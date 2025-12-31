Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA39430CDAF;
	Wed, 31 Dec 2025 20:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211486; cv=none; b=ouJzP6JggJNyqTAWpVdfKN23ZZoaCcdMKvUPpHbo8Q9Vb32JWL612Xej3Oj1/uQhFzi2HZP9nHM5NYBEYKGqFsni3LJuKdnaZI2snFLuS2evR6Dkk+zikt/BjWDe2+wyYA3lQ9Up9/LGfC1WMQDBSzRn1XqEG5Szg9e66j2I0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211486; c=relaxed/simple;
	bh=n1P57dwOxahXW/vQtjNfBHnINRtQ/DHmkoESJbr/80A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a41Qh0ZVidTM+GlR1Hu1sbTIb1sQou3PV+2Hi7H+oCMfbtVb0FPMMgT8hRC1aHjMYkWt0UkaEe2En6gjZ9XgqWohbW7wSN4Pw4D7Umqi0PC/nXsRN3xZW1WhFyZzGnKng/VHz5IwGwGbXAfuC76DyV5p4+k57dSEoVqb+b+YAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nkiYZTzK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nkiYZTzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211476;
	bh=n1P57dwOxahXW/vQtjNfBHnINRtQ/DHmkoESJbr/80A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nkiYZTzKJTUMqYWGEi1EwI8AL6iOZS5NamW5hwAtH7uUz4D3NQ/0kgcqNGX/2J5g7
	 S4kFGidWQZgHan+hYBTx0dgGNUFQaSpjGp58y6Kc8TITNlDJp8FFNWsmARnNhD0pFI
	 zdv4+LicM7wmOZI7vCpTrcPpKbtoDmq0/W6HWLzH5ZEjcNsGV1sdtqROYAEhWdrmco
	 YkmFTuDkeQbxeNUzK5NlFlpWTfzjN3wpxyVQ4GHsrBxN524BHL1HpMfduNTODAb2Zr
	 OP4zrXQlg/ihQIHJ1ICI107WcIhPm2qVETS9sjfB0mJ9epnjKd5B7L8VS0q87zTQs1
	 F2HS9ZNZ/vMng==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C12D017E368E;
	Wed, 31 Dec 2025 21:04:36 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:19 +0200
Subject: [PATCH 5/7] ASoC: nau8821: Simplify conditional in
 nau8821_get_osr()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-5-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Get rid of the unnecessary branch to address checkpatch complaint:

  WARNING: else is not generally useful after a break or return

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 6dffda69f1ff..10e8c220c0e0 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -806,16 +806,20 @@ nau8821_get_osr(struct nau8821 *nau8821, int stream)
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		regmap_read(nau8821->regmap, NAU8821_R2C_DAC_CTRL1, &osr);
 		osr &= NAU8821_DAC_OVERSAMPLE_MASK;
+
 		if (osr >= ARRAY_SIZE(osr_dac_sel))
 			return NULL;
+
 		return &osr_dac_sel[osr];
-	} else {
-		regmap_read(nau8821->regmap, NAU8821_R2B_ADC_RATE, &osr);
-		osr &= NAU8821_ADC_SYNC_DOWN_MASK;
-		if (osr >= ARRAY_SIZE(osr_adc_sel))
-			return NULL;
-		return &osr_adc_sel[osr];
 	}
+
+	regmap_read(nau8821->regmap, NAU8821_R2B_ADC_RATE, &osr);
+	osr &= NAU8821_ADC_SYNC_DOWN_MASK;
+
+	if (osr >= ARRAY_SIZE(osr_adc_sel))
+		return NULL;
+
+	return &osr_adc_sel[osr];
 }
 
 static int nau8821_dai_startup(struct snd_pcm_substream *substream,

-- 
2.52.0

