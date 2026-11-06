Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001430;
	b=ELRn8lhS4960RB7Vkp/iKDzq0hmHnz6W1jWWyG4qnLGquSLPaPP9w2PiTdMVjLqef7FE
	 6j9qBfmvKTUle8kJ0iCMqae3OL27vdjZDKpsgeCB5A9yfHjCbt5XywEy3w9/sDqwrEhZh
	 XcATS2Rwpo4/0xLSJ62iar8Q4IBIpqWjFSQKK+z4k5RFW0S5ksmuJHlY0Xz4scZGI9YUo
	 quFK+pXu83VYEM+AeG35oU+nhii/36teEw48tGcWL5qY1/BqkWJGQA424pOguanJZvjau
	 R34/JpXH/i/yyNZswJJPtPad3+rDLSnAC57cswNC+Y/Uw6iLdPxMtcEpl2L4Hl/kLFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+EMihw+29gDcNVmUeE5mPnmTJgj7tYi2T69Ao2ysKY=;
	b=njD41KfyZLbz4Z0VldGyHlGS5cp6o28tseggGEj+csRDEE302iWtB7FvQ85146SK0e42
	 1M/g2hWA6D21anywhAweCOCGiWhloSwQZcK52/d2o+sJYU/k14RgJyJfIOGeV/IXOsZDz
	 tE2cJ0mAmHaRmfyFaRkHtLlvIl82mmUbDe+L7ifY8KzjWuYIOHYh0p7czWQZw3AMLrGB9
	 Jb+HLY/46Hb579w4bqNi8BikVx3qokRpqoHPvoZDyVfUgMOGZr1HQUmluzre6ZwlGDi5d
	 apjzjXjEiWx2GMSb6hNmsNm/biGZ+lef70iT99DiBD6uW9rMbjJmRdCYcWHHYD32+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fs2SGDKn;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89328606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 21:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89328606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fs2SGDKn
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492690dd5daso853980f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 13:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1794001428; x=1794606228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+EMihw+29gDcNVmUeE5mPnmTJgj7tYi2T69Ao2ysKY=;
        b=fs2SGDKngW/9oBNjUlpPGGGwVf+3VTsvgeiTTS37IgJLJkrRhB4ApotOCwIDiVrqOM
         HTJKmKH/eNij4+VEu8Z6XybVAvPWgqBRIICUszhS2gaRErcYBMSGcJ6zONx/eL5wMzi0
         sHRrLvZuaS/U75SrZaDwV3OFdr4oSCp8IlbO0pqVN9Hh8aN3N51twvFYblFbwGUhz5FH
         nqvkBZLpHbOdrALUVzhy6EjVIRpIJLhAPrBA6M3sMAzUzLtypKXb4wGAds4EETezitpB
         MP1mU7r3kd1oGnd/FeB21Ur2+fNkZs3OFgo6lDgS+VqvoVFWowjGfDHa4C3twJ3rB3oi
         Ym1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794001428; x=1794606228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+EMihw+29gDcNVmUeE5mPnmTJgj7tYi2T69Ao2ysKY=;
        b=19CPq8Bv9gC5J7YhRkDLX+P755DMyxtokXqQjJQEZWueGGUbgyJZX9RlmP5pHYxo0q
         poFYRbMbkvTnJPZ+4lMMtYXP3s4W3p9FeN2CID6D+jBll1pTriThrFd6DVcZnmQVZC4M
         0xnWv4NBkImGKdo9XJNA0079N/2GfYyp6DdxLnHE/nTQrqtMawxTYG5eB/pt2BaAS510
         xR60/geX64Wx7xQmueutuQTZkBXJUTGTeEE9gDM3TugoRfk5WT7Q4dQRaLnwz6F1DQU7
         hF3Ij8lnPrqXcxbejJ7XMA+WcyftyWYK1wjixvHa8Ts/3VxZzS+5k8IEKV4kaFYYeEbg
         t0ag==
X-Forwarded-Encrypted: i=1; AL+hErGzLsVEEhIqWlLOxnbOO5LTLhWH4YwNJkxg1iU4C4MMr1HYt7noGrs25cNykHApFRldDV+vzNJag5m9BA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IOi/XPSHdJtlnB1vd/N1XPhzlmJcAd0q+40FKksjpWuJkcY7v
	PaBJBDcDsyFJL4uZ9HcfxE+GNnpNtpK5GR/yqAVOQCrxbEaUG/FqLUhOurGu60BONmDcgNxSvhO
	NxLfUStA=
X-Gm-Gg: AYBFou0eHwLv3JV52nDHiRpuFF6oWToS/Zu0rwAIoqNgmSDkhYxCZoF6hx1qquLQNiZ
	ue4wrpWL/5ZMo3EYt4u/BKsKiS1xXOTkE+jq9ZzesnV9ArseBznNxFb8+YE1GZE60OJ6L0IkFpV
	5J5yCbvAc6+syktxM2leSho4HSQpuLWbwE4Ri+ptefk4NiFgu41seEXhcZB02YwWGTkCd7b/Nne
	hN9IAWSE/lIpy25GjWbZLoIeUReOZkrV6iVrm+EBi9OHaxyrYXetz8lsaxPN3kA4+q5Z6U8C9l/
	/b3Hq5xPAR4YwTg0v7jrp81Eo5x6v32TTStZvqK/07jfZsSgeCPtlxiAQ6kK9yAuaxdQHXNu1ux
	paTnFpbhwXoXkOgN9m6YP0I+qVci3hujFSUXPsEW72HKVl5Qo1MQlShH2+NHNFcvwHTXS5YnAkd
	a22CRENyoY3nNDnReoRcDl6BFxkCuAjKgRvWoKJWqhFgyGDBtXa+s47JIrTWkq7e1m27DAaA6oG
	ybs2UOmynsATZZ/SuOYi32/GrzYfPpyys5GzSNZyCPpF9CqdYvGBUfYeOHQVWxdthoZjYc6vNNV
	kMSioVJ/TzQ6HXvGOHbZJSfTeZRVDI7/qDyWAarZGf1iv4DzPHWPNWvIHBjLpQ==
X-Received: by 2002:a05:6000:1862:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-492760da7admr7602054f8f.13.1794001427547;
        Fri, 06 Nov 2026 13:43:47 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:30ce:e69c:9ae:c94a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3c6c056sm6222125f8f.4.2026.11.06.13.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 13:43:47 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v3] ASoC: cs43130: Power the playback path down when the stream closes
Date: Fri,  6 Nov 2026 22:42:30 +0100
Message-ID: <20261106214230.17417-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With use_pmdown_time set, DAPM keeps the playback path powered and
unmuted for pmdown_time after a stream closes, and the DAC plays
whatever its serial port carries meanwhile: on a HiBy R1 (CS43131 on an
Ingenic X1600 I2S controller), white noise once a stream stops. Drop it
from both component drivers, so that the path powers down as the stream
closes.

Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v3, now a single patch since 1/2 was applied:
- Drop use_pmdown_time instead of adding a mute_stream() op (Charles).
  Tested on the R1: the codec's bias level is back to standby within
  0.5 s of the stream closing, a stream restarts in 0.08 s, and the
  noise after a stop is gone. A faint pop as the path powers down
  remains, fainter and rarer than with v2's mute.

v2: https://lore.kernel.org/r/20261023202941.87999-1-olivier@mgcrea.io

 sound/soc/codecs/cs43130.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 7fb23522f081..4db57758f897 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2428,7 +2428,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs43130_digital =
 	.set_sysclk		= cs43130_component_set_sysclk,
 	.set_pll		= cs43130_set_pll,
 	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
 	.endianness		= 1,
 	/* Don't take into account the ending analog widgets and routes */
 	.dapm_widgets		= hp_widgets,
@@ -2444,7 +2443,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs43130_analog =
 	.set_sysclk		= cs43130_component_set_sysclk,
 	.set_pll		= cs43130_set_pll,
 	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
 	.endianness		= 1,
 	.dapm_widgets		= hp_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(hp_widgets),

base-commit: b72f6bb43dec5e89c26adf049056e24e85e5e65e
-- 
2.39.5

