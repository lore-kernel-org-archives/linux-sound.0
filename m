Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA24A230998
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199702; cv=none; b=mO0yGNagw9W0pYRQx6Wpo0uszcmsFPbKO/H69clNxVSzu07foTh8boZuCzm2e6RFxTj3jhx+t6zkM9I4pQpGLJuxKLQ1AVm48xqULW04XHWpFyudJO1jrwVWeiAqnZQ+moAaeG/KChFSMR9CkNAxucN+PPS2AWz2m6pZPzwXplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199702; c=relaxed/simple;
	bh=1SUppZfGE8OGfuCWgDmwdGk734Gq/5yDZqUI2tQbkK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aug0m99Y7XzCPa6+6GrckHXENz9OwLhSe9HCIlsDVXHkbuIB4lUczAAhpwxWAx7T/SGe9Mq1N4eEJ615KJZDc9iN2oB8JN0qCMKtMRwRIB9sGr8+yL18SoJOxDMaR2/5A7JgfxU6ruoz5B11eOK56HTeMfxMDKyj5FZv/DZllvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F3FzA+Wd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F3FzA+Wd"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7d58aa674so47973366b.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 07:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199697; x=1739804497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BadoGFdbWi+RxOS2TPc6oRzGweQOUnlp92mI5rcILo8=;
        b=F3FzA+WdcHy5M7f8MFqhWW68YvHoDYIw2nR9bM+k0pT2Urh1zNnbG/gkkinwLhcGNK
         nmUd3SIQ+43AFm5PVDQmGJ6DuCEuT19z7+qt/FO8uQZZZl1XLuRGc4D5RtZ7O0tlvIjb
         /+DAEDPd8yfgEnZqnGEU82XAsDTwDfU54LgUqLFHBUHJbTg3XleLzqDQe6ibtWAsHUAX
         ZKt5Gg9j6i1tyeP7NzFKVAcFu3qpUl59yC/LG3Xn6F2QT7Vi7LrC6+kDRGRay6UX4TuS
         v2LzJXVvdXMVWzojmUl5kV98+URPIazRrUmeTRfaIcr0XsvKrNkmWjQad0krRgzCJeTn
         yhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199697; x=1739804497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BadoGFdbWi+RxOS2TPc6oRzGweQOUnlp92mI5rcILo8=;
        b=DWV69taZtVyyKSxyelK+deO82UcQMP81Zd8oNWx3ysJTLTwR5DpWDsCN2C1VYG0fJX
         0a0n5isCM3MAIq3x4UyOiallR09GEcBuNHsBTp6wOVG7kElTOuvghxnSD0o/0cdvrs6t
         bJF6R1sss6fJAKDSz2cDiv6X2alhohY/rClNOTHOCzpcdIYPfLPyyUdsIYZR56OIbgDG
         3sjwPcNJKOVeAxRwfKFSaHopo6D7XOA9n7WiswJ3Qpzx7IMKTrjCLbkIh9C2mwgcgrEn
         BR21s9xufdLVL9RW98QjmTgvw1uhQB9putmNoLH8AmdBttuNcmWl3HfPqLDMO9eLTtEQ
         xHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV5NQ2PyeJedAN/tm4H+bV5brOdBsGrIEnMUiU+bzvpQB9XPEejMrGvA5a7iNb+ryQXUkwF03P4lQikg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzzm8guaqhzfJrtc20XAcTvJXVp7+kI112+Ww66RJK42LvenF
	EdBX652PtV7WDUqzR0eQGpTiKygi2ddOO418fCZgPwts8/CoSeEQHUbmOmCI9DQ=
X-Gm-Gg: ASbGncsorQFDqOtQsLRSGAKBSYSiibvkXNkbaxw3YLoNOZXjGE8IDHmyKmgLR4Ojhjk
	oOJ703JtR/rcqAVvC+yzF621YrDd3BgbqKz5vdmW/wYXld/nf4PUzbGJv0PsSg4io0gvbpdCJsz
	s+/+8DhE+ELD80lI4EQvZG4O5bk39QoCjMjh92n+zzkPgHRO9wCLkmsCv+OaDdIncqxRqrw2zGq
	cohgOZaXsdeVBPRU3zCKw/7djjsMR88db9JiHLepD5lG9GG6hvr9jBDv1o3LtGzA/Y4rksIjq95
	VLRrSCRVLY+TCZnmSyJzktXHqlqm
X-Google-Smtp-Source: AGHT+IGpVqycyZR2YnxbLB+0FPSVnyS2AxVJJQJRRoHf/8da6EsHjXh4Mti5AGi9XDwh+En5MO0W0w==
X-Received: by 2002:a17:907:960f:b0:ab6:dbe0:d658 with SMTP id a640c23a62f3a-ab789b20e6amr1580540166b.31.1739199696978;
        Mon, 10 Feb 2025 07:01:36 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:36 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 2/6] ASoC: meson: audin: add audio input dt-bindings
Date: Mon, 10 Feb 2025 16:01:25 +0100
Message-Id: <20250210150129.40248-3-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the dt-bindings and documentation of the AUDIN audio controller.
This component provides most audio input found on the Amlogic GXBB SoC
family.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,audin.yaml         | 104 ++++++++++++++++++
 include/dt-bindings/sound/meson-audin.h       |  10 ++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,audin.yaml
 create mode 100644 include/dt-bindings/sound/meson-audin.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,audin.yaml
new file mode 100644
index 000000000000..7fb231a8d5a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,audin.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AUDIN audio output controller
+
+maintainers:
+	- Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+	- $ref: dai-common.yaml#
+
+properties:
+	$nodename:
+		pattern: "^audio-input-controller@.*"
+
+	"#sound-dai-cells":
+		const: 1
+
+	compatible:
+		items:
+			- enum:
+					- amlogic,audin-gxbb
+			- const: amlogic,audin
+
+	clocks:
+		items:
+      - description: AIU peripheral clock
+      - description: I2S peripheral clock
+      - description: I2S output clock
+      - description: I2S master clock
+      - description: I2S mixer clock
+			- description: AUDIN peripheral clock
+			- description: I2S bit clock gate
+			- description: I2S bit clock basic divider
+			- description: I2S bit clock more divider
+			- description: I2S L/R clock divider
+
+	clock-names:
+		items:
+			- const: pclk
+			- const: i2s_pclk
+			- const: i2s_aoclk
+			- const: i2s_mclk
+			- const: i2s_mixer
+			- const: i2s_input_clk
+			- const: i2s_aoclk_div_gate
+			- const: i2s_aoclk_basic_div
+			- const: i2s_aoclk_more_div
+			- const: i2s_lrclk_div
+
+	reg:
+		maxItems: 1
+
+	resets:
+		maxItems: 1
+
+	sound-name-prefix: true
+
+required:
+	- "#sound-dai-cells"
+	- compatible
+	- clocks
+	- clock-names
+	- reg
+	- resets
+
+additionalProperties: false
+
+examples:
+	- |
+		#include <dt-bindings/clock/gxbb-clkc.h>
+		#include <dt-bindings/sound/meson-gxbb.h>
+		#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+		audin: audio-input-controller@a000 {
+			compatible = "amlogic,audin-gxbb", "amlogic,audin";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "AUDIN";
+			reg = <0x0 0xa000 0x0 0x308>;
+			clocks = <&clkc CLKID_AIU_GLUE>,
+							 <&clkc CLKID_I2S_OUT>,
+							 <&clkc CLKID_AOCLK_GATE>,
+							 <&clkc CLKID_CTS_AMCLK>,
+							 <&clkc CLKID_MIXER_IFACE>,
+							 <&clkc CLKID_I2S_SPDIF>,
+							 <&aiu AIU_AOCLK_DIV_GATE>,
+							 <&aiu AIU_AOCLK_BASIC_DIV>,
+							 <&aiu AIU_AOCLK_MORE_DIV>,
+							 <&aiu AIU_LRCLK_DIV>;
+			clock-names = "pclk",
+										"i2s_pclk",
+										"i2s_aoclk",
+										"i2s_mclk",
+										"i2s_mixer",
+										"i2s_input_clk",
+										"i2s_aoclk_div_gate",
+										"i2s_aoclk_basic_div",
+										"i2s_aoclk_more_div",
+										"i2s_lrclk_div";
+			resets = <&reset RESET_AIU>;
+		};
diff --git a/include/dt-bindings/sound/meson-audin.h b/include/dt-bindings/sound/meson-audin.h
new file mode 100644
index 000000000000..30c2fe218ab4
--- /dev/null
+++ b/include/dt-bindings/sound/meson-audin.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_AUDIN_H
+#define __DT_MESON_AUDIN_H
+
+#define CPU_AUDIN_TODDR_0	0
+#define CPU_AUDIN_TODDR_1	1
+#define CPU_AUDIN_TODDR_2	2
+#define CPU_I2S_DECODER		3
+
+#endif /* __DT_MESON_AUDIN_H */
-- 
2.39.5

