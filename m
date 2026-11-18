Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028606;
	b=tHoLQp17w/JzH1nFujChj3cpWYxBV6cCebRPEWBvzWQZzqjYnkMYBrbTuFVZI2zCF1M2
	 WUYDCmFuNp9iOTJB15zQeZtOzX/tGHrNgUghYKqP8KFM/ME0nfJDt5RFfo996yJo8HQNM
	 oCBbcURsOoArR6AFeBYU+WCKxtVQmhcIrLjAeujsWbAY5UWBUecY/V8yeP6Q8PFGbsw/S
	 pULVu0YPS7PDSTpEhm5ZDFV0g/asXXVHi1Lrgpf4cot8N8INmmMxhXH4ddDog9g7wQvHu
	 1ITDAA59iaXHPrPUZYCVGn3COUa61Am8E90JBi0GLyvzv0AtmDdyhy+8ePGs1ckWlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028606;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=B7b9Vu2Y2JDC2GgkGBogp3S9l1OJiEE/ZSrODiMA40Y=;
	b=ykJpN2xVJfQv0ik9+vNW/GpYDVkxIEB2p4jnYM+fRjDf3vWzmoXuvCXc8dwdIA+l5H7+
	 PWfN+qRRa0EzRuBbmqSz9znq5VCP3QWT4QPv0mGxbrbJ3JT2vekoY4SeIVXxOyGvKWG9f
	 vUHyWt1bdjLXSwQdQrN/qEckioTCE81XRbbigXAitHz8hQ2LVOihZEPuP4xMXFL/6kft3
	 K77I/Z1ljjbuO8nCC4X0KeCwgthp8eXefCbKGfszrq/xURpLqbFBFBf8xVh8VnOhIvnEk
	 3P2OF762lbQoHNOwUNKoVjravFIqlL2RQy741jlsfSq5lucmX0NOqemdNlrKWYBYG+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=FIY5JgoU;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD698606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD698606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=FIY5JgoU
X-Virus-Scanned: by amavisd-new using ClamAV (3)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028602;
	bh=B7b9Vu2Y2JDC2GgkGBogp3S9l1OJiEE/ZSrODiMA40Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FIY5JgoU01TkYLntTMcmUyrt79snqL8BFhb5aPqgvZBjNBIyZO3KqL+lRpHAcrn7h
	 +FIrdgP4melGtC4Jker669d7G7PUQgTcyRUt6155Ltk0kSpQvM2i8mv+MHjARYzmbq
	 1690S0c8VvGhii9E0E57MSCVsOPpgN+1+i8pD2m1OwPdsEFfFQcoRvc4ijWOnBUMz7
	 6Y0cnZiW571+zHklh4egQfC7Fa1LPVB8/RlAiTb0d501utJ2q0WlAzXwyx8drUDEmX
	 EC9n2PqI4RtyruOIx6oEkF9yu2lJ/jiNp5Ro7fCsSR/y8qS1c58jnFmIztiybealAS
	 BboWaaSlfBycQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 098941BE948;
	Wed, 18 Nov 2026 20:03:22 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 09/22] ASoC: rt722-sdca: Remove orphaned rt722_sdca_jack_detect() prototype
Date: Wed, 18 Nov 2026 20:02:06 +0100
Message-ID: <20261118190219.316811-10-amade@asmblr.net>
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

rt722_sdca_jack_detect() is not defined anywhere in the tree. Remove its
orphaned function prototype from rt722-sdca.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/rt722-sdca.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index dd245ae9bd44..105aa9bc5706 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -275,5 +275,4 @@ int rt722_sdca_index_write(struct rt722_sdca_priv *rt722,
 int rt722_sdca_index_read(struct rt722_sdca_priv *rt722,
 		unsigned int nid, unsigned int reg, unsigned int *value);
 
-int rt722_sdca_jack_detect(struct rt722_sdca_priv *rt722, bool *hp, bool *mic);
 #endif /* __RT722_H__ */
-- 
2.56.1

