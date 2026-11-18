Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028660;
	b=vjIsND7zyr938IEOPHhRFiiOCux+y0dHsS3TiOU3pQYqiprE36zGvvjDFeUt1B+3JF6E
	 US2Q+lN6L0pqJf1PCEyWYjHnmfeVYmAi6I2N0T4S5tA9lPdlckfHZ9Y5Jw7nVmUAM2e0S
	 UHIUTzem24wljCOZW+gW44f2ulTETjx8XDfo59AbPaYT8exKvBnch/M6l6qOVPbtjjAwT
	 CUEv5zjRH0zfynMDMO7VMOSqzmUJHNFYBZQUx00Y4SWX58bVxgkGt5kgg6ei4QcCx7Cid
	 WV5a9NmncgXsG72OqMWNQQqdmhQjTAR6UqYGnrKYZOEbr09EFcHv0WHa+85UiPb98mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028660;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=y51LGszshtN2qLlVjKrAzr5n4FKCpW6bRowiuzviJZo=;
	b=Y5jyk1Lj4k81E2zasrwKP9KykC7frPGrlPu+hrSRUBe5zRxcbbiHrSuRCP5eY3ZfJJHh
	 Od4dddPo7xGhVPo+bKVNFBO0yKuhvOK2FtHA8/DiuHF9y5CrzbDOgePN4h0ng5gSsHWA1
	 iJv0A6HHzT0cDi39aHlP/bCpwCIbUhZHN2w+E56jacirGcYN4De0CKcXRJOPmpUkkM7YJ
	 kUBAF1/LDsnPo3jSyvIcBuZOzJuOUg9YhqhcIiyXQNPo/GlAGOlAsb295ZU3rrPrY8YKw
	 lW/JI36YNSyxPwozmsset4XCWlMYbeUnAbwsgQ9cNz9GNgedyU1FwfpcPIY20/yHUTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=y3G75I3k;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB5606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=y3G75I3k
X-Virus-Scanned: by amavisd-new using ClamAV (6)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028658;
	bh=y51LGszshtN2qLlVjKrAzr5n4FKCpW6bRowiuzviJZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y3G75I3kOcrTtFYf+QwTKQfk6cGnDQu2Iwws3jjY1JoL9yMLHkmmphKe9YzmgYEwW
	 Galk987vTz/8ssSh52JazgEGttdoTLLwgLAzR3luK8YVFn3jyHwM58DPLnB8PLzR1+
	 4qGH5i4nIcaJyvXd7ZmydRLtGPSh45KtcJrWwlVPWL8aUvXWSUjp3bQ9E7m8VCLalH
	 KK5YFEcUa54FzfIbbzkUyPQXHskinpa6TiqA9kYZ6ZSSVDlVab0jeGvBvSVHiqie6i
	 TCgmhHmeaOFhAY0eGWBUTv/vY5rfZm4wcn9TblVD38k61W1nbpQEBE/f786ej+3bJy
	 bU2ZXLna/AD4w==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id E80EE1BEA4F;
	Wed, 18 Nov 2026 20:04:17 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 19/22] ASoC: mediatek: mt8365: Remove orphaned mt8365_dai_tdm_register() prototype
Date: Wed, 18 Nov 2026 20:02:16 +0100
Message-ID: <20261118190219.316811-20-amade@asmblr.net>
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

mt8365_dai_tdm_register() was declared in mt8365-afe-common.h when the
header was added, but was never implemented. Remove the orphaned
prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/mediatek/mt8365/mt8365-afe-common.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-common.h b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
index 731406e15ac7..f908e57fe7a1 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-common.h
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
@@ -443,6 +443,4 @@ int mt8365_dai_dmic_register(struct mtk_base_afe *afe);
 
 int mt8365_dai_pcm_register(struct mtk_base_afe *afe);
 
-int mt8365_dai_tdm_register(struct mtk_base_afe *afe);
-
 #endif
-- 
2.56.1

