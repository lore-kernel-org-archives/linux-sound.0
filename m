Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D2644D03B
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981929; cv=none; b=fFAa0COqRuwz4AxUnPlcWdhrc/GabTf1bLsHI4iItpcSxG6e/Cp12MTZufNOuFs2536ag4EYDxf9SxANXHpL4iKLd4P6Zt55lq3OBDPvnAbxca+Xi0LKaPAT9ZPNIkHnDEtUoRHi0bD5dWxzNJWr7r7kzxpowVDevbCY/LkAc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981929; c=relaxed/simple;
	bh=AhD3wlmEqBAT3HlPt8IYdhE9e9qHrgsqPhmiCfPkPrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNhqOlnw89bHjYEwsY1VxA3YsljisO5ymqojOm+z3ZSCu+8+FQZqmqhovMjXpHH2wc2/hxMRT74y22F04wTIZLSPy89zzHMoLo77LK0Uzdo/LMuwYXICVIvFwgRP6kfMbysLHKW/g8MFd9a2PsirzJgcGgByLYnOFOJdhBOyy3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJjuIxZ2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJjuIxZ2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso1325549a91.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981927; x=1783586727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ynYj3Hv1c2SwjRZ0G2WJklJeAWxlh9A39Rdw7J9Hfc=;
        b=aJjuIxZ2jaBF6VFNf6mLg0bM7StaowLqiKMioTMSMOG3oX3w/iVKt6YBbWOLA+ysZZ
         Z/P58Syk/mLOBhPhaRAuXA8BDlq6bwN9e6DKH6yS5ctVLYjYaVIvWdkpDjDBedrclZGD
         MW7qaFxf9mIxVDDrSpVDwxAQziB7axXsud4XzvQ5bdO7EIH+aMh4A+AcFsGKBxT3Npah
         UPdtC0YhRGekAK46h+fPldiqVCx3fOK7O0SFIZtNTubJKXQBHtWtmqrMDuKRVMz4Q4xk
         9k0xtOTwUdrT1bpXQaUvYQo+pXeKjJG6kkb60of1gt9QfV0q4PVVBN1EyfXnMLCwdNgC
         ptOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981927; x=1783586727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ynYj3Hv1c2SwjRZ0G2WJklJeAWxlh9A39Rdw7J9Hfc=;
        b=FBGqbqrIpD2gmIIIs82PQbCkxPcYspYOx2OBXIwLRJWEJXMOzIt0wrhAQAhIWz4tTi
         Pl7if7NB9vI5/W9HSzwYevPKEUVXVkHXB96YdGAwPD1TvsAjrrN2tzUfAmjNZk08651b
         wCpKG8VjeJXySbWZvzPTqIWNZEL6wWsXPtPRKb/4T8evfbCNi5khiP6H1O2TWyBus8h2
         CjDsOxt+83VaL1vTvXwdxi2x0hP7e0oJDjGStkcPVi1IOmJELxIg73uqVx9eRlIbUGFY
         sjXPnVJKPli1Id5OD3u/FAMNlEroR0MTcqNd9gWnZma8eMKWzoALS08RmgQOFV5avltm
         J01g==
X-Forwarded-Encrypted: i=1; AHgh+RpvOYrsQYVtqKOHSRj7vSFBXm8XmV90XpPiRNGO8FxTAtEscLliPv/JMKnygE6B6LE+4J42jE6hgIKHPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygRqE6ZcLLFBjPqQxLBY97nF11SM5mOI206EJB45jt5b8RO8Ya
	pBZtb/ML/ftr7XFJb4gOYXZoadIzZqsN52hGWjxpujCrfgeCoPHyC+MH
X-Gm-Gg: AfdE7cli6/jS3wFEykRzBXFOKYa5XmtgjAwLr9timYGQiw+LtvCsSxajcFyTJe47sEA
	FfuWaQb2FPLJanHuaBDmezuWG/g0TaDWuBVL1yrriUPpnUgs7Q4gr4xSaBKCd6sG2atcnft2eFp
	GxAZh3iwmFZFHa9ImnZCnUEI8Zkx4UTgOxUxUnqyyLT6H4PKp7HCUFyPjYFqUZ3/zFUgFSpZmhl
	VHtG+H2GlbNvjWZGsmc/tYAkrqSpFOhsplGvo8wBRKWFBElAEFgOVyoc4M4eg6YQudCU4Pg6T0h
	lzJyJuPXah7HOU+unWTYV6k1DlLGVQg6yL32jwslSXh+otjNIHaDMCKKq/uL1PT3VoF/YcX2XgA
	rHiDpLd581w8n4eyN0pUidBe2dq54FC54S/fB6HxfWH+QWGRJ5xI91tsaxhpThtrEKe8VyF0ChY
	Tjh6GBT+spfrISTPfD5XGKYSPv/1Ck1B9mMzMEFTmxmvOYAuU=
X-Received: by 2002:a17:90b:5150:b0:380:8b14:d8e6 with SMTP id 98e67ed59e1d1-380aa1c98afmr5379021a91.17.1782981927247;
        Thu, 02 Jul 2026 01:45:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ziqing Chen <chenziqing@xiaomi.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/7] ALSA: pcm: oss: Drop redundant nonseekable_open() return check
Date: Thu,  2 Jul 2026 15:44:40 +0700
Message-ID: <20260702084445.519669-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702084445.519669-1-phucduc.bui@gmail.com>
References: <20260702084445.519669-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

nonseekable_open() always returns 0, so the error check is unnecessary.
Remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/oss/pcm_oss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 9826d9a0be6d..0d7818eb3e14 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2495,9 +2495,7 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 	int nonblock;
 	wait_queue_entry_t wait;
 
-	err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
+	nonseekable_open(inode, file);
 
 	pcm = snd_lookup_oss_minor_data(iminor(inode),
 					SNDRV_OSS_DEVICE_TYPE_PCM);
-- 
2.43.0

