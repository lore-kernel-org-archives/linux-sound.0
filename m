Received: from mail.mutex.one (mail.mutex.one [37.27.84.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DD91F754F;
	Fri, 27 Dec 2024 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.84.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318495; cv=none; b=cQfWz+HMP/7V2XpkssGWJOd1AWmo/UN5Rc4kcjPou8DdHhEf+nNJ8wYLGre5cQeMjMRlTeNRuL3yMZnt5iOwAMnWgCYCvZGtxwE4r4gT843TtG2rg9+A7wqtqzsD1kcmfn0Vad7i2M2rw1iYKakpSxdyv8bZ1jD3plZ3/mMc+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318495; c=relaxed/simple;
	bh=1iFDCQm++V+V6pkgjb+LTgznaht/lk9GRu1gf/8Fr00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mj5o4SR1OmKCDKk52YWOjs9W2L+8Vs5Yr8scxKJqFpKw4ZNFu82dWjptUQc3B/TnHKmKOZpTgEsaK0fm+YODAHq8/viCq4OZwM5r/8uYO17J3NyV/ZGlftTytDDrNEksLmvsaSV4cAaH9yrRkGmo24M2gwUWlRj6aj7QZ/heVUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mutex.one; spf=pass smtp.mailfrom=mutex.one; dkim=pass (2048-bit key) header.d=mutex.one header.i=@mutex.one header.b=JcFgMQPG; arc=none smtp.client-ip=37.27.84.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mutex.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mutex.one
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mutex.one header.i=@mutex.one header.b="JcFgMQPG"
Received: from localhost (localhost [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id B5EA8141047;
	Fri, 27 Dec 2024 16:36:18 +0000 (UTC)
X-Virus-Scanned: Scanned by mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgwGOoqfRKSR; Fri, 27 Dec 2024 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1735317378; bh=1iFDCQm++V+V6pkgjb+LTgznaht/lk9GRu1gf/8Fr00=;
	h=From:To:Cc:Subject:Date:From;
	b=JcFgMQPGKUDo1Zf5tWtElx8CoBALb5HI82GsRkmudQbI79RutlN8b+M/N0js3wcM2
	 jUU8MfYemfVAiXmGJJz1YdSsjGARiFNt1SPC0glmYyI27Vtu1I48vfzXp5zSLOrQfN
	 cY9tII9kl153a6sFZQ02NPz4kVYUSDKh3N+q/tj1HdUtIwOcUQTA20O3NujgjBramy
	 hubRGMjqBr/wPFqCYo02jbzl4pK4+SjYWzjfdpmb9/ZMM2+8ZRpUPzppWqF+F/t6/4
	 7v2ywXQa/0idVxZ/kLB2iw1z/ziH05jFytGx1IVqPx3o15AZNzntVFzCNdQOgouK6Y
	 aR2uIWjzfmglQ==
Received: You can't see me ;-)
From: Marian Postevca <posteuca@mutex.one>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH] ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK
Date: Fri, 27 Dec 2024 18:36:16 +0200
Message-ID: <20241227163616.239682-1-posteuca@mutex.one>
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

