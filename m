Received: from mail.mutex.one (mail.mutex.one [37.27.84.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64839139579;
	Fri, 27 Dec 2024 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.84.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735331279; cv=none; b=MhNWpFnSRgIAYVI9JwKEZeJWKG3BrSdSEmLyvKSfiPbkuc2mF4walDGfHur2jqQRiY2i0IPmu68ZGAe4nhvBpdf4vKlzaQAfb/lJttUqJdMiS4ed9pBWx0vd6+77sDLRorCptugQ9ybYD8ad0cWoFzB0LUbuxd73l+RsEUe5C4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735331279; c=relaxed/simple;
	bh=1iFDCQm++V+V6pkgjb+LTgznaht/lk9GRu1gf/8Fr00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMtAWQULMs1adc2v02rnpNCS2xCuZJte/2qO/Al3MGMbQMzkHFWZVAfnwGFQFb0yX7ccIaGcEFuGyt2ohTUtWlCJjLRe7hfDBdDSR/FWoBftIooItDS8x1/b/Rc0U3yKMO/SFgS79VoS2Y9BpIs0eBVx6cXhNXnbnlKmNpshGJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mutex.one; spf=pass smtp.mailfrom=mutex.one; dkim=pass (2048-bit key) header.d=mutex.one header.i=@mutex.one header.b=fzou67c6; arc=none smtp.client-ip=37.27.84.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mutex.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mutex.one
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mutex.one header.i=@mutex.one header.b="fzou67c6"
Received: from localhost (localhost [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id CB94D141055;
	Fri, 27 Dec 2024 20:27:53 +0000 (UTC)
X-Virus-Scanned: Scanned by mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bL70l0X6l5J; Fri, 27 Dec 2024 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1735331273; bh=1iFDCQm++V+V6pkgjb+LTgznaht/lk9GRu1gf/8Fr00=;
	h=From:To:Cc:Subject:Date:From;
	b=fzou67c6cXE5ZkV5ZM6uRLYNks+Hij4n/wLGAzWXOYRIwnr4W3n2Ka0OQerfeo0I5
	 UPsXVg7Fnj4vr3Ol6ch3vJESXvDTcJ1BNE3lAWTe+EXvis2bcTLfLAETwEWZqmy6I+
	 ADaenYY9YkvEe0QpgNuDUxyv1FtYTjLETqvpKa10YMtxlHt8fODFD3BZMuTA/Ith5r
	 QshxnUeT5JpVI01I0lSkInimaMJbKaK0v2TBYp1IF4csyt3jzJgpT8qC7uGTz7lbyc
	 +f1+NSCVTUWXz63XG+DuhvjaAvNadLWJhsDZjSEG7i1grwN78VD5xUKDmy6BjCf1jE
	 kXF0SgxjtF4qA==
Received: You can't see me ;-)
From: Marian Postevca <posteuca@mutex.one>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH RESEND] ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK
Date: Fri, 27 Dec 2024 22:27:51 +0200
Message-ID: <20241227202751.244954-1-posteuca@mutex.one>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For 48Mhz MCLK systems the calculation of the HW rate is broken,
and will not produce even one sane rate. Since es83xx supports
the option to halve MCLK, calculate also rates with MCLK/2.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/codecs/es8316.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 61729e5b50a8..f508df01145b 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -39,7 +39,9 @@ struct es8316_priv {
 	struct snd_soc_jack *jack;
 	int irq;
 	unsigned int sysclk;
-	unsigned int allowed_rates[ARRAY_SIZE(supported_mclk_lrck_ratios)];
+	/* ES83xx supports halving the MCLK so it supports twice as many rates
+	 */
+	unsigned int allowed_rates[ARRAY_SIZE(supported_mclk_lrck_ratios) * 2];
 	struct snd_pcm_hw_constraint_list sysclk_constraints;
 	bool jd_inverted;
 };
@@ -386,6 +388,12 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 
 		if (freq % ratio == 0)
 			es8316->allowed_rates[count++] = freq / ratio;
+
+		/* We also check if the halved MCLK produces a valid rate
+		 * since the codec supports halving the MCLK.
+		 */
+		if ((freq / ratio) % 2 == 0)
+			es8316->allowed_rates[count++] = freq / ratio / 2;
 	}
 
 	if (count) {
-- 
2.45.2

