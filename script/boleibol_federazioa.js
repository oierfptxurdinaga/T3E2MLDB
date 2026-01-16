$(document).ready(function () {

    // ===== KARGATU HASIERAKO ORRIA =====
    $('main').load("hasiera.html", function () {
        document.title = 'Hasiera - Boleibol Federazioa';
    });

    // ===== HASIERA =====
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

    // Jokalarien animazioak, botoia ematerakoan talde horren jokalariak aterako dira
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
                        console.error("Error al cargar XSL de partiduak");
                    }
                });
            },
            error: function () {
                console.error("Error al cargar XML de partiduak");
            }
        });
    }

    // Partidak elementuari klik-gertaera esleitzen zaio (bi bertsioekin bateragarria)
    if ($('#partidak').length > 0) {

        // #partidak IDa duen elementua existitzen bada,
        // klik egitean "cargarPartidos" funtzioa exekutatuko da
        $('#partidak').on('click', cargarPartidos);

    } else if ($('.partiduak').length > 0) {

        // Bestela, .partiduak klasea duen elementua existitzen bada,
        // klik egitean "cargarPartidos" funtzioa exekutatuko da
        $('.partiduak').on('click', cargarPartidos);
    }


    // ========= BERRIEN ANIMAZIOA ========= //
    // 1. berria
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

    // 2. Berria
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

    // 3. Berria
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

    // 4. Berria
    $(document).on("click", ".erakutsi4", function () {
        const card = $(this).closest(".albiste4-card");
        card.find(".albiste4-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu4").show();
    });

    $(document).on("click", ".ezkutatu4", function () {
        const card = $(this).closest(".albiste4-card");
        card.find(".albiste4-full").slideUp();
        $(this).hide();
        card.find(".erakutsi4").show();
    });

    // 5. Berria
    $(document).on("click", ".erakutsi5", function () {
        const card = $(this).closest(".albiste5-card");
        card.find(".albiste5-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu5").show();
    });

    $(document).on("click", ".ezkutatu5", function () {
        const card = $(this).closest(".albiste5-card");
        card.find(".albiste5-full").slideUp();
        $(this).hide();
        card.find(".erakutsi5").show();
    });

    // 6. Berria
    $(document).on("click", ".erakutsi6", function () {
        const card = $(this).closest(".albiste6-card");
        card.find(".albiste6-full").slideDown();
        $(this).hide();
        card.find(".ezkutatu6").show();
    });

    $(document).on("click", ".ezkutatu6", function () {
        const card = $(this).closest(".albiste6-card");
        card.find(".albiste6-full").slideUp();
        $(this).hide();
        card.find(".erakutsi6").show();
    });


    // ===== Gezia orriaren behen aldean erakutziko da =====
    $(window).on("scroll", function () {

        const scrollActual = $(window).scrollTop();
        const altoPagina = $(document).height() - $(window).height();

        if (scrollActual > altoPagina * 0.85) {
            $("#flecha").fadeIn();
        } else {
            $("#flecha").fadeOut();
        }
    });

    $("#flecha").on("click", function () {
        $("html, body").animate(
            { scrollTop: 0 },
            600,
            "swing"
        );
    });

});