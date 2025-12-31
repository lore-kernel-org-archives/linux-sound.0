Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41730CDB0;
	Wed, 31 Dec 2025 20:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211486; cv=none; b=tCcgwZw74uNmAi+6oCQQRGLva3tMKWW8o5nzxHDdfMLpgOfwX+oqC9Go8xi+Ut2x1v3HauABbfqLm33k0t9cZv1vdQli1V1ybZapfX9n/gg1KsGP8IwjTgCT1NCanNmFXA+Ndy/R/OCTCkeFWiA5/o4eufWVfC0zAORR8f/N5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211486; c=relaxed/simple;
	bh=AM65amuekUvL2dVwT3EQhiS2lVut1Fm81BBvjBbNDtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrKK+hg9w0dCmPNCihONPm7p8hgTFDM8F4W+ku9FSsx1HiCDP4hadXZlVqY4RGZgMZa6he2hbWgSPckEFe5CT8CAPY00gp4KCRFU0ejRcKuMxzbIo7GwbGyTHji2ALaLdLS4nV9c7fkSFDI4wiqjtYBphjlsuSUTLITo6VWkOfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H40tnygK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H40tnygK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211477;
	bh=AM65amuekUvL2dVwT3EQhiS2lVut1Fm81BBvjBbNDtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H40tnygKP3vJSUaboHji+p5PfmzCCq2sJSo2N6IJxa8zHh51qtpaPiUkuNnKjZ+Bq
	 J0fuyPMCE58oFPiVVaI880EZcWtcmMUIytMU/tCtrRVl8AMXVCf3i7HW1juGJs7TJN
	 H1IGvm2GTfhR/5GS3WtkRTHO0sR9yfkAmMtPDtp4CuzatYmCOJ+HaO0RP9UmXY0R9v
	 C4/YtaIi9ReL6GBJS9yz1zTVAdWSTej2VygPOQmx/4dP3cnr5HGruJEgFjKQ63D6Ku
	 uHKw6nShR/ATe7mkDA2CK6g/eX3DagLl4Ue14tCjWKlTUgjnpWbWOcT5kiTli4lGRk
	 Prw5wzWphz/6Q==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93C5817E0DC0;
	Wed, 31 Dec 2025 21:04:37 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:20 +0200
Subject: [PATCH 6/7] ASoC: nau8821: Drop unneeded braces in
 nau8821_hw_params()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-6-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Get rid of the superfluous braces and silent checkpatch complaint:

  WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 10e8c220c0e0..181214fa792d 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -872,15 +872,16 @@ static int nau8821_hw_params(struct snd_pcm_substream *substream,
 	if (ctrl_val & NAU8821_I2S_MS_MASTER) {
 		/* get the bclk and fs ratio */
 		bclk_fs = snd_soc_params_to_bclk(params) / nau8821->fs;
+
 		if (bclk_fs <= 32)
 			clk_div = 3;
 		else if (bclk_fs <= 64)
 			clk_div = 2;
 		else if (bclk_fs <= 128)
 			clk_div = 1;
-		else {
+		else
 			return -EINVAL;
-		}
+
 		regmap_update_bits(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2,
 			NAU8821_I2S_LRC_DIV_MASK | NAU8821_I2S_BLK_DIV_MASK,
 			(clk_div << NAU8821_I2S_LRC_DIV_SFT) | clk_div);

-- 
2.52.0

