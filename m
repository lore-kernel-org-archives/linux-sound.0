Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991547B425
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302640; cv=none; b=WVK5ake+kb2Qn9tA6/H4ZMMommYg1EYNG9hZgz9Z6b/BemrWTmsNEjgmfpANg3mYWL3Avf/5C5Vck8InsokF/b0aUEunAeEeN6Wzkg7O18+q1uGLuoeZmjyPYhh56UasFwNsRz9E2odWMjS4XNA4b4A9HYTPFY7Icqq/qzhYb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302640; c=relaxed/simple;
	bh=dRpIOGz11RlY+r/Whw7PzqHQO5sK41Q/9MXKalfbLcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLnYcw3cEiqCZFF4z0BP05f8ZLLXx/jzvsyECqfu24lK3jecfWdl5g2e6kpeaZ3KGHXFH5wwqtk0RyWD4Q232LP7RCIwwAzr/eVb5jHXAW2t4lmVISKCnNGVRRLlVBkbieKGJneuhmOvZzQn/lA3q2bKdTgNXLD5iHglsU5IQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW+akDJG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW+akDJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342651F00A3A;
	Tue,  1 Sep 2026 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302639;
	bh=lmLS0rpfCCUPqr4egw3GjBBJDoDgz7V7K6pT8N40Nmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bW+akDJGS3YRECxvPU2Sp/WPA1C7hlsOL21j9AUk+SeRY66Bb/QWM0UzO3CowQwYu
	 7y8NpNeX2HoCtGedJ4BrvejUvVxYYePKZf9pqNMKJ14ZszMQrER00Qhkn/YZ8L2XpZ
	 +yQzq8RLBD/BHGdcoW2Ffag1lY/Obv5/b2BLPKDripWJjGBT+eudrjZnPbrefgglBw
	 I5rC+QZCrprOAigXmYm7fZcWbNMk+2p0Gx/zzGfi2Zx8OIk4TifY6kifaPNACV0LpK
	 C277niianDNC5vlaB+x/6yknZUgVs7Q2iAVxfDfO5/pBtFs5JC3XxQexPpjMV3j/KG
	 Aw1I5elQg0qyA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 00:43:48 +0200
Subject: [PATCH 5/9] ASoC: ux500: Deassert the MSP reset during probe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v1-5-da1447fd9f7b@kernel.org>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The devicetree has described each MSP reset line since the PRCC reset
controller was added, but the driver never acquires or deasserts it. The
block can consequently remain inaccessible when firmware has left it in
reset.

Acquire the reset exclusively and keep it deasserted for the lifetime of
the bound device.

Fixes: 95f04048325c ("ARM: dts: ux500: Add reset lines to IP blocks")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_dai.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 599de5de23dd..8450a4799c0f 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/mfd/dbx500-prcmu.h>
 
 #include <sound/soc.h>
@@ -686,6 +687,7 @@ static const struct snd_soc_component_driver ux500_msp_component = {
 static int ux500_msp_drv_probe(struct platform_device *pdev)
 {
 	struct ux500_msp_i2s_drvdata *drvdata;
+	struct reset_control *reset;
 	int ret = 0;
 
 	drvdata = devm_kzalloc(&pdev->dev,
@@ -733,6 +735,11 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	reset = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+				     "Failed to deassert MSP reset\n");
+
 	ret = ux500_msp_i2s_init_msp(pdev, &drvdata->msp);
 	if (ret) {
 		dev_err(&pdev->dev,

-- 
2.55.0

