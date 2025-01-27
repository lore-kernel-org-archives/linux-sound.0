Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A600E13D52E;
	Mon, 27 Jan 2025 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990827; cv=none; b=Q7ytxqK4G8e0uAoGtnInawEx3NCPwq7pg897RX51JAFVlpH26/OV14TNker3ZoD95FTk+mvsOfhPZ7RR4u5G+ouw5jtDK3ekyelFORopt93moABr9i5GL7IP1KiCejdNC18NY9VWNKFMle0E9jdjlxTVkDLI/yeSjsYeLrHCBBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990827; c=relaxed/simple;
	bh=6wLgqAgxgb7VToyeyPGBhvgst7pHmtRSNKmUZeNUXJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZcE9iSI8gvKq7kk6LfDFPeCqTLR8ak8gdyndt4/BEgCyHanjBQhe8sywTD06x/I7mMV0JSgOyEJ20UuIRjJvg4DfZB3JNi28d4dxqCw1ZJ9rQ5i4J5l9evU1a5RJ2+pi1/dgDc+yaSMFZKuXiChVw9sltuAxDjgql6haNPkvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=B+WkDnja; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="B+WkDnja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1737990307; bh=6wLgqAgxgb7VToyeyPGBhvgst7pHmtRSNKmUZeNUXJk=;
	h=From:To:Cc:Subject:Date:From;
	b=B+WkDnjaJOBbQpYcrl/LxmuaHgWIK01zKl99zhOtwDVXk+M4woe6s0u6/A2HNqhPv
	 EDCMFaDkF/iRmpl90bUQUbO9qh6bgiZnJ5wC2H0A9o/1Y1kzOL9UeSkbfhPDah1sdb
	 9vd9VAYiHkWit/kkC+QnKmbFrpVmqGVQqSqMojtA=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-kernel@vger.kernel.org
Cc: Ondrej Jirman <megi@xff.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Marian Postevca <posteuca@mutex.one>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
Subject: [PATCH] ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2 bit control
Date: Mon, 27 Jan 2025 16:04:55 +0100
Message-ID: <20250127150458.1489425-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

Max value should be 3, otherwise "DAC Soft Ramp Switch" will be
overwritten by this control.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index f508df01145b..e7bd561a8f40 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -101,7 +101,7 @@ static const struct snd_kcontrol_new es8316_snd_controls[] = {
 	SOC_DOUBLE_R_TLV("DAC Playback Volume", ES8316_DAC_VOLL,
 			 ES8316_DAC_VOLR, 0, 0xc0, 1, dac_vol_tlv),
 	SOC_SINGLE("DAC Soft Ramp Switch", ES8316_DAC_SET1, 4, 1, 1),
-	SOC_SINGLE("DAC Soft Ramp Rate", ES8316_DAC_SET1, 2, 4, 0),
+	SOC_SINGLE("DAC Soft Ramp Rate", ES8316_DAC_SET1, 2, 3, 0),
 	SOC_SINGLE("DAC Notch Filter Switch", ES8316_DAC_SET2, 6, 1, 0),
 	SOC_SINGLE("DAC Double Fs Switch", ES8316_DAC_SET2, 7, 1, 0),
 	SOC_SINGLE("DAC Stereo Enhancement", ES8316_DAC_SET3, 0, 7, 0),
-- 
2.48.1

