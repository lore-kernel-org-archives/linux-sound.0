Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589D47B425
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302646; cv=none; b=jT4IuWW3q093sBLXIKWbBaRAxgzLseh5+YQ2U6N3hxMp7fKdtrX+y91Gn04KHbMGlBWRh82bKAm6bvIhGSM90mvbnG5JvUp9QokhSdc2XQWUkEaP4Z19a83Oe2CEs8s+unFQnR6p4mT7r7CeBGaMTRjbFQomoiHbsIT90XPiS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302646; c=relaxed/simple;
	bh=6kNlZeiKMitcdZ6EJ71gHkZclrj136AvcE7kpi7MZ/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCkoEGrHgstFhX3CygPl5f9XT6UBfh/Z+z8rfIsBCJu/azf2rRfYw6cn04pBndDKW4d4ygeRZMLq7lGwElyWTvOnKPDdAIG+e8WqCCX8E3y9zt+zC+cQ+Q0zbcuOx45EDSRo2wSzmzXdz9jk1BNgw8LU2kRDqWxZIbSlruJYq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBZ3EGx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBZ3EGx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43391F000E9;
	Tue,  1 Sep 2026 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302645;
	bh=zZFpOrK4hj+LaU59s3aofQ7+zK1uJdFw6ngql8FwZ2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bBZ3EGx6bcb36vI2TqK7QvLm1J9WNHG/aZgcAai2YB5wNX8IptaO8io0Gzxd2VnM2
	 kcC62I0M3Rx6JOx/xfdRRGm5GGPFwDZdRVzCkqB6lYIfFJFKOHDWPZ6f2lhmRSF+0L
	 vvdt7lyNxYYrW29PBXuHK/LOgRkhIaKbugCdG7c31YJsyqOB9CfXK6a1r0AkcHlUic
	 Y0UwrbTD6a+AG/ysfht/2+Q65KvoWYa2Ri6lA5FlSdLnFZU/BMIO1MtTKxot+pFOVb
	 eGYdCaEyf2A7ER2nS/3SctIBF4km7poJylkjPusRgvYdGzCrWYMVZMlCJYRkLQBZbT
	 m/Jm3ntYtQwVA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 00:43:51 +0200
Subject: [PATCH 8/9] ASoC: ux500: Allow repeated MSP prepare calls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v1-8-da1447fd9f7b@kernel.org>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
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

