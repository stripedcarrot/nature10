
function update(activeAnchor) {
    var group = activeAnchor.getParent();

    var topLeft = group.get('.topLeft')[0];
    var topRight = group.get('.topRight')[0];
    var bottomRight = group.get('.bottomRight')[0];
    var bottomLeft = group.get('.bottomLeft')[0];
    var image = group.get('.image')[0];

    var anchorX = activeAnchor.getX();
    var anchorY = activeAnchor.getY();

    // update anchor positions
    switch (activeAnchor.getName()) {
    case 'topLeft':
    topRight.setY(anchorY);
    bottomLeft.setX(anchorX);
    break;
    case 'topRight':
    topLeft.setY(anchorY);
    bottomRight.setX(anchorX);
    break;
    case 'bottomRight':
    bottomLeft.setY(anchorY);
    topRight.setX(anchorX);
    break;
    case 'bottomLeft':
    bottomRight.setY(anchorY);
    topLeft.setX(anchorX);
    break;
    }

image.setPosition(topLeft.getPosition());

var width = topRight.getX() - topLeft.getX();
var height = bottomLeft.getY() - topLeft.getY();
if(width && height) {
    image.setSize(width, height);
    }
}
function addAnchor(group, x, y, name) {
    var stage = group.getStage();
    var layer = group.getLayer();

    var anchor = new Kinetic.Circle({
    x: x,
    y: y,
    stroke: '#666',
    fill: '#ddd',
    strokeWidth: 2,
    radius: 8,
    name: name,
    draggable: true,
    dragOnTop: false
    });

anchor.on('dragmove', function() {
    update(this);
    layer.draw();
    });
anchor.on('mousedown touchstart', function() {
    group.setDraggable(false);
    this.moveToTop();
    });
anchor.on('dragend', function() {
    group.setDraggable(true);
    layer.draw();
    });
// add hover styling
anchor.on('mouseover', function() {
    var layer = this.getLayer();
    document.body.style.cursor = 'pointer';
    this.setStrokeWidth(4);
    layer.draw();
    });
anchor.on('mouseout', function() {
    var layer = this.getLayer();
    document.body.style.cursor = 'default';
    this.setStrokeWidth(2);
    layer.draw();
    });

group.add(anchor);
}
function loadImages(sources, callback) {
    var images = {};
var loadedImages = 0;
var numImages = 0;
for(var src in sources) {
    numImages++;
    }
for(var src in sources) {
    images[src] = new Image();
    images[src].onload = function() {
    if(++loadedImages >= numImages) {
    callback(images);
    }
};
images[src].src = sources[src];
}
}
function initStage(images) {
    var stage = new Kinetic.Stage({
    container: 'container4',
    width: 800,
    height: 550,
    id: "trees"
    });
var woodlandGroup = new Kinetic.Group({
    x: 20,
    y: 430,
    draggable: true
    });
var daisesGroup = new Kinetic.Group({
    x: 250,
    y: 430,
    draggable: true
    });
var pitcherGroup = new Kinetic.Group({
        x: 400,
        y: 430,
        draggable: true
    });
var orchidGroup = new Kinetic.Group({
        x: 550,
        y: 430,
        draggable: true
    });


    var layer = new Kinetic.Layer();

/*
* go ahead and add the groups
* to the layer and the layer to the
* stage so that the groups have knowledge
* of its layer and stage
*/
layer.add(woodlandGroup);
layer.add(daisesGroup);
layer.add(pitcherGroup);
layer.add(orchidGroup);
stage.add(layer);

// woodland
var woodlandImg = new Kinetic.Image({
    x: 0,
    y: 0,
    image: images.woodland,
    width: 200,
    height: 138,
    name: 'image'
    });

woodlandGroup.add(woodlandImg);
addAnchor(woodlandGroup, 0, 0, 'topLeft');
addAnchor(woodlandGroup, 200, 0, 'topRight');
addAnchor(woodlandGroup, 200, 138, 'bottomRight');
addAnchor(woodlandGroup, 0, 138, 'bottomLeft');

woodlandGroup.on('dragstart', function() {
    this.moveToTop();
    });
// daises
var daisesImg = new Kinetic.Image({
    x: 0,
    y: 0,
    image: images.daises,
    width: 100,
    height: 90,
    name: 'image'
    });

daisesGroup.add(daisesImg);
addAnchor(daisesGroup, 0, 0, 'topLeft');
addAnchor(daisesGroup, 100, 0, 'topRight');
addAnchor(daisesGroup, 100, 90, 'bottomRight');
addAnchor(daisesGroup, 0, 90, 'bottomLeft');

daisesGroup.on('dragstart', function() {
    this.moveToTop();
    });
var pitcherImg = new Kinetic.Image({
        x: 0,
        y: 0,
        image: images.pitcher,
        width: 90,
        height:100,
        name: 'image'
    });

    pitcherGroup.add(pitcherImg);
    addAnchor(pitcherGroup, 0, 0, 'topLeft');
    addAnchor(pitcherGroup, 90, 0, 'topRight');
    addAnchor(pitcherGroup, 90, 100, 'bottomRight');
    addAnchor(pitcherGroup, 0, 100, 'bottomLeft');

    pitcherGroup.on('dragstart', function() {
        this.moveToTop();
    });


var orchidImg = new Kinetic.Image({
        x: 0,
        y: 0,
        image: images.orchid,
        width: 100,
        height: 90,
        name: 'image'
    });

    orchidGroup.add(orchidImg);
    addAnchor(orchidGroup, 0, 0, 'topLeft');
    addAnchor(orchidGroup, 100, 0, 'topRight');
    addAnchor(orchidGroup, 100, 90, 'bottomRight');
    addAnchor(orchidGroup, 0, 90, 'bottomLeft');

    orchidGroup.on('dragstart', function() {
        this.moveToTop();
    });
stage.draw();
}

var sources = {
    woodland: '/assets/woodland.jpg',
    daises:'/assets/daises.jpg',
    orchid:'/assets/orchid.jpg',
    pitcher:'/assets/pitcher.jpg'
    };


loadImages(sources, initStage);



