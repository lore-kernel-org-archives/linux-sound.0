Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028593;
	b=xOiEKr7eUetlRwX8ZQE6YMi7qS364j1aEyZR0Cws4f84GQ7OKPsfF6fshfUgmcYED/Wd
	 52CAKxvFwRBuKK/e2gz48+DuiTzN25xuekMpiPoxoQPlLJokmEV8+5rL3MPB0TUDAjuF9
	 g4DCSgfBGFdLbzqJv2QFZHOpsGTKKDJhHaqzjWAY7m5obPEeft7KtRda1JxsdJXDwRCII
	 fLfBKlMDDc0t+0nCWgOjBlNINVcZw0xhtG8S2a3Mppa686aSfIQnrhyEz7sy4oQ+pyrwJ
	 /UzFpo+Cd+sriWZ/soo2EzRmwuqMsME9HEusksIjCbogiTYaTGy2W6ukTh/i2m+DvaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028593;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vx2u1U1s8x75q/yPUkxZme0Ud70nzB8Pq+m7Shnt/5k=;
	b=oVYwkSZvwTsY8/GZPCfzXTmnJ3u64rpWSkNfg91fLu44cukVmWfPB/2sh0owa4I/5N0u
	 kWtcDHUqDJuqcln/ROHPs2kUmkwgSaAP4zYQMFIsluh9cVK7OA5DoIZmSMwqrkAo8DNpd
	 DbPCFHOu89TyyXSx0W9g7ctlSwLfc879++5yoTj4HCuyDd5BNyYNrWiuw6krxlwE1Mc8e
	 b3Aif7Kxv2Wfcz0kGaMCwJwMJvnvVuuSnFMFPzHNkLmvCnFrxG5tN5Kag92GM+hHfxJpb
	 8ks7XWBP9YbK6ZzJt++tFo41G1tPKF6G9EZRdUIv8QlgznaxQJRM0g/L41CY31jrY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=SZUtMjtF;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F10C606A32F
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F10C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=SZUtMjtF
X-Virus-Scanned: by amavisd-new using ClamAV (20)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028591;
	bh=vx2u1U1s8x75q/yPUkxZme0Ud70nzB8Pq+m7Shnt/5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SZUtMjtFTRYaf4Ym5W5gU3ofcjGpi/7jySYPCfhVGGmuh7Pr69VN2aaIyOuEIaaPR
	 GY120jZzs36v/c12qVNPC3x9ZRppr8lmRYx9DKInvJy8tprpVPj1JlGiQoRCmxaH01
	 h+QbkhOBya+z88fBXj1D8bwcT+n745oInvj2xbdF9KyF9UQ5uuwbtJHg92kcbQCDsE
	 L4hnzI/22fYX/9bj+g9ubWHMf+PsNjgkTCQ6NdASHDt1ZBeriHY4f+873oIuGW7AjM
	 9+sZx7S63cYav0hn2jnfdvklG2mC/l4fTmK+JfprLPhoM4tt4e0HRWV8yPbzI91Z9u
	 t8hhzhKF4we5Q==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id DA43F1BEE09;
	Wed, 18 Nov 2026 20:03:10 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 07/22] ASoC: rt711-sdca: Remove orphaned rt711_sdca_jack_detect() prototype
Date: Wed, 18 Nov 2026 20:02:04 +0100
Message-ID: <20261118190219.316811-8-amade@asmblr.net>
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

rt711_sdca_jack_detect() is not defined anywhere in the tree. Remove its
orphaned function prototype from rt711-sdca.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/rt711-sdca.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 15263dcb0314..710da3bef8bf 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -240,5 +240,4 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave);
 int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	       struct regmap *mbq_regmap, struct sdw_slave *slave);
 
-int rt711_sdca_jack_detect(struct rt711_sdca_priv *rt711, bool *hp, bool *mic);
 #endif /* __RT711_SDCA_H__ */
-- 
2.56.1

