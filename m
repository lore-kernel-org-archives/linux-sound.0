Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028587;
	b=oM3NVlLvzPBKhrknCjC7nMqA/wQhTzuBDg1x/9DvbnzwJSPFFf0MDV6jR3URVMvSe3kE
	 OcB5BpW+hLOVDBdvnS9ldMnIREgZdeKAZBmBY25Yz2ljJlMmtMVtg2BGzzuoY0ZODcCoL
	 k/Uqc7tSd40yMFeQMtU3H/IIwusGBHB+wK8McULxJ681/BFhUoK0QQluFZZjBbgbmhB/1
	 jUwMzvLVgYjk0f9EGX5cEiMT14kCNwulk5izjeLKJB6WAnQeKbySHTFelKTVr/xbRtJZL
	 pHMh/hZGVpLSV/IvHoNAtwCkiVfGszp/tkI6yTRj+yFHwzMAXpLU732ASawpFYmKOBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028587;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sqsfiPcUamqwjzbjQ/q1Moe3+FN6sHQZ9HrY4mcLjuU=;
	b=ycBvgyBYa40K1APNzWNMVId40FbbFFF+MTQnYMmyQ/amn1DY2KRQemCvfgb/8biDyp9K
	 t1bGQSx+NXtLzs7VuPw8iCY3qsn7WrESZtrIjc+wVX7DqJYwxC0pM9LiXjZSme03S42vu
	 RwzftjdZZ0hPcfYYFu4dk1yVHiMhLwzUMLkzQpXkE5YUYmSUHpBDOLPpDvDZ09sqbZwyD
	 NYQlhiL7IIiz5uHxWlynZo6vYuw2iyfIRlga28cRZZ8k2nBFKalu/FTccfyoPbFqlo5zj
	 8j/P8AOUNMgZdSQn4PWNH67bHyw0m/NiHbU8WV3JR8XjGz5MBqULVPegU5n8vEkusYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=hJmM9gK1;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2355606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2355606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=hJmM9gK1
X-Virus-Scanned: by amavisd-new using ClamAV (19)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028585;
	bh=sqsfiPcUamqwjzbjQ/q1Moe3+FN6sHQZ9HrY4mcLjuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hJmM9gK1fSuBes0Ysgx8/dGGs7zRTIpP4ihzflzJ33C0CkWGF/GHET0HmHoOmKkFL
	 oxyyNmHFAo9i9mVwv/CkjN21pKNAQm6oXLV3LzCWU1v6rNjntbE7SA5cjdpqvTmRKs
	 38X9jQskqq8s2SVS89loikUL+P3b9AuH1e3cm8PVXhqI3nInNRXPg1I7XV+SPXjnF0
	 zTfUBkSykO7CTPTtJX/KUjW4P98kzLTXdjDaAJ1wNmqBbM/UFK5dIPkEX3figXNUMS
	 FW6snPWhSamGn3lQN6GQPbF5KWUSHQsBqsJVhTVGaO/5xdiLjQ8jY+S0wStEpRjjmn
	 1JKEJ7jQMm/KQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 467321BE7DA;
	Wed, 18 Nov 2026 20:03:05 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 06/22] ASoC: codecs: rt711: Remove orphaned declarations from rt711.h
Date: Wed, 18 Nov 2026 20:02:03 +0100
Message-ID: <20261118190219.316811-7-amade@asmblr.net>
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

rt711_runtime_pm and rt711_jack_detect() are not defined anywhere in the
tree. Remove their orphaned declarations from rt711.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/rt711.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
index 491e357191f9..a82920f7db66 100644
--- a/sound/soc/codecs/rt711.h
+++ b/sound/soc/codecs/rt711.h
@@ -8,8 +8,6 @@
 #ifndef __RT711_H__
 #define __RT711_H__
 
-extern const struct dev_pm_ops rt711_runtime_pm;
-
 struct  rt711_priv {
 	struct regmap *regmap;
 	struct regmap *sdw_regmap;
@@ -246,6 +244,5 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave);
 int rt711_init(struct device *dev, struct regmap *sdw_regmap,
 	       struct regmap *regmap, struct sdw_slave *slave);
 
-int rt711_jack_detect(struct rt711_priv *rt711, bool *hp, bool *mic);
 int rt711_clock_config(struct device *dev);
 #endif /* __RT711_H__ */
-- 
2.56.1

