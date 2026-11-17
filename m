Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889287;
	b=4W3Vwr4VOiu/iMkcAKKS52oBCLBQIR1P1Va4aKuCsKtwIKAH/g77agxQC2dUSktvBfps
	 8dyyoBC+ko1iV7GwSIw8pJpfY/dZwY3pi84C0f0SNhwlKMvUjZaLVgtxa1MkE3/Z5PITx
	 t0zAdguGqdk9J0sor8ZvzdN6Ig/qHGlyyycfe062yrKhc7OoAJS/L4cJgIkc38LEGjYl5
	 3d719PNRNdQyl3QNoAmuimOQesS7c/jRE4jhXRDKYzI/OGdUjU60CbydS3QBXI4B5CDHC
	 jYHXOe0U9nBzz6PYTYSIzCbTZ1xna6Keh+vxvNC6nILYQFHMAK6z62LEbqC+sJoTFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XIcutFxtKY5e7a2xv9fceQp19paF2ilpk4Nu1u5fqLw=;
	b=Mn2CjoCjm0n32UM7IIkhfi2cnVwXrFIsA8bqwRWFQ4gE0yYKdmFKm/+oLbbbV6kJtc1j
	 9wqDkytfL1Oi3N/FJ/jnqayC1LI2aYFl6FnPRFx31FhjRs3T9Qjt0+frkU1icZ/fmADV7
	 be6f1sHCGgIY9Ie2kGkAX3YCw9Co8AACLD9uPNUJlJcTYmQaI1VeNkeU11PS2YQRu+fc9
	 c/vXpqNs3+adSfuH7/9JwJnYXqDdz2yT08iVxeWjZ3jx2pvWWIHZXM9FUsS2H6KjScDai
	 ZCVK9QTGwiwm2Ncb9FWGzMU0NZy2+N6Q6jdYZGa/tajtVCzYBWfgvalnlTPX9TQlCRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKexKFum;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9C606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 04:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKexKFum
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9eb579c0eso23558045ad.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794889287; x=1795494087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIcutFxtKY5e7a2xv9fceQp19paF2ilpk4Nu1u5fqLw=;
        b=YKexKFumA62r4NnViuW+Eh4RHHPmwOrbBMKrA0CidZyGbvIZG5PUNSXtcECwcgSUyg
         iHB+6fwivzQUaWAeZSMBIpbpW2xWXB5YSqLH+IU2K4IZ5CcDDXXqt8ZGBd7RctjH7tJc
         QUOMUWRc4xjA7OP4rT8KqjnodT2Awm0dUcGwAiMh2kJUXEunvC2BQHG1Qpv29/WEvkq3
         +segr2JrHcO9AwIDEV/TYk0qrQ5z6c+4Wy9oZNQ9m3PhuwDwTL0vNLMqlSrhTRNVXOKO
         wRNzK5oIDfbc4MtpfOgEyc8QThM7zv7fj5l4ssEOgcZrwPSKKPvawW4kVqyQ2NhBJx30
         y6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889287; x=1795494087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIcutFxtKY5e7a2xv9fceQp19paF2ilpk4Nu1u5fqLw=;
        b=VSArFT4bE4JTjLhz1v9LD/PetMwGcoZ7lnjHidjAitJmUyxM8anM/qHCVN1h68LsGK
         fxDeqPGo06AScljdbVSlv4DFrwJYIgttaR0B8OccSuIAFqqVH1XmT5LmfOUFdDZD1/mU
         oI+zn7Lnj4J4DY3pxf7g73WQz+5I0YjVqeY5RwaOgyMz/PKPtlYx0XmRbt7igR7dKTSx
         iPaAFECulnkLz8W3tGQ25rl6q2+jYzt5yVqeE+fjWIms8zmFJvuJMaZeNc5Bm5jW82KD
         Tg21HjIPPSgtGcAVrHjQpNSr/M2yooUz9S3Q8kcXrijo9azhp/vPbk2QKmGqpWZCmoQm
         m2ow==
X-Forwarded-Encrypted: i=1; AL+hErG2r0kb6fnV+DxDLeja182MTnAxRfUO4y8ZcIvrEnMEGDv/aoxdL3WbO0ZAmQ9PXcvZuVN37UVztf8/Gg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q6LJKYWHOvL1E5YksODitu3rDhxPFEOJJCAEkgoEkQ7nr1/Hx
	wBlk3wqVsd2Uj33/eW4PoIxgbrv3z+jF3KMSNsSlKdWT6t/NFx38s6P2
X-Gm-Gg: AZFdTZeUy5mtwDxJnlSAI4zLgTj4uhN4ssGuM6FbpmRq2KG8vXjgipIbBQKy/s69Vv6
	5J9OxdbqVMxhq6wZdqVSxpk7VJxNId1GjwlVlQXYNBBD2Hxw19HSMQpR9sj1+wqh2cMqbBebmHv
	a+Q8J+bEXSoYgmX56Xg9euy226iEXRT53nCrzb+4LiB/E+/YFZvCttaEX8icTkFbi6PAhPyLTsq
	8Ug9A94BKJ/IeyWCXC69hH+KP6FVzRrYy5maumUVQyCKSG4FqYS1BdcRei7ghUl7YdZoalBX6P3
	EYtdwPKOSxz1B/MF/56y8GDjAkmF19O0lyFQFfnZ/Kn00iXoguJd57HchNUJToGo5g81uo3Bz90
	XxkXsZ6VyTtz1R5goKLhNAO6oTSU/igm30Xt9y4prGgS6iwANXOxxp3sEsHKVKcNMJpcAk9JIIX
	FjEDCoGvk+LCvE1mJ2torVp/Qu50qvPFUVU2SJZZ7+Qqiy90UD9DWsD1aWNG4YLecty/vyWvbdi
	a2r+c7bvnZKxhQtMB3OBTWlGFyKJ1+m56rHbcZ6xKn99XZimt9Dy++DbLAXAUmVnLfB91od0P6E
	72bdgUZ0OfBKl2GsO/Cpg0+gK7c2I1pz7/XzznZP4jCUklJsTSHX3XYLAVrThndZohxf6E/PGQR
	AcSvIpG5PsdC9KnWAzCeSvLRtaqast64mX/vqBZG95b4I
X-Received: by 2002:a17:903:244d:b0:2ef:e465:5047 with SMTP id d9443c01a7336-2efe465548cmr442305ad.33.1794889286773;
        Mon, 16 Nov 2026 20:21:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe41c8df5sm412385ad.70.2026.11.16.20.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:21:26 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: cirrus: ep93xx-i2s: Simplify platform_get_irq() error check
Date: Tue, 17 Nov 2026 11:21:01 +0700
Message-ID: <20261117042102.12442-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117042102.12442-1-phucduc.bui@gmail.com>
References: <20261117042102.12442-1-phucduc.bui@gmail.com>
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

platform_get_irq() is documented to return a non-zero IRQ number on
success and a negative error number on failure. Drop the special
handling of a zero return value and check only for irq < 0.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 97816fb75368..8dcfc6717e19 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -462,8 +462,8 @@ static int ep93xx_i2s_probe(struct platform_device *pdev)
 
 	if (IS_ENABLED(CONFIG_SND_EP93XX_SOC_I2S_WATCHDOG)) {
 		int irq = platform_get_irq(pdev, 0);
-		if (irq <= 0)
-			return irq < 0 ? irq : -ENODEV;
+		if (irq < 0)
+			return irq;
 
 		err = devm_request_irq(&pdev->dev, irq, ep93xx_i2s_interrupt, 0,
 				       pdev->name, info);
-- 
2.43.0

