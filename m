Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25543C0091
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840260; cv=none; b=G4Gt3JW1cftxIMKefU5kpqjnMv/mKfz6bLy/FZft0kNc4GZTrRPNg/54rJpUJRZeXgS8psN2oK67OEJ+uYS62J1SlJNzZ04wAWbOU60+raW8i4jcVJSWkvAPmhruW9JEyUMmsxtr+12L26jh6GbUmbduKLul97sQOlvgj2g0E5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840260; c=relaxed/simple;
	bh=Uu914q6UODLItA3vvK5l88VgJwM32DdfsJmtfwi/rkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htQauci3iFfuR5L7r1cCTi0AkQZJL2Vt5CJyOKKtFDFDsaDeVbBKGjQqog5qCZhYYJfQBcRq97phrtfZSc63n//X1/6YXNJlAW8/Q2vRHrN6gGwfUf5D0/j8/Xc7dSuibrjp/+08LhiFCLOKO/6neMKUFUXTTKx13xLvvEs6aLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3th6RTD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3th6RTD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2520424f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 08:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840257; x=1769445057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dO/w705OwMsU88LoVwjVUON1I4DFKZluQtaxNiuxS18=;
        b=f3th6RTDG/djVtwPwJxIvfdGpcKfm8+fDHbbQVK65SEcqnuf7oZYucHrzi1oo2WSmp
         WHKnmPCpn0lqVVrhuGz4vqIxZTA+F4lwb6PSqp5k8RieMjBBR/28qilcoEAa6RQ84aDN
         2xz8/LPc0gjYMpfIyZ2+dRBDF6dhF51tvkz3VNC1Y+k/saZUKpRJYMnvqHVTWEtzH6sg
         Vlpq9cWTaarja9frRfPvIpWGJOfkvPLNGQmi/JkK9ebnoUWjMX+w6L+Qlm4ggccLLLKi
         yizt1E+cGtKXmA6TEyp/bti0XRWKQ0JQ7MAkb0dWl1LVBQr+aY04qAcZcFmaITEJe8qt
         sTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840257; x=1769445057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dO/w705OwMsU88LoVwjVUON1I4DFKZluQtaxNiuxS18=;
        b=neK83pq2OSkaM76LQElwKDR6gNzYD1Onytoix7u6JvO//gc3kfk9GFFWulcddCJ7N8
         hvVylKnw9uLzmVZ/dQiUWsa6AnnqfSNfzL3RvSubfTrwlNifga1dKaM+iPL1JQZI5nob
         pLvMyAnB7ZfNU9lS43YhBGjUVtX4CMF/tU6J2S1sAwDP/gcLRs21iUNHjJpqxV7T3ljI
         KXtAy+2dYg9S8CoE2SpmH3rfXj6/k3429QwJarkj7A1aNlsG3/UWlZvjP9m+7X49T+0z
         r4QjD7zmrDgZcFfRvG4YGGXHd7XyoIFfuyD+SFKkaQBA8DHA7mS4T1K3uazdBPDHfZJL
         aGSg==
X-Gm-Message-State: AOJu0YzQstCZWYNgIizq3z6k5mENzV3JakThejyvSx07H63PZks8K3pc
	Py24TUHhoMEzue2GPKEtDFy/2NOpkcT/PDWlDoDuy3cR3V/laEmx/03E
X-Gm-Gg: AY/fxX4ZDw8ZXT5bCEmQzeBih7R67W2qtrHr72qLUTbqOOrNAh+VH7l1lzETx9mU4Zm
	yOuH0z5VJb7ZoME3epyjGK3IncYorRzPLDfMLI6kjAQAKebqzjGIY89G+oCltP2Fk1mOhQzsiAo
	kKlcz/d1989JnkElCx0+Royi59HGxFv5ddLrBNEZbAweaCk7W4WAUrp44x3fyH8sr37HcmVuSm0
	zLO3OXhXWknoxIFOH+gcGzmI5QPbcDgi4N7kASMWME9M/UCM6dHVolkAPJkhSwR4ebWha3N5dxv
	wxWSu/L92p/DwzLz6BvYeWS9e3/2u6BlgNWy23XdWkTm4MruVWAHr8eP3r+DFRsWCv0Oj5yrXXM
	umlsbz5AM1ML0gml7kovZB8IsJplfxnST50YoagjS/f+z7CICUzxHHjcKnelmM2IKLr6Rj1WKEz
	M+sQthBOpN0lHfaWIvhDrS6ZSzPj5xonQSUyBYqMsP5U2M
X-Received: by 2002:a05:600c:548a:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4801eb12369mr140158025e9.32.1768840256778;
        Mon, 19 Jan 2026 08:30:56 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:56 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:44 +0400
Subject: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=3011;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=Uu914q6UODLItA3vvK5l88VgJwM32DdfsJmtfwi/rkw=;
 b=nqI8ujgfXvOhrkF22+SO+FuPdj0nXLzd7iSHNw/zYATKuwEIQGxLxETgbdJ6NdnCicyO5vUUa
 U9BiyYztgEqApft9pm9i+stRZcA7NDW5Id/dBr2XFP185F3gMq6otZT
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC and DAC audio codecs integrated
in the Sophgo CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..d3b7e92f9758
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
+
+  reg:
+    maxItems: 1
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
+    audio-codec@300a100 {
+      compatible = "sophgo,cv1800b-sound-adc";
+      reg = <0x0300a100 0x100>;
+      #sound-dai-cells = <0>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..8457bddcea92
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-dac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B internal DAC audio codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+description: Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
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
+    audio-codec@300A000  {
+      compatible = "sophgo,cv1800b-sound-dac";
+      #sound-dai-cells = <0>;
+      reg = <0x0300A000 0x100>;
+    };
+...

-- 
2.43.0

