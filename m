Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFE280CD4
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428924; cv=none; b=MzwJ5S5mAF9t9mZSHHhFDSPQmiuMkhZtRGCvJ0PYGxU3GJKYa4u/Dwcp8KEzK/dGBiRcFWgvebVKNbT05qtPiAc2fwzGB5viO+ffotJNvoXCJLu8R872OSoJU2LhwTotFG7lbmRIJFB9ZMm+5W+FqUiS7ENWmv3j9QUQ97gIlYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428924; c=relaxed/simple;
	bh=tMPOIoxmSYTBilMSijclMXxtNrW8WzkiypV3oMPeYrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqjHuuddaueKGaQNWXIKHT0KD5+rmn9Zcn341E4WWV8xptDAxCikRGxqulMPiDIawsWNzO7hDwCHzf7tKUfsVaJTYZ2l7BM7++Sd5sWgaffdRISsONw9ojCBvsmeRiOI/fqpdJg7D1j8eqKKgv6gH5OjVdl/1Wcfl7XBVyrz2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkyGmBd0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkyGmBd0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-444582310e3so4550075e9.1
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428921; x=1749033721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
        b=FkyGmBd0MZTD3uPGCbiRnwr8G7DOclYZZ9YJevDJblITJJHNvsVcf0f1AuvDMmYUbM
         xue0woDdr282FrNddbU/J2t85ZtNQ+n2Ad56mbPJFV9mN7ignRxh9GAmn4G6IWCV1Xqp
         fW2XboFPNqxjIQlpBuZqVG17A8RRWlh2whfMJT4NgEIBHqXzHSSnBLHqjM8U7q4lN3jp
         NS3aivlqFPbxORndFLMeRBYOihknF5moOunrl0VGljYTBjC9KOzlysjC8Fp7f4eDqqlr
         WwOB8jwgJNHcP3GfBBmNjTkUFhhCiCD5C4eA5MQLF0pH1pbS8nj/N1UM1ry2kT+Q0DuL
         DYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428921; x=1749033721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
        b=WZ/XLtYdZQFjMyK/tYBhZunOti8a6hhKdk6zpRj7vKnpMZZkhuwNiEVHt8rFQRKTzS
         IeADYK6Zz0CpKyZj4LQ0BjJFOgUgv8owjHRKfeCBljaPmLgLnpr9RUxgu+Tf4vzXFj5u
         X9GmbYIMTtxoPvCuPzBrrhDdkm7v1qHBUO5IkCc8jYrIQS//VOz1R0y/3lccuHmlmAz1
         JId+mEqXklkcCLtpur0xluF7zF+XFNCvp6aYRtdu1/q9ZdXswGL3iR4ZexUSOC8Q9n+L
         sTHs6mfrw2BF1lDOBhxvzmMLmoIiaCUb0Jwhja6d2XQnMtg5q5I2ZhEVSNILi+Z98cbG
         sdoA==
X-Forwarded-Encrypted: i=1; AJvYcCVxlA3C6THWEQt/LGOF/gDylkhll8POMdHB3Hyrh103FmDFNaWCjIlttx5gglMeikDw2uPWUV+MB1q10w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3FYzk6YuV+ZbbZ3nU7P1dLU4L0ssujuwgBaUd/drQb3Y7/oGD
	D7s8usVovxlxGIFTxoxMAAauzgC+izperscXbchTqx0oCs22T0bKosDwLSZNz+sJBvo=
X-Gm-Gg: ASbGncvGVeSiJbx2ZXOnlB+DK/Gcf5tPST5jknvOjOh0+7w4jOhBxMR55tCuWmJnhB9
	a5K98SONLqgR6xaFuB2sUb4L0UfcEZSwgSBRcLhMn5OSyAeofyeGEU8R3DmWlT2XjRjWQ1Gko0c
	jFW8roanVnQ0I3mGyVCVhUvH6Fh00MppsjFeNnPIFsDNsPdfIXvrj2R9IENJqzIxCTTB1Mo5BUE
	d4UhJ+W33XDxLdmh2aq8t9n4cf/4ysXvSj4qVE9Hzl5sjB9hI8Opjx9M1+/mw5dZ8QRnR1tOG7O
	wjpk/HufIOKy+ueD2WaArcaGbK+Td1BfgdYW8pe8FrIaOQGAD4D3DMFfAe1lnRJiOhoILvE=
X-Google-Smtp-Source: AGHT+IH2RvO3u2jIkhe2BH1+/yJAOhQA0UR42TzWyNNAEDpg/cdMhyD7e03ICGq58jet5YwmI1xsWg==
X-Received: by 2002:a05:600c:1d0d:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-44c934e5f3cmr48727465e9.1.1748428920692;
        Wed, 28 May 2025 03:42:00 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:05 +0200
Subject: [PATCH 09/17] pinctrl: bcm: cygnus-ns2: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-9-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tMPOIoxmSYTBilMSijclMXxtNrW8WzkiypV3oMPeYrw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhQiRFuBZNM/PyHQB2QGJi215mgTKjmtl1J4
 6O38EUsvPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUAAKCRDBN2bmhouD
 192rD/98fy4M3wAq2lLrZI16iHbCWibHnzws9NPmcH5NdY6VM7xhLEq++95JNIwB0UKiqe2sWUi
 nR0jKaZVhxwjwEoHgfW3yXkchrYLT4HtbxPM2wXzHTIMNG7qDtvCJDN6RHCbsGZBoarDEQuCk2H
 ZSpG5J0mCHYGWzNcuUMYQPg8wInmjwrNaISZ2c3lFPKzal+YJqOE+78XA0oIU0qNoJX6sWXyufV
 u01win3xK0AMvzXktWiaB//8qOR8se9X8Q/kU83OohrexwKTewmqQGrKCqWvub2qfbqVJs9Lcf1
 g9HWX7C88+/pIBcjjWdDmWRa1DCLypL6Nb8lKQXaFrgAs9z63JSXsuobSuuFvtErz4Q4CQSePjF
 39ee9zzBsbsjRGSNjGTWVJ1RUoBRJI5WZbDvm8wmDGn6N09uesj2pWwa5OnDuM4Q7JzMKY3byGT
 d9cfJoT3IffCKay5oTbaTEipX1AxJL5Ka5JKkQdtV9Fd5SGfyFzzGW0zgMhoOLK8L9eaGOZmObm
 HlL037nJMCk37k2UYML60oXBFFsO5loJChx/GjpfwBoPXLjRPk8PdQnTbwF4gLyNP1zxMSZ/6Yy
 D7h9V/1hVNWGd0B1G9TGQH5qJt5+Nq9SQUlmoG/jyVioHYfTnjhR4QTiy2kMaZpNlU2URVKqZf5
 A3gbDHJkIDwlHMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 04f4fca854cc05c6ccc75fbcb640b18fcfd37453..23ab3ab064b6f2b0aaa15afd6b9c582f1a1256b2 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -971,6 +971,7 @@ static struct pinctrl_desc ns2_pinctrl_desc = {
 	.pctlops = &ns2_pinctrl_ops,
 	.pmxops = &ns2_pinmux_ops,
 	.confops = &ns2_pinconf_ops,
+	.npins = ARRAY_SIZE(ns2_pins),
 };
 
 static int ns2_mux_log_init(struct ns2_pinctrl *pinctrl)
@@ -1026,7 +1027,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(ns2_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -1060,11 +1060,12 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(ns2_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(ns2_pins); i++) {
 		pins[i].number = ns2_pins[i].pin;
 		pins[i].name = ns2_pins[i].name;
 		pins[i].drv_data = &ns2_pins[i];
@@ -1075,7 +1076,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = ns2_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(ns2_pin_functions);
 	ns2_pinctrl_desc.pins = pins;
-	ns2_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
 			pinctrl);

-- 
2.45.2

