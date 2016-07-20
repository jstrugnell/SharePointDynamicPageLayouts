var dynamicPageWPZConfig;

$(document).ready(function () {

    var configFieldValue = $('.js-DynamicPageConfiguration').val();
    if (configFieldValue) {
        try {
            dynamicPageWPZConfig = JSON.parse(configFieldValue);
        } catch (e) {
            console.log(e);
        }
    }

    if (!dynamicPageWPZConfig) {
        dynamicPageWPZConfig = { "rows": [] }; // empty configuration
    }

    // Delete function
    $('.row-config-delete-button').on('click', function (e) {
        e.preventDefault();

        if (!confirm("Any web parts in this row will be moved to another zone on the page.")) {
            return;
        }

        var rowToDeleteElem = $(this).closest('.row-config-control');
        var rowToDeleteId = rowToDeleteElem.find('.row-config-id').val()

        var matchedRow = $.grep(dynamicPageWPZConfig.rows, function (e) { return e.id.toUpperCase() == rowToDeleteId.toUpperCase(); })[0];

        // Loop through rows and delete matching item
        for (var index = 0; index < dynamicPageWPZConfig.rows.length; index++) {
            // If current array item equals itemToRemove then
            if (dynamicPageWPZConfig.rows[index] === matchedRow) {
                // Remove array item at current index
                dynamicPageWPZConfig.rows.splice(index, 1);
                // Decrement index to iterate current position one more time, because we just removed item that occupies it, and next item took it place
                index--;
            }
        }

        // re-sort items in correct order (might not be necessary as they should already be in the correct order)
        dynamicPageWPZConfig.rows.sort(function (a, b) {
            return parseInt(a.order) - parseInt(b.order);
        });

        // Reset Order numbers as a row has been deleted and we don't want a gap
        for (var index = 0; index < dynamicPageWPZConfig.rows.length; index++) {
            dynamicPageWPZConfig.rows[index].order = index + 1;
        }

        $('.js-DynamicPageConfiguration').val(JSON.stringify(dynamicPageWPZConfig));

        savePageAndContinueEditing();

    });

    // Update / Create function
    $('.row-config-update-button').on("click", (function (e) {
        e.preventDefault();
        var rowToUpdate = $(this).closest('.row-config-control');

        var rowConfig = {
            id: rowToUpdate.find('.row-config-id').val(),
            order: rowToUpdate.find('.row-config-order').val(),
            backgroundColour: rowToUpdate.find('.row-config-backgroundColour').val(),
            marginTop: rowToUpdate.find('.row-config-topMargin').val() || 0,
            marginBottom: rowToUpdate.find('.row-config-bottomMargin').val() || 0,
            paddingTop: rowToUpdate.find('.row-config-topPadding').val() || 0,
            paddingBottom: rowToUpdate.find('.row-config-bottomPadding').val() || 0,
            layout: rowToUpdate.find('.row-config-layout').val()
        };

        var reorderingRequired = false;

        if (!rowConfig.id) {
            // must be adding a new row
            rowConfig.id = generateFauxGuid();
            rowConfig.order = dynamicPageWPZConfig.rows.length + 1;

        } else {
            // We are updating a row. The approach below finds the existing record in the array, deletes it, we then add the updated record later
            var matchedRowConfig = $.grep(dynamicPageWPZConfig.rows, function (e) { return e.id.toUpperCase() == rowConfig.id.toUpperCase(); })[0];

            if (matchedRowConfig.order != rowConfig.order) {
                // the user has changed the Order number
                reorderingRequired = true;
                if (rowConfig.order < matchedRowConfig.order) {
                    rowConfig.order = parseInt(rowConfig.order) - 0.1;
                }
                else {
                    rowConfig.order = parseInt(rowConfig.order) + 0.1;
                }
            }

            for (var index = 0; index < dynamicPageWPZConfig.rows.length; index++) {
                // If current array item equals itemToRemove then
                if (dynamicPageWPZConfig.rows[index] === matchedRowConfig) {
                    // Remove array item at current index
                    dynamicPageWPZConfig.rows.splice(index, 1);
                    // Decrement index to iterate current position one more time, because we just removed item that occupies it, and next item took it place
                    index--;
                }
            }
        }

        dynamicPageWPZConfig.rows.push(rowConfig);

        dynamicPageWPZConfig.rows.sort(function (a, b) {
            // force sort by "Order" property
            return parseInt(a.order) - parseInt(b.order);
        });

        if (reorderingRequired) {
            // Reset Order numbers as ordering has been updated
            for (var index = 0; index < dynamicPageWPZConfig.rows.length; index++) {
                dynamicPageWPZConfig.rows[index].order = index + 1;
            }
        }

        $('.js-DynamicPageConfiguration').val(JSON.stringify(dynamicPageWPZConfig));

        savePageAndContinueEditing();

    }));
});

function savePageAndContinueEditing() {
    var command = 'PageStateGroupSave';
    SP.Ribbon.PageState.Handlers.showStateChangeDialog(command, SP.Ribbon.PageState.ImportedNativeData.CommandHandlers[command]);
}

$('#rowLayoutConfigModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var rowid = button.data('rowid') // Extract info from data-* attributes
    // // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)

    var rowConfig = $.grep(dynamicPageWPZConfig.rows, function (e) { return e.id.toUpperCase() == rowid.toUpperCase(); })[0];

    if (rowConfig) {
        // intialise fields in form
        modal.find('.row-config-count-section').show();
        modal.find('.modal-title').text("Update row settings");
        modal.find('.modal-body .row-config-id').val(rowConfig.id);
        modal.find('.modal-body .row-config-order').val(rowConfig.order);
        modal.find('.modal-body .row-config-backgroundColour').val(rowConfig.containerBackgroundColour);
        modal.find('.modal-body .row-config-topMargin').val(rowConfig.marginTop);
        modal.find('.modal-body .row-config-bottomMargin').val(rowConfig.marginBottom);
        modal.find('.modal-body .row-config-topPadding').val(rowConfig.paddingTop);
        modal.find('.modal-body .row-config-bottomPadding').val(rowConfig.paddingBottom);
        modal.find('.modal-body .row-config-layout').val(rowConfig.layout);

    } else {
        modal.find('.row-config-count-section').hide();
    }

});

function generateFauxGuid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
        s4() + '-' + s4() + s4() + s4();
}