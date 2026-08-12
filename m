Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155B40097A
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524738; cv=none; b=GIkKnTg0t/XcQu+buDLWkAh9vkoeTOBugZu0+c9fJQEhANLJ9ZbzUENMIiyhws1Glh39D0KZwZdDzX9x6K+3AsQduOsSRi5H+bTJ5iXvc1R5qzgyOVZYWrjIcjsMRFBIBbkPY+SVzpXaBqemzkMJZvlD/3M/hfxei6dmZqhXg6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524738; c=relaxed/simple;
	bh=4SwQcIWJWlpsAy2UeX0JxQJgG84GGQZTWyXoO0gVZiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMoWaUrHc4lrPG0N2UMnKF/fb01rmi1azRRiajS4l44JYiHioe5FiQxvEJToe2FV1Y7NjK6LimMGqUvn4K42B4uU6jR1D3GnWMGiBPC7sJb2bK2V+QBReYH3vy9wg+pCOFQgs644M2cQldSmzWl1QRoMhwJGYVx1I88uPJuKNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayJLZIQp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayJLZIQp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so784485a91.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524735; x=1787129535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYQUVgZF/U0wEavvIRgRQfroGiCAdrHwYvc4Lgynj3E=;
        b=ayJLZIQpf4GhvdVX3lDGGTxrYqKDqj09/BjAgmd4qI5Rm7kwyllwv4xfuY5BXRt+Fj
         r7oR8Xv2XgnN10gv8zUZV7UG+bFkYCKzVJ6wt6sH7PBD0KJsDzP19XoVnUXEWeSGkMtJ
         /5iPUPilz6PTCOqKD9l7wrZOKVwFnhRtfKRXYpWnDRW6WAdw1S7MHSZ4Nagn72n8dwxx
         KXeqhmSSTsENZDqsH6P0c4H/HVtQHzx415L7v9M2eT/Xmbay+RC6/HIQ669LliNIv94y
         S6E2KxFwMlxnHX79Qr0vfImtYt0D249IQo1PU7gk1fA4gAM8X1Ssd2itTuTY6LnnzgsA
         CejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524735; x=1787129535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYQUVgZF/U0wEavvIRgRQfroGiCAdrHwYvc4Lgynj3E=;
        b=qMzh4AbbN3dO/jQk6O13wBKV0yEYM1nWYjP8CIHfqGjpdJxg0h2EAr1K+9ZQ6b+yMT
         fiQ2XjWA74uO3P25jQ0fREYH05xDE+qFQZE8L+cxMboJez0RaOFEuvrEW4fvh7sftIL0
         9Qr0el93ebqLOZ5+lkmZCen86KC1IyLNFW2KNQNZbwP++cPKxwsdMBP3k/RoL19ulFMG
         ByuijqwQjdw+Fh154ecn3LWkyojHbn0UoP8B4XSdAK3PVHExUs5FN07JunMY8eyxvMWp
         lceqOdjar8CVV8/TrZSKblNRvGPlO4NI5PCodm074TGc7g1diXund96zFO8PgdCAYIt5
         D+1w==
X-Gm-Message-State: AOJu0Yzm0w0eYapQBIy4ZPIlDKh0UUV0mG/isXTeT0meear2mYizIiNC
	ELMlKxWavvspcmTs05hYo2bo3AGblLFHOD9g73C9mPYwzlro0lSUt76K
X-Gm-Gg: AR+sD10cmsx5DSGlkGSTXZJUpU7V08MMPUiP2lBPanqLBRSRrQgBs1c68ZsUeyrP/Ad
	j/WCEclKa6o3I6xQOfo3uzTxLICZnR4DypeIX1p12i59aIx5gnaqq708s+oHKMYU/J7FnKfDG+H
	HjMaauXKSJbD6DxaZiVbEG7Ww4J95HnxIGL1uRSb1XD23qMSp2WUN1PAKqN8wTFeGqesJIgrZLk
	NOMgWDDcBf5SHa6q1ZZjOHopPaU+/mur4MayYkjj6cwmqxNb/8cM3o6NREEUeeUMK/FC3z/jV4A
	l0m6uPMUUAPoosO3vFEyGyyONZWDRYM0XlgbKJRSuTMEDZB2+xwrVfhgv4/Ui4iXyu3dYwNGpAU
	qEgTP330iEbc5GNI6QVLP6B6ZvjbAdDLzPmo+zYXVnfrU9WLc//9D/EXalL7+2Z7peinGLb3Gv3
	yK1Wv0JRwA47Xv7WvLxrnc04/MNQIjNX+SZsn52Dw87x686vq4cY6N+I7NqFzjeNttg67VS9YOW
	a7opXCuHAf3oLR4fnhQIZ4VjjT+pDR/FFD3ZzrMyUiOu3YuJiupq62yJYS5fNkP0EeyDijI9o2t
	So0u
X-Received: by 2002:a17:90b:57ed:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-3930164c8fcmr4000105a91.21.1786524735514;
        Wed, 12 Aug 2026 01:52:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq() error codes
Date: Wed, 12 Aug 2026 15:51:28 +0700
Message-ID: <20260812085133.29658-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

gpiod_to_irq() can currently return several error codes, including
-ENXIO, -ENODEV, -EPROBE_DEFER, and -EINVAL.

Return the original error code instead of overwriting it with -EINVAL,
so that the actual failure reason is preserved.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Cezary Rojewski's Reviewed-by tag.

 sound/soc/samsung/aries_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 6db91b73f25c..58e3e08225de 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -374,7 +374,7 @@ static int aries_late_probe(struct snd_soc_card *card)
 	irq = gpiod_to_irq(priv->gpio_headset_detect);
 	if (irq < 0) {
 		dev_err(card->dev, "Failed to map headset detect gpio to irq");
-		return -EINVAL;
+		return irq;
 	}
 
 	ret = devm_request_threaded_irq(card->dev, irq, NULL,
-- 
2.43.0

