Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4B3D47A7
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302635; cv=none; b=AmYLptu2CLpXk6NlHkXTgJ3vwf5tvp5SoG7ck751/g0FpRIME4/1aBdtAzpWBFKVRcO5J1qxg5DaU6SSWmXPRFmkMaj1IzDTvc8qVYoOmdja06GM5f1Hnj0hAio2tqVnqJppL50nZakLO5QQkH3dRpioGULgGsyXc7TYIHGcaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302635; c=relaxed/simple;
	bh=r9CFOaNWYMgR/afBnEAQs5sNZ3Gm7qHKJPgrKS5kSHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWXMs/NllkOWhOwWgGVROFn9bcVlp2tmU7p/Y8bDMwJ6CBn2bW/XN13VhfxkeSbuHUqCL5K0TR0Cs2CAjbTvV4rHhkQD6DHkQm87ukHVM8nB2tH50hYWpLe9xlmuRcrKBrJfGOR2l0rYuEDJICLcWuy9RUQ/cQRJNegVikmTGuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEyGPYFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEyGPYFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6FB1F000E9;
	Tue,  1 Sep 2026 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302634;
	bh=2L+ksvDpGuyQ17beZwou4RtxMPxoY69a8NjgPP8E0uM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nEyGPYFrkWjYAbiBOLokDgRIAleUkFbeOfe42WBViukAxHb0EnPkG2PvycpcXr0Vs
	 BbIh2SFH62PRgrGJboRjLPwqDRHqoXZfE4C+s9b8Da+Li9AB5cJjhkMMkwKHYiz1tZ
	 J7EFVKAl9aJRHzyYUdQh8vcyDAnefJ9Z4Lf7uaoySNOeSMYeKE6LNdCBFd6/Quap5M
	 t1kylSSl0CaX6TthgCPiSZ1LBxsAz5d/glw/3GAjFlfNPz3G1iYOIliN1/I/X0uiPO
	 XL9PdQAYwfitdKpT9Bu07e4XGE3HNG2EGD3sgR9ZissXmFC8j9citWoSahoUOcQyIa
	 6uv6Om2I0nRFA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 00:43:45 +0200
Subject: [PATCH 2/9] ASoC: ux500: Propagate MSP setup errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v1-2-da1447fd9f7b@kernel.org>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The prepare callback continues with a partly initialized configuration
when format setup fails. Probe likewise tests the allocated pointer
instead of the return value, so an MMIO resource or mapping failure can
be ignored after allocation succeeds.

Return configuration failures from prepare and test the MSP
initialization result directly.

Fixes: 3592b7f69a54 ("ASoC: Ux500: Add MSP I2S-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_dai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 7d6540898934..32d751fc1e78 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -468,7 +468,9 @@ static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter (rate = %d).\n", __func__,
 		dai->id, snd_pcm_stream_str(substream), runtime->rate);
 
-	setup_msp_config(substream, dai, &msp_config);
+	ret = setup_msp_config(substream, dai, &msp_config);
+	if (ret)
+		return ret;
 
 	ret = ux500_msp_i2s_open(drvdata->msp, &msp_config);
 	if (ret < 0) {
@@ -764,7 +766,7 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 	}
 
 	ret = ux500_msp_i2s_init_msp(pdev, &drvdata->msp);
-	if (!drvdata->msp) {
+	if (ret) {
 		dev_err(&pdev->dev,
 			"%s: ERROR: Failed to init MSP-struct (%d)!",
 			__func__, ret);

-- 
2.55.0

