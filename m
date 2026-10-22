Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658469;
	b=R+OlJiZKXLqVvK1yYxYeDNoqdfCMpqgsPEbHb6Ezihrjq7oab4ZUpKibbw/Ui6WUrfNH
	 /oDkC5ytFwKVcyV0cXx/xWpQDLRhwsCYzf6EeEz32776s4ymF3eCCoICqqWDyh5c7SJ8g
	 YB8mnXkXD5/XNaxMcOQApH5uO+TJww/7LH8a60PZmiOIxF8GXpicRl/J8RNUTB3iauFY+
	 1TeLP1dIBxgfOUn3cf2S84wcEAmRCThEU20hdWy05AHb2eIZn15ZD7nSdAsQcua7Kg/By
	 TTO4Qv9mqACbxIWuQxfyTfBYYlHs4CgeI43i/+LayGk7Pkcu/6tQaaqttTgEJ7vXnag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnurLZm3rvLf63546fN/45BouE51Oz02YVjfq0TngVw=;
	b=Q5uNUxlCLGqJNNxJ9fMrO0GFdj/WDrhq79HCg+V+Mn3rsU/tKOdctHyY3hd6tNOY8k0y
	 C9mM9eJwwxiqpMxAi1CFsfBLPpyCLEc/dpKu+mohVd34v0i0QjnLp4Dm5Jc8U1/Xl+7iS
	 hzWNBRSgr6VrQOIKLIH+SGMk/laQkx9Duwczblq+rksKesSwvApp4pZw74g4pUjDnw4m8
	 0sL4mjPAkaMAYditjPbrR6O+ROGjK5GzyoaWTzjk5XZZDAUVvlR9WL48X+6XTOkmqv27M
	 Ma9bxk/5JBAxUigxbvJTtvELaeqOQFmCYx72LjVeXnpBTeD4akqwZZ5DSgNpvLWlaRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dbl9vOLN;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE3606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AE3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dbl9vOLN
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so917263a91.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 01:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658468; x=1793263268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnurLZm3rvLf63546fN/45BouE51Oz02YVjfq0TngVw=;
        b=dbl9vOLNLKvok7ElsiI2sihRxm5IEWWtwp/RvueoagpftwYPru5c03poSjjNzvvrTN
         lPKu+9+b9FSJ0MV5e+YPNCwo5UYZUBbqQRsExDfNEYWZLQiV5S2G3ZlXvDIRosY5qxqG
         BgMIx99jlOd0Tl23dAdKOki6qgIbzwcPdjdCQDXyK5Z9klNP60phSiIiCoGtQp+V3IbG
         1S6MWA9rxHqd3vTT5Kp39A3fNGtLnPNyJTvhp6mEnQyWQhM0M29LDZ5ShBTgxQfioXsi
         0/J1G2zmns/MUqAErSS0b+34NwqGdnhWvKcQdSqJ1xplndIVx15NGkH+jm1FJVlLH33v
         qFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658468; x=1793263268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnurLZm3rvLf63546fN/45BouE51Oz02YVjfq0TngVw=;
        b=Xx5twdjAqu8LU162BVJ5PjJ0Tg6xc9Kd1eWZ6OySGlymzwLWqTyH8D1MsyYfY9TTq3
         7YhFn1KF5lr60AfIgWbJdDV54pYsXfzRIsFaawgcn0NnVqSDO1ZxCfinuc4BeVsPIIWi
         Fv17biU6gkigyoQ3FicZFPEDsIy9+Wc7Mp4/ci+KVPLutWnUarmq1Z7P+9NnB5ME3VCe
         VA+hpJoVYOTWLml/MMfAjTuF3IjveIdJSAPcPop2byZ6m81MtXVNALKnIXtvQSuTH7Yr
         tB49J0uhKPpBNQ2/1Er7avove3oNMowllu8eRYFNL1oBsHMCr48fIwelE6/wtCMUBG3K
         6iAg==
X-Forwarded-Encrypted: i=1; AKwUvBwqBph3TxEEoGVjJPuK7nlJX3kXfEfLX4TCKHO/ymTFt/pBYzGu/A1HL8stKQD5pDLjVLrRbiFJOLZLcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2y4J6PIF4kAdRtoBygTY84s7MlWm40A4GOxMFCrdlNbMMcHrD
	b8bHU4BEVyEwmq0USwkPLBkTOLVyr2BJkxc8u3eQRY9pvxQdqhIcp0uS
X-Gm-Gg: AYBFou2ImLSOOxzmHRKTNHZ+u876YhMDUkKJxKqGqXgfZXIZdc85TfBSOFJ9Z5lUeZB
	dOi96qo1U1CTjVd8CldjmDNsg0a04XTe4JgLqaKqwHng8GG3Bds2lHcm3LybCf0SyRsA6J04Xo6
	Gb/SMzDL8p+83pFBKln4mfuMhfuUL9cMDvb5ceycIatVz0wVNBihef6XfSddL02n71AgM1jqwUG
	m1kkrOfKP9muclio/ENPTywawDD73tp4YMqEncU6KNxDc3bZ6hoaYPzHtwPKx7GPFUqI9hpA1In
	vnzx9lMKgljXla6YmYMGW3+3EebX4Ki5w9RR4UjUD2N5pRjYmdrrUu/9lkit0xcrxn0CCotsnA1
	GNu4famPq5x3HNLz1I60ddyKxyZIPVnJK7uhouMN81g89huj7oP7KSLQwwxczesgwO84qFhFqpN
	IKWguy11hTcbux54kCnyy4ymkbRySRVO6lkkaXwKtAsl+hW3zAvFziSoYdl7jIzgg2lD/Mln9BV
	wV0IQ4TZny+UoP6fXS8J01XjDfVirwIWyU+zgSRnaVvc14dBHjsxMB1/hNUAgS8TiG4f1kCjUVj
	wqDQ7kZHTGj5kWS0PXQ8/2xvbXC0HXjClaxJ8MQyt87xh4M4eUFJotsKVMcpnebjl5MBmPQ=
X-Received: by 2002:a17:90b:3a43:b0:3ac:9c37:9429 with SMTP id 98e67ed59e1d1-3ad86f1b5f7mr4226272a91.52.1792658467986;
        Thu, 22 Oct 2026 01:41:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3340992a91.10.2026.10.22.01.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:41:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 1/2] ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
Date: Thu, 22 Oct 2026 15:40:39 +0700
Message-ID: <20261022084040.31181-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022084040.31181-1-phucduc.bui@gmail.com>
References: <20261022084040.31181-1-phucduc.bui@gmail.com>
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

On revision 1 controllers, loongson_i2s_hw_params() reads LS_I2S_CFG
and ORs the new LR_LEN, BCLK_RATIO and RES_DEPTH values into it
without clearing the old ones.

The first stream after boot is configured correctly, but any later
stream with a different rate or sample width ends up with a mix of
old and new bits, so it may run with the wrong rate or sample width.

Use regmap_update_bits() to replace LR_LEN, BCLK_RATIO and the
RES_DEPTH field for the current direction while preserving the
other direction's RES_DEPTH field.

Fixes: d84881e06836 ("ASoC: Add support for Loongson I2S controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only, I don't have the hardware. 
A Tested-by from someone with a 2K0300, 2K2000 board would be appreciated.

The field layout follows the Loongson-2K0300 user manual (IISConfig0) [1].
 
Not sure whether concurrent playback and capture is supported on this controller. 
If it is, note that LR_LEN and BCLK_RATIO are shared, so the stream started later 
would overwrite them when the sample width or channel count differs. 
I can follow up with symmetric_channels and symmetric_sample_bits if that is 
the right fix.

[1] https://github.com/loongson-community/docs/blob/master/2K0300/2025060909243029508.%E9%BE%99%E8%8A%AF2K0300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C_V1.01.pdf

 sound/soc/loongson/loongson_i2s.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index da0d029c028a..109cb61c6ddf 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -69,6 +69,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 fs = params_rate(params);
 	u32 bclk_ratio, mclk_ratio;
 	u32 mclk_ratio_frac;
+	u32 mask;
 	u32 val = 0;
 
 	switch (i2s->rev_id) {
@@ -92,14 +93,19 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		mclk_ratio_frac = DIV_ROUND_CLOSEST_ULL(((u64)clk_rate << 16),
 						    sysclk) - (mclk_ratio << 16);
 
-		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
-		val |= (bits << 24);
-		val |= (bclk_ratio << 8);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		/* Shared fields: LR_LEN [31:24], BCLK_RATIO [15:8] */
+		mask = GENMASK(31, 24) | GENMASK(15, 8);
+		val = (bits << 24) | (bclk_ratio << 8);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* TX_RES_DEPTH */
+			mask |= GENMASK(23, 16);
 			val |= (bits << 16);
-		else
+		} else {
+			/* RX_RES_DEPTH */
+			mask |= GENMASK(7, 0);
 			val |= bits;
-		regmap_write(i2s->regmap, LS_I2S_CFG, val);
+		}
+		regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
 
 		val = (mclk_ratio_frac << 16) | mclk_ratio;
 		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
-- 
2.43.0

