Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33723C9454
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092897; cv=none; b=Qwx3AIgMCDD3W83pu0QGcGyOoizCUWLTE0ao8TN+ke+UqSqcABbpC4TZcMdMIO7RulcDX831e2U9jnzFE7qtGyWX+U2rIkRf48L4fWDuaidT+08bh9IbhlQfCcrcBNodcWri2SDGepCOq4YJooE6e2M+n10jT9p90q9ujIyc8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092897; c=relaxed/simple;
	bh=BtLAkNapV4DmIrWa28ic6M0lRmuI8gxGAx+Yq38WqnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3un+TaJC3nqCE1s1zO1EXh6eACLBWyxDIWqOfVL6e7Sr/1PA88A8q7gE0knJybFSmzaxDFJEaqTXYFx27/BHl6044peNyh/3cQpW24eS62t9DT7KSW1Kra85kMo0saotPeLHXXNS+Pf0/t+vjbc4VuEgQnyiS/rs6vvh6hzrkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gxxQyeOt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gxxQyeOt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so25886295e9.2
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092893; x=1790697693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FweYFWQvoZssJ6fM//sCdfeUPF500+UD5gOd7nynddo=;
        b=gxxQyeOt6F6YPVicjcT/gPf6oyF1AGMqZSScVSuKWUs+fTFvWYptHOatU+WuG7SKKW
         XtYct1ktjsT9dB3dTHHeflhtoPnfTU1zEGrFx3Lxu9qMWvKJ7T3quXM2d4XY6z2GJ7rm
         6+y8kPHUXhslcJwK71rrHNuY/3vPFjJhz5KT2xd3+3XTROKa9L2JFSGt0XSCblXDRsyT
         0nWisomMtqQZT9GZ3/gWzwDa8WT/HXK4XFF7pjWYCEbUOcgClmJFsgoTpfB2ret+KRtv
         BjUrGpFh+n74NYSj/vTjCrRR1gKVmbA7JZvn8S6ddXKyF3upWtMr/luwl+iAzRmw9cKi
         PZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092893; x=1790697693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FweYFWQvoZssJ6fM//sCdfeUPF500+UD5gOd7nynddo=;
        b=REf1f2lP3QhwVs+x7wN/eV30BnNYpmQZxMiup1rrZ3I8Wae5ozZ7m8oXbg71LYkyIP
         FFrWjA7eGqLmSHGePKDY5BoDGDSgFhBLtMtMDP9robA6aiZDxw/4RtiNXhoI1Qio8s66
         JgZj38fPGQKsNYUET/G5Uk7fkQQqenho7+PvLMvYK/14I43FYU3Y5Aor2bGc3bzL+USL
         EjeA+6ujWg9ULjrpqwnQSFfcarwuEXz7ACK7xQ46jALDHJVySGX0quJVMnxd9K+J+/Bs
         LJBtVbkvLz1K3k9VC8IG88WaEn3igxjEMmCF5Sbp7T+/t7yVDKCx9IgsigkhOeMdH+m3
         ZDCA==
X-Gm-Message-State: AFuF++n4DqseZCPyQInvZVqK9KxnXfYPzqubGrpI/akqel4Uv3eTM54m
	Dfv2silyfaBCrUYJkowP0beWbo86AB0YILTDh1k9L810+x1S2lpdNX0UnSGM2aYOKVc=
X-Gm-Gg: AYBFou0J6rjio7mnyxwdZkyuWiR/TABVFDwViex4pYT1igzIIlC8HN8tS1zhVD6MJqi
	PHECTMn5k7RKmNcsNZyBUaGErTkqSiSd6c5jd4lM1CUYkJNZ0ANDVZLdLPM6Prudkf2Gkkuu2Xy
	VU6r4MTbzUZgMOjIl8xFe0NEArB7pjtJLbQ+uPj9ibA2gQdEbfZlIbgJ8UvWoellN2cgXtw1iIj
	58DvmKpw8gGjRieb1uFIFStUMu6SNRtM2OE4XW/39Ukpdx148uPODgt1w2ENs3yabI1fjtIfnCk
	q5Ivu4EQ7S8L1vOstoFtPgUaD4spflxorZ4H9XPc0efR2OOP6i7+poFGltifq1eXfbL1ArAfF7w
	5B2hF53RgiNp7H8oqBns+NqdqyqIybjXFmZ9SswhMaDMNW8B8HpZg6OY7ZFpXDJRRyjrsnflR5y
	3EpQhM4P2XN+DEwsAfVB5/8M4bP9ozpEVkwUqRnGYprsbNDLcGVjvqoP59fmd5Q4M0kg==
X-Received: by 2002:a05:600c:4f41:b0:49f:ce78:3570 with SMTP id 5b1f17b1804b1-49fce78372dmr147694095e9.33.1790092892893;
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:46 +0200
Subject: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-1-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=BtLAkNapV4DmIrWa28ic6M0lRmuI8gxGAx+Yq38WqnA=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkWWhnOnds3fnOve0Z1U8XIO243wpvWmr+s2a35WP
 Zgk9GpPRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZyYSojw5qcUG+j9tQ6roOS
 H9z05Xb89jAq6H6fJL84/IjFQkeTPwz/0ybtf7Kn8tHFaIbGnZ5sB+d9Zb+1qbFF9Ps8PRv2Qn9
 lLgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides I2S audio input support to the Meson GX platforms
(GXBB/GXL).

Note: GXBB and GXL are not known to differ so the driver binds on the
'amlogic,gx-audin' fallback.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gx-audin.yaml           | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
new file mode 100644
index 000000000000..bdf1db882eda
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,gxbb-audin
+          - amlogic,gxl-audin
+      - const: amlogic,gx-audin
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3

