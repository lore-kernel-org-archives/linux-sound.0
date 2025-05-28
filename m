Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9927F16D
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428914; cv=none; b=YsYlqvLk3PjbV9qZNPKfhuFFJbmAtzXDvMm7FDPwj5MZzltuz7/0PrVLI/DSsye6z4eDB7yucR5M6UlRfhWkSXsO1EJTtslNeNeaZthtQm5mO06YQiiXaV0wZJFv751/QrpEuhEfLYjY6eER9BshY4xDtCPl63HSnOtfZSM0Uz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428914; c=relaxed/simple;
	bh=8vGQpzjfE6u+giOJnSmjcfHXKBBVmk/PFMGclk6BN7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFOVGHVfxxMMpO/8gYr0MSiMK+k2zL/iSvr9faUNwDMQ9ZxT70B346tegjRzl6I1tlf3Vkfe+gwba87RtXoOYIpvoI58su7yHoDSIb5kBmknvV6etGsQsByWLybw2oDD6Y0h106AZ0YqaTss/I2bkbb93RHjtK76JCzuPzdvv5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lc7/A6Ox; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lc7/A6Ox"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so4584015e9.0
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428911; x=1749033711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
        b=Lc7/A6Oxi2acMisDiT5q+Ejee64Fm2Ax5poKiMe5vyf7YJPOdeHJocn7p0B+A8HHtn
         ef2GztPd02BRrLEuIbCd/7voOiVH0vkhUGiWmXzJkNnRn18Xxi5ji46djGUMHr8S9aZF
         boALWwQIFTwduNGe/kolYkfV3bfBgJga6gAaD6cfk65AiH+nr6y0H1Fg6jQIlZ/VHJGs
         h488twGPhNXQL0MrfKKvIBmNPpppJtbAR66iqG/6jpB7PGeKvTK9XvKUDiwMQq5KRKH4
         cGZ/RglzW5kr4Bf1aOWHde9Lr+hbv9eOfEn21+XxmkelngCg4QXA2BzvVfw5wg9kC/MJ
         VkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428911; x=1749033711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
        b=Erht6NFg7t/7vnkI4ZyxqpuYfYPHYVGaQ9Kno++rPpaOZ1O35zSc/JvpzzzuQda72v
         X4stMV4I1itNdz+VeNQgcEJ1dcQUvlHRi8DhF/ZzQyc6t5/qkQy7JizHQlEPvfky2GyR
         XwUpa4gVlxsXofGs8ozdHJV1Xm5wfhlFN6qBMem/sgc9ghyG2/q1fkGPkF3PGFo1UIp+
         iC33AFW/UqBMW7jbNw1IOmCJigpm08K+eFrUyZ8KefiBmhdpS0V+RtnYfmwLw29SPhHU
         fSjKmEOnAhX26TgJCss38D7N3D3YTY9ImomiBHyeMwoLfczrDnP2Ds4b7Sivy5n2JiL6
         NjyA==
X-Forwarded-Encrypted: i=1; AJvYcCV+h7z5YGkObk+0dAVHTNkQrcSeaf/m3ki4oOwzQiBj3FuSpyOUbbdhciOujwKXPke2PFk3qT+kIb9aZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxTTlT+M3JlO5kTLalvorlBZ8EcU6OsThDzuo9N1BxiRWdXIZ
	6SDI1fwIg9f7ls5Mkl45YRsHxUeV7Eocg7PCAQ9QRhs7yTA5isnjx670E0gC1CUhZoUGyIR++dU
	b1/Ov
X-Gm-Gg: ASbGnctu1Qq7qhdGjKCXUTPTCnHwpBTZHRG6/aPaEilS9rSX9tx5QDMBweTUFGFZQK5
	r+pzCBApfpTEZQi4LhZpPJ1XIevag+tB+9TielX9gukMQn7QA5KDlWXzGejgzos29FjrX1GpgCh
	/+Ou18LSiEAlgfq2xuG8CHx3Bfaq2lszo/MMYksc4IVr+4bp9XR1BGM9AHZQKTNsHbxeolcugTu
	blOaZKUqxcK77MhjjZNOUBvU1sSQ5/8xOBebXbJCY5vJD6LN1JduaXNIdCdcY1b96qTS2rE/I3j
	V8JAaAIgYfNntv0TQIodZkfEKLgC/ufpBPNPfA0i9JgQ5x1AU0/HcTuOYjbNBTjDFK8iB7w=
X-Google-Smtp-Source: AGHT+IHooMMR2KlU+5Gd8qlyqc96QquKsll0XFTTr3pLcv0vMQ8MQYAiAnb4hez9obwW2eebyXysVA==
X-Received: by 2002:a05:600c:4fd6:b0:439:9a1f:d73d with SMTP id 5b1f17b1804b1-44ffbf6412cmr6476285e9.8.1748428911030;
        Wed, 28 May 2025 03:41:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:02 +0200
Subject: [PATCH 06/17] pinctrl: nuvoton: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-6-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8vGQpzjfE6u+giOJnSmjcfHXKBBVmk/PFMGclk6BN7Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhNLZ8pobgxDI+k/cnfYZxSjqul6/uSEOxZM
 vok2W+plm+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTQAKCRDBN2bmhouD
 13TjD/wOqmsWZ7EQoYqceyEx8pFTPODw2hmkVaNqOFXe5nyTBtX+iKX4YUmEY7uC4ETlfUcrwkO
 a6Vgt3zPOGDFaxbSSff7596dBnACq/JoxD3QW1jVcrucqNldYG+PoPiOl91Y48IT+B2NL0dEFaB
 9kb+u6wRP1uLSAMcTxl3bTew5Htfu6wdcNe1Km8HKXTY+ax9I07NT+csG1rsx6v2nQxDpwiMEgc
 F0uFrou+YC4ZuBciooFqcC0te0BMfO+hdUqD5LKAZnzo1fmNOmcWC9OgMXAv0hNcIfDFeZqV9TV
 VeZmNZ2cRUStmVhhNFVBOj37ibBa8dirMQH0dnLhF8oJ06v2UVEH6O8w/O8pFmOI3f5LOJGZDhi
 sX9pxVXsptzDlWEWxxFxkBJMTK7Z+x5vmZPC1ukNjDp65C/3c8zu/DTcTXTQRtAUE6jM//OAWQh
 eTTHy+kkiZddwZyyQWeVFNT2fyD4c5NCxHORafQAKkDmfUpwHBEvbbm+nns/4omiwOt3PcrX8Sg
 /74BEVM9lWEZ1ksBPmCKL0Rmf5FrRWc8jrFSevr/pSiQ61B3SuMd4QPlfR2euHPsr5GMigiAdyF
 eCmi7ZYzUdTt7LfuKAD6j7WMlr2ZPoMBEtFQU9iNSYrzF89ylv8cGXPkdrbUKIsGCkBHGorfXiZ
 +mFOyVYptx3UCtQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index dfd32feb34286b7a4d807e9033a11f507e277dce..b8872d8f5930ad931dad208afec4e08a23c3d653 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1817,7 +1817,7 @@ static const struct pinconf_ops npcm7xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm7xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
 	.name = "npcm7xx-pinctrl",
 	.pins = npcm7xx_pins,
 	.npins = ARRAY_SIZE(npcm7xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index be3db8ab406c416f0709d06eb864e33e3208541a..3c3b9d8d3681c64c21927615e1bb49f157f156b5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2299,7 +2299,7 @@ static const struct pinconf_ops npcm8xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm8xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm8xx_pinctrl_desc = {
 	.name = "npcm8xx-pinctrl",
 	.pins = npcm8xx_pins,
 	.npins = ARRAY_SIZE(npcm8xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4264ca749175a2ce0f3603c1d7aa271d98e6cd89..8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -989,7 +989,7 @@ static const struct pinconf_ops wpcm450_pinconf_ops = {
 	.pin_config_set = wpcm450_config_set,
 };
 
-static struct pinctrl_desc wpcm450_pinctrl_desc = {
+static const struct pinctrl_desc wpcm450_pinctrl_desc = {
 	.name = "wpcm450-pinctrl",
 	.pins = wpcm450_pins,
 	.npins = ARRAY_SIZE(wpcm450_pins),

-- 
2.45.2

