Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6963D301D
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140665; cv=none; b=PvVh7ARXBvyFhPOQqrBlZQ/GoqLo+6xtlIRPOFiH+kYfTu+tlHAn79+89jGogaaSk8pX5Ws79hCaVRvIG95+dZCT7+vxiEfKwqXoJaw6xk8cXcirjpan9tpw8QAEIFuPvrm++ZT4CI0b/gK0zxDp6lDuMBGy9saJ8Tt+YMd1RNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140665; c=relaxed/simple;
	bh=qBF4f2AR1gDshWlAzuEZ3UiQ6JAUSX7d6Fb/8Wu7DPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ByjRjPsEK5w7BRkUoW7fS2acFFTSCWj5gX/v+w2NOtMeXBfjWuYI1X0yUNOlXTo2leirM0rOzyXr74chrDpMO8Hv9lUO9HwX9ZzmPL5hO2GaZWgKyuNxzKDoEiLHdK4ZcEhRxChh8JoBtsNBgf4CW6uMnNu537vIV18WRum+H4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaCFrhN8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaCFrhN8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e915887d9dso25825805ad.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140664; x=1792745464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDraI8AhB3fHPfJ38Az678CJQw7R/yVx2otit0d40f0=;
        b=SaCFrhN8Z9/mo1TzRIO8QMmt8MiPDbwEmNGmGKHW2pvEbqGG44o8oJf0OxcY5xnq8I
         RyC3bbj5xrkZXAu7Tuf/bmClWk/sP9cf10OQfYLHhIURQ/M3Bi5Iye8fYktkSjxvYLQx
         PByCjP/5CsacK0gXHyVQtZLgYRWcShgMEO8frcdH+576ZldoEjZ4WKjkHM3nFQ5B1JR9
         mfiueVkR2akyzj6yqGE2PoeSxou40bhUmAKkc1TJ6EXh2DZ20/08aAVx7ZYj5dUNgucb
         y3nj023/WuKoJEuJcBOCdtNIsHg39eqhBxWTYPZIM01DXkziwRx0HX0NK4oe3Gv2L3Bw
         MnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140664; x=1792745464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDraI8AhB3fHPfJ38Az678CJQw7R/yVx2otit0d40f0=;
        b=mXUl98dX3gLe+KosW51Ngh9PKm61/YbDroBRJS5wJWrgRqhXxb1NY5kyqwy4xhafEq
         Zg03MHqzHXi8vyTAplOJTHmrv2DBXax4ZclSjtffLPzgHqbR+wJK/UH5dIvvHZ7e4EBY
         S2KWcWNPNzc+TBU2xfYHB1nYsv9Q/Y6ItVctqBUsxes2+69sIiyhGhc2NhG1x7WKqnit
         GBlTo59TkPOOxGE/j2woPwBnZQOBnZ6MxGwQzfZ/a6RWID/X2Gm8jRQ0Lovdly0/Fz/o
         Fm/6resxnuO2BhoUOCoLwL00E0m6ouQKWc5boTNHkwqXR2chXehNizO5JX1PwBglX+P8
         WGfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz8jp4oqLK2v7e2tt+DOqpXag2jbG5jLN1dZRHGsV9dzJnV9f5qyv8JFVe6eDnbzUrr1D0XNn46ijaqA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjo8CyK8MN9HGOGxDoIlZWpslqiQgjPhl8qBsFiqDl7pwPmdTT
	tz89/REs3J8N+tci/s6XgpJluIM0qWk9Uxf73pvv2lqO6jA3oI+QvdYL
X-Gm-Gg: AYBFou2nqLOCr0+Ox/WmIchWZw4hhXn6EKGJ9JvM5xYFTqbGR76A7lW0RRPZQtdDDMw
	/BuC2xELxgtSLqIWs5JMZf3zeASLJXMjD1nMwp8EJQJpz3YIVVe9NsqA8lcesUhQ94//satBFmJ
	ysOeGtFzf8LAAgaFXD3TKjW7jIrbxDyNSkJ0bkr1dN5laBKaQLmTowo7HcNDl/8+8Z+MpplPh+V
	lBrNYX9e1/EUH21NE/LIOTFoiac+tDyHA6AfUlbQc/h2Wu/Fz2o6Zyu8SWRmjGlK+XfF3m38LoL
	sG0OE63/bU+7m5sIPTjhnwtmETJcB0VlXXMeNbkqPRLO3QvIzZG/ZkCK1cxucm7dMb+zB/Mo8UM
	2Tc8cKfoJu9ez0YuV2qv/JAkf6uKmKbpRkRwWI+aKUlHzmyQjClURD7uG/u94FyyvsMN0fsLQhD
	lQCP1wzv4hM3Jix+cYgANWtmWvNJ3lsN9u0iUxz/0BdvuB3q6K+ObIlxENuK96DzBl7INm8Zo7g
	07Tgs26C7UKzYh3hGz/KKVz6xwAw0yKjsKb70hVMAms3yFE0ynxE8pbX7Kt73YUxaVCqSlsKH1H
	WYZuGeKIKvY4zA==
X-Received: by 2002:a17:903:476f:b0:2e7:94fb:262 with SMTP id d9443c01a7336-2e842ce2a76mr172039975ad.43.1792140663916;
        Fri, 16 Oct 2026 01:51:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5b8849sm6826045ad.6.2026.10.16.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:51:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	sashiko-reviews <sashiko-bot@kernel.org>
Subject: [PATCH] ASoC: amd: raven: Fix memory leak in acp3x_dma_close()
Date: Fri, 16 Oct 2026 15:50:47 +0700
Message-ID: <20261016085047.535265-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

acp3x_dma_open() allocates a struct i2s_stream_instance for
each substream, but acp3x_dma_close() never frees it, leaking
it on every open/close cycle.

Free it in acp3x_dma_close().

Fixes: 9f7041b71a2f ("ASoC: amd: closing specific instance.")
Reported-by: sashiko-reviews <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-173760@kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 765057499021..0862a431b2d1 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -360,6 +360,8 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 		}
 	}
 
+	kfree(ins);
+
 	return 0;
 }
 
-- 
2.43.0

