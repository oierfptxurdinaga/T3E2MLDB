$(document).ready(function () {

    // ===== CARGAR PÁGINA INICIAL =====
    $('main').load("hasiera.html", function () {
        document.title = 'Hasiera - Boleibol Federazioa';
    });

    // ===== NAVEGACIÓN =====
    $('.hasiera').on('click', function (e) {
        e.preventDefault();
        $('main').load("hasiera.html", function () {
            document.title = 'Hasiera - Boleibol Federazioa';
        });
    });

    $('.berriak').on('click', function (e) {
        e.preventDefault();
        $('main').load("berriak.html", function () {
            document.title = 'Berriak - Boleibol Federazioa';
        });
    });

    // ===== KLASIFIKAZIOA =====
    $('#klasifikazioa').on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: "GET",
            url: "XML/denboraldiak.xml",
            dataType: "xml",
            success: function (xml) {
                $.ajax({
                    type: "GET",
                    url: "XML/klasifikazioa.xsl",
                    dataType: "xml",
                    success: function (xsl) {
                        var xsltProcessor = new XSLTProcessor();
                        xsltProcessor.importStylesheet(xsl);
                        var resultDocument = xsltProcessor.transformToDocument(xml);
                        var resultHTML = new XMLSerializer().serializeToString(resultDocument);
                        $('main').html(resultHTML);
                        document.title = 'Klasifikazioa - Boleibol Federazioa';
                    },
                    error: function () {
                        console.error("Error al cargar XSL de klasifikazioa");
                    }
                });
            },
            error: function () {
                console.error("Error al cargar XML de klasifikazioa");
            }
        });
    });

    // ===== TALDEAK =====
    $('#taldeak').on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: "GET",
            url: "XML/boleibol_federazioa.xml",
            dataType: "xml",
            success: function (xml) {
                $.ajax({
                    type: "GET",
                    url: "XML/taldeak.xsl",
                    dataType: "xml",
                    success: function (xsl) {
                        var xsltProcessor = new XSLTProcessor();
                        xsltProcessor.importStylesheet(xsl);
                        var resultDocument = xsltProcessor.transformToDocument(xml);
                        var resultHTML = new XMLSerializer().serializeToString(resultDocument);
                        $('main').html(resultHTML);
                        document.title = 'Taldeak - Boleibol Federazioa';
                    },
                    error: function () {
                        console.error("Error al cargar XSL de taldeak");
                    }
                });
            },
            error: function () {
                console.error("Error al cargar XML de taldeak");
            }
        });
    });

    // ===== PARTIDAK =====
    function cargarPartidos(e) {
        e.preventDefault();
        $.ajax({
            type: "GET",
            url: "XML/denboraldiak.xml",
            dataType: "xml",
            success: function (xml) {
                $.ajax({
                    type: "GET",
                    url: "XML/partidak.xsl",
                    dataType: "xml",
                    success: function (xsl) {
                        var xsltProcessor = new XSLTProcessor();
                        xsltProcessor.importStylesheet(xsl);
                        var resultDocument = xsltProcessor.transformToDocument(xml);
                        var resultHTML = new XMLSerializer().serializeToString(resultDocument);
                        $('main').html(resultHTML);
                        document.title = 'Partidak - Boleibol Federazioa';
                    },
                    error: function () {
                        console.error("Error al cargar XSL de partidak");
                    }
                });
            },
            error: function () {
                console.error("Error al cargar XML de partidak");
            }
        });
    }

    // Asignar evento a Partidak (compatible con ambas versiones)
    if ($('#partidak').length > 0) {
        $('#partidak').on('click', cargarPartidos);
    } else if ($('.partiduak').length > 0) {
        $('.partiduak').on('click', cargarPartidos);
    }

    // ===== ANIMACIONES DE BERRIAK =====
    $(document).on("click", ".erakutsi1", function () {
        const card = $(this).closest(".albiste1-card");
        card.find(".albiste1-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu1").show();
    });

    $(document).on("click", ".ezkutatu1", function () {
        const card = $(this).closest(".albiste1-card");
        card.find(".albiste1-full").slideUp();
        $(this).hide();
        card.find(".erakutsi1").show();
    });

    $(document).on("click", ".erakutsi2", function () {
        const card = $(this).closest(".albiste2-card");
        card.find(".albiste2-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu2").show();
    });

    $(document).on("click", ".ezkutatu2", function () {
        const card = $(this).closest(".albiste2-card");
        card.find(".albiste2-full").slideUp();
        $(this).hide();
        card.find(".erakutsi2").show();
    });

    $(document).on("click", ".erakutsi3", function () {
        const card = $(this).closest(".albiste3-card");
        card.find(".albiste3-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu3").show();
    });

    $(document).on("click", ".ezkutatu3", function () {
        const card = $(this).closest(".albiste3-card");
        card.find(".albiste3-full").slideUp();
        $(this).hide();
        card.find(".erakutsi3").show();
    });

    // ===== ANIMACIONES DE JOKALARIAK =====
    $(document).on("click", ".jokalariak", function () {
        const card = $(this).closest(".jokalari-card");
        card.find(".jokalari-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu").show();
    });

    $(document).on("click", ".ezkutatu", function () {
        const card = $(this).closest(".jokalari-card");
        card.find(".jokalari-full").slideUp();
        $(this).hide();
        card.find(".jokalariak").show();
    });

});