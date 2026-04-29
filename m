Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EC3D7D78
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458484; cv=none; b=JbL8ARD9e8YWj0TqF6iXXmlXsbZzSMT0pH2dWjstWpc/D/K4cYdWyznwwVkUslI15HJ8Rih3AZRRiJ4VoC5xZE3oTLMgETDxDjvIrcL+98cCNXA7p2CQgkDtwf4WloNx/qnX9nhj+ilk42lToqdBGdNIkaBTC1KmSMkGeIu7C6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458484; c=relaxed/simple;
	bh=aVFPK7SUpcpakPalTN3Yuz97INHgAbhDB4lXhxI43k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+tGmwSBdQq165edRSWuh/XgoAeQyidXi0rqp7AB7uLhRrG4FFACFCsxdhB2UXEqgg9qsQFTmAkZsyBEy15XyNC+AJn1T5nllbcdIvV1dCOKM766K409Ar9piDyB6jeikl2+cWP5OmPtRsT6NiRTydDxuKdmuCpoowrfvYn5vQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR1fHvxS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR1fHvxS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so10580597a91.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777458480; x=1778063280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+9QBBMU8htpcS6BmZ6YxHpCBuohfRwpwtrnTFil/Yo=;
        b=MR1fHvxSxBm93sjFnEN0TH0225cWbCntxDq+TVuvvJCRCUtD1B/JKe5zbtEJ6lfXWA
         MTej4gZl54gBesKO88Kr2Xsj8InHVVTlGsXCYv69lMW6kSm/j7Hz4/RjYUfdSn0hxQ1L
         wBs1nJ3TGYj67j05vo76VXz0pZGnyOb1IsxjhxL8/1lkGj7XWDEwSjkyhlwhyQia3BYx
         8q4m4AYnEGr00BfT66NFw8fEs60GCPvR9Vz9yQz5bquKNF63jn+C7Lqvw9YiBBxiwzA9
         G09Db2h/1cWDivP8D70ov8VVaWKhZBFn4fS3bcCJUmgx41qhdvt3iHbDjQNiH9LLlcwq
         waMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458480; x=1778063280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+9QBBMU8htpcS6BmZ6YxHpCBuohfRwpwtrnTFil/Yo=;
        b=seTLlkh/6qfFoo4a2jMrPFjMtCUQ2wiSy34TjkHhYajatiJBJpmoe2QVOVtU3PeCt2
         KL0yGVq0+DPss8voVkkoTMj+4s/3KrwI1bvNDLDgJUlh+UjQ3FfQOqoGLIzeObzxKzLI
         FoQ2P/pHd32+l9zMnON6hkP4v0iHJ+i4yRQwHaPNkQlrhek53G8PY7wDcBMT/9L4pk76
         iLBG281mPM6DqZQ5yhW8hqvg9azXaY3n+uk5XeoGAmie1u3jlrTr9dQwZkgXwGpHH06b
         PQo9UoCcRGZuHZmeXE0uzLu1MHVb5zfrXi72CDFB8oIkTYY2FfOgZEVfAvydwjAOp0IH
         UqDg==
X-Forwarded-Encrypted: i=1; AFNElJ9epapKvZXT21nNpAsQ3IW98+pcUW+zc729LyB+vEZW50176tHZzMS+2HxoLCZeIkm2CUGn5J4P4UoFVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxooAyAczCvMhK/sz5fof9uKhohGmp6rhcRLfjEZFwqxtDmc6nC
	/C1zULRckySiMj2vwzIf43S9yFSGG+osI+WA2jCJZ5E5Zz/aNKysBhxBFoLUAw==
X-Gm-Gg: AeBDievPCivo93dza53c+PWsUaRWPJNHTHGn5KnDra6lOla3MWas6R63M1hRB2xp0BI
	zMF+J/mN7Wr3TA3HNHAqqMso1yXcn3HMeDV0vcSJoy7Jfrde81Pt/o/6/0m6T6iy2aL3jLuo0ST
	SvLhBbPA3HBr3K5/fVHDFy6JsKbjXxk+Orvl1vow9IC1kCvowV1cH9OQ9tRPG4sFE5ym/0O/L9Q
	ZLY7nJUoLkGHiqh+n7k+cr7GTpRXc8KkZvr13C7eZI8HOKozzTMy30NkwVPZ0ZhMp+qiCeoDu97
	Xao/WGl0p48bzLgtQ5vsbE25WRMoKtioicmmwnGu7x7At7XvoynRtFlQV37wxrssrcyWeKcXQq0
	RoMQgsyV2lWp422kwGFZ9QK+5TRQUGu6WpRZfC4dlVcMZjfaVT9B1pW3u5DWoA3RWC8IdN3SrvO
	zrd+JoF9MbncJApInv0GlI2qqYImvRNeje8rprk0EtQz44QUoeF4MQ6NtdUA5lUWpHRZyZ
X-Received: by 2002:a17:90a:e18c:b0:35e:5929:d78d with SMTP id 98e67ed59e1d1-364a0ade51bmr3299256a91.3.1777458479986;
        Wed, 29 Apr 2026 03:27:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a27c356asm1107003a91.0.2026.04.29.03.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:27:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: tegra: Use guard() for mutex locks
Date: Wed, 29 Apr 2026 17:27:43 +0700
Message-ID: <20260429102743.103197-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra_isomgr_bw.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
index fa979960bc09..db33acbf6c67 100644
--- a/sound/soc/tegra/tegra_isomgr_bw.c
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -55,19 +55,18 @@ int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
 				sample_bytes;
 	}
 
-	mutex_lock(&adma_isomgr->mutex);
-
-	if (is_running) {
-		if (bandwidth + adma_isomgr->current_bandwidth > adma_isomgr->max_bw)
-			bandwidth = adma_isomgr->max_bw - adma_isomgr->current_bandwidth;
-
-		adma_isomgr->current_bandwidth += bandwidth;
-	} else {
-		adma_isomgr->current_bandwidth -= adma_isomgr->bw_per_dev[type][pcm->device];
+	scoped_guard(mutex, &adma_isomgr->mutex) {
+		if (is_running) {
+			if (bandwidth + adma_isomgr->current_bandwidth > adma_isomgr->max_bw)
+				bandwidth = adma_isomgr->max_bw - adma_isomgr->current_bandwidth;
+
+			adma_isomgr->current_bandwidth += bandwidth;
+		} else {
+			adma_isomgr->current_bandwidth -=
+				adma_isomgr->bw_per_dev[type][pcm->device];
+		}
 	}
 
-	mutex_unlock(&adma_isomgr->mutex);
-
 	adma_isomgr->bw_per_dev[type][pcm->device] = bandwidth;
 
 	dev_dbg(dev, "Setting up bandwidth to %d KBps\n", adma_isomgr->current_bandwidth);
-- 
2.43.0

