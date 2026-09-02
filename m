Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741203EA957
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335773; cv=none; b=rvtUp757wq89RRe8YjCtIpcgsD1yQ9ueWcKZ/MWJwFDC4LJC19I1Dx3dj+hZVUJKsDzndFXlHpRI5nzCxXc/9Jv93HcdMwoYocpJ+m6oLVYVwFd6MwMgs5ERI4dkrluVMVqncei2yCxKZhZU5Jg7gD48wwxnFate3fM7pG/F/Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335773; c=relaxed/simple;
	bh=6kNlZeiKMitcdZ6EJ71gHkZclrj136AvcE7kpi7MZ/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HK2wFAiBDuwdtWAuIr4amZSvyaSTm6OxZQhPSXUGVo6zP6Dep4RDWVA810XU0Ll9ojvxnAh4p11XIb9XdbmuzLVIFvmZntjACPGC7XjP/JF+v9eT3gw17g4NYVgEBC9AJzez5J1j5ZINVxB0+vkJ4VfHZpRrBZyqRX92reGfhGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgKbRnCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgKbRnCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75021F000E9;
	Wed,  2 Sep 2026 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335772;
	bh=zZFpOrK4hj+LaU59s3aofQ7+zK1uJdFw6ngql8FwZ2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DgKbRnCshZr4TTmxCd+xwJ15zWATwaxUWIw6jS6KBaV68/T4Oa5z9zF9ojvth2+Tb
	 plPDhc9F2YkIHt/ET9phB70KyGfMc1bCaLU2ykyQVPa4IbmziNQycjHix+rk2TsAz7
	 jdq2xribjCVWnSFiWoPDWBsiquYzugcfR3mSyZ42wU9fBVbyDr407EWCLZJT7Www+E
	 oCp90PDqSLJ/V6bnpBy0lxpPwkOCEUkOMYuxnWo0AIgR3+vNnf0mYqts4eIduk5Leb
	 a4IF05FqWySIIJDCkMV9OHee8KrAmyd+J532FwHZgGzzzzjsvZplibC0P46RAhTMWz
	 o659ZoD9QvmCw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 09:55:58 +0200
Subject: [PATCH v2 8/9] ASoC: ux500: Allow repeated MSP prepare calls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v2-8-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

ALSA can call the DAI prepare callback again after an XRUN without
first shutting down the stream. The MSP open helper rejects the second
call with -EBUSY because the direction remains configured.

Track successful playback and capture configurations at the DAI layer.
Make repeated prepare calls no-ops and only close directions which were
successfully prepared.

Fixes: 3592b7f69a54 ("ASoC: Ux500: Add MSP I2S-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_dai.c | 28 +++++++++++++++++++++-------
 sound/soc/ux500/ux500_msp_dai.h |  1 +
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 5b4b3126637e..37c48cc70394 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -388,15 +388,21 @@ static void ux500_msp_dai_shutdown(struct snd_pcm_substream *substream,
 	int ret;
 	struct ux500_msp_i2s_drvdata *drvdata = dev_get_drvdata(dai->dev);
 	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	unsigned int configured = is_playback ? PLAYBACK_CONFIGURED :
+		CAPTURE_CONFIGURED;
+	unsigned int dir = is_playback ? MSP_DIR_TX : MSP_DIR_RX;
 
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter.\n", __func__, dai->id,
 		snd_pcm_stream_str(substream));
 
-	if (ux500_msp_i2s_close(drvdata->msp,
-				is_playback ? MSP_DIR_TX : MSP_DIR_RX)) {
-		dev_err(dai->dev,
-			"%s: Error: MSP %d (%s): Unable to close i2s.\n",
-			__func__, dai->id, snd_pcm_stream_str(substream));
+	if (drvdata->configured & configured) {
+		if (ux500_msp_i2s_close(drvdata->msp, dir)) {
+			dev_err(dai->dev,
+				"%s: Error: MSP %d (%s): Unable to close i2s.\n",
+				__func__, dai->id,
+				snd_pcm_stream_str(substream));
+		}
+		drvdata->configured &= ~configured;
 	}
 
 	/* Disable and unprepare clocks */
@@ -414,14 +420,20 @@ static void ux500_msp_dai_shutdown(struct snd_pcm_substream *substream,
 static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	int ret = 0;
 	struct ux500_msp_i2s_drvdata *drvdata = dev_get_drvdata(dai->dev);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct ux500_msp_config msp_config;
+	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned int configured = is_playback ? PLAYBACK_CONFIGURED :
+		CAPTURE_CONFIGURED;
+	int ret;
 
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter (rate = %d).\n", __func__,
 		dai->id, snd_pcm_stream_str(substream), runtime->rate);
 
+	if (drvdata->configured & configured)
+		return 0;
+
 	ret = setup_msp_config(substream, dai, &msp_config);
 	if (ret)
 		return ret;
@@ -433,7 +445,9 @@ static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return ret;
+	drvdata->configured |= configured;
+
+	return 0;
 }
 
 static int ux500_msp_dai_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/ux500/ux500_msp_dai.h b/sound/soc/ux500/ux500_msp_dai.h
index ad4ce69bfbf5..aae582030d95 100644
--- a/sound/soc/ux500/ux500_msp_dai.h
+++ b/sound/soc/ux500/ux500_msp_dai.h
@@ -36,6 +36,7 @@ struct ux500_msp_i2s_drvdata {
 	struct ux500_msp *msp;
 	struct regulator *reg_vape;
 	unsigned int fmt;
+	unsigned int configured;
 	unsigned int tx_mask;
 	unsigned int rx_mask;
 	int slots;

-- 
2.55.0

