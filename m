Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87812E2286
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207207; cv=none; b=lT8+XxSFVoY/zYzqE0zo2fhehKkVV8e19JSZhckQp9+yqPyn0mA/NXL2xfqcc+I6axPdldolX9gVfw5w1RS/0PuGQo33zLI/oro3Xs8G9s4SbH4u4JPIZwW4aE2QhYE0k14OvjdZIleSKuS6Vz0Flqywmc3vF4Na17kBgDcPyjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207207; c=relaxed/simple;
	bh=Hu1b/eM8DIgxetD6+FDAba6Xts4rH35UVME2yp/qqxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sSIjyrLZl/OVqL10HhSwAZ/wgQsG5VsyLjelxHpDyF34x0kbHIKdzDcyXJc8ZEx2HJSsvUYXoPbtH6rCz4OIiPAFNUOhPTrCRSi2ClUHf2zdjSSuuIyIcSekWVJBmhawSNk3QAH3GUpmEY8riOoMFV51TTUCZfFHZbb/lLCL55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=HuM+3hpv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="HuM+3hpv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso21554735e9.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 23:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207202; x=1787812002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGL+opdogW3f/VFMm125tb78RzFKbGXV5P/NglL6bmo=;
        b=HuM+3hpvwayQekShQ2wZGrmTfpvty044MzH66y6KUkMiroW5bp7j9WsZDRGAJU1jlE
         l9EGXyZwIDNgQf00pB9+BEACQ/l64bfu33uaGm1Bye9ArkriiEWl/1gsVHVfJVKAqed1
         DVbvY63pueRDT7JLexYOHpw9TeJ+Sn68n4HaDamUQSvh8wq0ZrSvCUMKczBLXBtxDiYE
         zZZFvzz3gp4C5idXWR6HcA5Wcu42QFcgsiHyx8AmThG2wTd1iAZ9uXr0qsyFhA5ErcR1
         AQSkBpkw0NG4x1MuNU1t/ksl59q9G7ySPx/6ngYEG5B46VdiTqs2ppQI73fjJX+/gzJL
         zZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207202; x=1787812002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGL+opdogW3f/VFMm125tb78RzFKbGXV5P/NglL6bmo=;
        b=fbf/+yc1i4Chv2Sr4dhY0MRzgCV8LFvYgTEs6fS3bjOIwD0pRiody8zgG1tUMt+VRl
         MRLXZCDnYZzRJ74OFx2zEautRpgXmvJ1F9acnb8kPuEZtKf2TsCa2OhW2oJvYiDA9fuh
         ut2PiqArb7Gl9gVNlBzzbPgvTq45oONEXXlZhneijp5JQY3iaOcGQm9pjLhNa0sEZDYD
         Ts0i06orahXJ662Xk8dUzbs+6XVCxZ53tXvu8sieKt7h63+Gs6Nv2HUJecqRRfFRuJpk
         cRR8v8ovLPGYWiMKXaJ5pmlGt45U5vXhuMzVA9AEGUPhlT9uQVoGwaQ7xMsWdRHlmVKp
         nYRw==
X-Gm-Message-State: AFuF++kPC2YC4tui42ycMigmHEJ5LCEOVeetj1hhX84T7K2yhjHtXD2y
	Rk8OK2Msa2xJntz7tft4KhuxQdAnKwpj/a/M0tBwrZZyoxWXaPl/1E7AaTujlwx5p3U=
X-Gm-Gg: AR+sD11b55R8ZBXlCjp4w0kVmglXmRyNPl1k7neiEYRQEUJA8uzOguSsnp9J+xkqBEo
	cVc5c6o70IephD/iLsRDNsp5u0CLR2jEbNnK2+oqm/SogsXNW2Mqhv4pRYWqHvRXouy0kiE+ofu
	ArdR0/L+vBwN5lNipWA/HNcbLsFfACuDRK6y0JsoLJkv0SWkymgdtA9MqZ/3iouAMJd9w8h3pbH
	/RbBxNzwUgTnJ3Gxp5/NGfw0lPgkdQsXPdsQW7yH0AS2PjPKhX4978a7GCxERnSqZsiUxUOlig/
	DxAXqIf1GxL9Ix0ZlTjWBdXdDCNX2b7qZsCkrckfgzYb8IjL4u6Ldi0qY4u3ab/9xmhsFkOT1ei
	ZXMtmTY7ou2CCnzsIvl++1u8jqNNhj/uCfPn8VfybeeS7RvYZw6+I9wz8uCQ0Q3YylhzfHzQ+jA
	lryg4y8xBIYWJFNbDTjJQ3zoMIHaYjQBQd8O4Q4cH0gLAAAVn/tkoL5fkGfdgEBklQBEGsmJqA7
	0A=
X-Received: by 2002:a5d:64c8:0:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-482b1fde1e9mr18334090f8f.16.1787207202106;
        Wed, 19 Aug 2026 23:26:42 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:41 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Date: Thu, 20 Aug 2026 09:26:24 +0300
Message-Id: <20260820062626.39218-3-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820062626.39218-1-karl@asseily.com>
References: <20260820062626.39218-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the ES9039Q2M, a 32-bit two-channel audio DAC with an
asynchronous sample rate converter.

The part selects between two control personalities with its MODE pin:
hardware mode, strapped by HW0/HW1/HW2 with no control bus at all, and
software mode over I2C or SPI. This binding describes software mode over
I2C, which MODE = GND selects.

Signed-off-by: Karl Asseily <karl@asseily.com>
---
 .../bindings/sound/ess,es9039q2m.yaml         | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml

diff --git a/Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml b/Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml
new file mode 100644
index 00000000000..b52c4cc5304
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ess,es9039q2m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESS Technology ES9039Q2M audio DAC
+
+maintainers:
+  - Karl Asseily <karl@asseily.com>
+
+description:
+  The ES9039Q2M is a 32-bit two-channel audio DAC supporting PCM to 768 kHz,
+  DSD64 to DSD1024, DoP and S/PDIF. It is controlled over I2C or SPI when the
+  MODE pin selects software mode; this binding covers the I2C interface. The
+  part contains an asynchronous sample rate converter, so the system clock need
+  not be synchronous with the audio bit or frame clocks.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ess,es9039q2m
+
+  reg:
+    description:
+      I2C address, selected by the ADDR0 and ADDR1 pins - 0x48, 0x49, 0x4a or
+      0x4b for GND/GND, GND/AVDD, AVDD/GND and AVDD/AVDD respectively.
+    enum: [ 0x48, 0x49, 0x4a, 0x4b ]
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@48 {
+            compatible = "ess,es9039q2m";
+            reg = <0x48>;
+            #sound-dai-cells = <0>;
+            clocks = <&dac_mclk>;
+            clock-names = "mclk";
+        };
+    };
-- 
2.34.1

