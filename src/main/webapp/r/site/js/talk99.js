<
!--saved
from
url = (0050)
http://static.soperson.com/131221/talk99.js?160203 -->
    <
html > < head > < meta
http - equiv = "Content-Type"
content = "text/html; charset=GBK" > < / head > < body > < pre
style = "word-wrap: break-word; white-space: pre-wrap;" > (function (D) {
        var E = D.env, doc = document, docurl = doc.location.href, share = null, lookup = [], ci = E.compId, loaded = false, oms = ci &gt;= 20000000, ua = navigator.userAgent.toLowerCase(), id_s = "looyu_id", id_l = "looyu_" + ci, localdb, localtemp, homepage = oms &amp;&amp; "http://www.looyuoms.com" || "http://www.talk99.cn", dct = [], sametime = 120, fpath = E.file + "/../default/", conhtml, site = E.subComp || 0, winopt = "height=450,width=650,directories=no,location=no,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no,top=100,left=200", supportFlash = (function () {
            var version = 0, plug = navigator.plugins;
            if (plug &amp;&amp; plug.length &gt; 0 &amp;&amp; plug["Shockwave Flash"]) {
                var words = plug["Shockwave Flash"].description.split(" ");
                for (var i = 0; i &lt; words.length; i++) {
                    if (isNaN(parseInt(words[i]))) {
                        continue
                    }
                    version = words[i]
                }
            } else {
                try {
                    version = parseInt(new ActiveXObject("ShockwaveFlash.ShockwaveFlash").FlashVersion()) &gt;&gt;&gt; 16
                } catch (e) {
                }
            }
            return version &gt;= 9
        })();
        var getDomain = function (url) {
            url = url.replace(/^\w+:\/\//, "");
            var p = url.indexOf("/");
            if (p != -1) {
                url = url.substring(0, p)
            }
            var da = url.split("."), len = da.length;
            if (len &gt; 2) {
                var t = len - 2;
                var l2 = da[t];
                if (/org|com|net/.test(l2)) {
                    t = len - 3
                }
                for (var i = 0; i &lt; t; i++) {
                    da[i] = ""
                }
                url = da.join(".")
            }
            return url
        };
        var domain = getDomain(docurl);
        var $ = function (id) {
            return doc.getElementById(id)
        }, browser = {
            strict: doc.compatMode == "CSS1Compat",
            webkit: /webkit/i.test(ua),
            msie: /msie/i.test(ua) &amp;&amp; !/opera/i.test(ua),
            gecko: !/webkit/i.test(ua) &amp;&amp; /gecko/i.test(ua),
            safari: /safari/i.test(ua) &amp;&amp; !/maxthon/i.test(ua),
            cacheswf: /theworld|se\s\d+|greenbrowser/i.test(ua),
            android: ua.indexOf("android") &gt; -1,
            iPhone: ua.indexOf("iphone") &gt; -1,
            winPhone: ua.indexOf("windows phone") &gt; -1,
            iPad: ua.indexOf("ipad") &gt; -1
        };
        $.mobile = browser.android || browser.iPhone || browser.winPhone;
        var securityPath = function (p) {
            if (!E.secure || p.indexOf("http://static.soperson") == -1) {
                return p
            }
            return p.replace("http://static", "https://encrypt")
        };
        browser.ie6 = browser.msie &amp;&amp; !/msie [789]/i.test(ua);
        browser.fix = !browser.msie || (!browser.ie6 &amp;&amp; browser.strict);
        browser.ie6 &amp;&amp; doc.execCommand("BackgroundImageCache", false, true);
        var blk = function (s) {
            s = s || "";
            return !(trim(s))
        }, trim = function (s) {
            return (s || "").replace(/^\s+|\s+$/, "")
        }, getCookie = function (name) {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
            arr = (doc.cookie || "").match(reg);
            return arr ? unescape(arr[2]) : null
        }, setCookie = function (name, value, t) {
            var expStr = "";
            if (t != 0) {
                if (t == -1) {
                    t = 120 * 30 * 24 * 60 * 60
                }
                t = t * 1000;
                var exp = new Date();
                exp.setTime(exp.getTime() + t);
                expStr = exp.toGMTString()
            }
            doc.cookie = name + "=" + escape(value) + ";expires=" + expStr + ";domain=" + domain + ";path=/"
        }, delCookie = function (name) {
            setCookie(name, "", -3600)
        }, setShare = function (name, value, sec) {
            if (supportFlash &amp;&amp; share) {
                share.setCookie(name, value, sec || -1)
            }
            setCookie(name, value, sec)
        }, tpl = function (s, obj) {
            return s.replace(/\$?\{([a-zA-z0-9]*)\}/ig, function ($1, $2) {
                return obj[$2]
            })
        }, cterPos = function (w, h) {
            return {top: (getBody().clientHeight - h) / 2, left: (getBody().clientWidth - w) / 2}
        }, stayPos = function (p, w, h) {
            return !p &amp;&amp; cterPos(w, h) || p == 1 &amp;&amp; {left: 5, bottom: 5} || p == 2 &amp;&amp; {
                    right: 5,
                    bottom: 5
                }
        };
        var have = doc.compareDocumentPosition ? function (a, b) {
            return a.compareDocumentPosition(b) &amp; 16
        } : function (a, b) {
            return a !== b &amp;&amp; (a.contains ? a.contains(b) : true)
        }, inB = (function () {
            var el = $("doyoo_panel") || $("doyoo_monitor");
            if (!doc.body) {
                return false
            }
            if (!el) {
                return true
            }
            var fms = doc.forms;
            for (var i = 0; i &lt; fms.length; i++) {
                if (have(fms[i], el)) {
                    return false
                }
            }
            return true
        })(), loadSWF = function (id, name) {
            var sharediv = $("doyoo_share");
            if (!sharediv) {
                ready(function () {
                    loadSWF(id, name)
                });
                return true
            }
            var path = fpath + "swf/" + name, str = ' &lt;object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1" height="1" id="{id}"&gt;&lt;param name="movie" value="{path}"/&gt;&lt;param name="allowScriptAccess" value="always"/&gt;&lt;embed src="{path}" allowScriptAccess="always" width="1" height="1" name="{id}" type="application/x-shockwave-flash"&gt;&lt;/embed&gt;&lt;/object&gt; ';
            if (browser.cacheswf) {
                path += "?_t=" + +new Date()
            }
            var os = tpl(str, {path: path, id: id});
            sharediv.innerHTML = '&lt;iframe src="about:blank" id="shareWrapper"&gt;&lt;/iframe&gt;';
            show(sharediv);
            try {
                var h = '&lt;html&gt;&lt;head&gt;&lt;script type="text/javascript"&gt;var domReady=false,doyoo={};doyoo.probe=function(){return parent.doyoo.probe();};doyoo.init=function(o){return parent.doyoo.init(o);};doyoo.domReady=function(){return domReady;};doyoo.shareReady=function(){parent.doyoo.shareReady();};window.onload=function(){domReady=true};window.findSWF=function(id,ie){return ie?window[id]:document[id];};&lt;\/script&gt;&lt;/head&gt;&lt;body&gt;&lt;script type="text/javascript"&gt;document.write(\'' + os + "')&lt;\/script&gt;&lt;/body&gt;&lt;/html&gt;";
                var indoc = $("shareWrapper").contentWindow.document;
                indoc.open();
                indoc.write(h);
                indoc.close()
            } catch (e) {
                return false
            }
            return true
        }, findSWF = function (id) {
            var indoc = $("shareWrapper").contentWindow;
            return indoc.findSWF(id, browser.msie)
        }, jsonRequest = function (url, cb) {
            D.resp = null;
            var u = url + "&amp;x=" + (+new Date()), h = doc.getElementsByTagName("head")[0], s = createEle("script", {
                type: "text/javascript",
                src: u
            }, h);
            var callback = function (o) {
                var rst = D.resp;
                remove(o);
                cb &amp;&amp; cb(rst)
            };
            if (s.addEventListener) {
                s.addEventListener("load", function () {
                    callback(this)
                }, false)
            } else {
                if (s.readyState) {
                    s.onreadystatechange = function () {
                        if (this.readyState == "loaded") {
                            callback(this)
                        }
                    }
                } else {
                    s.onload = function () {
                        callback(this)
                    }
                }
            }
        }, currentStyle = function (el) {
            return el.currentStyle || doc.defaultView.getComputedStyle(el, null)
        }, show = function (v) {
            if (typeof v == "string") {
                v = $(v)
            }
            if (v) {
                v.style.display = v.doyoo_old || "";
                if (currentStyle(v).display === "none") {
                    v.style.display = "block"
                }
            }
        }, hide = function (v) {
            if (typeof v == "string") {
                v = $(v)
            }
            if (v) {
                v.doyoo_old = v.style.display;
                v.style.display = "none"
            }
        }, remove = function (nd) {
            nd &amp;&amp; nd.parentNode &amp;&amp; nd.parentNode.removeChild(nd)
        }, attachE = function (t, e, f) {
            if (!t) {
                return
            }
            var re = /[a-z]+/ig, attr;
            while ((attr = re.exec(e)) != null) {
                var at = attr[0];
                if (t.addEventListener) {
                    t.addEventListener(at, f, false)
                } else {
                    if (t.attachEvent) {
                        t.attachEvent("on" + at, f)
                    } else {
                        t["on" + at] = f
                    }
                }
            }
        }, detachE = function (t, e, f) {
            if (t.removeEventListener) {
                t.removeEventListener(e, f, false)
            } else {
                if (t.detachEvent) {
                    t.detachEvent("on" + e, f)
                } else {
                    t["on" + e] = null
                }
            }
        }, obj2str = function (obj) {
            var a = [];
            each(obj, function (l, v) {
                a.push(l + "=" + encodeURIComponent(v) || "")
            });
            return a.join("&amp;")
        }, guessR = function () {
            var re = /looyu_ext(\d)=(\w+)(?:&amp;|$)/ig;
            var rst = [], mt;
            while ((mt = re.exec(docurl)) != null) {
                rst.push("ext" + mt[1], mt[2])
            }
            return rst.length ? ("#params:" + rst.join(",")) : ""
        }, each = function (obj, func) {
            for (var v in obj) {
                if (typeof obj[v] != "function" &amp;&amp; obj.hasOwnProperty(v)) {
                    func(v, obj[v])
                }
            }
        }, getBody = function () {
            return !browser.strict ? doc.body : doc.documentElement
        }, sTop = function () {
            return getBody().scrollTop || doc.body.scrollTop
        }, sLeft = function () {
            return getBody().scrollLeft || doc.body.scrollLeft
        }, fixTop = function () {
            return browser.fix ? 0 : sTop()
        }, upDenied = function () {
            setCookie(denyKey, monDenied, sametime)
        }, upvid = function () {
            getCookie(id_s) != localdb &amp;&amp; setCookie(id_s, localdb, -1);
            setCookie(id_l, getCookie(id_l) || localtemp, sametime);
            supportFlash &amp;&amp; share &amp;&amp; share.upvid &amp;&amp; share.upvid(ci, site, E.vId);
            setTimeout(upvid, 60000)
        }, sameSite = function (loc) {
            return getDomain(loc) == getDomain(docurl)
        }, ignoreLongParam = function (url, max) {
            var urlArray = url.split("?", 2);
            if (urlArray.length == 2) {
                var rtn = [];
                var params = urlArray[1].split("&amp;");
                for (var i = 0; i &lt; params.length; i++) {
                    var a = params[i].split("=", 2);
                    if (a[0].length &gt; max || a.length == 2 &amp;&amp; a[1].length &gt; max) {
                        continue
                    }
                    rtn.push(params[i])
                }
                url = urlArray[0] + "?" + rtn.join("&amp;")
            }
            return url
        }, shortURL = function (l) {
            if (!l || l.indexOf("http") != 0) {
                return ""
            }
            return l
        }, createEle = function (tag, opt, tar) {
            var d = doc.createElement(tag);
            (tar || doc.body).appendChild(d);
            each(opt || {}, function (l, v) {
                v &amp;&amp; d.setAttribute(l, v)
            });
            return d
        }, commonURL = function () {
            var obj = {c: ci, v: E.vId, u: E.uId, f: E.confId, site: site, p0: E.p0};
            if (E.counter) {
                obj.ct = E.counter
            }
            if (E.lang) {
                obj.lang = E.lang
            }
            extend(obj, {refer: shortURL(E.refer), loc: shortURL(docurl)});
            if (!E.reseve || E.reseve == "" || E.reseve == "null") {
                E.reseve = getCookie("_DOYOO_RESEVE_KEY")
            }
            if (E.reseve &amp;&amp; E.reseve != "null") {
                obj.r = E.reseve
            }
            obj._d = +new Date();
            return obj2str(obj)
        }, chatURL = function (ch) {
            if (!E.uId) {
                return "#"
            }
            var url = E.chat + "/chat/p.do?";
            var md = 1, ot = [];
            if (!ch || typeof ch == "object") {
                if (ch &amp;&amp; ch.type) {
                    ot.push("cId=" + ch.m)
                }
                if (ch &amp;&amp; (ch.sId || ch.g)) {
                    ot.push("command=" + (ch.force &amp;&amp; "forceChat" || ch.sId &amp;&amp; "applyChat" || "inviteChat"));
                    ot.push("t=" + ch.type);
                    ot.push(ch.sId ? ("n=" + ch.sId) : ("g=" + ch.g));
                    md = ch.g &amp;&amp; 7 || ch.m &amp;&amp; 3 || ch.force &amp;&amp; 6 || 1
                } else {
                    var cg = D.monParam &amp;&amp; D.monParam.group;
                    if (cg &amp;&amp; cg != "0") {
                        ot.push("g=" + cg)
                    }
                    md = 5
                }
            } else {
                if (typeof ch == "string" &amp;&amp; ch) {
                    ot.push(ch);
                    md = 2
                }
            }
            ot.push("md=" + md);
            return url + ot.join("&amp;") + "&amp;" + commonURL()
        }, openChat = function (ch, ur) {
            var url = ur || ch &amp;&amp; chatURL(ch) || m &amp;&amp; m.talk || chatURL("g=");
            try {
                var cw = window.open(url, "chat_" + (+new Date()), winopt);
                cw.focus()
            } catch (e) {
                if (ch.force) {
                    window.location = url
                }
            }
            return false
        }, extend = function (o, ch) {
            o &amp;&amp; arguments[2] &amp;&amp; extend(o, arguments[2]);
            if (o &amp;&amp; ch &amp;&amp; typeof ch == "object") {
                for (var v in ch) {
                    ch.hasOwnProperty(v) &amp;&amp; (o[v] = ch[v])
                }
            }
            return o
        }, fly = function (v, g, w, h, pos) {
            pos = pos || cterPos(200, 75);
            v = (typeof v == "string") ? $(v) : v;
            if (!v) {
                return
            }
            var f = new flier(v, g, w, h, pos);
            ready(f.start.doyoodg(f));
            return f
        }, fade = function (o) {
            var opcity = function () {
                var args = arguments, obj = args[0], f = obj.style.filter;
                if (args.length == 2) {
                    var v = args[1];
                    browser.msie &amp;&amp; (obj.style.filter = "alpha(opacity=" + v + ")") || (obj.style.opacity = v / 100)
                } else {
                    if (browser.msie) {
                        return f &amp;&amp; f.indexOf("opacity=") &gt;= 0 ? (parseInt(f.match(/opacity=([^)]*)/)[1])) : 100
                    } else {
                        return obj.style.opacity * 100
                    }
                }
            };
            opcity(o, 0);
            show(o);
            var doFade = function () {
                var op = opcity(o);
                if (op &lt; 100) {
                    opcity(o, op + 5);
                    setTimeout(doFade, 100)
                } else {
                    o.style.filter = "";
                    o.style.backgroundColor = "transparent"
                }
            };
            o.style.backgroundColor = "#FFF";
            doFade()
        }, slide = function (o, pos, tar) {
            show(o);
            var w = parseInt(o.offsetWidth || 500), h = parseInt(o.offsetHeight || 300), pw = getBody().clientWidth, ph = getBody().clientHeight, sp = [0 - h + fixTop(), sLeft() + pw, ph + fixTop(), 0 - w + sLeft()], rp = ["top", "left"];
            var sv = sp[pos], d = pos % 2, tv = d ? (tar.left || (pw - tar.right - w)) : (tar.top || (ph - tar.bottom - h)), td = d ? "left" : "top";
            var setP = function (v) {
                o.style[td] = v + "px"
            };
            setP(sv);
            var doSlide = function () {
                var stv = tv + (d ? sLeft() : fixTop());
                if (Math.abs(stv - sv) &gt; 4) {
                    sv += (stv &gt; sv ? 4 : -4);
                    setP(sv);
                    setTimeout(doSlide, 1)
                } else {
                    setP(stv)
                }
            };
            doSlide()
        }, ready = (function () {
            var func = [], domCheck = false;
            var exec = function () {
                if (loaded) {
                    return
                }
                loaded = true;
                for (var i = 0; i &lt; func.length; i++) {
                    func[i]()
                }
            };
            var domLoaded;
            if (doc.addEventListener) {
                domLoaded = function () {
                    doc.removeEventListener("DOMContentLoaded", domLoaded, false);
                    exec()
                }
            } else {
                if (doc.attachEvent) {
                    domLoaded = function () {
                        if (doc.readyState === "complete") {
                            doc.detachEvent("onreadystatechange", domLoaded);
                            exec()
                        }
                    }
                }
            }
            var scrollCheck = function () {
                if (loaded) {
                    return
                }
                try {
                    doc.documentElement.doScroll("left")
                } catch (e) {
                    setTimeout(scrollCheck, 1);
                    return
                }
                exec()
            };
            return function (fn) {
                if (loaded || !!E.ready) {
                    fn()
                } else {
                    func.push(fn);
                    if (!domCheck) {
                        domCheck = true;
                        if (doc.readyState === "complete") {
                            return exec()
                        }
                        if (doc.addEventListener) {
                            doc.addEventListener("DOMContentLoaded", domLoaded, false);
                            window.addEventListener("load", exec, false)
                        } else {
                            if (doc.attachEvent) {
                                doc.attachEvent("onreadystatechange", domLoaded);
                                window.attachEvent("onload", exec);
                                var toplevel = false;
                                try {
                                    toplevel = window.frameElement == null
                                } catch (e) {
                                }
                                if (document.documentElement.doScroll &amp;&amp; toplevel) {
                                    scrollCheck()
                                }
                            }
                        }
                    }
                }
            }
        })(), onloaded = function (fn) {
            if (!!E.ready) {
                fn()
            } else {
                attachE(window, "load", fn)
            }
        }, genID = function () {
            var id = 0;
            return function () {
                return "looyu_dom_" + id++
            }
        }(), monitorObj = function (o) {
            o = o || {};
            var h = o.t || doc.title, u = o.u || docurl;
            if (h.length &gt; 100) {
                h = h.substring(0, 100)
            }
            return {
                c: "a",
                i: ci,
                v: E.vId,
                u: E.uId,
                p: E.pId || "",
                ref: E.refer,
                site: site,
                h: h,
                w: u,
                scn: (screen.width + "*" + screen.height),
                t: this.type || "",
                ct: E.counter,
                r: E.reseve || "",
                p0: E.p0 || docurl
            }
        };
        D.util = {
            openChat: openChat, chatURL: chatURL, fly: fly, openPhone: function (pm) {
                var url = m &amp;&amp; m.talk || chatURL(pm), found = false;
                url = url.replace(/command=[^&amp;$]*/, function () {
                    found = true;
                    return "command=freePhone"
                });
                found || (url = url + "&amp;command=freePhone");
                openChat("", url)
            }, msgSuccess: function (o) {
                msgp &amp; msgp.success()
            }
        };
        extend(Function.prototype, {
            doyoodg: function (obj, args) {
                var method = this;
                return function () {
                    var callArgs = args || arguments;
                    return method.apply(obj || window, callArgs)
                }
            }
        });
        Function.prototype.delegate || (Function.prototype.delegate = Function.prototype.doyoodg);
        var timer = function () {
            this.id = 0;
            this.tasks = [];
            this.exec = this.execute.doyoodg(this)
        };
        extend(timer.prototype, {
            addTask: function (f) {
                if (typeof f == "function") {
                    this.tasks.push(f)
                }
            }, delTask: function (f) {
                for (var i = 0; i &lt; this.tasks.length; i++) {
                    if (this.tasks[i] == f) {
                        this.tasks.splice(i);
                        break
                    }
                }
            }, execute: function () {
                for (var v = 0; v &lt; this.tasks.length; v++) {
                    !this.tasks[v] || this.tasks[v]()
                }
            }, start: function (t) {
                if (this.id != 0) {
                    this.stop()
                }
                this.id = setInterval(this.exec, t)
            }, stop: function () {
                if (this.id != 0) {
                    clearInterval(this.id)
                }
                this.id = 0
            }, started: function () {
                return this.id != 0
            }
        });
        var dtimer = new timer();
        var flier = function (v, g, w, h, pos) {
            extend(this, {
                obj: v,
                handle: !g ? null : (typeof g == "string") ? $(g) : g,
                width: w || v.offsetWidth,
                height: h || v.offsetHeight,
                onmousemove: this.drag.doyoodg(this),
                onmousemove: this.drag.doyoodg(this),
                onmouseup: this.drop.doyoodg(this),
                pos: pos
            });
            if (this.handle) {
                this.handle.style.cursor = "move";
                this.handle.onmousedown = this.beginDrag.doyoodg(this)
            }
        };
        extend(flier.prototype, {
            beginDrag: function (e) {
                e = e || event;
                this.offs = {x: e.offsetX || e.layerX, y: e.offsetY || e.layerY};
                attachE(doc, "mousemove", this.onmousemove);
                attachE(doc, "mouseup", this.onmouseup);
                doc.onselectstart = function () {
                    return false
                }
            }, isMoved: function (newX, newY) {
                var b = getBody();
                return {
                    x: newX &gt; 0 &amp;&amp; newX &lt; b.clientWidth - this.width + sLeft(),
                    y: newY &gt; 0 &amp;&amp; newY &lt; b.clientHeight - this.height + sTop()
                }
            }, drag: function (e) {
                e = e || event;
                var b = getBody(), o = this.obj;
                var mv = this.isMoved(e.clientX - this.offs.x + sLeft(), e.clientY - this.offs.y + sTop());
                if (mv.x) {
                    o.style.left = e.clientX - this.offs.x + "px"
                }
                if (mv.y) {
                    o.style.top = e.clientY - this.offs.y + fixTop() + "px"
                }
            }, drop: function (e) {
                detachE(doc, "mousemove", this.onmousemove);
                detachE(doc, "mouseup", this.onmouseup);
                doc.onselectstart = null
            }, reset: function (o) {
                extend(this, o);
                delete this.lastLeft
            }, showDiv: function () {
                var st = this.obj.style;
                if (typeof this.lastLeft == "undefined") {
                    this.lastLeft = sLeft();
                    this.lastTop = sTop();
                    var pb = (this.pos.bottom ? (getBody().clientHeight - this.pos.bottom - this.height) : this.pos.top);
                    st.top = sTop() + pb + "px";
                    return
                }
                if (st.visibility != "visible") {
                    st.visibility = "visible"
                }
                var nleft = sLeft(), ntop = sTop();
                var dx = nleft - this.lastLeft, dy = ntop - this.lastTop;
                if (dx != 0) {
                    var sig = (st.left ? "left" : "right"), stv = 0;
                    try {
                        stv = parseInt(st[sig] || 0)
                    } catch (e) {
                    }
                    st[sig] = stv + dx + "px";
                    this.lastLeft = nleft
                }
                if (dy != 0) {
                    if (st.top) {
                        st.top = parseInt(st.top) + dy + "px"
                    }
                    this.lastTop = ntop
                }
            }, start: function () {
                var me = this, checkPos = function (o) {
                    var pn = o.parentNode, tag = function (el) {
                        return el.tagName.toLowerCase()
                    };
                    return (pn &amp;&amp; tag(pn) == "body")
                };
                if (!checkPos(this.obj)) {
                    onloaded(function () {
                        remove(me.obj);
                        doc.body.appendChild(me.obj);
                        me.start()
                    });
                    return
                }
                if (!browser.fix) {
                    this.func = this.showDiv.doyoodg(this);
                    dtimer.addTask(this.func);
                    dtimer.start(250)
                } else {
                    this.obj.style.position = "fixed"
                }
            }, stop: function () {
                dtimer.delTask(this.func)
            }
        });
        var M = function (cfg) {
            this.obj = $("doyoo_monitor");
            extend(this, cfg, {width: 412, height: 158})
        };
        var P = function (cfg) {
            this.obj = $("doyoo_panel");
            extend(this, cfg)
        };
        var Mask = function () {
        };
        extend(Mask.prototype, {
            showDiv: function () {
                this.obj = $("doyoo_mon_mask");
                if (!this.obj) {
                    this.obj = createEle("div", {id: "doyoo_mon_mask"});
                    var b = getBody();
                    this.obj.style.width = Math.max(b.scrollWidth, b.clientWidth) + "px";
                    this.obj.style.height = Math.max(b.scrollHeight, b.clientHeight) + "px"
                }
                show(this.obj)
            }, hideDiv: function () {
                hide(this.obj)
            }
        });
        var mask = new Mask();
        var DP = function () {
            this.defUI()
        };
        extend(DP.prototype, {
            defUI: function () {
                this.obj = createEle("div", {id: "looyu_p"});
                this.obj.innerHTML = '&lt;div class="looyu_p_tl looyu_p_t"&gt;&lt;div class="looyu_p_tr looyu_p_t"&gt;&lt;div class="looyu_p_tc looyu_p_t"&gt;&lt;div id="looyu_p_h"&gt;X&lt;/div&gt;&amp;nbsp;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="looyu_p_ml looyu_p_m"&gt;&lt;div class="looyu_p_mr  looyu_p_m"&gt;&lt;div class="looyu_p_mc"&gt;&lt;div id="looyu_p_c"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="looyu_p_bl  looyu_p_b"&gt;&lt;div class="looyu_p_br  looyu_p_b"&gt;&lt;div class="looyu_p_bc  looyu_p_b"&gt;&amp;nbsp;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;';
                attachE($("looyu_p_h"), "click dblclick", this.hideDiv.doyoodg(this))
            }, opt: function (w, h, u, b, p, f) {
                extend(this, {w: +w + 26, h: +h + 26, u: u, b: b, p: p, f: f});
                var o = $("looyu_p_c");
                extend(o.style, {width: w + "px", height: h + "px"});
                extend(this.obj.style, {width: this.w + "px", height: this.h + "px"});
                this.obj.className = "looyu_p_" + b;
                o.innerHTML = '&lt;iframe id="looyu_p_f" frameborder="0" width="100%" height="100%" src="' + u + '"&gt;&lt;/iframe&gt;';
                fly(this.obj, null, this.w, this.h, stayPos(p, this.w, this.h))
            }, showDiv: function () {
                mask.showDiv();
                var ps = stayPos(this.p, this.w, this.h);
                if (!this.p) {
                    ps.top += fixTop();
                    ps.left += sLeft()
                }
                each(ps, function (v) {
                    ps[v] = ps[v] + "px"
                });
                extend(this.obj.style, ps);
                !this.f &amp;&amp; show(this.obj);
                this.f &amp;&amp; (this.f == 1 ? fade(this.obj) : slide(this.obj, this.f - 2, stayPos(this.p, this.w, this.h)))
            }, hideDiv: function () {
                mask.hideDiv();
                hide(this.obj)
            }
        });
        var dp = null;
        P.chatParam = function (et, tar) {
            var p = "";
            if (et == "c") {
                p = "n=" + tar
            } else {
                if (et == "g") {
                    p = "g=" + (tar &amp;&amp; +tar || "")
                }
            }
            return p
        };
        extend(M.prototype, {
            defUI: function (mark) {
                var fp = function (s, idx) {
                    return fpath + "images/monitor/" + s + "_" + idx + ".gif?131127"
                };
                var cu = function (s, idx) {
                    return "url(" + fp(s, idx) + ")"
                };
                var i = this.index, bi = i, o = this.obj, inh, inh2, defp;
                var lang = E.lang || "sc";
                var accs = {
                    tc: "\u5f00\u59cb\u4ea4\u8c08",
                    en: "Chat",
                    sc: "\u5f00\u59cb\u4ea4\u8c08"
                }, denys = {tc: "\u7a0d\u540e\u518d\u8bf4", en: "Deny", sc: "\u7a0d\u540e\u518d\u8bf4"};
                if ($.mobile &amp;&amp; !this.preferConfig) {
                    o.className += " doyoo_mon_mobile";
                    inh = '&lt;div id="doyoo_mon_innner" style="position:relative;width:100%;height:100%;-webkit-transform: translateZ(0px)"&gt;&lt;div id="doyoo_mon_main"&gt;&lt;/div&gt;&lt;a id="doyoo_mon_accept" class="doyoo_mon_btn" href="javascript:;" onclick="doyoo.util.openChat();doyoo.util.accept();return false;"&gt;' + (accs[lang] || "CHAT") + '&lt;/a&gt;&lt;div id="doyoo_mon_closer"&gt;&lt;/div&gt;&lt;/div&gt;';
                    extend(this, {width: 200, height: 120});
                    o.innerHTML = inh
                } else {
                    if (i &lt;= 8 &amp;&amp; i &gt; 0 || i &gt; 100) {
                        try {
                            inh = '&lt;div id="doyoo_mon_innner" style="position:relative;width:100%;height:100%;-webkit-transform: translateZ(0px)"&gt;&lt;div id="doyoo_mon_head"&gt;&lt;/div&gt;&lt;div id="doyoo_mon_main"&gt;&lt;/div&gt;&lt;div id="doyoo_mon_foot"&gt;&lt;a id="doyoo_mon_accept" class="doyoo_mon_btn" href="javascript:;" onclick="doyoo.util.openChat();doyoo.util.accept();return false;"&gt;&lt;/a&gt;&lt;a id="doyoo_mon_phone" class="doyoo_mon_btn"  href="javascript:;" onclick="doyoo.util.openPhone();doyoo.util.accept();return false;"&gt;&lt;/a&gt;&lt;div id="doyoo_mon_refuse" class="doyoo_mon_btn"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id="doyoo_mon_closer"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;';
                            o.innerHTML = inh
                        } catch (e) {
                        }
                        o.style.background = cu("m_bg", i) + " no-repeat";
                        $("doyoo_mon_accept").style.backgroundImage = cu("acc", lang);
                        $("doyoo_mon_refuse").style.backgroundImage = cu("dn", lang);
                        $("doyoo_mon_phone").style.backgroundImage = cu("phone", lang);
                        extend(this, {width: 429, height: 196})
                    } else {
                        inh = '&lt;div id="doyoo_mon_inner" style="position:relative;width:100%;height:100%;-webkit-transform: translateZ(0px)"&gt;&lt;object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="{mw}" height="{mh}"&gt;&lt;param name="movie" value="{mbg}"/&gt;&lt;param name="wmode" value="transparent"/&gt;&lt;embed src="{mbg}"  width="{mw}" height="{mh}" type="application/x-shockwave-flash" wmode="transparent"&gt;&lt;/embed&gt;&lt;/object&gt;&lt;div id="doyoo_mon_head" class="doyoo_mon_head" style="position:absolute;left:{mtl}px;top:{mtt}px;width:{mtw}px;height:{mth}px"&gt;&lt;/div&gt;&lt;a id="doyoo_mon_accept" href="javascript:;" onclick="doyoo.util.openChat();doyoo.util.accept();return false;" style="position:absolute;margin-left:5px;display:block;left:{mbal}px;bottom:{mbab}px;width:{mbaw}px;height:{mbah}px;background:url({mbabg}) no-repeat;text-align:center"&gt;&lt;/a&gt;&lt;a id="doyoo_mon_phone" href="javascript:;" onclick="doyoo.util.openPhone();doyoo.util.accept();return false;" style="position:absolute;display:block;margin:0;left:{mbpl}px;bottom:{mbpb}px;width:{mbpw}px;height:{mbph}px;background:url({mbpbg}) no-repeat;text-align:center"&gt;&lt;/a&gt;&lt;div id="doyoo_mon_refuse"  style="position:absolute;display:block;left:{mbdl}px;bottom:{mbdb}px;width:{mbdw}px;height:{mbdh}px;background:url({mbdbg}) no-repeat;text-align:center;top:auto;right:auto;cursor:pointer"&gt;&lt;/div&gt;&lt;div id="doyoo_mon_main" class="doyoo_mon_main"  style="position:absolute;left:{mml}px;top:{mmt}px;width:{mmw}px;height:{mmh}px"&gt;&lt;/div&gt;&lt;/div&gt;';
                        inh2 = '&lt;div id="doyoo_mon_inner" style="position:relative;width:100%;height:100%;background-image:url({mbg});-webkit-transform: translateZ(0px)"&gt;&lt;div id="doyoo_mon_head" class="doyoo_mon_head"  style="position:absolute;left:{mtl}px;top:{mtt}px;width:{mtw}px;height:{mth}px"  &gt;&lt;/div&gt;&lt;a id="doyoo_mon_accept" href="javascript:;" onclick="doyoo.util.openChat();doyoo.util.accept();return false;" style="position:absolute;margin-left:5px;display:block;left:{mbal}px;bottom:{mbab}px;width:{mbaw}px;height:{mbah}px;background:url({mbabg}) no-repeat"&gt;&lt;/a&gt;&lt;a id="doyoo_mon_phone" href="javascript:;" onclick="doyoo.util.openPhone();doyoo.util.accept();return false;" style="position:absolute;margin:0;display:block;left:{mbpl}px;bottom:{mbpb}px;width:{mbpw}px;height:{mbph}px;background:url({mbpbg}) no-repeat"&gt;&lt;/a&gt;&lt;div id="doyoo_mon_refuse" href="javascript:;" style="position:absolute;display:block;left:{mbdl}px;bottom:{mbdb}px;width:{mbdw}px;height:{mbdh}px;background:url({mbdbg}) no-repeat;top:auto;right:auto;cursor:pointer"&gt;&lt;/div&gt;&lt;div id="doyoo_mon_main" class="doyoo_mon_main"   style="position:absolute;left:{mml}px;top:{mmt}px;width:{mmw}px;height:{mmh}px"&gt;&lt;/div&gt;&lt;/div&gt;';
                        if (i &gt; 0) {
                            var acc = fp("acc", lang), deny = fp("dn", lang), phone = fp("phone", lang);
                            defp = {
                                mw: 500,
                                mh: 200,
                                mbg: fpath + "swf/" + i + ".swf?0831",
                                mtl: 40,
                                mtt: 8,
                                mtw: 240,
                                mth: 30,
                                mbal: 50,
                                mbab: 20,
                                mbaw: 78,
                                mbah: 25,
                                mbdl: 263,
                                mbdb: 20,
                                mbdw: 78,
                                mbdh: 25,
                                mml: 42,
                                mmt: 40,
                                mmw: 270,
                                mmh: 80,
                                mbabg: acc,
                                mbdbg: deny,
                                mbpbg: phone,
                                mbpw: 95,
                                mbph: 30,
                                mbpl: 148,
                                mbpb: 17
                            }
                        } else {
                            defp = this.style;
                            var tp = defp.elepos.split(" "), seq = ["mtl", "mtt", "mtw", "mth", "mml", "mmt", "mmw", "mmh", "mbal", "mbab", "mbaw", "mbah", "mbdl", "mbdb", "mbdw", "mbdh", "mbpl", "mbpb", "mbpw", "mbph"];
                            for (var j = 0; j &lt; seq.length; j++) {
                                defp[seq[j]] = parseInt(tp[j])
                            }
                            defp.mbpw = defp.mbpw || 0;
                            defp.mbph = defp.mbph || 0
                        }
                        o.innerHTML = tpl(/^.*\.swf($|\?.*)/.test(defp.mbg) ? inh : inh2, defp);
                        extend(this, {width: defp.mw, height: defp.mh})
                    }
                }
                this.main = $("doyoo_mon_main");
                this.head = $("doyoo_mon_head");
                this.accLink = $("doyoo_mon_accept");
                this.denyLink = $("doyoo_mon_refuse");
                this.closer = $("doyoo_mon_closer");
                this.head = $("doyoo_mon_head");
                mark &amp;&amp; (this._defui = true);
                var phoneLink = $("doyoo_mon_phone");
                if (!this.showPhone &amp;&amp; phoneLink) {
                    hide(phoneLink)
                }
            }, getPos: function () {
                return stayPos(this.pos, this.width, this.height)
            }, buildMain: function (txt) {
                txt = txt || this.text;
                this.main.innerHTML = /^https?:\/\/.*/.test(txt) ? ('&lt;iframe frameborder="0" width="100%" height="100%" src="' + txt + '"&gt;&lt;/iframe&gt;') : txt
            }, builder: function () {
                var o = this.obj;
                if (typeof beforeLooyuMonitorBuilder == "function") {
                    beforeLooyuMonitorBuilder.apply(this)
                } else {
                    this.defUI(true)
                }
                this.head &amp;&amp; (this.head.innerHTML = this.title);
                this._defui || (this.accLink.onclick = this.accept.doyoodg(this));
                this.denyLink &amp;&amp; (this.denyLink.onclick = this.deny.doyoodg(this));
                this.closer &amp;&amp; (this.closer.onclick = this.deny.doyoodg(this));
                extend(o.style, {width: this.width + "px", height: this.height + "px"});
                this.flier = fly(o, this.head, this.width, this.height, this.getPos())
            }, autoShow: function () {
                if (this.auto &gt;= 0 &amp;&amp; !this.autoTimer &amp;&amp; (this.offShow || this.status)) {
                    var now = new Date();
                    var nh = now.getHours(), nm = now.getMinutes();

                    function tonum(s) {
                        var s1 = s.replace(/:/g, "");
                        while (s1.charAt(0) == "0" &amp;&amp; s1.length &gt; 1) {
                            s1 = s1.substring(1)
                        }
                        return parseInt(s1)
                    }

                    var h1 = tonum(this.start), h2 = tonum(this.end);
                    var n = tonum(nh + ":" + ((nm &lt; 10) ? ("0" + nm) : nm));
                    if (h1 &lt;= n &amp;&amp; h2 &gt;= n) {
                        this.autoTimer = setTimeout(this.showDiv.doyoodg(this, [true]), this.auto * 1000)
                    }
                }
            }, leave: function () {
                var img = new Image();
                img.src = E.mon + "/s?" + this.leaveUrl();
                var leaveF = $("looyu_leave");
                leaveF &amp;&amp; (leaveF.src = "about:block");
                if (this.timer) {
                    clearInterval(this.timer);
                    this.timer = 0
                }
            }, refresh: function (o) {
                this.leave();
                this.record(o)
            }, destory: function () {
                this.leave();
                remove(this.obj);
                clearTimeout(this.autoTimer);
                this.flier.stop()
            }, bindLeave: function () {
                if (!browser.safari) {
                    attachE(window, "unload", this.leave.doyoodg(this))
                }
                if (browser.safari) {
                    var leaveF = $("looyu_leave"), url = E.mon + "/l.jsp?" + this.leaveUrl();
                    leaveF &amp;&amp; (leaveF.src = url) || createEle("iframe", {id: "looyu_leave", src: url})
                }
            }, leaveUrl: function () {
                return "c=l&amp;i=" + ci + "&amp;v=" + E.vId + "&amp;p=" + E.pId + "&amp;_t=" + +new Date()
            }, pump: function (r) {
                if (r == null) {
                    return
                }
                switch (r.c) {
                    case"a":
                        var rp = r.p.split("|");
                        E.pId = rp[0];
                        this.bindLeave();
                        this.text = tpl(this.text, {area: (r.area || "")});
                        this.buildMain();
                        this.autoShow();
                        parent &amp;&amp; parent.doyoo &amp;&amp; (parent.doyoo.env.pId = rp[0]);
                        if (rp.length &gt; 1) {
                            E.mId = rp[1]
                        }
                        var t = r.t &amp;&amp; (+r.t) || 10;
                        t &lt; 3 &amp;&amp; (t = 3);
                        if (t &amp;&amp; !this.timer) {
                            this.timer = window.setInterval(this.driver.doyoodg(this), t * 1000)
                        }
                        r.e &amp;&amp; this.doEvent(r.e);
                        if (getCookie("_t99_chat") == 1 &amp;&amp; r.status == 2) {
                            m.force(null, 1)
                        } else {
                            if (t &lt;= 20 &amp;&amp; this.autoDirectChat &gt; -1 &amp;&amp; this.status) {
                                setTimeout(function () {
                                    m.force(null, 1)
                                }, this.autoDirectChat * 1000)
                            }
                        }
                        break;
                    case"e":
                        var es = r.es;
                        for (var v in es) {
                            (es.hasOwnProperty(v) &amp;&amp; typeof es[v] == "object" &amp;&amp; es.hasOwnProperty(v)) &amp;&amp; this.doEvent(es[v])
                        }
                        break;
                    case"ac":
                    case"de":
                        break
                }
            }, driver: function () {
                var url = E.mon + "/s?c=e&amp;i=" + ci + "&amp;v=" + E.vId + "&amp;p=" + E.pId;
                jsonRequest(url, this.pump.doyoodg(this))
            }, force: function (ch, auto) {
                if (auto &amp;&amp; ($("doyoo_f_chat") || $.mobile)) {
                    return
                }
                if ($.mobile) {
                    if (!this.allowMobileDirect) {
                        this.showDiv();
                        return
                    }
                }
                setCookie("_t99_chat", 1, 0);
                ch &amp;&amp; !auto &amp;&amp; jsonRequest(E.mon + "/s?c=ac&amp;i=" + ci + "&amp;v=" + E.vId, null);
                var t = this.mini, talkUrl = chatURL(this.chat);
                auto &amp;&amp; (t = 4);
                var found = false;
                talkUrl = talkUrl.replace(/command=[^&amp;$]*/, function () {
                    found = true;
                    return "command=forceChat"
                });
                found || (talkUrl = talkUrl + "&amp;command=forceChat");
                ch &amp;&amp; (ch.sId = null);
                if (t == 3 || $.mobile) {
                    this.chat.force = false;
                    var cwin;
                    try {
                        cwin = window.open(talkUrl, "c" + (+new Date()), winopt);
                        if (!cwin) {
                            doc.location.href = talkUrl;
                            return
                        }
                        cwin.focus()
                    } catch (e) {
                        if (!cwin) {
                            doc.location.href = talkUrl
                        }
                    }
                    return
                }
                var curF = $("doyoo_f_frame");
                if (t != 4 &amp;&amp; !curF) {
                    var nurl = docurl + (docurl.indexOf("?") == -1 ? "?" : "&amp;") + +new Date();
                    curF = createEle("iframe", {
                        id: "doyoo_f_frame",
                        src: (t == 1 ? "about:blank" : nurl),
                        frameborder: "0"
                    });
                    curF.className = "doyoo_f_frame";
                    try {
                        if (this.mini == 1) {
                            var s = (function () {
                                curF.style.display = "none";
                                var html = [], fc = doc.firstChild, hn = doc.getElementsByTagName("html")[0], ns = hn.getAttribute("xmlns");
                                if (browser.msie) {
                                    browser.strict &amp;&amp; html.push(fc.text || "")
                                } else {
                                    html.push('&lt;!DOCTYPE html PUBLIC "', fc.publicId, '" "', fc.systemId, '"&gt;')
                                }
                                html.push("&lt;html ", ns ? ('xmlns="' + ns + '"') : "", "&gt;");
                                html.push(conhtml, "&lt;/html&gt;");
                                curF.style.display = "block";
                                return html.join("")
                            })();
                            var frameDoc = curF.contentWindow.document;
                            frameDoc.writeln(s)
                        }
                        doc.getElementsByTagName("html")[0].className += " doyoo_f_original";
                        doc.body.scroll = "no"
                    } catch (e) {
                    }
                }
                curF &amp;&amp; (curF.style.top = sTop() + "px");
                var fChat = $("doyoo_f_chat");
                var fMin = $("doyoo_f_minPanel");
                if (!fChat) {
                    this.minimize = false;
                    fChat = createEle("div", {id: "doyoo_f_chat"});
                    fChat.className = "doyoo_f_chat";
                    fChat.innerHTML = '&lt;div id="doyoo_f_head"&gt;&lt;div id="doyoo_f_close"&gt;&lt;/div&gt;&lt;div id="doyoo_f_min"&gt;&lt;/div&gt;&lt;div id="doyoo_f_title"&gt;&amp;nbsp;&lt;/div&gt;&lt;/div&gt;&lt;div  id="doyoo_f_main"&gt;&lt;/div&gt;';
                    fChat.style.width = (+this.miniWidth + 2) + "px";
                    fChat.style.height = this.miniHeight + "px";
                    $("doyoo_f_main").style.height = this.miniHeight + "px";
                    show(fChat);
                    var closeForce = function () {
                        var f = $("doyoo_f_work");
                        f.src = "about:blank";
                        hide(fChat)
                    };
                    var me = this;
                    attachE($("doyoo_f_close"), "click dblclick", closeForce);
                    attachE($("doyoo_f_end"), "click,dblclick", closeForce);
                    attachE($("doyoo_f_min"), "click,dblclick", this.minForce.doyoodg(this))
                }
                var fMain = $("doyoo_f_main");
                fMain.innerHTML = '&lt;iframe frameborder="0" id="doyoo_f_work" width="100%" height="100%" src="' + talkUrl + '"/&gt;';
                $("doyoo_f_work").style.height = this.miniHeight + "px";
                show(fMain);
                var pos = {right: 10, bottom: 10};
                slide(fChat, 2, pos);
                fly(fChat, "doyoo_f_title", 411, 40, pos)
            }, minForce: function () {
                var me = this;
                var fChat = $("doyoo_f_chat");
                $("doyoo_f_main").style.height = (me.minimize ? me.miniHeight : 40) + "px";
                $("doyoo_f_min").style.backgroundImage = "url(" + fpath + "/images/white-" + (!me.minimize ? "restore" : "min") + ".png?1)";
                var top = parseInt(fChat.style.top), alpha = me.miniHeight - 40;
                fChat.style.top = top + alpha * (!me.minimize ? 1 : -1) + "px";
                me.minimize = !me.minimize
            }, doEvent: function (et) {
                var build = function (e) {
                    var fc = (e.m &amp;&amp; e.m.indexOf("&lt;FORCE&gt;") != -1) || e.e == "s1";
                    return {
                        type: (e.e == "11" ? 1 : 0),
                        force: fc,
                        cId: e.c,
                        sId: e.s,
                        dId: e.d,
                        m: fc ? 0 : e.m,
                        g: e.g
                    }
                }, me = this;
                this.chat = build(et);
                switch (et.e) {
                    case"11":
                    case"1":
                    case"s1":
                        if (this.chat.force &amp;&amp; this.mini) {
                            setTimeout(function () {
                                me.force(me.chat)
                            }, (et.d || 0) * 1000);
                            return
                        }
                        this.buildMain();
                        this.showDiv();
                        break;
                    case"8":
                    case"9":
                        et.m &amp;&amp; this.buildMain(et.m);
                        this.showDiv();
                        break;
                    case"s0":
                        this.buildMain(et.t);
                        setTimeout(function () {
                            me.showDiv()
                        }, (et.d || 0) * 1000);
                        break;
                    case"s2":
                        dp || (dp = new DP());
                        dp.opt(et.w, et.h, et.url, et.b || 0, et.p || 0, et.f || 0);
                        setTimeout(function () {
                            dp.showDiv()
                        }, (et.d || 0) * 1000);
                        break;
                    case"nm":
                        if (this.minimize) {
                            this.minForce()
                        }
                        break
                }
            }, hideDiv: function (auto) {
                mask.hideDiv();
                hide(this.obj);
                p &amp;&amp; !p.hidden &amp;&amp; show(p.obj);
                if (this.hideTimer) {
                    clearTimeout(this.hideTimer);
                    this.hideTimer = 0
                }
                this.mayLoop(auto);
                this.visible = false
            }, accept: function () {
                this.saveStatus(0);
                this.hideDiv();
                var ch = this.chat;
                ch &amp;&amp; (ch.force = false);
                ch &amp;&amp; jsonRequest(E.mon + "/s?c=ac&amp;i=" + ci + "&amp;v=" + E.vId, null);
                this._defui || openChat(ch, this.talk);
                ch &amp;&amp; (ch.sId = null)
            }, deny: function () {
                this.saveStatus(1);
                this.hideDiv();
                var ch = this.chat;
                ch &amp;&amp; jsonRequest(E.mon + "/s?c=de&amp;i=" + ci + "&amp;v=" + E.vId + "&amp;n=" + ch.sId, null)
            }, mayLoop: function (auto) {
                this.loop &amp;&amp; (this.loopTimer = setTimeout(this.showDiv.doyoodg(this, [auto, 1]), this.loop * 1000))
            }, showDiv: function (auto, loop) {
                if (auto) {
                    var monShow = this.monShowOnly;
                    if (monShow) {
                        var urls = monShow.split(/[\s;]+/), found = 0;
                        for (var v = 0; v &lt; urls.length; v++) {
                            if (docurl == urls[v]) {
                                found = 1;
                                break
                            }
                        }
                        if (!found) {
                            return
                        }
                    }
                }
                if (auto || loop) {
                    var status = this.readStatus();
                    var monS = this.monHideStatus;
                    for (var s = 0; s &lt; monS.length; s++) {
                        if (monS[s] &amp;&amp; status[s] &gt;= monS[s]) {
                            return
                        }
                    }
                }
                this.saveStatus(2);
                auto &amp;&amp; !this.visible &amp;&amp; (this.chat = null);
                this.talk = chatURL(this.chat);
                this.hidePanel &amp;&amp; p &amp;&amp; p.close();
                var ps = this.getPos();
                if (!this.pos) {
                    ps.top += fixTop();
                    ps.left += sLeft()
                }
                each(ps, function (v) {
                    ps[v] = ps[v] + "px"
                });
                extend(this.obj.style, ps);
                this.mask &amp;&amp; mask.showDiv();
                !this.fx &amp;&amp; show(this.obj);
                this.fx &amp;&amp; (this.fx == 1 ? fade(this.obj) : slide(this.obj, this.fx - 2, this.getPos()));
                this.visible = true;
                window.focus();
                if (this.autoTimer) {
                    clearTimeout(this.autoTimer)
                }
                if (this.loopTimer) {
                    clearTimeout(this.loopTimer);
                    this.loopTimer = 0
                }
                if (this.autoHide) {
                    this.hideTimer = setTimeout(this.hideDiv.doyoodg(this, [auto]), 1000 * this.autoHide)
                }
            }, readStatus: function () {
                var status = [0, 0, 0];
                var saved = getCookie("_99_mon");
                if (saved) {
                    status = eval(saved)
                }
                return status
            }, saveStatus: function (index) {
                var strTpl = "[{0},{1},{2}]";
                var status = this.readStatus();
                if (index != -1) {
                    status[index]++
                }
                setCookie("_99_mon", tpl(strTpl, status), sametime)
            }, record: function (o) {
                if (!this.updateStatusTimer) {
                    this.updateStatusTimer = setInterval(this.saveStatus.doyoodg(this, [-1]), 60000)
                }
                var url = E.mon + "/s?" + obj2str(monitorObj(o));
                jsonRequest(url, this.pump.doyoodg(this))
            }
        });
        extend(P.prototype, {
            defUI: function () {
                this[($.mobile &amp;&amp; !this.preferConfig &amp;&amp; "mobile" || this.category) + "Builder"]()
            }, builder: function () {
                var o = this.obj, pos, me = this;
                if (this.position != -1) {
                    var lr = (this.position == 0) ? "left" : "right";
                    pos = {top: this.vertical};
                    pos[lr] = this.horizon;
                    var p = {position: "absolute", top: pos.top + fixTop() + "px"};
                    p[lr] = this.horizon + "px";
                    extend(o.style, p)
                }
                if (typeof beforeLooyuPanelBuilder == "function") {
                    beforeLooyuPanelBuilder.apply(this)
                } else {
                    this.defUI()
                }
                if (this.position != -1) {
                    this.flier = fly(this.obj, this.handler, this.width, this.height, pos)
                }
                show(o);
                this.closer &amp;&amp; attachE(this.closer, "click dblclick", function (e) {
                    me.close(e);
                    me.hidden = true
                })
            }, destory: function () {
                remove(this.obj);
                this.flier.stop()
            }, mobileBuilder: function () {
                var o = this.obj;
                o.className += " doyoo_panel_mobile";
                var mode, tar, cat = this.category;
                if (cat == "icon" || cat == "text") {
                    mode = this.mode;
                    tar = this.target
                } else {
                    var groups = this.customers.groups, m = this.customers.mode;
                    if (m) {
                        mode = 1;
                        tar = groups[0].id
                    } else {
                        mode = 0;
                        tar = groups[0].customers[0].id
                    }
                }
                o.onclick = openChat.doyoodg(this, [P.chatParam(mode == 0 ? "c" : "g", tar)])
            }, winBuilder: function () {
                var o = this.obj;
                if (this.mode == 2) {
                    extend(o.style, {
                        width: (this.width + "px"),
                        height: (this.height + "px"),
                        background: ("url(" + this.panelBG + ") no-repeat")
                    });
                    var hcont = ['&lt;div id="doyoo_panel_main"&gt;'], groups = this.customers.groups, celltpl = '&lt;a class="doyoo_panel_cell" style="width:100%;display:block;height:{height}px;line-height:{height}px;background:url({cellbk}) no-repeat left center;{cellMargin}" href="javascript:;" onclick="doyoo.util.openChat(\'g={group}\');return false"&gt;&lt;span style="{textStyle};height:{height}px;line-height:{height}px;{textMargin}"&gt;{groupName}&lt;/span&gt;&lt;/a&gt;';
                    for (var i = 0; i &lt; groups.length; i++) {
                        var gp = groups[i];
                        hcont.push(tpl(celltpl, {
                            height: this.cellHeight,
                            cellbk: (gp.active ? this.cellOnline : this.cellOffline),
                            group: gp.id,
                            groupName: gp.name,
                            cellMargin: this.cellMargin,
                            textStyle: gp.active &amp;&amp; this.onlineText || this.offlineText,
                            textMargin: this.textMargin
                        }))
                    }
                    hcont.push("&lt;/div&gt;");
                    o.innerHTML = hcont.join("");
                    var mp = $("doyoo_panel_main"), stys = this.panelMain.split(" ");
                    extend(mp.style, {
                        left: stys[0] + "px",
                        top: stys[1] + "px",
                        width: stys[2] + "px",
                        height: stys[3] + "px"
                    });
                    return
                }
                if (this.mode == 1) {
                    o.innerHTML = '&lt;div id="ohead"&gt;&lt;div id="ocls" &gt;&lt;/div&gt;&lt;div id="omin" onclick=""&gt;&lt;/div&gt;&lt;div id="otitle"&gt;&lt;/div&gt;&lt;div id="oentrance"&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id="ocontent"&gt;&lt;/div&gt;&lt;div id="ofoot"&gt;&lt;div onclick=javascript:window.open("' + homepage + '")&gt;&lt;/div&gt;&lt;/div&gt;';
                    $("otitle").innerHTML = this.title;
                    var cu = function (i, t) {
                        return "url(" + fpath + "images/floatwin/" + t + "_" + i + ".gif?131127)"
                    };
                    $("ohead").style.background = cu(this.index, "head") + " no-repeat";
                    $("ocontent").style.background = cu(this.index, "back") + " repeat-y";
                    $("ofoot").style.background = cu(this.index, "foot") + " no-repeat"
                } else {
                    if (this.mode == 0) {
                        this.width += 8;
                        var h = '&lt;div id="nhead"&gt;&lt;div id="ncls"&gt;X&lt;/div&gt;&lt;div id="ntitle"&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id="ncontent" &gt;&lt;/div&gt;';
                        var phones = {sc: "\u7535\u8bdd\uff1a", en: "Number:", tc: "\u96fb\u8a71\uff1a"};
                        if (!blk(this.phone)) {
                            var l = (blk(E.lang) || "tc,sc,en,ru,".indexOf(E.lang) == -1) ? "sc" : E.lang;
                            h += '&lt;div id="nphone"&gt;' + phones[l] + "&lt;div&gt;" + this.phone + "&lt;/div&gt;&lt;/div&gt;"
                        }
                        h += '&lt;div id="nfoot" onclick=javascript:window.open("' + homepage + '")&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;';
                        o.innerHTML += h;
                        o.className = "doyoo_pan_flat " + (oms ? " looyu_oms" : "");
                        try {
                            $("nhead").style.backgroundColor = this.headBgClr
                        } catch (e) {
                        }
                        try {
                            $("nhead").style.color = this.headClr
                        } catch (e) {
                        }
                        try {
                            $("ntitle").innerHTML = this.title
                        } catch (e) {
                        }
                        try {
                            extend(o.style, {borderColor: this.borderClr})
                        } catch (e) {
                        }
                    }
                }
                o.style.width = (this.width ? this.width : 144) + "px";
                var main = $((this.mode == 1) ? "ocontent" : "ncontent");
                main.innerHTML = '&lt;div id="allcontent"&gt;' + this.buildList() + "&lt;/div&gt;";
                (this.mode == 0) || (main.style.height = this.height + "px");
                this.handler = (this.mode == 1) ? "ohead" : "nhead";
                this.closer = $(this.mode == 1 ? "ocls" : "ncls");
                if (this.mode == 0) {
                    if (this.cols &gt; 20) {
                        extend(main.style, {height: 350 + "px", overflowY: "auto"});
                        o.style.width = this.width + 20 + "px"
                    }
                }
            }, buildList: function () {
                var html = "", custs = this.customers, depts = custs.groups, m = custs.mode, cols = 0;
                var ele = function (et, sn, tar, st, of) {
                    var mo = this.mode, sc = ["doyoo_offline", "doyoo_online", "doyoo_offline", "doyoo_offline", "doyoo_offline", "doyoo_other", "doyoo_other", "doyoo_other"], sofft = {
                        sc: ["\u7559\u8a00", "\u81ea\u52a9", "\u7535\u8bdd", "\u77ed\u4fe1"],
                        en: ["MSG", "AUTO", "CALL", "SMS"],
                        tc: ["\u7559\u8a00", "\u81ea\u52a9", "\u96fb\u8a71", "\u7c21\u8a0a"],
                        ru: ["MSG", "AUTO", "CALL", "SMS"]
                    }, sont = {
                        sc: ["\u5728\u7ebf", "\u5fd9\u788c", "\u79bb\u5f00"],
                        en: ["CHAT", "BUSY", "AWAY"],
                        tc: ["\u5728\u7dda", "\u5fd9\u788c", "\u96e2\u958b"],
                        ru: ["CHAT", "BUSY", "AWAY"]
                    }, ln = E.lang &amp;&amp; (sont[E.lang] &amp;&amp; E.lang) || "sc", clk = (et != "gw" &amp;&amp; et != "d"), h = '&lt;div class="' + (et == "c" ? "group_content" : "group_title") + '" ';
                    h += "&gt;";
                    if (clk) {
                        h += '&lt;div class="' + (st &amp;&amp; sc[st] || sc[of + 4]) + '"&gt;';
                        h += '&lt;div class="doyoo_status"&gt;' + (st == 0 ? sofft[ln][of] : sont[ln][st - 1]) + "&lt;/div&gt;"
                    }
                    h += '&lt;a class="doyoo_link" href="javascript:;" ';
                    if (clk) {
                        h += 'onclick=javascript:doyoo.util.openChat("' + P.chatParam(et, tar) + '") '
                    }
                    h += "&gt;" + ((mo == 1 &amp;&amp; et != "c") ? "&lt;span&gt;&amp;gt;&amp;nbsp;&lt;/span&gt;" : "") + sn + "&lt;/a&gt;&lt;/div&gt;";
                    if (clk) {
                        h += "&lt;/div&gt;"
                    }
                    return h
                };
                for (var v = 0; v &lt; depts.length; v++) {
                    var dept = depts[v], t = m &amp;&amp; ((dept.mode == 2) &amp;&amp; "g" || "gw") || "d", stat = m &amp;&amp; (dept.active &amp;&amp; 1 || dept.online &amp;&amp; 2), off = (t == "g") &amp;&amp; (dept.phone &amp;&amp; 2 || dept.sms &amp;&amp; 3);
                    cols++;
                    html += ele(t, dept.name, dept.id, stat, off);
                    if (t == "d" || t == "gw") {
                        var cts = dept.customers;
                        for (var v1 = 0; v1 &lt; cts.length; v1++) {
                            var cst = cts[v1];
                            cols++;
                            html += ele("c", cst.name || cst.id, cst.id, cst.status, cst.offline)
                        }
                    }
                }
                this.cols = cols;
                return html
            }, close: function (evt) {
                hide(this.obj);
                var e = evt || window.event;
                window.event &amp;&amp; (e.cancelBubble = true) || e &amp;&amp; e.stopPropagation()
            }, iconBuilder: function () {
                var pan = this.obj;
                pan.className = "doyoo_pan_icon";
                var w = this.collapse &amp;&amp; this.collapsed &amp;&amp; this.collapseW || this.collapse &amp;&amp; !this.collapsed &amp;&amp; (this.width + this.collapseW) || this.width;
                this.collapseFloat = this.position == 1 &amp;&amp; "right" || "left";
                var innerW = this.width;
                if (this.collapse &amp;&amp; this.collapsed) {
                    innerW = 0
                }
                extend(pan.style, {width: w + "px", height: this.height + "px"});
                var id = genID(), id_link = genID();
                var innerTpl = '&lt;div class="doyoo_pan_icon_inner" id="{id}" style="width:{innerW}px;float:{floatPos}"&gt;&lt;a href="javascript:;" id="{linkId}" style="display:block;width:100%;height:100%;"&gt;&amp;nbsp;&lt;/a&gt;';
                var html = tpl(innerTpl, {id: id, innerW: innerW, linkId: id_link, floatPos: this.collapseFloat});
                var blankImage = fpath + "images/s.gif";
                for (var i = 0; i &lt; this.regions.length; i++) {
                    var rgs = this.regions[i];
                    if (blk(rgs.bk)) {
                        rgs.bk = blankImage
                    }
                    var regionTpl = '&lt;a href="javascript:;" class="talk99_region" style="left:{l}px;top:{t}px;width:{w}px;height:{h}px;background-image: url({bk})" onclick="{act};return false;"&gt;&amp;nbsp;&lt;/a&gt;';
                    switch (+rgs.type) {
                        case 0:
                            rgs.act = "window.open('http://wpa.qq.com/msgrd?V=1&amp;uin=" + rgs.v + "')";
                            break;
                        case 1:
                            rgs.act = "window.open('msnim:chat?contact=" + rgs.v + "')";
                            break;
                        case 2:
                            rgs.act = "doyoo.util.openChat('g=" + rgs.v + "')";
                            break;
                        case 3:
                            rgs.act = "doyoo.util.openPhone('g=" + rgs.v + "')";
                            break;
                        case 4:
                            rgs.act = "window.open('" + rgs.v + "')";
                            break
                    }
                    html += tpl(regionTpl, rgs)
                }
                html += "&lt;/div&gt;";
                if (this.collapse) {
                    this.collapseImage = this.collapsed &amp;&amp; this.expandIcon || this.collapseIcon;
                    this.collapseId = genID();
                    var collapseTpl = '&lt;a href="javascript:;" class="talk99_collapse" id="{collapseId}" style="width:{collapseW}px;height:{collapseH}px;margin-top:{collapseT}px;float:{collapseFloat};background-image:url({collapseImage})"  collapsed="{collapsed}"&gt;&amp;nbsp;&lt;/a&gt; ';
                    html += tpl(collapseTpl, this)
                }
                pan.innerHTML = html;
                var innerDom = $(id);
                this.online = securityPath(this.online);
                this.offline = securityPath(this.offline);
                innerDom.style.backgroundImage = "url(" + (this.status &amp;&amp; this.online || this.offline) + ")";
                $(id_link).onclick = openChat.doyoodg(this, [P.chatParam(this.mode == 0 ? "c" : "g", this.target)]);
                if (this.closable) {
                    var closer = createEle("div", {}, $(id));
                    closer.className = "doyoo_pan_close";
                    this.closer = closer
                }
                if (this.collapse) {
                    var collapse = $(this.collapseId);
                    var me = this;
                    attachE(collapse, "click dblclick", function (e) {
                        e &amp;&amp; e.preventDefault &amp;&amp; e.preventDefault();
                        var collapsed = +collapse.getAttribute("collapsed");
                        pan.style.width = (collapsed ? (me.width + me.collapseW) : me.collapseW) + "px";
                        innerDom.style.width = (collapsed ? me.width : 0) + "px";
                        collapse.setAttribute("collapsed", collapsed ? 0 : 1);
                        collapse.style.backgroundImage = "url(" + (collapsed ? me.collapseIcon : me.expandIcon) + ")";
                        return false
                    })
                }
            }, textBuilder: function () {
                var pan = this.obj;
                extend(pan.style, {color: this.color, fontSize: this.size + "px"});
                pan.innerHTML += this.content;
                pan.onclick = openChat.doyoodg(this, [P.chatParam(this.mode == 0 ? "c" : "g", this.target)])
            }
        });
        var MsgPanel = function (opt) {
            this.obj = $("talk99_message");
            extend(this, opt)
        };
        extend(MsgPanel.prototype, (function () {
            var curl = E.lang || "sc";
            var lang_tip = {
                sc: "\u8f93\u5165\u60a8\u7684\u7559\u8a00\u4fe1\u606f\uff0c\u6211\u4eec\u4f1a\u5c3d\u5feb\u8054\u7cfb\u60a8\uff01",
                tc: "\u8f38\u5165\u60a8\u7684\u7559\u8a00\u4fe1\u606f\uff0c\u6211\u5011\u6703\u5118\u5feb\u806f\u7e6b\u60a8\uff01",
                en: "We will contact you!",
                ru: ""
            }, lang_name = {
                sc: "\u59d3\u540d\uff1a",
                tc: "\u59d3\u540d\uff1a",
                en: "name",
                ru: "\u0444.\u0438.\u043e"
            }, lang_phone = {
                sc: "\u7535\u8bdd\uff1a",
                tc: "\u96fb\u8a71\uff1a",
                en: "phone",
                ru: "\u2116.\u00a0\u0442\u0435\u043b"
            }, lang_email = {
                sc: "\u90ae\u7bb1\uff1a",
                tc: "\u90f5\u7bb1\uff1a",
                en: "email",
                ru: "\u044d\u043b.\u043f\u043e\u0447\u0442\u0430"
            }, lang_qq = {
                sc: "Q&amp;nbsp;&amp;nbsp;Q\uff1a",
                tc: "Q&amp;nbsp;&amp;nbsp;Q\uff1a",
                en: "Q&amp;nbsp;&amp;nbsp;Q:",
                ru: "Q&amp;nbsp;&amp;nbsp;Q:"
            }, lang_submit = {
                sc: "\u63d0\u4ea4",
                tc: "\u63d0\u4ea4",
                en: "submit",
                ru: "\u0441\u043f\u0430\u0441\u0430\u0442\u044c"
            }, lang_freePhone = {
                sc: "\u514D\u8D39\u901A\u8BDD",
                tc: "\u514D\u8CBB\u901A\u8A71",
                en: "FreePhone",
                ru: "\u0431\u0435\u0441\u043f.\u0437\u0432\u043e\u043d\u043e\u043a"
            };
            var msg_error = {
                sc: "\u7559\u8A00\u5185\u5BB9\u4E0D\u80FD\u4E3A\u7A7A",
                tc: "\u7559\u8A00\u5167\u5BB9\u4E0D\u80FD\u70BA\u7A7A",
                en: "Message cannot be blank.",
                ru: "\u043f\u0443\u0441\u0442\u043e\u0439\u00a0\u043a\u043e\u043c\u043c\u0435\u043d\u0442"
            };
            var con_error = {
                sc: "\u7535\u8BDD\u548C\u90AE\u7BB1\u81F3\u5C11\u8981\u63D0\u4F9B\u4E00\u9879\u4EE5\u65B9\u4FBF\u6211\u4EEC\u8054\u7CFB\u60A8\uFF01",
                tc: "\u96FB\u8A71\u548C\u90F5\u7BB1\u81F3\u5C11\u8981\u63D0\u4F9B\u4E00\u9805\u4EE5\u4FBF\u6211\u5011\u806F\u7E6B\u60A8\21",
                en: "phone and email cannot be all blank!",
                ru: "\u043d\u043e\u043c\u0435\u0440\u00a0\u0442\u0435\u043b.\u0438\u00a0\u044d\u043b.\u043f\u043e\u0447\u0442\u0430\u0000\u0437\u0430\u043f\u043e\u043b\u043d\u044f\u0442\u044c\u00a0\u043e\u0431\u044f\u0437\u0430\u0442\u0435\u043b\u044c\u043d\u043e"
            };
            var phone_error = {
                sc: "\u8BF7\u8F93\u5165\u6B63\u786E\u7684\u7535\u8BDD\u53F7\u7801",
                tc: "\u8ACB\u8F38\u5165\u6B63\u78BA\u7684\u96FB\u8A71\u865F\u78BC",
                en: "the number is invalid",
                ru: "\u043d\u0435\u0440\u043f.\u043d\u043e\u043c\u0435\u0440"
            };
            var email_error = {
                sc: "\u8BF7\u8F93\u5165\u6B63\u786E\u7684\u90AE\u4EF6\u5730\u5740",
                tc: "\u8ACB\u8F38\u5165\u6B63\u78BA\u7684\u90F5\u4EF6\u5730\u5740",
                en: "the email is invalid",
                ru: "\u043d\u0435\u0440\u043f.\u044d\u043b.\u043f\u043e\u0447\u0442\u0430"
            };
            var qq_error = {
                sc: "\u8BF7\u8F93\u5165\u6B63\u786E\u7684qq\u53F7\u7801",
                tc: "\u8ACB\u8F38\u5165\u6B63\u78BA\u7684qq\u865F\u78BC",
                en: "the qq number is invalid",
                ru: "\u043d\u0435\u0440\u043f qq"
            };
            var validPhone = function (v) {
                return !blk(v)
            };
            var validEmail = function (v) {
                return /^([\w]+)(.[\w]+)*@([\w-]+\.){1,5}([A-Za-z]){2,4}$/.test(v)
            };
            var validQq = function (v) {
                return /^\d{5,20}$/.test(v)
            };
            var fp = function (v, i) {
                return "url(" + fpath + "images/message/" + v + "_" + i + ".gif?131127)"
            };
            return {
                builder: function () {
                    this.defUI();
                    var me = this;
                    me.mini = false;
                    this.miner &amp;&amp; attachE(this.miner, "click dblclick", function () {
                        me.mini &amp;&amp; me.maximize() || me.minimize()
                    });
                    this.submiter &amp;&amp; attachE(this.submiter, "click dblclick", function () {
                        me.submit()
                    });
                    return this
                }, minimize: function () {
                    this.obj.style.height = "34px";
                    var tar = this.initPos();
                    this.mini = true;
                    this.miner.style.backgroundImage = fp("m_open", this.index);
                    this.flier.reset({height: 34});
                    return this
                }, maximize: function () {
                    this.obj.style.height = "241px";
                    this.mini = false;
                    this.miner.style.backgroundImage = fp("m_close", this.index);
                    this.flier.reset({height: 241});
                    return this
                }, submit: function () {
                    var url = E.chat + "/leaveWord.do?c=" + E.compId + "&amp;command=token&amp;callback=doyoo.util.submitMessage";
                    jsonRequest(url)
                }, doSubmit: function (obj) {
                    var param = {
                        c: E.compId,
                        command: "leaveMessage",
                        g: this.group || "",
                        u: E.uId,
                        v: E.vId,
                        ct: E.counter,
                        site: site,
                        category: 0,
                        _mark: E._mark,
                        token: obj.token
                    };
                    var objm = $("t99_msg_content"), objp = $("t99_msg_phone"), obje = $("t99_msg_email"), objq = $("t99_msg_qq");
                    param.name = $("t99_msg_name").value;
                    param.phone = objp.value;
                    param.email = obje.value;
                    param.message = objm.value;
                    param.qq = objq.value;
                    param.callback = "doyoo.util.msgSuccess";
                    param.subject = param.message.substring(0, 10);
                    if (blk(param.message) || param.message == lang_tip[curl]) {
                        alert(msg_error[curl]);
                        objm.focus();
                        return
                    }
                    if (blk(param.phone) &amp;&amp; blk(param.email)) {
                        alert(con_error[curl]);
                        objp.focus();
                        return
                    }
                    if (!blk(param.phone) &amp;&amp; !validPhone(param.phone)) {
                        alert(phone_error[curl]);
                        objp.focus();
                        return
                    }
                    if (!blk(param.email) &amp;&amp; !validPhone(param.email)) {
                        alert(email_error[curl]);
                        objp.focus();
                        return
                    }
                    if (!blk(param.qq) &amp;&amp; !validQq(param.qq)) {
                        alert(qq_error[curl]);
                        objq.focus();
                        return
                    }
                    var requrl = "http://lc.talk99.cn/chat/leaveWord.do?" + obj2str(param);
                    jsonRequest(requrl);
                    doyoo.util.msgSuccess()
                }, defUI: function () {
                    var h = '&lt;div class="t99_mpanel_inner"&gt;&lt;div class="t99_mpanel_title" id="t99_mpanel_title"&gt;{title}&lt;/div&gt;&lt;div id="t99_mpanel_miner"&gt;&lt;/div&gt;&lt;div class="t99_mpanel_main"&gt;&lt;div class="t99_mpanel_content"&gt;&lt;textarea id="t99_msg_content"&gt;{txtTip}&lt;/textarea&gt;&lt;/div&gt;&lt;div class="t99_mpanel_info"&gt;&lt;span class="t99_mpanel_name"&gt;{txtName}&lt;/span&gt;&lt;input type="text" id="t99_msg_name"&gt;&lt;/div&gt;&lt;div class="t99_mpanel_info"&gt;&lt;span class="t99_mpanel_phone"&gt;{txtPhone}&lt;/span&gt;&lt;input type="text" id="t99_msg_phone"&gt;&lt;/div&gt;&lt;div class="t99_mpanel_info"&gt;&lt;span class="t99_mpanel_email"&gt;{txtEmail}&lt;/span&gt;&lt;input type="text" id="t99_msg_email"&gt;&lt;/div&gt;&lt;div class="t99_mpanel_info"&gt;&lt;span class="t99_mpanel_qq"&gt;{txtQQ}&lt;/span&gt;&lt;input type="text" id="t99_msg_qq"&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id="t99_mpanel_submit" &gt;{txtSubmit}&lt;/div&gt;&lt;a id="t99_mpanel_freePhone" href="javascript:;" onclick="doyoo.util.openPhone();return false;"&gt;{txtFreePhone}&lt;/a&gt;&lt;/div&gt;';
                    var idx = this.index;
                    this.obj.innerHTML = tpl(h, {
                        cId: E.compId,
                        gId: this.group,
                        txtTip: lang_tip[curl],
                        txtName: lang_name[curl],
                        txtPhone: lang_phone[curl],
                        txtEmail: lang_email[curl],
                        txtQQ: lang_qq[curl],
                        txtSubmit: lang_submit[curl],
                        title: this.title,
                        txtFreePhone: lang_freePhone[curl]
                    });
                    this.obj.style.backgroundImage = fp("m_b", idx);
                    this.head = $("t99_mpanel_title");
                    $("t99_msg_content").onfocus = function () {
                        if (this.value == lang_tip[curl]) {
                            this.value = ""
                        }
                    };
                    $("t99_msg_content").onblur = function () {
                        if (this.value == "") {
                            this.value = lang_tip[curl]
                        }
                    };
                    this.miner = $("t99_mpanel_miner");
                    this.submiter = $("t99_mpanel_submit");
                    this.freePhone = $("t99_mpanel_freePhone");
                    this.miner.style.backgroundImage = fp("m_close", idx);
                    this.submiter.style.backgroundImage = fp("m_btn", idx);
                    this.freePhone.style.backgroundImage = fp("m_p", idx);
                    if (this.hidePhone) {
                        this.freePhone.style.display = "none"
                    }
                    var me = this;
                    return this
                }, initPos: function () {
                    var tar = {bottom: 5};
                    var lr = this.pos &amp;&amp; "left" || "right";
                    tar[lr] = 5;
                    extend(this.obj.style, {bottom: "5px", top: "auto"});
                    this.obj.style[lr] = "5px";
                    return tar
                }, start: function () {
                    var me = this;
                    var tar = me.initPos();
                    setTimeout(function () {
                        show(me.obj);
                        slide(me.obj, 2, tar)
                    }, (this.delay &lt; 0 ? 0 : this.delay) * 1000);
                    this.flier = fly(me.obj, me.head, 213, 241, tar)
                }, success: function () {
                    this.minimize()
                }
            }
        })());
        var parseEnv = function (o) {
            o = o || {};
            localdb = getCookie(id_s) || "";
            var refer = doc.referrer, lid = getCookie(id_l) || "", re = new RegExp("_" + ci + ":(\\d+)"), cts = localdb.match(re);
            var getl = function (key) {
                var re1 = new RegExp(key + ":([^,]*)", "i");
                var v = lid.match(re1);
                return unescape(v &amp;&amp; v.length &gt; 1 &amp;&amp; v[1] || "")
            };
            var parsev = function () {
                var rtn, now = +new Date();
                if ((rtn = /^([^_]+)_([\d]+)/i.exec(o.vid)) != null &amp;&amp; Number(rtn[2]) &gt; now) {
                    return rtn[1]
                }
                return null
            };
            var ct = o.ct || cts &amp;&amp; cts.length &gt; 1 &amp;&amp; cts[1] || 0;
            var ev = {
                uId: o.id || localdb.match(/^([^_]+)/) || E.vId,
                vId: o.vid &amp;&amp; parsev() || getl("v") || ++ct &amp;&amp; E.vId,
                counter: ct,
                refer: (!refer || sameSite(refer)) ? getl("ref") : refer,
                p0: getl("p0") || docurl,
                reseve: (typeof reseveKey == "undefined" ? (getl("r") || guessR()) : reseveKey)
            };
            ev.uId != "undefined" || (ev.uId = E.vId);
            ev.uId = /[^\w\d]*([\w\d]+)[^\w\d]*/.exec(ev.uId)[1];
            if (ev.uId.length &lt; 30) {
                ev.uId += +new Date()
            }
            localdb = ev.uId + "_" + ci + ":" + ct;
            ev.mon = getl("mon") || E.mon;
            localtemp = "v:" + ev.vId + ",ref:" + escape(ev.refer) + ",r:" + escape(ev.reseve) + ",mon:" + ev.mon + ",p0:" + escape(ev.p0);
            return ev
        };
        var m, p, msgp, inited = false;
        var fixFlash = function () {
            var fs = doc.getElementsByTagName("object"), ems = doc.getElementsByTagName("embed");
            var i = 0;
            for (i = 0; i &lt; fs.length; i++) {
                var wc = doc.createElement("param");
                wc.name = "wmode";
                wc.value = "transparent";
                fs[i].appendChild(wc)
            }
            for (i = 0; i &lt; ems.length; i++) {
                ems[i].setAttribute("wmode", "transparent")
            }
        };
        attachE(window, "load", function () {
            E.ready = true;
            E.fixFlash &amp;&amp; fixFlash()
        });
        D.shareReady = function (mod) {
            share = findSWF("looyuShare")
        };
        D.probe = function () {
            return {c: ci, id: "", vid: "", ct: "", site: site}
        };
        D.init = function (o) {
            if (inited) {
                return
            }
            try {
                inited = true;
                extend(E, parseEnv(o));
                inB ? D.start() : ready(D.start.doyoodg(D))
            } catch (e) {
                if (typeof console != "undefined") {
                    console.log &amp;&amp; console.log(e)
                }
            }
            return {c: ci, id: E.uId, vid: E.vId, ct: E.counter, site: site}
        };
        D.start = function () {
            conhtml = doc.getElementsByTagName("html")[0].innerHTML;
            conhtml = conhtml.replace(/&lt;script[^&lt;&gt;]+doyoo\.net\/(?!j\.jsp)[^&lt;&gt;]+&gt;&lt;\/script&gt;|&lt;link[^&lt;&gt;]+doyoo\.net[^&lt;&gt;]+&gt;|&lt;object((?!&lt;\/object&gt;).)*looyuShare((?!&lt;\/object&gt;).)*file\.doyoo\.net((?!&lt;\/object&gt;).)*&lt;\/object&gt;/ig, "");
            conhtml = conhtml.replace(/&lt;div\s+id=['|"]doyoo_[^&gt;&lt;]+['|"]\s*&gt;\s*&lt;\/div&gt;/ig, "");
            D.panelParam &amp;&amp; (p = new P(D.panelParam)) &amp;&amp; p.builder();
            !$.mobile &amp;&amp; D.msgParam &amp;&amp; (msgp = new MsgPanel(D.msgParam)) &amp;&amp; msgp.builder().start();
            msgp &amp;&amp; (doyoo.util.submitMessage = msgp.doSubmit.doyoodg(msgp));
            var topd = window, findm = false, maxloop = 10;
            while (topd != top &amp;&amp; (--maxloop)) {
                topd = topd.parent;
                if (topd.doyoo &amp;&amp; topd.doyoo.monitor) {
                    findm = true;
                    break
                }
            }
            if (topd == window || !findm) {
                D.monParam &amp;&amp; (D.monitor = m = new M(D.monParam)) &amp;&amp; m.builder();
                m &amp;&amp; (doyoo.util.accept = m.accept.doyoodg(m));
                m &amp;&amp; ready(m.record.doyoodg(m))
            } else {
                topd.doyoo.monitor.refresh({t: doc.title, u: docurl})
            }
            if (!D.monParam) {
                var sharediv = $("doyoo_share");
                if (sharediv) {
                    var obj = monitorObj();
                    obj.c = "oc";
                    createEle("iframe", {src: E.mon + "/s?" + obj2str(obj)}, sharediv)
                }
            }
            upvid()
        };
        ready(function () {
            loaded = true;
            var snf = D.sniffer, idg = {};
            if (snf) {
                var ids = snf.ids.split(","), lb = "looyu_bound", gids = snf.gids.split(","), regStr = snf.ids.replace(/([\.\-\[\]\{\}\?\(\)\|])/ig, function ($0, $1) {
                    return "\\" + $1
                }), reg = new RegExp(regStr.replace(/\s*,\s*/ig, "|"), "ig");
                for (var i = 0; i &lt; ids.length; i++) {
                    idg[ids[i]] = gids[i]
                }
                var ebound = function (nd, op) {
                    if (nd.nodeType == 3) {
                        return op.getAttribute(lb)
                    }
                    return nd.getAttribute(lb)
                };
                var ebind = function (nd, op) {
                    (nd.nodeType == 3 &amp;&amp; op || nd)["setAttribute"](lb, 1)
                };
                var snifferNode = function (nd) {
                    var o_p = nd.parentNode;
                    if (ebound(nd, o_p)) {
                        return
                    }
                    if (nd.nodeType == 3 &amp;&amp; o_p.nodeName != "A") {
                        if (nd.data.search(reg) == -1) {
                            return
                        }
                        var span = doc.createElement("span");
                        span.innerHTML = nd.data.replace(reg, function ($0) {
                            return '&lt;a href="javascript:;" onclick="doyoo.util.openChat(\'g=' + idg[$0] + "');return false\"&gt;" + $0 + "&lt;/a&gt;"
                        });
                        o_p.replaceChild(span, nd)
                    } else {
                        if (nd.nodeType == 1) {
                            var rst = reg.exec(nd.id) || reg.exec(nd.className) || nd.nodeName == "IMG" &amp;&amp; reg.exec(nd.src);
                            if (!rst) {
                                return
                            }
                            attachE(nd, "click dblclick", doyoo.util.openChat.doyoodg(null, ["g=" + idg[rst[0]]]));
                            nd.style.cursor = "pointer"
                        }
                    }
                    ebind(nd, o_p)
                };
                var count = 0;
                var processNode = function (nd) {
                    var o = nd.childNodes, nn = (nd.nodeName || "").toLowerCase();
                    if ("script" == nn || "style" == nn || "link" == nn) {
                        return
                    }
                    count++;
                    try {
                        snifferNode(nd)
                    } catch (e) {
                    }
                    if (o &amp;&amp; o.length &gt; 0) {
                        for (var i = 0; i &lt; o.length; i++) {
                            processNode(o[i])
                        }
                    }
                };
                if (ids.length) {
                    processNode(doc.body)
                }
            }
        });
        supportFlash &amp;&amp; loadSWF("looyuShare", "looyu2.swf") || D.init();
        setTimeout(function () {
            D.init()
        }, 3000)
    })(doyoo);
</
pre > < div
class
= "_bd_ext_tip"
style = "visibility: hidden;" > < span
class
= "_bd_ext_search" >
�
ٶ
�
һ
��</
span > < span
class
= "_bd_ext_open" >
������</
span > < span
class
= "_bd_ext_copy" >
����</
span > < / div > < / body > < / html >