Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45013E8695
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335769; cv=none; b=aC30NOpvvz/1S4xeevI5Q47kPv+vTXA16mweFMa5QXQphU4bHxm+osQkvoz1wSWxx0SgVQDlSa79GTbE0vKGtlf7T6HLLRHCaTOktVyqJn88f6UfCGffghlYDtDZqXUeguWxViRtgam5VqsUMWEkW7Atah4wEBzAXWnCS4Bfu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335769; c=relaxed/simple;
	bh=2mzFSNN38df3xZV5ySX0YD0CGTqD9yUoQlpo6FibUb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aU2BCMjLk7F1OJVCc7TcjwZR8PPIc0Mhk5HGj80YyuU9XzXnN4VYm/LsbWLwDZQb901vlmo19NXtuFB5TkNItZAJasPNaSezyd5hJ/Mbva1wRdzLrKdIPa3HLPbxEJkY5LzmCpbkfqcGL1jydbMX5Q4c5ngJf1RGXtjy5lS5af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOpPmwQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOpPmwQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D21F000E9;
	Wed,  2 Sep 2026 07:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335768;
	bh=8e/TlJjd1XU+qZDzy7Loje2LXoBYlJn/vvz5Sdmezg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UOpPmwQ+d2Lz8VL5hBsNp2KY1sxJ7+Q2RPfbATAzMetCSi3woRLTlpfm7POSLk9Lu
	 o4HljHGxIVRdWKrIYDcFAn5iQOjxiOuTNaRFhvBySay0KalzxxRtdzuJCJsLOB9dgD
	 U55JrEtjTjf6QTvNpdFl0Gral9sIZcBxRNizsuuLdxeWGfaXFEiHHFuAsRhRKzVnBN
	 K+sebDOgfgzz1AgVzUIk/+0/ObGBJy8EP6PnUA/sMW2eZTbGL8lhRVK47Rnqrn8+s4
	 c3Vo40Xzq0V4u8ogKO2JsveDsMLahexRqfjZiz+pFJdNVjyhIpbGngcg8zOAHcPYyC
	 Gc9hdc0KtF0dQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 09:55:56 +0200
Subject: [PATCH v2 6/9] ASoC: ux500: Request the MSP MMIO resource
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v2-6-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
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

