Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028615;
	b=QzkIRoVc26aEUpag/q54BHBM0u0gaXhNB9YU3TmCTokp1r8BZUjEA8ZZQIObRIGe9mR8
	 0Ag5pnRzFoRkKd+LuRUpSSS7YLdAWWm0tlX7HLpUbHch7e49X7F9dOFNY/JU9uXjrQWko
	 VfQP/hVZKQyCd8/KeAAP3nMt6/tzgI0gC+IaXVfTczOWxlZathS+6BB0XIUZ/5ljM0ZW4
	 lyPSM1jwfbFEW0g/Ogq8IeW+Kuhz0Z13CJw1VKjgaFrhuJ0LnL2GZNyIMbdIB1rQ0PBUW
	 DKeFw/8VkLHdzbuIRLsIkj/q3KJuOe35mixYv0lztX3FLMLIwraKye8ZZ/ZC1ZOHeFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028615;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=c/L+cQVQuwi1Wp/6osVG/ql990lU3dWd3hgnYHTEfdE=;
	b=J/hd1OB9gTEY/NQp7MQrj9kYTRgjgmdliCHAt+57Jm3eroNNBmtEyUCZayDIOpYHG/R6
	 K8zLyD+KGgBtn6fKaxXf6jA+lMoAyAJ2V0nYXJPiWqc4JA9hyFZlU2M0v/mLZxGupX7qJ
	 XBi140VQM6pp4IIEPcq17tMAr2WXLos54Eq0ucgyMQf80eqA1r31n7irVvqyVoxfV9/oH
	 xi2q8HDkER83N+iTAdWIw0XGmP0oMDPzZP9nAjJ2jAcxwaG495xyKzRpGQvh6RpWfRMs7
	 u/cOP9GZWVKMK1Z/6sWPphDRuL5GCuHXv2gLhwO9jkca52kw2/vk2+tBKVRjjbc9tIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=d3zQNd+o;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C9606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52C9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=d3zQNd+o
X-Virus-Scanned: by amavisd-new using ClamAV (7)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028613;
	bh=c/L+cQVQuwi1Wp/6osVG/ql990lU3dWd3hgnYHTEfdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d3zQNd+oe8MKRxQiolh+bvfcUoYpHmWr2IbD/LfJDfS+4+fh7y/wGnvw6yTJuodc0
	 dzxsxJyVPTtUFbrVOTulm5YQEzVA5z9gluBB1eIXB9EI23C1anF+moLFEOC8YXN5cu
	 K8swg6n3auDxhYreeM8yjwJp2jJ5Y65bRhxs0QHhAAbjm1M0umtjJuwnDP50sXvYZJ
	 AHi6ilbHmNn8q+kJXZKpVmDoHDAXQ15rquERQ8J5264YY0r/T9e3M/+cswUn4vePWR
	 VpH1SR3r/6nPHeaVYqlK9gA6Ayr+8mTNJqyXtIXmkbDofBVhYR8qUT8laPsIHxxSGs
	 iioULUgidQmWg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 2F2BD1BE3B1;
	Wed, 18 Nov 2026 20:03:33 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 11/22] ASoC: codecs: wcd937x: Remove orphaned SoundWire helper declarations
Date: Wed, 18 Nov 2026 20:02:08 +0100
Message-ID: <20261118190219.316811-12-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

wcd937x_sdw_free() and wcd937x_sdw_set_sdw_stream() have no
implementation or callers in the tree. Remove their orphaned prototypes
and stub definitions from wcd937x.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wcd937x.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 3d0ba3cc0ee6..af217eae493e 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -526,32 +526,12 @@ struct wcd937x_sdw_priv {
 };
 
 #if IS_ENABLED(CONFIG_SND_SOC_WCD937X_SDW)
-int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
-		     struct snd_pcm_substream *substream,
-		     struct snd_soc_dai *dai);
-int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
-			       struct snd_soc_dai *dai,
-			       void *stream, int direction);
 int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
 #else
-static inline int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
-		     struct snd_pcm_substream *substream,
-		     struct snd_soc_dai *dai)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
-			       struct snd_soc_dai *dai,
-			       void *stream, int direction)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
-- 
2.56.1

