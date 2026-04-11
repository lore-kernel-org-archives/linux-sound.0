Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF25389454
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919490; cv=none; b=iQFQfgD8b0ix2uaezuJG9jt/crqOv6vo9hViXcjA3Us5/yjHj/r+an720aAOWR/fggxip/sHncpI6r8FfIwguSPAKrLjrSvp7s5pRUNgzDJSeWsZmouMG9CwBsvfsx2c7KxrnqQCbyJqWir6/mDOQQ9yQG4ENslItyniugvPxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919490; c=relaxed/simple;
	bh=PHZLLnMsIE8GpLnJkBykfRLhYRx2iFJYTw8nQWNaVlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL7dHg/QRcIT1DYwMQtZRdi+UlTB/ZFtMhTBkMb6aeuK8q1WGQ/NOclnI5mcHr/bzgv1YbyoTuj2js29wXlmFMWuu/0VP7bQLKRPPYuBztYHZoaGeJJH+0G7VLdnFNc4ugcAk7m6kPJNyPmhZ/JEFiYgUspzHH7FgIech26vsyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=AyUM57Gv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="AyUM57Gv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d02a71526so1848706f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919486; x=1776524286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=AyUM57Gv9vSLoq9Ii6E3wjvJj/XUPV43J5G2JezgRJVup7A5Nr0uwkPQgTIU5ytsuo
         Vz9uYJ/xy9lRmKvYFI99Hkhv19yJXF1IEBS9lv/vaVS/F798qY+cUZW2Bft40zjQFQDo
         BXRih1V+v9B5XYyoZsE+ykVe6RtM7d53N0nqqm/3V0qNYRmX0yz2yMn2jhEuWT7CTvh3
         ffjmHPYhaEXCRF+ZAsUXvu8VGLUYa0OgI+rO6Uk7PRBIyRYT7kKio6UKzV7hN7O0Hl6F
         tD40tguiHbY5MA8I1ub7lpzXOtSwfPYgUfYAsShGVCKssdaW8q7QyUq304FnpHNGDDNe
         c0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919486; x=1776524286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=ZF5rhFvxDERk/zkqFJHWaySGK+4enXqtaMigp1HTzHI/wGpK0GFRyAcgBp8vdj70ho
         nVR/fyDxwAEv+L/BM/+ohjWlqsEDKkT2cdSOuxGZKBEwhkkK7f1reoZZQfRIMN/yHOkd
         454/WCGNopGYppDdtbJZzDu8zLiNSVAR2gvhyyVpqmpVdmryrkfCWVBuLuFoBfhGRyOC
         HjcTm9b0nJMWmFQ5mYxNf7WmOXOLJXKPxRUQicanYJoKA9l2pmgoy2c+VS4U/ACNVI7l
         9CTV8lt15Ozhg5LM+ijdxZsD57KRlAJA4FwBXaqbzeW49sLTdZ+79xk7rn2WoxuHvR/k
         cGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiY8R46zA93Xt6GtnArlAi/GvaLuEIKtuFL8TgSTNP40KX75L2UMsHsAKRICQails9GPC+UIzljXm3pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0C4XJP7zUJiiOdZwSEg6chi9eZZfFXvEi+d6bN6IsdNCSVxs5
	e2LWrZOI6ZycmzWSeEB2uF/+tedXCohGpVJi2Pu5LrPHVWxkver4bsQtdtvWKJ6JEtU=
X-Gm-Gg: AeBDies4vel1cUG59XGspBgZjxO4T518ap+nvUgdZ8e8j3obHjCJPgVe4IkpgKwLzN6
	diKobg91dVgAyB5Jtc/69ifzi7oYLDw75WR09HOafHNbFl4eBFdfVYTWIxkzqj82bbqy4/uqg/T
	iQyktJwHL7etpou81yLaKo2z3/0+9jRgH3HAYlk1h4kuAruvxIDjpbe1+yaaGir+4Tcvl95VaWy
	TO2N3mhY4eDdumEoLm3jFOqXFw7whnAH0IWlS99ihDbmfPu1othup/cxbE6A7sZOePQ/4HKTagd
	aeWnghCqKfGFoRceYKpiQNMCJHCane72uRM6H6maYDnl6k0L8pNANThWiyvGaVH1wHpg6HQZMr/
	LY9HRXleNIPBIujc3Hz9QMVJQyUPxrQ9d/ahZlmBUJhBoSY1gITCkUOlkGEt3p+AuQWN7rhK7vz
	vo1PmCUUWu0rIpfFgjSXg+
X-Received: by 2002:a05:600d:d:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488d67b8da2mr72755715e9.5.1775919485044;
        Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:04 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:30 +0200
Subject: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PHZLLnMsIE8GpLnJkBykfRLhYRx2iFJYTw8nQWNaVlw=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EosN3vB9XsUdlXc2ZPYKzqm//naZXdxa+++XzbJXa
 oeU3lqld5SyMIhxMMiKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAih/oZGW5XMcRf9OW+cjjh
 9ZHd1bfZlbzfXdE3V9py4Hvh/HgjNQ+Gf8a7rq+y/5TKs7glY+9Okz8lsbHWP8yrlIVy3/OXiE5
 iYAUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add schema for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo" modules which are used to
provide I2S audio input support to the Meson GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  | 49 +++++++++++++++++
 .../sound/amlogic,meson-gx-audin-fifo.yaml         | 63 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eaf57603e1ecf5944ffdcf7a1b6146d1a0295696
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-decoder-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN I2S Input Decoder
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-decoder-i2s
+      - const: amlogic,meson-gx-audin-decoder-i2s
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-controller@a040 {
+      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+                   "amlogic,meson-gx-audin-decoder-i2s";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "AUDIN I2S Decoder";
+      reg = <0xa040 0x4>;
+      status = "disabled";
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4957c8711623ac45d2826ca96e6344d0aeac2735
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-fifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN FIFO controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-fifo
+      - const: amlogic,meson-gx-audin-fifo
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  clock-names:
+    items:
+      - const: i2s_input_clk
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+
+    audio-controller@a080 {
+      compatible = "amlogic,meson-gxbb-audin-fifo",
+                   "amlogic,meson-gx-audin-fifo";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "FIFO0";
+      reg = <0xa080 0x1c>;
+      status = "disabled";
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+      clock-names = "i2s_input_clk";
+    };

-- 
2.39.5

