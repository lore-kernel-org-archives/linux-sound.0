Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746157;
	b=qe76zTu8mB644vy+bq8AyUrKQcGu9vo4pV3iU36SRhY07heRHO2dKqe6oI8EWN9DZ+qK
	 Z46RvLszN9kK6mKMZBAVXmMzodCFFN+QFapJMZ1Gbm7GEdSVBj7qtvL5sreqb4i2G2tGx
	 myT5EF6fHmj+Fk1G+u9W5IoLI0viw91GrV6eFY/t2qQVS35LeBTRCnS7KYsl7aF0KBa1f
	 3wUQUqK4j2DZ67zclWYMgo0jHctX4TNGbMTQ021lr77KxNrHIYCGB87YxFyPZHuHnLspD
	 rSvg96Xtvpp0+16vVqglKD3g+S2cMAeXGgxRODZ5JSk80eJxvNFmJno+RBymy88BQdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JO0tB7Xd9eWgQ+Y6nIQYBILBi0lSDC/RKqQDkgfwr9U=;
	b=t6eKCyLDpubhG9olEWMf1Un9dnKFeCtMQl4QcF2hC/vumqgBU2A/kh+9Q3r/nfRx8BJt
	 iE+xs4JZ+EwwrYcTrL4t3pf+7rl1tnxs1tcNGFxBUOzC6R2sEukULP4wHG7cEMdBrU6Lz
	 n6Lq9F+yieRtK4rbK1QZsQWak2U9YMF7JfXGmaaMJ2fVyKcaSPnz98JnvdfJiWZRDlaYY
	 AlzAKyCggJal1RavLT0tI+aOn3TDRcX7jIfQ5zqtPwBpit0cAtfAUZ892cGQGRAu6nHsS
	 0i6ezPw+JC/p/3zuZI6y+GOKILt7Iq+CFiPsrr6UyFpQu5qmHIJKbB6MkNzJ40YKK9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFgcO7MV;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492B0606A332
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492B0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFgcO7MV
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso348776a91.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746156; x=1793350956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO0tB7Xd9eWgQ+Y6nIQYBILBi0lSDC/RKqQDkgfwr9U=;
        b=tFgcO7MVBOnZiWQopcfBHuDRSroc9h0A5wrBiJro0X7bFyWnJb+8EThzICDLOR/A3v
         qMurC9aR3UJYR0jm+gzLuJKDIgULLbl7qfHC/paoV9LJ+zpocymdFXHClhPp6PTMAZzj
         EBlUBgM88fe6867MfY+9fNtEf1YrDRq27Y7LDuGqxvWX0xfHKU1fDRZSkUsMZIlkrtsZ
         wRhivkJXph9q1zYAL7/Bux2C7ugHYcku4NSKshHtUjkEn4Kuzxn7HD1ZGx8nCjjqQd7B
         SDQ/xKcNKh3i6+KE0/BkUGmzhKBQa41aNI2QjdrD99a0DVqgaKTJSREjRO5cgqFzO5M+
         q3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746156; x=1793350956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JO0tB7Xd9eWgQ+Y6nIQYBILBi0lSDC/RKqQDkgfwr9U=;
        b=FskIUJZQMXSM2dNJBtq6tnkGVw2muDOb0GJAx4nk8PG2XEfqnhDlXIhTd9O5xYAchW
         j6peBOfYCX7SQ3ME+acUiQ7E3QNFVpaU8gB0ab1hUqjUTkdci6KZBPKAVU8ZWTCZg5JH
         7sMcY8TfNuDiFFX7sxk7bVKkrGBVZ+UqCyKJIqRPPd3nRIXWa/Z8546TN8DFtRlr1Mi+
         Vleti43G0V6woGm3gplcbjm+5wBNVkFSJZq97f9gyejED36Or2GuKsCQhG/1hHfMYI4B
         zVKeiIWivis/sI1GCTUJdUFDf2TuBOdaifiKjqGngv1op+2ZxsnjoY15slCzhilXWhIo
         LWCw==
X-Forwarded-Encrypted: i=1; AKwUvBzBW7I7+QeQ7qpUgCP1fP2e6pk+EvYGdKtnOq3N6JfPgAL2x2L43lEdZHc256Q7cjs8MYu2AHqY49DFbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmXI+MKlWX/9/QzdBRMtSGZvaUhHBMQLqYeSSm6j28hJYN3t0r
	HK+V163VnRovV0/+avV8fU7NdafXw6pSJHp+/7z7alaYKc82jzmw+U5H
X-Gm-Gg: AYBFou2btroCV9HxtU/t+/oS9VPit9rsZVEm1LXNjNyX5d/oBAcs0+Fy8qQ8UMG2KoC
	ofs9++YtHXD7wYjtwPtYl2gjeCxUTOnbgg2EOvsyujYeeTSDsYJy5Mx72U3m8sDRS2dkbwQYt6N
	UzH+gHEcQVt3aeYrfI5G6/lcuUt2yvsnk+eE3nl0WaLFAntypwAx4+x+7l0Qn5Dzwp8wUT4hZS2
	5RgpHw42hReXdvjnrnvP4HC9kb71v9fRL73K+/pzGJ+isWBdD8u3+KOgUGqN3eIOXo3MVIhrZ8r
	WhImJTc1TSqmDbrc39xqmjdNTfai30DsGUTGVgbPcZ5u1t2YzgBcWCgKgvLtuVawWcpVpO9xcbn
	4ma7cChZkpXjs0QVU08XWCXVlKPSgafy4pjYTNpa92hf2lELDRIQZCIgWhlg1RmoOyHEb2i5gWc
	Z1s2FB3XszkRDxg0tJy8HBP0fZWDHZeP/Myd/p0y3ZrHVECBrWqxJEz1hG+A6kU9z86Axb3/dt7
	qGc0gYgJT6cbsm8vO7If3kHO283dX0rPtdtsZnieYy+LBC82syppxIB5Odd6Dd7XwdLPTGAvLMq
	IhBuiKmSjf8roHmwV7P9aEeGmi4u2IULGj4cYZ+nCxQw7yPtTHSU/pbFBXBtTjqkL03gbJA=
X-Received: by 2002:a17:90a:d40b:b0:3ac:9785:4c32 with SMTP id 98e67ed59e1d1-3adce03f56emr1208626a91.30.1792746156497;
        Fri, 23 Oct 2026 02:02:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: codecs: tfa989x: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:56 +0700
Message-ID: <20261023090157.518032-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tfa989x.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 7204be155eb9..885b3ea19c2c 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -160,15 +160,24 @@ static int tfa989x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	int sr;
+	int sr, ret;
 
 	sr = tfa989x_find_sample_rate(params_rate(params));
 	if (sr < 0)
 		return sr;
 
-	return snd_soc_component_update_bits(component, TFA989X_I2SREG,
-					     TFA989X_I2SREG_I2SSR_MSK,
-					     sr << TFA989X_I2SREG_I2SSR);
+	ret = snd_soc_component_update_bits(component, TFA989X_I2SREG,
+					    TFA989X_I2SREG_I2SSR_MSK,
+					    sr << TFA989X_I2SREG_I2SSR);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_dai_ops tfa989x_dai_ops = {
-- 
2.43.0

