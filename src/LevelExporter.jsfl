/**
 * User: VirtualMaestro
 * Date: 10.01.13
 * Time: 20:49
 */

function setXMLPath()
{
    // Открываем диалоговое окно для выбора папки куда будет сохранен файл
    // Возвращает урл выбраной папки в правильном формате. Если пользователь нажал отмена, возвращает null.
    var xmlPath = fl.browseForFolderURL("Choose folder for export");
    if (xmlPath == null) xmlPath = "";

    return xmlPath;
}

// Главный метод экспорта уровней
function exportLevels(xmlPublishPath)
{
    fl.outputPanel.clear(); // Очищаем консоль

    var doc = fl.getDocumentDOM(); // берем ссылку на текущий документ
    var swfPublishPath = doc.getSWFPathFromProfile();
    var docName = doc.name;
    var exportedFile = <levels/>;   // Создаем XML с коренным тегом levels, в нем будут хранится все уровни
    var levelList = doc.library.getSelectedItems();  // Возвращаем масссив всех выделенных уровней для экспорта
    var level;
    var levelsNum = levelList.length;

    if (levelsNum < 1) alert("Any level wasn't selected!");
    else
    {
        for (var i = 0; i < levelsNum; i++)
        {
            level = levelList[i];
            exportedFile.appendChild(parseLevel(level));  // Добавляем спарсеный уровень в экспортируемый файл
        }

        var savePath = (xmlPublishPath == "" || xmlPublishPath == null) ? swfPublishPath : xmlPublishPath;

        if (xmlPublishPath == "" || xmlPublishPath == null)
        {
            var index = swfPublishPath.lastIndexOf(".swf");
            savePath = swfPublishPath.substring(0,index);
            savePath += ".xml";
        }
        else savePath = xmlPublishPath + "/" + docName + ".xml";

        FLfile.write(savePath, exportedFile);
        doc.publish();
    }
}

// Парсим уровень и возвращаем XML описание
function parseLevel(level)
{
    var levelXML = <level/>;
    levelXML.@name = level.name;   // Считываем имя уровня. Необязательное значение, задается как имя экземпляра

    // добавляем узел actors
    levelXML.appendChild(<actors/>);

    // добавляем узел externalJoints
    levelXML.appendChild(<externalJoints/>);

    //
    var layers = level.timeline.layers;  // Идем внутрь уровня (экземпляра) и выбираем все слои
    var numLayers = layers.length;
    var layer;
    var nestedElements;
    var element;
    var numNestedElements;

    for(var i = 0; i < numLayers; i++)  // Бежим по слоям
    {
        layer = layers[i];
        nestedElements = layer.frames[0].elements; // выбираем все элементы на данном слое (вибирается только из первого кадра, так как более одного кадра использоваться не будет)
        numNestedElements = nestedElements.length;

        for(var j = 0; j < numNestedElements; j++)  /// бежим по внутренним элементам (MovieClip, sprite, shape и т.д.)
        {
            element = nestedElements[j];

            var baseLinkageClass = element.libraryItem.linkageBaseClass;

            // Определяем какой компонент мы взяли
            switch (baseLinkageClass)
            {
                case "worlds.WorldScheme":
                {
                    levelXML.appendChild(parseWorld(element));
                    break;
                }

                case "actors.ActorScheme":
                {
                    levelXML.actors.appendChild(parseActor(element));
                    break;
                }

                // парсим внешние соединения
                case "joints.AngleJointScheme":
                case "joints.DistanceJointScheme":
                case "joints.LineJointScheme":
                case "joints.MotorJointScheme":
                case "joints.PivotJointScheme":
                case "joints.WeldJointScheme":
                {
                    levelXML.externalJoints.appendChild(parseJoint(element));
                    break;
                }
            }
        }
    }

    return levelXML;
}

// парсим параметры мира
function parseWorld(world)
{
    var worldXML = <world/>;
    worldXML.@instanceName = world.name;
    worldXML.@className = world.libraryItem.linkageClassName;
    worldXML.@baseClassName = world.libraryItem.linkageBaseClass;

    // считываем данные компонента. Эта опция доступна только для типа 'компонент' и возвращает массив объектов Parameter
    var params = world.parameters;
    var parameter;
    var numParameters = params.length;
    var paramName;
    var paramValue;

    for(var i = 0; i < numParameters; i++)
    {
        parameter = params[i];
        paramName = parameter.name;
        paramValue = parameter.value;

        switch(paramName)
        {
            case "worldSize":       // тип массив
            {
                worldXML.appendChild(<size/>);
                worldXML.size = paramValue[0].value + "," + paramValue[1].value + "," + paramValue[2].value + "," + paramValue[3].value;
                break;
            }

            case "destroyOutWorld":
            {
                worldXML.appendChild(<destroyOutWorld/>);
                worldXML.destroyOutWorld = paramValue;
                break;
            }

            case "timeStep":
            {
                worldXML.appendChild(<timeStep/>);
                worldXML.timeStep = paramValue;
                break;
            }

            case "gravity":
            {
                worldXML.appendChild(<gravity/>);
                worldXML.gravity = paramValue[0].value + "," + paramValue[1].value;
                break;
            }

            case "velocityIterations":
            {
                worldXML.appendChild(<velocityIterations/>);
                worldXML.velocityIterations = paramValue;
                break;
            }

            case "positionIterations":
            {
                worldXML.appendChild(<positionIterations/>);
                worldXML.positionIterations = paramValue;
                break;
            }
        }
    }

    return worldXML;
}

// парсим параметры актера
function parseActor(actor)
{
    var actorXML = <actor/>;
    actorXML.@instanceName = actor.name;
    actorXML.@className = actor.libraryItem.linkageClassName;

    var params = actor.parameters;
    var paramsLength = params.length;
    var parameter;
    var parameterName;
    var parameterValue;

    // проходимся по параметрам актера
    for (var i = 0; i < paramsLength; i++)
    {
        parameter = params[i];
        parameterName = parameter.name;
        parameterValue = parameter.value;

        switch (parameterName)
        {
            case "actorName":
            {
                actorXML.appendChild(<actorName/>);
                actorXML.actorName = parameterValue;
                break;
            }

            case "actorType":   // тип список (List)
            {
                actorXML.appendChild(<actorType/>);
                actorXML.actorType = parameterValue[parameter.listIndex].value;
                break;
            }

            case "sameTypeForChildren":
            {
                actorXML.appendChild(<sameTypeForChildren/>);
                actorXML.sameTypeForChildren = parameterValue;
                break;
            }

            case "allowRotation":
            {
                actorXML.appendChild(<allowRotation/>);
                actorXML.allowRotation = parameterValue;
                break;
            }

            case "allowMovement":
            {
                actorXML.appendChild(<allowMovement/>);
                actorXML.allowMovement = parameterValue;
                break;
            }

            case "graphicsRotation":
            {
                actorXML.appendChild(<graphicsRotation/>);
                actorXML.graphicsRotation = parameterValue;
                break;
            }

            case "isUpdate":
            {
                actorXML.appendChild(<isUpdate/>);
                actorXML.isUpdate = parameterValue;
                break;
            }

            case "layerName":
            {
                actorXML.appendChild(<layerName/>);
                actorXML.layerName = parameterValue[parameter.listIndex].value;
                break;
            }

            case "cache":
            {
                actorXML.appendChild(<cache/>);
                actorXML.cache = parameterValue;
                break;
            }

            case "isCollisionInternalActors":
            {
                actorXML.appendChild(<isCollisionInternalActors/>);
                actorXML.isCollisionInternalActors = parameterValue;
                break;
            }
        }
    }

    // Считываем трасформацию актера
    actorXML.appendChild(<transform/>);
    actorXML.transform.@x = actor.x;
    actorXML.transform.@y = actor.y;
    actorXML.transform.@rotation = actor.rotation;
    actorXML.transform.@scaleX = actor.scaleX;
    actorXML.transform.@scaleY = actor.scaleY;
    actorXML.transform.@width = actor.width;
    actorXML.transform.@height = actor.height;
    actorXML.transform.@transformX = actor.transformX;     // Определяет значение X точки трансформации элемента внутри координатной системы его парента
    actorXML.transform.@transformY = actor.transformY;     // Определяет значение Y точки трансформации элемента внутри координатной системы его парента

    // Заранее добавляем тег physics в не зависимости от того есть ли физика в актере или нет
    actorXML.appendChild(<physics/>);

    // Смотрим внутрь актера и парсим данные - напр. шейпы, соединения, вложенные актеры
    var layers = actor.libraryItem.timeline.layers;
    var layersNum = layers.length;
    var layer;
    var nestedElements;
    var nestedElementsLen;
    var element;
    var baseLinkageClass;

    // бежим по слоям
    for(var i = 0; i < layersNum; i++)
    {
        layer = layers[i];
        nestedElements = layer.frames[0].elements;
        nestedElementsLen = nestedElements.length;

        // бежим непосредственно по самим элементам (графика, физика, соединения)
        for(var j = 0; j < nestedElementsLen; j++)
        {
            element = nestedElements[j];

            baseLinkageClass = element.libraryItem.linkageBaseClass;

             // Определяем какой компонент мы взяли
             switch (baseLinkageClass)
             {
                 case "shapes.BoxShapeScheme":
                 {
                     var boxXML = parseShape(element);
                     boxXML.@type = "box";
                     actorXML.physics.appendChild(boxXML);
                     break;
                 }

                 case "shapes.CircleShapeScheme":
                 {
                     var circleXML = parseShape(element);
                     circleXML.@type = "circle";
                     actorXML.physics.appendChild(circleXML);
                     break;
                 }

                 case "graphics.GraphicsScheme":
                 {
                     actorXML.appendChild(parseGraphics(element));
                     break;
                 }

                 case "actors.ActorScheme":
                 {
                     actorXML.appendChild(parseActor(element));
                     break;
                 }

                 // парсим внешние соединения
                 case "joints.AngleJointScheme":
                 case "joints.DistanceJointScheme":
                 case "joints.LineJointScheme":
                 case "joints.MotorJointScheme":
                 case "joints.PivotJointScheme":
                 case "joints.WeldJointScheme":
                 {
                     actorXML.appendChild(parseJoint(element));
                     break;
                 }
             }
        }
    }

    return actorXML;
}

// парсим физику - фигуру физики
function parseShape(shape)
{
    var shapeXML = <shape/>;

    // Считываем параметры компонента
    var params = shape.parameters;
    var paramsLen = params.length;
    var parameter;
    var paramName;
    var paramValue;

    for(var i = 0; i < paramsLen; i++)
    {
        parameter = params[i];
        paramName = parameter.name;
        paramValue = parameter.value;

        switch(paramName)
        {
            case "shapeName":
            {
                shapeXML.appendChild(<shapeName/>);
                shapeXML.shapeName = paramValue;
                break;
            }

            case "materialPredefine":
            {
                shapeXML.appendChild(<materialName/>);
                shapeXML.materialName = paramValue[parameter.listIndex].value;
                break;
            }

            case "density":
            {
                shapeXML.appendChild(<density/>);
                shapeXML.density = paramValue;
                break;
            }

            case "elasticity":
            {
                shapeXML.appendChild(<elasticity/>);
                shapeXML.elasticity = paramValue;
                break;
            }

            case "dynamicFriction":
            {
                shapeXML.appendChild(<dynamicFriction/>);
                shapeXML.dynamicFriction = paramValue;
                break;
            }

            case "staticFriction":
            {
                shapeXML.appendChild(<staticFriction/>);
                shapeXML.staticFriction = paramValue;
                break;
            }

            case "rollingFriction":
            {
                shapeXML.appendChild(<rollingFriction/>);
                shapeXML.rollingFriction = paramValue;
                break;
            }

            case "collisionGroup":
            {
                shapeXML.appendChild(<collisionGroup/>);
                shapeXML.collisionGroup = paramValue;
                break;
            }

            case "collisionMask":
            {
                shapeXML.appendChild(<collisionMask/>);
                shapeXML.collisionMask = paramValue;
                break;
            }

            case "sensorGroup":
            {
                shapeXML.appendChild(<sensorGroup/>);
                shapeXML.sensorGroup = paramValue;
                break;
            }

            case "sensorMask":
            {
                shapeXML.appendChild(<sensorMask/>);
                shapeXML.sensorMask = paramValue;
                break;
            }

            case "fluidGroup":
            {
                shapeXML.appendChild(<fluidGroup/>);
                shapeXML.fluidGroup = paramValue;
                break;
            }

            case "fluidMask":
            {
                shapeXML.appendChild(<fluidMask/>);
                shapeXML.fluidMask = paramValue;
                break;
            }

            case "fluidEnable":
            {
                shapeXML.appendChild(<fluidEnable/>);
                shapeXML.fluidEnable = paramValue;
                break;
            }

            case "fluidDensity":
            {
                shapeXML.appendChild(<fluidDensity/>);
                shapeXML.fluidDensity = paramValue;
                break;
            }

            case "viscosity":
            {
                shapeXML.appendChild(<viscosity/>);
                shapeXML.viscosity = paramValue;
                break;
            }

            case "fluidGravity":
            {
                shapeXML.appendChild(<fluidGravity/>);
                shapeXML.fluidGravity = (paramValue != "") ? (paramValue[0].value + "," + paramValue[1].value) : paramValue;
                break;
            }
        }
    }

    // Считываем трасформацию шейпа
    shapeXML.appendChild(<transform/>);
    shapeXML.transform.@x = shape.x;
    shapeXML.transform.@y = shape.y;
    shapeXML.transform.@rotation = shape.rotation;
    shapeXML.transform.@scaleX = shape.scaleX;
    shapeXML.transform.@scaleY = shape.scaleY;
    shapeXML.transform.@width = shape.width;
    shapeXML.transform.@height = shape.height;
    shapeXML.transform.@transformX = shape.transformX;     // Определяет значение X точки трансформации элемента внутри координатной системы его парента
    shapeXML.transform.@transformY = shape.transformY;     // Определяет значение Y точки трансформации элемента внутри координатной системы его парента

    return shapeXML;
}

// парсим графический компонент
function parseGraphics(graphics)
{
    var graphicsXML = <graphics/>;
    graphicsXML.@className = graphics.libraryItem.linkageClassName;
    graphicsXML.@frames = graphics.libraryItem.timeline.frameCount;

    // параметры компонента
    var parameters = graphics.parameters;
    var parametersLen = parameters.length;
    var parameter;
    var parameterName;
    var parameterValue;

    for(var i = 0; i < parametersLen; i++)
    {
        parameter = parameters[i];
        parameterName = parameter.name;
        parameterValue = parameter.value;

        switch(parameterName)
        {
            case "nameGE":
            {
                graphicsXML.appendChild(<graphicsName/>);
                graphicsXML.graphicsName = parameterValue;
                break;
            }

            case "playingAnimFrom":
            {
                graphicsXML.appendChild(<playingAnimFrom/>);
                graphicsXML.playingAnimFrom = parameterValue;
                break;
            }

            case "frameRate":
            {
                graphicsXML.appendChild(<frameRate/>);
                graphicsXML.frameRate = parameterValue;
                break;
            }
        }
    }

    // параметры трасформации
    graphicsXML.appendChild(<transform/>);
    graphicsXML.transform.@x = graphics.x;
    graphicsXML.transform.@y = graphics.y;
    graphicsXML.transform.@rotation = graphics.rotation;
    graphicsXML.transform.@scaleX = graphics.scaleX;
    graphicsXML.transform.@scaleY = graphics.scaleY;
    graphicsXML.transform.@width = graphics.width;
    graphicsXML.transform.@height = graphics.height;
    graphicsXML.transform.@transformX = graphics.transformX;     // Определяет значение X точки трансформации элемента внутри координатной системы его парента
    graphicsXML.transform.@transformY = graphics.transformY;     // Определяет значение Y точки трансформации элемента внутри координатной системы его парента


    return graphicsXML;
}

// парсим параметры соединения
// TODO: Надо подумать как сделать парсинг соединений, так как большинство из них состоят из двух элементов
// и чтобы записать в XML результат надо сначала найти два элемента соединения, а потом только парсить данные
function parseJoint(joint)
{
    var jointXML = <joint/>;
    var parameters = joint.parameters;
    var parameter;
    var parameterName;
    var parameterValue;

    switch(parameterName)
    {
        case "joints.AngleJointScheme":
        case "joints.DistanceJointScheme":
        case "joints.LineJointScheme":
        case "joints.MotorJointScheme":
        case "joints.PivotJointScheme":
        case "joints.WeldJointScheme":

    }

    return jointXML;
}

// Упрощение трейса
function tr(mess)
{
    fl.trace(mess);
}

function trParameterValue(params)
{
    var paramsLen = params.length;
    var param;
    var paramName;
    var paramValue;

    for(var i = 0; i < paramsLen; i++)
    {
        param = params[i];
        paramName = param.name;
        paramValue = param.value;

        tr("Name: " + paramName + " Value: " + paramValue);

        if (param.valueType == "List" || param.valueType == "Array" || param.valueType == "Object")
        {
            trParameters(param);
        }
    }
}

function trParameterProps(param)
{
    for (var prop in param)
    {
        tr("Prop name: " + prop + " Prop value: " + param[prop]);
    }
}

// Samples

//    fl.trace("instanceType: " + level.instanceType);
//    fl.trace("element props: " + level.parameters);
//    fl.trace("library item: " + level.libraryItem);
//    var params = level.parameters;
//    for(var paramName in params)
//    {
////        fl.trace("Name: " + paramName + " Value: " + params[paramName]);
//        fl.trace("value: " + paramName);
//    }

//    fl.getDocumentDOM().selection[0].libraryItem = fl.getDocumentDOM().library.items[0]

//    someInstance.libraryItem.itemType == "component"  // Проверить является ли итем компонентом
//    component.parameters // Хранит параметры компонента
