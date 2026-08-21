Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72743822A5
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 04:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287204; cv=none; b=XY5Ony696k+jm+m/Kyzt7vjUQ/QcGPoCSnOBhQw2dvXCA3ioGO9XVVT9LBdiVwO11D70JIX/K8+GbwUMGZvYKoVTsWolirVYwWLA9jKnI/0BzCHTch6xiOqimAPOB2fHSTpAWjfRZzbn2Q3lNt6aW9uoWe+u7mfDf0QoFvahz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287204; c=relaxed/simple;
	bh=fhF5eyedH2gXD/2uR68oyWbe5657S6ghrkVsIg3OrOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t2ER5kE/B0mmJWJ+Im4EqPz7nY5MBfIiKdHMEZGxjsIBM7AfcvvV6qxzNDNeZ6qgQHqde0UgEO8QeTrgSB9aNRwLeOlw1KDM6mg5C7D+Zn+j4qhXjleHcwb1qmT78EziTjYGFt2b5eX9DuibXCDkr9u67WLtC8VEVzG0Dbvgj2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=fwaTLiNf; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="fwaTLiNf"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so1224774a12.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 21:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287201; x=1787892001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u38MAgQ16EkssZf3acMydlSoJl569lszmJMEzuVuQGs=;
        b=fwaTLiNfqdVSen5BDYRC/CrGkGGduzgA7tIGa1t1FaXMYDoC/5KBb6KAwmrdi5k8OZ
         i+rnKSArsNmpA2UeIpOH3jB9Fb+SG7vgHeJkMGxkYtTtkym2jU66OEnLzw+99wgp7M4Y
         CpcyVwI/NUS4MAy+pefeknGaeLUrlidEZC/8rVqpSoASglSb+WsG9qrK1IFdNaKhIovA
         UzuF7OgyRbwmJ0I0XclbP1gQ6QMIY3nO/GWIUJdHBix24SSPkQm6jUZmQeUJGMvv/w5a
         ofv/ejAVtSZZ493fgcWSyilirRZZWc3tDtn8/XVKD/V8dmK4xL2ha5UvpzJbY6Y75Rxj
         5img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287201; x=1787892001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u38MAgQ16EkssZf3acMydlSoJl569lszmJMEzuVuQGs=;
        b=XNr32EMdTmh4QSdJkPch4Kd/ov/VmmRvG3xLEkNV+vseMnDGd79PIsEu9s1z6FCadd
         2veQIAbTDbhi67gV5jYKkZ+Po4TjNaaI1eEXuVjES4uUXQFA7vCU7Wo7LxKO+S0hnlLv
         uK17frtl+WR+CK0W9SrBwGDI9YiucyU5CejkayvZzpybDcUa2E9DeMxvruwXl50YRJ6v
         85UpSy2UnWRWiVE1MkN6Lfi5BWBXldXTHzEeMcopt6lVNWynJCaOziJXwLrjTaayHfL8
         vOTpU8psXjz/Gvz+Xa5Vq0gnkdcaXjLzk7DTr6aI/kPPygPyE7eFFcHKFgD0Q+Mk/qUG
         mvFA==
X-Gm-Message-State: AOJu0YxRT0kyGpEOvqC1mrfVGq/3DUos3tTFEbgMvWaEzXFM1OSW8l+C
	ZwAKsEzROxGFSS7JOXr0/ffCC8B5JgC7L/4kAFPPgFCF6cKulnLmscBERzLAwkp09YI=
X-Gm-Gg: AR+sD11vGkwmy1IfzkY2Cxij0WEPNtvADW6bUI0yeFOJgGOU+WWvLj6ifPwOXQNsttG
	QOCeM+YMRa1umheXcGNVE1Oue/k4t/EGtQrrb+S/FPpvdXMtz/HpbEQXduTRGrDuQ1PBQhnudPL
	c7yOs3FvqfWrLIvOafiSP4f/HiQucoY4XwpThxcYcQX2W9oof5seVjzVd0UbgcSYXorvbTOYlWd
	w7czmGMbAB4vtcXD/ZWeJ3V9GxR9UID+GBu26bVndDBTVAYnAegm5VJqiOQoTOyTLrGIHGZCRYM
	G4etBZDSBtgg6Cq5rrjilwREuaLGZ148t2dMtYOeW4EAvez9ltqdtsN+WQBimXypwqY3X7GcUxd
	ZSLDGDn+fKrL2DbKaKRO7oMMdGOHaP3fhdK6IcUCqRHZ11Uxnz9H31H8fVUZrBws1tQusgnisfN
	4uGWMkNO1gU5t9xokK6lqPMkYK+b+HNTXMfLwFwYISKutmWjxO0I6MGFcTsx6crtLqC4w0JC6kf
	Zg80Ppj0CsHqg==
X-Received: by 2002:a17:906:9f8b:b0:c1f:c061:569a with SMTP id a640c23a62f3a-c246a4c6d63mr275364766b.7.1787287201026;
        Thu, 20 Aug 2026 21:40:01 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:40:00 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Date: Fri, 21 Aug 2026 07:38:57 +0300
Message-Id: <20260821043859.171871-3-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
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

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the binding to esstech,es9039q2m and update its $id and compatible

 .../bindings/sound/esstech,es9039q2m.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml

diff --git a/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
new file mode 100644
index 00000000000..c1d03d3a855
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/esstech,es9039q2m.yaml#
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
+    const: esstech,es9039q2m
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
+            compatible = "esstech,es9039q2m";
+            reg = <0x48>;
+            #sound-dai-cells = <0>;
+            clocks = <&dac_mclk>;
+            clock-names = "mclk";
+        };
+    };
-- 
2.34.1

