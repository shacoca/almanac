# top ****************************************************

TODO: finish display feature format - pieces print twice

TODO: find_or_create_Piece no duplicate Pieces

TODO: make (or find) Section.pieces from Pieces.all; piece.section should return a Section

TODO: add "___OTD" items at bottom of fp middle column

a, h2, h3, #block-system-main .block-content .view-content

PROBS TO FIX:
don't re-download features
subheads 2/13 features: 1, 3, 4, 5
texts 2/13 features: 2
best days to....
weather forecast

group_by { |obj| block } → a_hashclick to toggle source
group_by → an_enumerator
Groups the collection by result of the block. Returns a hash where the keys are the evaluated result from the block and the values are arrays of elements in the collection that correspond to the key.

check charts with: https://www.almanac.com/content/how-measure-wind-speed-beaufort-wind-force-scale

2.6.1 :279 > pp a_nok.features[4].body_text.css("section")[3]
#(Element:0x3ff50311c244 {
  name = "section",
  attributes = [
    #(Attr:0x3ff50311c140 {
      name = "class",
      value = "panel-pane pane-subscription-form-simplified block"
      }),
    #(Attr:0x3ff50311c118 { name = "id", value = "chicken-garden" })],
  children = [
    #(Text "\n" + "  "),
    #(Element:0x3ff503115a34 {
      name = "div",
      attributes = [
        #(Attr:0x3ff5031158cc {
          name = "class",
          value = "block-inner clearfix"
          })],
      children = [
        #(Text "\n" + "    \n" + "              "),
        #(Element:0x3ff5031111c8 {
          name = "h2",
          attributes = [
            #(Attr:0x3ff50311096c {
              name = "class",
              value = "pane-title block-title"
              })],
          children = [ #(Text "FREE BEGINNER'S GARDEN GUIDE!")]
          }),
        #(Text "\n" + "        \n" + "    \n" + "    "),
        #(Element:0x3ff50310d834 {
          name = "div",
          attributes = [
            #(Attr:0x3ff50310d67c {
              name = "class",
              value = "block-content"
              })],
          children = [
            #(Text "\n" + "      "),
            #(Element:0x3ff503109428 {
              name = "div",
              attributes = [
                #(Attr:0x3ff5031092c0 {
                  name = "id",
                  value = "custom-listrak-subscribe-wrapper"
                  }),
                #(Attr:0x3ff503109298 { name = "class", value = "" })],
              children = [
                #(Element:0x3ff503101548 {
                  name = "div",
                  attributes = [
                    #(Attr:0x3ff503100a58 {
                      name = "class",
                      value = "custom-listrak-subscribe-body"
                      })]
                  }),
                #(Element:0x3ff5030fce44 {
                  name = "form",
                  attributes = [
                    #(Attr:0x3ff5030fcd18 {
                      name = "action",
                      value = "/recipe/longevity-noodles-0"
                      }),
                    #(Attr:0x3ff5030fcc3c { name = "method", value = "post" }),
                    #(Attr:0x3ff5030fcc28 {
                      name = "id",
                      value = "listrak-api-subscribe-simplified-form"
                      }),
                    #(Attr:0x3ff5030fcc14 {
                      name = "accept-charset",
                      value = "UTF-8"
                      })],
                  children = [
                    #(Element:0x3ff5030f54f0 {
                      name = "div",
                      children = [
                        #(Element:0x3ff5030f5090 {
                          name = "fieldset",
                          attributes = [
                            #(Attr:0x3ff5030f5004 {
                              name = "class",
                              value = "container-inline form-wrapper"
                              }),
                            #(Attr:0x3ff5030f4ff0 {
                              name = "id",
                              value = "edit-options"
                              })],
                          children = [
                            #(Element:0x3ff5030f0bf8 {
                              name = "div",
                              attributes = [
                                #(Attr:0x3ff5030f0ab8 {
                                  name = "class",
                                  value = "fieldset-wrapper"
                                  })],
                              children = [
                                #(Element:0x3ff5030ec788 {
                                  name = "legend",
                                  attributes = [
                                    #(Attr:0x3ff5030ec328 {
                                      name = "style",
                                      value = "display: none;"
                                      })],
                                  children = [
                                    #(Text "Sign up for our email newsletter by entering your email address.")]
                                  }),
                                #(Element:0x3ff5030e0848 {
                                  name = "div",
                                  attributes = [
                                    #(Attr:0x3ff5030dd51c {
                                      name = "class",
                                      value = "form-item form-type-textfield form-item-email"
                                      })],
                                  children = [
                                    #(Text "\n" + "  "),
                                    #(Element:0x3ff5030c94a4 {
                                      name = "label",
                                      attributes = [
                                        #(Attr:0x3ff5030c5bb0 {
                                          name = "for",
                                          value = "edit-email"
                                          })],
                                      children = [
                                        #(Text "Enter your email address: "),
                                        #(Element:0x3ff5030c0bb0 {
                                          name = "span",
                                          attributes = [
                                            #(Attr:0x3ff5030c07dc {
                                              name = "class",
                                              value = "form-required"
                                              }),
                                            #(Attr:0x3ff5030c07c8 {
                                              name = "title",
                                              value = "This field is required."
                                              })],
                                          children = [ #(Text "*")]
                                          })]
                                      }),
                                    #(Text "\n" + " "),
                                    #(Element:0x3ff5030b97d4 {
                                      name = "input",
                                      attributes = [
                                        #(Attr:0x3ff5030b94dc {
                                          name = "placeholder",
                                          value = "Email Address"
                                          }),
                                        #(Attr:0x3ff5030b943c {
                                          name = "type",
                                          value = "text"
                                          }),
                                        #(Attr:0x3ff5030b93c4 {
                                          name = "id",
                                          value = "edit-email"
                                          }),
                                        #(Attr:0x3ff5030b93b0 {
                                          name = "name",
                                          value = "email"
                                          }),
                                        #(Attr:0x3ff5030b9338 {
                                          name = "value",
                                          value = ""
                                          }),
                                        #(Attr:0x3ff5030b9310 {
                                          name = "size",
                                          value = "24"
                                          }),
                                        #(Attr:0x3ff5030b9248 {
                                          name = "maxlength",
                                          value = "128"
                                          }),
                                        #(Attr:0x3ff5030b9130 {
                                          name = "class",
                                          value = "form-text required"
                                          })]
                                      }),
                                    #(Text "\n")]
                                  }),
                                #(Text "\n"),
                                #(Element:0x3ff504c6d5ac {
                                  name = "input",
                                  attributes = [
                                    #(Attr:0x3ff504c6d46c {
                                      name = "type",
                                      value = "submit"
                                      }),
                                    #(Attr:0x3ff504c6d340 {
                                      name = "id",
                                      value = "edit-submit--2"
                                      }),
                                    #(Attr:0x3ff504c6d084 {
                                      name = "name",
                                      value = "op"
                                      }),
                                    #(Attr:0x3ff504c6d070 {
                                      name = "value",
                                      value = "GET MY FREE GUIDE"
                                      }),
                                    #(Attr:0x3ff504c6d05c {
                                      name = "class",
                                      value = "form-submit"
                                      })]
                                  })]
                              })]
                          }),
                        #(Text "\n"),
                        #(Element:0x3ff504c653e8 {
                          name = "input",
                          attributes = [
                            #(Attr:0x3ff504c64d94 {
                              name = "type",
                              value = "hidden"
                              }),
                            #(Attr:0x3ff504c64d6c {
                              name = "name",
                              value = "form_build_id"
                              }),
                            #(Attr:0x3ff504c64d44 {
                              name = "value",
                              value = "form-hAeW3vg5YxWO1CPBWdN0OHgvuoRIRZueUFzRZyGIUiQ"
                              })]
                          }),
                        #(Text "\n"),
                        #(Element:0x3ff5024d17f0 {
                          name = "input",
                          attributes = [
                            #(Attr:0x3ff5024d173c {
                              name = "type",
                              value = "hidden"
                              }),
                            #(Attr:0x3ff5024d1728 {
                              name = "name",
                              value = "form_id"
                              }),
                            #(Attr:0x3ff5024d16d8 {
                              name = "value",
                              value = "listrak_api_subscribe_simplified_form"
                              })]
                          }),
                        #(Text "\n")]
                      })]
                  }),
                #(Element:0x3ff5024ccf20 {
                  name = "div",
                  attributes = [
                    #(Attr:0x3ff5024cca5c {
                      name = "class",
                      value = "custom-listrak-subscribe-under-form"
                      })],
                  children = [
                    #(Element:0x3ff5030a7020 {
                      name = "p",
                      children = [
                        #(Text "BONUS: You’ll also receive our "),
                        #(Element:0x3ff5030a3f60 {
                          name = "i",
                          children = [ #(Text "Almanac Companion")]
                          }),
                        #(Text " newsletter!")]
                      }),
                    #(Text "\r\n")]
                  }),
                #(Text "    ")]
              }),
            #(Text "\n" + "\n" + "    \n" + "    \n" + "  ")]
          }),
        #(Text "\n" + "\n"),
        #(Element:0x3ff5024c35ec {
          name = "div",
          attributes = [
            #(Attr:0x3ff5024c2c00 {
              name = "class",
              value = "panel-separator"
              })]
          }),
        #(Element:0x3ff50309d8cc {
          name = "div",
          attributes = [
            #(Attr:0x3ff50309d520 {
              name = "class",
              value = "panel-pane pane-block pane-advertising-advertising-107788 no-title block"
              })],
          children = [
            #(Text "\n" + "  "),
            #(Element:0x3ff504c5a13c {
              name = "div",
              attributes = [
                #(Attr:0x3ff504c59ac0 {
                  name = "class",
                  value = "block-inner clearfix"
                  })],
              children = [
                #(Text "\n" + "    \n" + "            \n" + "    \n" + "    "),
                #(Element:0x3ff504c54458 {
                  name = "div",
                  attributes = [
                    #(Attr:0x3ff504c4e1c0 {
                      name = "class",
                      value = "block-content"
                      })],
                  children = [
                    #(Text "\n" + "      "),
                    #(Comment " Ad: Sitewide 336x280 B "),
                    #(Text "\n"),
                    #(Element:0x3ff5024b3e58 {
                      name = "div",
                      attributes = [
                        #(Attr:0x3ff5024b3908 {
                          name = "id",
                          value = "dfp-ad-107788"
                          }),
                        #(Attr:0x3ff5024b38a4 {
                          name = "class",
                          value = "sitewide-rectangle-ad"
                          })],
                      children = [
                        #(Text "\n"),
                        #(Element:0x3ff5024444b8 {
                          name = "script",
                          attributes = [
                            #(Attr:0x3ff502444030 {
                              name = "type",
                              value = "text/javascript"
                              })],
                          children = [
                            #(CDATA "\n" +
                              "  googletag.cmd.push(function() { \n" +
                              "    googletag.display('dfp-ad-107788');\n" +
                              "  });\n")]
                          }),
                        #(Text "\n")]
                      }),
                    #(Text "\n" + "    ")]
                  }),
                #(Text "\n" + "\n" + "    \n" + "    \n" + "  ")]
              }),
            #(Text "\n")]
          }),
        #(Text "\n"),
        #(Element:0x3ff5030945ec {
          name = "div",
          attributes = [
            #(Attr:0x3ff5030943e4 {
              name = "class",
              value = "panel-separator"
              })]
          }),
        #(Element:0x3ff5030894e4 {
          name = "section",
          attributes = [
            #(Attr:0x3ff5030893cc {
              name = "class",
              value = "panel-pane pane-block pane-webcam-webcams-promo-main block"
              })],
          children = [
            #(Text "\n" + "  "),
            #(Element:0x3ff503080fd8 {
              name = "div",
              attributes = [
                #(Attr:0x3ff503080d6c {
                  name = "class",
                  value = "block-inner clearfix"
                  })],
              children = [
                #(Text "\n" + "    \n" + "              "),
                #(Element:0x3ff5024a71a8 {
                  name = "h2",
                  attributes = [
                    #(Attr:0x3ff5024a6f64 {
                      name = "class",
                      value = "pane-title block-title"
                      })],
                  children = [ #(Text "The Almanac Webcam")]
                  }),
                #(Text "\n" + "        \n" + "    \n" + "    "),
                #(Element:0x3ff50248b1c4 {
                  name = "div",
                  attributes = [
                    #(Attr:0x3ff50248ac24 {
                      name = "class",
                      value = "block-content"
                      })],
                  children = [
                    #(Text "\n" + "      "),
                    #(Element:0x3ff50247e050 {
                      name = "div",
                      attributes = [
                        #(Attr:0x3ff502467f44 {
                          name = "class",
                          value = "webcam_wrapper"
                          })],
                      children = [
                        #(Element:0x3ff502456690 {
                          name = "a",
                          attributes = [
                            #(Attr:0x3ff502452158 {
                              name = "href",
                              value = "/webcam"
                              }),
                            #(Attr:0x3ff50244ebfc {
                              name = "title",
                              value = "Almanac Headquarters Cam -- click to see hourly images."
                              })],
                          children = [
                            #(Element:0x3ff50261db7c {
                              name = "img",
                              attributes = [
                                #(Attr:0x3ff50261daf0 {
                                  name = "class",
                                  value = "webcam_image_hq"
                                  }),
                                #(Attr:0x3ff50261dadc {
                                  name = "alt",
                                  value = "Almanac Headquarters Cam"
                                  }),
                                #(Attr:0x3ff50261dab4 {
                                  name = "src",
                                  value = "https://almanac.s3.amazonaws.com/webcam/rightbar.jpg"
                                  })]
                              }),
                            #(Element:0x3ff50261d028 {
                              name = "h2",
                              children = [
                                #(Text "Visit the Almanac HQ Webcam")]
                              })]
                          })]
                      }),
                    #(Text "    ")]
                  }),
                #(Text "\n" + "\n" + "    \n" + "    \n" + "  ")]
              }),
            #(Text "\n")]
          }),
        #(Text "\n"),
        #(Element:0x3ff50261c344 {
          name = "div",
          attributes = [
            #(Attr:0x3ff50261c268 {
              name = "class",
              value = "panel-separator"
              })]
          }),
        #(Element:0x3ff502456fa0 {
          name = "section",
          attributes = [
            #(Attr:0x3ff502457fb8 {
              name = "class",
              value = "panel-pane pane-custom pane-2 recommender block"
              })],
          children = [
            #(Text "\n" + "  "),
            #(Element:0x3ff50249f3a4 {
              name = "div",
              attributes = [
                #(Attr:0x3ff5024a7a18 {
                  name = "class",
                  value = "block-inner clearfix"
                  })],
              children = [
                #(Text "\n" + "    \n" + "              "),
                #(Element:0x3ff50308036c {
                  name = "h2",
                  attributes = [
                    #(Attr:0x3ff503080524 {
                      name = "class",
                      value = "pane-title block-title"
                      })],
                  children = [
                    #(Text "Chosen for You from The Old Farmer's Store")]
                  }),
                #(Text "\n" + "        \n" + "    \n" + "    "),
                #(Element:0x3ff502c0ef54 {
                  name = "div",
                  attributes = [
                    #(Attr:0x3ff502c0eaf4 {
                      name = "class",
                      value = "block-content"
                      })],
                  children = [
                    #(Text "\n" + "      "),
                    #(Element:0x3ff502444fbc {
                      name = "div",
                      attributes = [
                        #(Attr:0x3ff502444e7c {
                          name = "data-ltk-merchandiseblock",
                          value = "f46877a4-8aba-4eb5-96fb-0dc03c829d83"
                          })],
                      children = [
                        #(Element:0x3ff5024b68d8 {
                          name = "script",
                          attributes = [
                            #(Attr:0x3ff5024b6680 {
                              name = "type",
                              value = "text/html"
                              })],
                          children = [
                            #(CDATA "\n" +
                              "        <div>\n" +
                              "            <a onclick=\"ga('send', {hitType: 'event', eventCategory: 'Products', eventAction: 'Click', eventLabel: '@Recommendation.Title', transport: 'beacon'});\" href=\"@(Recommendation.LinkUrl)\">\n" +
                              "                <img src=\"@Recommendation.ImageUrl\" alt=\"@Recommendation.Title\" />\n" +
                              "                <strong>@Recommendation.Title</strong>\n" +
                              "                <div class=\"form-submit\" style=\"width: 50%; margin-left: auto;\n" +
                              "    margin-right: auto;\">Buy Now!</div>\n" +
                              "            </a>\n" +
                              "        </div>\n" +
                              "    ")]
                          })]
                      }),
                    #(Text "\n" + "    ")]
                  }),
                #(Text "\n" + "\n" + "    \n" + "    \n" + "  ")]
              }),
            #(Text "\n")]
          }),
        #(Text "\n"),
        #(Element:0x3ff5030a3920 {
          name = "div",
          attributes = [
            #(Attr:0x3ff5030a372c {
              name = "class",
              value = "panel-separator"
              })]
          }),
        #(Element:0x3ff5030a282c {
          name = "div",
          attributes = [
            #(Attr:0x3ff5030a2908 {
              name = "class",
              value = "panel-pane pane-block pane-advertising-advertising-107800 no-title block"
              })],
          children = [
            #(Text "\n" + "  "),
            #(Element:0x3ff5024cd77c {
              name = "div",
              attributes = [
                #(Attr:0x3ff5024cd54c {
                  name = "class",
                  value = "block-inner clearfix"
                  })],
              children = [
                #(Text "\n" + "    \n" + "            \n" + "    \n" + "    "),
                #(Element:0x3ff5024d56ac {
                  name = "div",
                  attributes = [
                    #(Attr:0x3ff5024d4ba8 {
                      name = "class",
                      value = "block-content"
                      })],
                  children = [
                    #(Text "\n" + "      "),
                    #(Comment " Ad: Sitewide 336x280 C "),
                    #(Text "\n"),
                    #(Element:0x3ff504c646f0 {
                      name = "div",
                      attributes = [
                        #(Attr:0x3ff504c64344 {
                          name = "id",
                          value = "dfp-ad-107800"
                          }),
                        #(Attr:0x3ff504c64308 {
                          name = "class",
                          value = "sitewide-rectangle-ad"
                          })],
                      children = [
                        #(Text "\n"),
                        #(Element:0x3ff504c6ca80 {
                          name = "script",
                          attributes = [
                            #(Attr:0x3ff504c6c88c {
                              name = "type",
                              value = "text/javascript"
                              })],
                          children = [
                            #(CDATA "\n" +
                              "  googletag.cmd.push(function() { \n" +
                              "    googletag.display('dfp-ad-107800');\n" +
                              "  });\n")]
                          }),
                        #(Text "\n")]
                      }),
                    #(Text "\n" + "    ")]
                  }),
                #(Text "\n" + "\n" + "    \n" + "    \n" + "  ")]
              }),
            #(Text "\n")]
          }),
        #(Text "\n" + "    ")]
      }),
    #(Text "\n" + "  ")]
  })
