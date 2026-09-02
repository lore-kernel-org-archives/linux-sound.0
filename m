Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D053515F8
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335763; cv=none; b=NPY4OQVI6ZvmBYPdKY5LuOPGsJpKCOb49LM4TVE5gj4iBkLh6dO5EYREjX9IuAISGyh+pSXWftnTDeqDFpveotTCL/puphU+6JS4/510W+ApjvXf2GRV0bB1d81svQgoYuF7Z+LcL13eVw/EdC9OAMvm+pAfIPmHZ/SOamJA1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335763; c=relaxed/simple;
	bh=0lPK5YqDfeqxW7T5mOswijiKE8UmXLWMCSqHLuowqHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGpzL0My3Rot5qxtdzXzemqhayVw4Q1+lQirPAF8WYjMIDFbd06FUY/QZDCyszN7G0yPTrX3IBjH7fYtzwjvr91uMZYkTCIQY4G61wST3ehOUOiOXUwJ/c6vaTtrEqmjDHviVr6TmOdWkkVsg/8rmONhGLQo+DBrE+Lih8KCn4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbNxRHD/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbNxRHD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A501F000E9;
	Wed,  2 Sep 2026 07:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335761;
	bh=Fc2RFe1mrIUXCdBaX12TpD4y+XTvW+QTBgT1L916l74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cbNxRHD/obM+xRV3N8riuCUSciOE1QWwVsMb6N0ohWi8YeLJJrlFaLSRlDqWBT/TT
	 qtGkAKjsXC91TdT1lbML9np8lt1h7OkBaRDx0GvfpsiguJ6d1t3pT6uCFWMeEfwmXC
	 x/Lt9QlkqDeLq9pDdQ1/IQ/8aIlZQQOmV6fcK5Q5EiVbC8tSXgyQZy6JolqIW0B2YM
	 PUsLWioaKBIaU7x1oFZ7tCcFWn1cWKAU8lEAFk+1j+0igeht80gr6GgQc7it6riU4f
	 uyZwfSaN9f451AEXhmDeoZb9tqsrjm/66t/bL8yGFt7KwD1DMTFrm+ZUTSh5paNOSd
	 b9ne4ODiFGy5w==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 09:55:52 +0200
Subject: [PATCH v2 2/9] ASoC: ux500: Propagate MSP setup errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v2-2-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
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
index 994422e72512..29d25a3f6f40 100644
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

