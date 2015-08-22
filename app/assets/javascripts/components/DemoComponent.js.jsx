var DemoComponent = React.createClass({
    displayName: 'Demo Component',
    render: function () {
        return React.DOM.div(null, "Demo Component");
    }
});

// each file will export exactly one component
module.exports = DemoComponent;