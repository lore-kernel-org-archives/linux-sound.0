Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28AB47B425
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302642; cv=none; b=Gcd9FlbaPrfO0KTjdm2NIJx/en1+m1uQK1TtMlDKh6pl3Rozzr0Jip+JauPIvwAUUdFudNNyfsXcG5JTSEfeY17/TutxkckcX7w8JCCmkJ7LQVMDIQBpGqO3LM4R0X+KqpMDULaP7w8i6CLJCM4m5PYntRosmI3q/gWniNCKJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302642; c=relaxed/simple;
	bh=2mzFSNN38df3xZV5ySX0YD0CGTqD9yUoQlpo6FibUb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFDlNIe+otJaM/h7phZppkd45rcPaZu1T9VcpK/YjmjJ+Lj350BdhpQUdwimCU1bW2/+lSk5N66RzKeZL+bH1r6QWP7Ej2iepUVUxmd+0BqjTA65886SR91bhEAcU59IKFwiedP181sVEw7mtzmtij6zbq4Bl2Rq3ReGV3Y0ilw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9CunZ2a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9CunZ2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070691F000E9;
	Tue,  1 Sep 2026 22:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302641;
	bh=8e/TlJjd1XU+qZDzy7Loje2LXoBYlJn/vvz5Sdmezg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d9CunZ2a56xTKQD5RbQxNBEAisnuUmwxTNDjrjflEwEk7UQ57U+AL1C7zbaWs0LKW
	 SkPckZ6KCGmijyKVzaGWD9MPSEtHKhAmY7VVGKkSfSmKp/YVuySU9kcfpXD8SlJrDW
	 9JTYFNt5wgWWLd0GuXQWl3pizLVhzhggKzOQAPn1yTdH76TKiU1bPMXX5tnyHqdoLr
	 Q0xSHlLlaswKRpuxe3xg3YxDt//xO/k6FquRVVp/bmBdkZ/NZe235qsk9WK9Ub/RUf
	 5FYsEW0TgrvcQkj3xwbySf6RBeGkHWfukKR+csC5ZGxJtuJD99K0OMbdf8/zfTXt0b
	 BQ1laU83JXhdw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 00:43:49 +0200
Subject: [PATCH 6/9] ASoC: ux500: Request the MSP MMIO resource
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v1-6-da1447fd9f7b@kernel.org>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

A bare devm_ioremap() neither reserves the register range nor preserves
the platform resource error. This permits another driver to claim the
same range and reports every mapping failure as an allocation failure.

Use the managed platform resource helper, retaining the resolved
resource only to derive the DMA register address.

Fixes: 3592b7f69a54 ("ASoC: Ux500: Add MSP I2S-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_i2s.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index bc77174e0070..43dc9b3aa4ef 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -733,7 +733,7 @@ int ux500_msp_i2s_close(struct ux500_msp *msp, unsigned int dir)
 int ux500_msp_i2s_init_msp(struct platform_device *pdev,
 			struct ux500_msp **msp_p)
 {
-	struct resource *res = NULL;
+	struct resource *res;
 	struct ux500_msp *msp;
 
 	*msp_p = devm_kzalloc(&pdev->dev, sizeof(struct ux500_msp), GFP_KERNEL);
@@ -743,20 +743,10 @@ int ux500_msp_i2s_init_msp(struct platform_device *pdev,
 
 	msp->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "%s: ERROR: Unable to get resource!\n",
-			__func__);
-		return -ENOMEM;
-	}
-
+	msp->registers = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(msp->registers))
+		return PTR_ERR(msp->registers);
 	msp->tx_rx_addr = res->start + MSP_DR;
-	msp->registers = devm_ioremap(&pdev->dev, res->start,
-				      resource_size(res));
-	if (msp->registers == NULL) {
-		dev_err(&pdev->dev, "%s: ERROR: ioremap failed!\n", __func__);
-		return -ENOMEM;
-	}
 
 	msp->msp_state = MSP_STATE_IDLE;
 	msp->loopback_enable = 0;

-- 
2.55.0

