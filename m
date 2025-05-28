Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C1E27A44C
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428899; cv=none; b=TqjFEHgNrB3DT/UQX6dPBWdK2RgdXJIe/cjoUXC8kU6y/aahseoHOi0rGUNT1fdB6lWn0GOMlQ3RTUdthjcelqP+MsLT7N+RI814fvtrsobP0rrukbi4UIf96MoP63/2SCnaCM2Jb/bQWPA9TFFHsssMDPT6QAPWnQaMelqQ2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428899; c=relaxed/simple;
	bh=zrI5XszXIHo55XzuEzxs+Nt+l2DX90UOcjrVjPXljcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QldD127z7t/MhuXMoTIUeOkoEHQxQCWjRfbstMpZsgHhW4WpnjkuvdSTwXE7nT79fOVQy1OE7PDgjYCvhQzDtVeiqSw8CxeDs2ITm1b8/YNrw5E8hRHi2ZaDr7YzMURSGS67V26/MUD9LXi8f4HELmI5/ltKRmK+LNIAWSp2AnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUf26LPi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUf26LPi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5068855e9.2
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428895; x=1749033695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p6g8nrYLu2YSRDRFX7+ayHvEGE7eEHjSKPeWK9MLgc=;
        b=FUf26LPiWgQDd/7WsZegNt9UYRVHMfMbl34DHzO3qwlmPqWWyNobyvpeC5gTt+tCoP
         UAbfiKG94aigNoTDMorQWZhYeAo+xRyQ9rj4SHa+f5HpE9oRFMGka+zMowpyy8mGqoJ1
         4rye4kYIanGg59wVZ/gldCV4VePH6DK8usT9ClDDJgydWpxHPsZQbh0FbfRiqU4JIqfN
         5KZhrzO+X7Drj9gmgr+TQAMGRoubl3kPjmkiU69dNy8FDU9vg9Epxh15hmePzn2ksq0/
         5yCPls6EXmSBURAVYvKIwKWN8bC2eCMrXszsTSbxYF5tXQfiKZ5uEI0kNKxqzsD32CmA
         eAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428895; x=1749033695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p6g8nrYLu2YSRDRFX7+ayHvEGE7eEHjSKPeWK9MLgc=;
        b=JoPddJ3fxc2FuXJNCa5UgeGRmaDU+F334qYfaD4CYWvxcfnMn1FVfy4Ol19KzSppEB
         TTc9eNwiTflmQtewAoEg9LwoEPRbK+EgtF2z2dePfc56F61Mn2+l6figXyFiMq809pvC
         +gCWUJBFIFLIZLfPAu5HteJ8qrp6CDCfPTJO35bHuU4b9hQKr3zROzKOBYBRD/KUICH/
         c6qqlZUDNs+9ugqbldUzB/wTMwlVTaJKlC+4KyDWpA7Vh4jZUV1CGiXw45cqqqtapG3x
         sCrfkBuuq8TKksHEo6YfL+/j39uBMPd6Qcb8SoBBte5CPnbKvWeFWl732tPMSRWQQKFi
         CbmA==
X-Forwarded-Encrypted: i=1; AJvYcCVblXQ9UIiAftp8ElZhHZhMS8FnxK7vcRH8BsTqCJ1l7FfelpVUdrLAxpXIjoZMW/nqwJMc1JMow5Uzbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjC40dxRnSIw65c8L7Jr+W6rHLDvAJHKjnMYgt5wRvKyQvMIz9
	cMqkQj9CT4UKTSJus98rvP5CsKSoZYki/jg1oUg4T5oALB7ugo5RMotyikbX/QI/nR4=
X-Gm-Gg: ASbGncvtMhiTOTtj5X+b93VmqgBy1R/y0ijy3LzNkCgZx1FIdovYGdJNjitWKfm2M5j
	FXID69Ugi4V1glsTPgsxiF+U0JhEaM3kg0PvjUeGaOj2GmiLiMus1LWvCEbbOklxsXX0r/jaYJt
	oVaOctVCunNATAxAnZGn2Et+LHBN8GB9e+r0pAUtv/Th/OW4vIr5oGqpjjCI50z0E6HVKWc5IGe
	EJmeqpxMVY3FgqIibgkUUBRQBGzUQpItKOljDwYtKEhGBy0fHdSPaOiG7VyyMA11ztAZ6c2fv5l
	IgFrErnreBKCduVgsqb1hiOqJXWPD0K9ybO4ONj4E+TC/LiHaEmxnXjRhIeekQ7AK6RvOvWLLYr
	S+U2kdQ==
X-Google-Smtp-Source: AGHT+IF4XXp1aLCWKB2Y2JNdxIiZKbtNgU9ZnNFVay8r7bVjoBOcuQslbgG6XG2skmv22UHi94V+gA==
X-Received: by 2002:a05:6000:1885:b0:3a4:e672:df0c with SMTP id ffacd0b85a97d-3a4e672e083mr1108871f8f.13.1748428894969;
        Wed, 28 May 2025 03:41:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:57 +0200
Subject: [PATCH 01/17] pinctrl: starfive: Allow compile testing on other
 platforms
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zrI5XszXIHo55XzuEzxs+Nt+l2DX90UOcjrVjPXljcM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhJ4yZZSqj6dEPnXTgLNjKYLUIHgwgauUARk
 H8eJl7B4ryJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSQAKCRDBN2bmhouD
 1+ivEACCJDREpm7C+JuFF39/eQGACEJKolMKPZ3B1qh8VZPQQTidC/Sc4YJsNMf2ALyneQVNJRr
 ee0rzIGyB1dV+BdbrAAaU1luTOQfqd28ZU+hkN12kluq5TtfVYsfjC3qY+xT+s57CmqWJrS8suf
 tF84DJ05p8vijBMGOe4xzZO7or5BqM1JK32hTFyoZh7kOPiI174p0w91Flem3uX1rLg8f2iRGf5
 nPHw4aLV+fgDVeF1lulUpeOAfqHnt0lqKBhpWkowevGEp1PvCHxN9C+zZxjzyVFbhW7DQ7Vtb2q
 ekSrBr/nfXxV1LWbppOeZjsUoqbUYpEBFiNSjCW5tB6Rc2K4ez83OLBVRPG6U/mKcdlG/sz8MYf
 kxnETUB/7A5YgTrEHNeATC8iZ+qcu0dlniWB178PRj/Ohb5p/++wVINLNbOzxqKur1h03+i74ZQ
 lU+QrFHay3EclA4eZmLOSb5rWnnCam0dbD7OAwUxuYLUeB1dFqcULcpDozUjb0t6M4vPm2Opadi
 Y+Kcj/2g3qAtprbL+7BXQPANgJ7TNXpvHXfiUyPvyMmZPuCNkI2SsPmCPNPVAMn0fgSqkoz6iC1
 UKVdN+23XFZMk5MbzTHm838PZoLCCpE96EW79bgbL2OEPv4hPAfZ9GTjdJjAGafoQ+3/4WhNNSh
 y+XmeSNsjaGGtHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Always descent to drivers/pinctrl/starfive/ because limiting it with
SOC_STARFIVE is redundant since all of its Kconfig entries are already
have "depends on SOC_STARFIVE".  This allows compile testing on other
architectures with allyesconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -82,7 +82,7 @@ obj-y				+= sophgo/
 obj-y				+= spacemit/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
-obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
+obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/

-- 
2.45.2

