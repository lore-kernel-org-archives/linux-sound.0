Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028564;
	b=t2XlHs2wbmuM/Oxsc4ik9lUygH9KI/dlYiajsLkzmHAY+pgvk7p1yzKViX0li9gfGh9C
	 g6t8SIMICRujiPmxAVQvSCIm9cwjcyakAWbGgyE/MqQOH/G8QgkhZLLxtFUSX3k0pGrio
	 zxwD3FipxhMO7lsXMVIGcg8C1oWHq+oydaITAZnL5PlfFSDOT2TJpo3HmKw1nuIRwKx84
	 uvhxugt7xjvg8tyCLi3vhjZCNhwRY0ccbXdNxvTQ0pP80dR+aK1VrknEE2NgVnHIXzMN9
	 59+eiyLXGJs/8YF1i1iSI7aKbL+t8CcmXohx8bg24eXTpM25/N6ukFdMzj6ZxBCamGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028564;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dVhnPRPjCbiMQ1+WW2nng65H6QYZzo4NUzu8QNFSAfY=;
	b=x5LTuHX8XO7oLNrpfA1+rUTk5W4tGHE/GxCSjrgzVWPWcXuUa3rbilUzCftRqpYZYO+x
	 g1WmmjZF7+nYp4x3uONpQeyWfzs38GBqegLfuVgLwob5ied+2vOR7WhC8zCgQVtdwXlLW
	 t0cBl5TOOfP2S5vRjCn5TWACIihOV7DOZcVrtzAYCXmm7DfR0Kw+MQIMInO1frF53C8ft
	 TNFK1+uZzXzP0ly9DtLWrzIv2qRpM6BWIwEt0FS4c1g8PadRtP6qH4zEkG1OAa1+I4vGs
	 OW8dLt6O9YlZR464FDoB8FH8A3GIFyKoYUQ8Z3Zlm0ax+2YsS9ffsmmzm9jDmI9UYPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b="yx/VGKW5";
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8D606A320
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF8D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=yx/VGKW5
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028556;
	bh=dVhnPRPjCbiMQ1+WW2nng65H6QYZzo4NUzu8QNFSAfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yx/VGKW5c3bgbhuY1BscxrwBeHBJ/gjOP+tIhQqx9V1513giJJ+0/ZHgBqzdWb0fc
	 SPBR8aObMrsumfN187TRGB9j0ceU1oZzHUL3vJwFoABI67jKePVweHKjMe0/z3nx59
	 j6eHqD9oHXGhBYc7c9O1F+/Vr/m++Pn7YRX8IuzeJ9FqbPea69aMBQ0rW2ZmrRhESc
	 wbFHLqWQMEFdS9nmx5hrMxXbDoSgyzEaNcnbJotNcSyVb8E7UGuKlp3/67khEn8M8R
	 yTtir3XPYnx8n/w6Zu9rfZpYIhXl3k/TR0emAfaZte5xafddzM8/AH6k87Wcz243e6
	 Nqfp2HjE7JtJQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 4C2F01BE4DD;
	Wed, 18 Nov 2026 20:02:36 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 01/22] ASoC: soc-dai: Remove orphaned DAI suspend/resume prototypes
Date: Wed, 18 Nov 2026 20:01:58 +0100
Message-ID: <20261118190219.316811-2-amade@asmblr.net>
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

snd_soc_dai_suspend() and snd_soc_dai_resume() were removed in commit
450312b640f9 ("ASoC: soc-core: remove DAI suspend/resume"), leaving
their prototypes behind in include/sound/soc-dai.h. Remove them.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 include/sound/soc-dai.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c044909ef10d..aeac0de0c4f0 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -227,8 +227,6 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream);
 void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream, int rollback);
-void snd_soc_dai_suspend(struct snd_soc_dai *dai);
-void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai, struct snd_soc_pcm_runtime *rtd);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
 
-- 
2.56.1

