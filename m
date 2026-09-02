Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E63E5EDC
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335768; cv=none; b=VQtpHOTCwT+NGKHHBtoNg2D0JnvhPjF6Tq6HGCR78hzi4RK+ed1uMTzda5wsecK7El4H9WzSJlhhSpIk9AdJhrl9r9tP5U668Wi3Hm8bJ1+rK+9Rt2pAM0Sv8ZCsX2yAeQr4wpIpy191h3JUxIkhj3y6XE62fGPz87umX4qdVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335768; c=relaxed/simple;
	bh=IzGzsBx8xc8j7/D5UAQgpJqIk8LCFuN4ehiaxKXjfkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/oXO/jKd9bC5nPy5o1++/eKETsIJr694VGH2T4HkO8pefMZsMtybhmAm+Oar6iHrFmQOH+EcZc8tE/WjqclbJXA4A/PLfRpiSudi3IK22XD+c13Z5A0FWmIBi9zYhmDNci2shEHortFj1iYzX6EN+/Wes4U4GDRCBTbkUln1B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHQt/X7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHQt/X7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611AF1F00A3D;
	Wed,  2 Sep 2026 07:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335766;
	bh=N6nhUUqtBnN3VrIthLjfAKFsIS4+bG7PQvpZsSzYgXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YHQt/X7Au2aq7GYtWErRvPhHntMA2Z46zhI0uWkf/nIuvuroeOU45BsqVeRKSXVo5
	 TPihG2+Spo/foHCFHu2L7dQFPG6LvN+/H438qUPKfjVaq+1ZUdXqBrtbDT5JZgADnh
	 hvk35wB7ilzly51rjJoTdc8E0ZkB5THTcGKFxdv1/3nmN0397IpwTPWUEtqgGe6aPw
	 zGVnPW9bOGf3MyNllodRt0fsjxl2jMfbd9lXdX0cpc2c8SUAA1IkeBWO1MLXkSiDm1
	 0JP4T4KfmV/GGvKahAxLjLz3BxExJMTkuxC/b5xoKQ80xkgoBB00r+Lu5xNjs7kjrX
	 mi6ndCtYC58bw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 09:55:55 +0200
Subject: [PATCH v2 5/9] ASoC: ux500: Deassert the MSP reset during probe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v2-5-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
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
index 78278927cc53..b3de115d829a 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/mfd/db8500-prcmu.h>
 
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

