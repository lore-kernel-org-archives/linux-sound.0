Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4D4A3843
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465021; cv=none; b=YgbFQhj6QxdUbzBMQFcgKOj5QOUHYGryUnPQJrPJ0z8s/JnDV3PLvR4qN+0sBIwveNwZK8X7fqPvloPOwDjLWt/UrUdeXouD3nvhU/biOu1i5fFarLIExVwLU6OiFhh3pNWUrGHYFObOGQzuMQtY6kKPOqUvJExd6MnutiQbcFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465021; c=relaxed/simple;
	bh=aS4Dv5UHiq88C7h++2J8wWh4mkIjbtMYGmmdrGEH6DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLDfoViwhgGz4qppDDEY7p60yHlswgQ9vmSQ4mfGP5vQ2lB0DRt+3alnt9XLP2PAwRAqS9VmmTNeUnWBIwczC8NABvykUB/x1yvXvatKWelIAMDHqQkJ/DWku+wj6hQ3KDRnN0jkS6xbOfJXHHLF++IwO8XPjM3Quc05tZhY8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3H9i9an; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3H9i9an"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-885cd98d226so309385b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465019; x=1792069819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+A95327gEMuDSz2TUbfO2faSqz/UxfLB5KUZN+2QgPI=;
        b=C3H9i9anqnZgFOqLOXO4vu95c882goEtdwfPh03/kOspfNiecyvq0SB9iHiCI+eVnM
         kAcosTPvkxRxdIyVdrtQxZzMHLjATBB/hkA+jIGu1Ooqxs8Uy0sHz8zymxSXIlQ62wSl
         Yoove+2wrPeP/bn6+rFp6fkWw7gFFHMlC4BHGW4ZwoO9kjDIv595A1Mm87txfdDv8FrL
         z3MRROUGbKDWBm+6SNxvjweZmX/tMDh4TFIwp1T3UCgtl0QYch8RHB3ly85qBfoY9o5R
         rpHjam8nV0gzJuuvh/aWc0SK+F0i1YMvArA0jYzAEfEaSvEu2KlwUl4LDlJyDZ1zM0an
         8yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465019; x=1792069819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+A95327gEMuDSz2TUbfO2faSqz/UxfLB5KUZN+2QgPI=;
        b=SSpWxzHjrip1l5Mjf+6qPAoMgIWE/Nf2lr4JS+8ck5Gau0gUPONLa0wAmueZlHaubV
         pfgR0Ng6EoJixOKEWpZxXZ7jSJXhmWkVZmS1ZujBqNbd7XotrUdiA4o4BPvU4IO0j36e
         33V7xGMY6kpsjJcclI/5N5/3g4kyWWTOsABKAQswiIGGpJQl+rh68u+jRTURA8B0w8TD
         XbvpyiUzPuC5tpaykG60kBJiJQQkGpZR+WCL8Atha1hePh+WmcYos0nheWjytZjTPyZi
         dMuLTW8RyU0sbNLAxsp3T1W/woUSHf95UQGb9x0KHPwz4ZEzYVApRz4WH/6FWRh80TYK
         gGJg==
X-Forwarded-Encrypted: i=1; AKwUvBw4tMbz2pcaQz7c+9GkZL1CA4togjGynnvSKRbepJ0mGVzOCB+Gju3B5kGmYNt/5AQ+Z+iZXskHFuxJ5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPc/HO4AyjeL7sns7bALNLZ6HBfNNcOjQMW0u70hFi9tepM0hk
	UPqyRj5SrSxgQs1jjAgGoIiSRDJ6dNaYWpZIMZuwZMawO2fL3dPPsM/n
X-Gm-Gg: AYBFou0s3NuF3iReF3B4wWbXDltmlu2pXy46ZTZcgZwuD+FT0TMOXseOGD+/zJBhNhR
	8T1k2T/Bt7g6yCogeOHZwSeF8zzqglIFbTiMCJ0khoPRhunvJ1DVL27bbpucZZLw5blHg5Evxcl
	OatSfGmxU63zSX3v4b+vH52YXHuboDJjG2tkZ5oa2BXKUbI7J9M+HRaFVmfEhoqf+Ew243hVBGb
	FGvvbJzCzcwNRmN3F9Zd6ku4Ph8bAOYrgDRi2YGpV8/dIjT5Ef4WHvucIGyqzYDm+RtxS6SJ/i3
	TKf8BnRublyBRfu+iVz7oD6BrN2knrHz3VA87oXcX6xg4y3I7MG+/yk90ovXP4s3qxWY15W8NCc
	RPICEZkWLhXzQK3gxMMIkAE8BY2BpOCbtUyRu79RyhfjiwEhLrUGaXBNZ/A5kL0rHFzpZA8eiNj
	LYkam7AGvaGArvEzEZDQc8EFOs6zw1jacQJE8Duuku2pjkWHDPCJiZI3wAv1RvxogOE1ydtRZnB
	8XoDnA2T+2jHiwC/sskSyrJ00b+X+dy7FXzvNXwcCXwGRlnUF8ZOigwe1l6YP1ERfVfDYbzdcY=
X-Received: by 2002:a05:6a00:228d:b0:886:2d02:de83 with SMTP id d2e1a72fcca58-8930aec36abmr1548345b3a.25.1791465017776;
        Thu, 08 Oct 2026 06:10:17 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:17 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/6] ASoC: pcm3168a: Fix the DAC zero flag polarity bit
Date: Thu,  8 Oct 2026 22:09:49 +0900
Message-ID: <20261008130953.2446692-4-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAC Zero Flag Polarity enum uses PCM3168A_DAC_ATSPDA_SHIFT, which
is bit 6 of register 70. That bit is ATSPDA, the attenuation speed,
which the DAC Volume Rate Multiplier enum already owns. The datasheet
puts ZREV, the zero flag polarity, at bit 0. The header defines
PCM3168A_DAC_ZREV_SHIFT for it, but nothing uses it.

So changing the zero flag polarity changes the attenuation speed, and
ZREV cannot be set.

Use PCM3168A_DAC_ZREV_SHIFT.

Fixes: a9b17a638af5 ("ASoC: pcm3168a: Add driver for pcm3168a codec")
Link: https://www.ti.com/lit/ds/symlink/pcm3168a.pdf
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/pcm3168a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index cb6a6f08f2f8..6f45ea4869a7 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -103,7 +103,7 @@ static SOC_ENUM_SINGLE_DECL(pcm3168a_dac_zf_func, PCM3168A_DAC_ATT_DEMP_ZF,
 static const char *const pcm3168a_pol[] = { "Active High", "Active Low" };
 
 static SOC_ENUM_SINGLE_DECL(pcm3168a_dac_zf_pol, PCM3168A_DAC_ATT_DEMP_ZF,
-		PCM3168A_DAC_ATSPDA_SHIFT, pcm3168a_pol);
+		PCM3168A_DAC_ZREV_SHIFT, pcm3168a_pol);
 
 static const char *const pcm3168a_con[] = { "Differential", "Single-Ended" };
 
-- 
2.43.0

