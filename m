Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614C53DA7C5
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388109; cv=none; b=QxaKlBiiv/7KMAGg6iwCkT1JIWH6qAvGE+cvGFQVuMic0VpcO1lpDxiUYWUIZq8rE28zAFdZFe55z4iVX31j9ltiDcQBiK5DprWLMF2/3pGA7bCwTigQHOCZE7IAJwyEUKf2GHaa3qciHo6SB/yH9G11a0Il/NpKWsteezXtHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388109; c=relaxed/simple;
	bh=reh+VQsJ/yIoZFMwNqlFcbMLXcfZRxZ444wPqb1Igoo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Eel2pq+wqDIDKDvXnTM59NSI4oioW34lTvUSyg9bozZNRXRzaDkomYdO2dzqcpy+UjDYlF7uz/JRDwQma7u62skFvZS4xh9PGmcVGYvI+Q1h0+F87ybD8dN1Gf1WOrk/WqoNxHx4/N8IQDQNnjQ91KPN/A+oAglFb3i9iz+t4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMz1uGbk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMz1uGbk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4626fdc829aso1698905f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 04:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782388106; x=1782992906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2nr4Zfai6Pu/V4xdOMDDDUBnQsxOhCcFatWRe77nj4=;
        b=BMz1uGbkxBL42j7IxJhisSuRqKbk3lH4/hO1I8abg53UKVAfqM8SRtl+XekUz8qvx1
         mRonsUOSqjapMDF24xNDWBfVWbLexdbPJYcXL2tlOEBAcX1Zp71gcOK5Y/wNuSQqPhPf
         1SikGVY5rergqWxiiOZ3Jv8ltBmlEadgTOd4GUTHp960rSVj7KcO25UzWd2ExlzNhMqP
         P7LvhIbx67xlHP8WVRdJzcMMH46SY08F/A2fgcfG8iL+RFUmbtsZuIMX3I+siGAq1tQt
         LLWJYF693xk3sXV3rNz1uCj33MVol26e2X0vU94Zo0r+MoCGis0zAOktUHMuHnEY2fFN
         i2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388106; x=1782992906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2nr4Zfai6Pu/V4xdOMDDDUBnQsxOhCcFatWRe77nj4=;
        b=iOxVw7Fp/wIkcwCLxvaJ3Kn2NcUfL+uGZNSaUsYu2wmTY4hZf761h8Xp47BDBGZMZQ
         NbcOOhDuqdM5MHSADhjxHDD5VCy0b8X9bk/e6rkoUMc+D7Rxg23JuFBEMuaw2pcMIlUa
         UK1W/KqJrGQD0Ka3ZEWTe0CmHR2Mmv1+NY3d3LwV0Ofzhp/pzicZAfmgT0/koro0fQbL
         pdZ8VtC2wJZdskh8Fzig78oqoADMPkf0aNLApDWAWpD7yGJsOJwj4rD6UTefRk749AN4
         bTn8CQgnC1exoRs1advDU5+vQn8L7qCKut3DEcdkwNgutfAv4kGGSoGCb/8wwJTafEGM
         FQpA==
X-Forwarded-Encrypted: i=1; AFNElJ8ulyz/lS06J1w4WLuOtoSJqN+z6iOBoQflYCCKTRGpa/p2O7L0lD1nn7DBkU7BdeMgi6B2yCrma67f9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rFcPw3PQUGl2tiZ5wkgIRO8D4B7Gn7BItqOTkGL46GgN1xpE
	3z/++MMgbgVHoMZYY5znH5N0vX69X4e0KZdJu8xB6HDeiCQlycLgekuf
X-Gm-Gg: AfdE7cmt/p5N675Guh0Tam+q51OIuuzHkpCtUU0oV5ylUsKUSjUUGzd26lgcvXx4SQV
	dPPjU7AWjJhPLQoLAnyqZd1U5QvfEpE9TudLepxE5tx0w+xpc+MKiwglY/LS03KfFqYWwAADvXo
	0TGZk6faKF3h7wNjW8o/nFn1PUJ8rxIfquJjcQVjba6IWkXfW0JdPJ3DNjWPBIzu4MzijLCn2Zg
	Z2hrk/Dv97Dg+gb9GZtPzkcGs/n24AIEEXPKKhZGTDtsgQanj6OKd0FdUvqZLcqjSs/ocpBr01T
	nFoXaf19TEmcuU2GXnuF5smtqpAIcH4kA9HzcnD6ly7nDEACXMiy4TtStj1dvN+x8x7IDr1vwEw
	cLCnG2oiJI7V92nzzIMa0pXTlSf2X5QBnn7u6EvxICh9TLTF4et/bG06qZXdzTllm4zY+NoRdA7
	PDxiinF7GwBht4eHiWcl/3WflLELs=
X-Received: by 2002:a05:600c:a011:b0:492:6489:72b2 with SMTP id 5b1f17b1804b1-492668986a5mr29342455e9.20.1782388105344;
        Thu, 25 Jun 2026 04:48:25 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660adae1sm52237985e9.4.2026.06.25.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:48:24 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] WIP: ASoC: codecs: pcm512x: only print info once on no sclk
Date: Thu, 25 Jun 2026 11:48:20 +0000
Message-ID: <20260625114820.4055340-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If sclk is not provided the driver falls back to using bclk and prints
an info message in the system log. Under normal operations the message
is repeated many times:

[   17.929576] pcm512x 0-004c: No SCLK, using BCLK: -2
[   17.949172] pcm512x 0-004c: No SCLK, using BCLK: -2
[   17.953029] pcm512x 0-004c: No SCLK, using BCLK: -2
[   17.965059] pcm512x 0-004c: No SCLK, using BCLK: -2
[   82.592980] pcm512x 0-004c: No SCLK, using BCLK: -2
[   82.866293] pcm512x 0-004c: No SCLK, using BCLK: -2

Switch from dev_info to dev_info_once to reduce log noise.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
This was observed on an Odroid Hifi-Sheild2 board used with Kodi
which appears to reset the audio connection frequently resulting
in 100+ repeats of the message over time.

 sound/soc/codecs/pcm512x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..fe3b5011fa16 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -633,7 +633,7 @@ static int pcm512x_dai_startup_slave(struct snd_pcm_substream *substream,
 	struct regmap *regmap = pcm512x->regmap;
 
 	if (IS_ERR(pcm512x->sclk)) {
-		dev_info(dev, "No SCLK, using BCLK: %ld\n",
+		dev_info_once(dev, "No SCLK, using BCLK: %ld\n",
 			 PTR_ERR(pcm512x->sclk));
 
 		/* Disable reporting of missing SCLK as an error */
-- 
2.43.0

