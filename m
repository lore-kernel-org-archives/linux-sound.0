Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AC53EB105
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179175; cv=none; b=Ox8JvaHzCaiDD21ltON6n0MgTMVrrBl1YdqYI1iahNNi48dSTRkNqtykOS6japB9SRcWstCdzGqAcVHSv2E+tbPU5TGwmJCbfmP07ZGBV1P3VJ6GAxqllZai8vhBf6ZEYEARdryBj6znRBWq33KLywWlYzFYNodJAom82LucLJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179175; c=relaxed/simple;
	bh=9PbYWaPxJMCn9DcbJzw0XopHr38ZG9OWFxpdhMefKgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fX6etLTSWeL0PTOLh1HfJIPgmH6J3YsqDYXW8Tepm1pUnFBdJCYIwO2xtscyX5aQk+2KiXOW3xzjV5z/oM1WjBPAv42wrkz4tBZAUTifXYegT0/LqKmhe4tKQg+L9lH1fNdYvulEzU+5x9ShljhS3iw3u71C7bdwzjEnRWe1er8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgJTLxLE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgJTLxLE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso5374119a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179174; x=1781783974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpqLrH4GxRcj/qAEU/O+JLVEhCKWHzf0hbxYZhIqRF0=;
        b=OgJTLxLEPs+7zTIK8NU7lpbpEq5qR1Rw4o35nW8CUnLLd11SFNfRKAEANO781X3KMw
         wqGpCTOo0Nik4aGea14qyrTebfJu5WHp0VmiiNuxxmLOWKr9mBwbBnyoyUldjcGiEWVE
         /jDXfuVRrhomn3dHBjrUTEKC5Cy469d8ToiJckUgcCWXlIHzJxFQXd91Bd0m9z8QiXqS
         cn8JwMm0LobanGaF3s4d8kRmyUzedXxd2RvnTzEeAP3EJDt0J1UWUGkkOpNVH0VDXh+R
         WguMFQzpvdqbdiNyVuCFit3UcWsgO1v2DGR/8l/prI9yG1zpZK9XZG19peFrNPujgXVZ
         Wqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179174; x=1781783974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpqLrH4GxRcj/qAEU/O+JLVEhCKWHzf0hbxYZhIqRF0=;
        b=fLS8FrlKnjsSix///ce4ElNjmUuKrrgDyTAj/8+Qn34o2LUSppi2ep27yTl88N3voO
         hImE4TT6Lt92YkydEGr6SnkWajmNCHpDJftNg3LkcboNo0vNs+AlC/QjdsefdJpanzrY
         PdPbO6/rN0cqwAllaKQgG131GFNf+XxScqn4O8MuN8Z32t4Q21nkz1keJnriwiPzg1mb
         CPCLJonazE0gZPPPcgFicWV8q7xHbKtiHaQSNFiJlt1j+2ZvQ9MT+QxVRjaEY7ha7P7u
         Bb5IYHtvPfSLI0XJYLLRzhk7LtLimHNf7MjhvCwGAkH1HJEiY1ZNR2preu2iXq5yOi07
         YuOg==
X-Forwarded-Encrypted: i=1; AFNElJ/M+C1CxeqSALjGmndwzPrFFpKfqDheqBoRTN4biCq9ybJbkpaGXQogAXoKaFakeRqGxoEcMaTKUQb+9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8etAkKmlNZWyUJNYPhlEKHztaxrCsX1JZTwh4moKz66rUIKI
	FtQN7KsSYA3Y7HELctVqyekaLG/2+kq5xzoqilE82QWJV7V6/Nb7TYDU
X-Gm-Gg: Acq92OHtJdbn3Bt8eKFdq6ukhIrYTIdcwLyFfCZ1BMe3wXWeGt3I95mjaVs9aXqYCiQ
	tUqjEIVGIUvU6i9zWfKSkVgjCFDQNEp1fUYQUilFRiTLrbnCN+7orvgKOA8CwAmHZQloT7knSbc
	WwiSU7dPqkXX2UvtAQss6PTwMl2ioxlIgLylaB3xq7lQHSsDTB6MH0EVaUonthtxq4GnhY0U4zd
	roGa4SpzgLJQWwwV30Qg+BzoOxqP4JP+YblkLCpIHWKoNbArv3hC6pWNnnosrr/IXQW5A56wMDN
	sAHg2PZ2Qarkj78cjzvpDXR8pWBgdIAEmI5JRjhUJ8Gr6qEA4LohWSY3c8oELuef5FWbmBzAjwq
	XBGrkPV3mQFcDh6JLwlC0Nz9Qp7/QinXfIbGD6rXVaaojXheOh+27tbltY1UXl5G1a1x70sP6kV
	I3sF0A7rtJn3XG0RQv8DFOsfri2j1PVcpxeEmuMhaD03UgVjqb4JgtYNzWq06uUPUUp3NJ
X-Received: by 2002:a17:90b:1e04:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-377a7d753d3mr2729905a91.22.1781179174001;
        Thu, 11 Jun 2026 04:59:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/20] ASoC: Intel: avs: probes: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:45 +0700
Message-ID: <20260611115901.80438-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/probes.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3..13d933ab77cd 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -186,7 +186,6 @@ static int avs_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
 	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_bus *bus = &adev->base.core;
-	unsigned long cookie;
 
 	if (!hdac_stream(host_stream)->prepared)
 		return -EPIPE;
@@ -195,17 +194,15 @@ static int avs_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		spin_lock_irqsave(&bus->reg_lock, cookie);
-		snd_hdac_stream_start(hdac_stream(host_stream));
-		spin_unlock_irqrestore(&bus->reg_lock, cookie);
+		scoped_guard(spinlock_irqsave, &bus->reg_lock)
+			snd_hdac_stream_start(hdac_stream(host_stream));
 		break;
 
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		spin_lock_irqsave(&bus->reg_lock, cookie);
-		snd_hdac_stream_stop(hdac_stream(host_stream));
-		spin_unlock_irqrestore(&bus->reg_lock, cookie);
+		scoped_guard(spinlock_irqsave, &bus->reg_lock)
+			snd_hdac_stream_stop(hdac_stream(host_stream));
 		break;
 
 	default:
-- 
2.43.0

