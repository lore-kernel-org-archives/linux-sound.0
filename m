Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F13D0BE7
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212270; cv=none; b=Kje86ikqSNfKwXOBWwmjSTJY3gW1nWnEMYknaCdGpYGzT7RNRrM1u9mp/R+3FCfZ1kM4Q1I0enwjZy3cn6La52iUIZFuYrQjYuBm/03OZ/oxiK3MyQM/gQO40JnkFkztuCqdXqFcklQbeNJ32UUi+jwfmQCmlEXqWOGmPaJdPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212270; c=relaxed/simple;
	bh=IOBxnOtMshhbTfhP8u/coiEFsQzAKQdVCSVyXJW+724=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9sYWr3k8xzyPWptxIWWLmz9Cpf7WAS6Cs2aVvH2UAf+bD6DTlooJtHd5UEwIlt3qt7lDiLG4VHlnnEu+hbWye0sHAaOF8e6aEIU3UlJH/T4Anm4IZa2nuuBR/IqK3ltG9anQhar8d4EXIDw62eCpQrTzxB6Wy/rDDD6BLkQJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxnjHKaW; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxnjHKaW"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4846083b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212269; x=1782817069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EB+eP0FgMbygYM0Y8vrQyXLJ+2AgLlhtsqyywSd5+U=;
        b=oxnjHKaWP2Krh50cxQSRqMN2mUo/Q3piOWLKps2bz2Ar8GQ+KEhJ1IDf3LKTSc7KRl
         4a7IoYz5RtAv8i7dTrcYTAkeyVLyLbOFdQ90OVpMJkOs8s1rZYEp/P5YgR4iVSd2EuuL
         0GlmUuAS7fsNcrNARGJDI/V+6MdIVgBWVbnvqN4oHzkgJ2vJBnSD8ORGf6hH0A7QG1Wy
         j2fhdEpszgPxxbsBgNOQZeI5ZPVXoKDoLU4tojJNKLUk8yW3FpVrAmmJ3eVIXOiO4TlC
         2XoZQsqPfO4fQ4N58Vjqmg/YL/Lz1UTfVPJDaP99E1+5QtY0OHqFQcves14dT0ViaHWT
         lA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212269; x=1782817069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EB+eP0FgMbygYM0Y8vrQyXLJ+2AgLlhtsqyywSd5+U=;
        b=cwWtT0yOqUJxI5USa/Gg6TzXXw6iBquGdxVMoGFxKswri/czGiVjMWps+2d+7MEWur
         j4JaYgB5IPIBkWjfdzmrx0yuHKd8Q97C1Hbr/bLgeae7UTPfhooK4Luv6T76R0NY8Ong
         OTuq4BbHwprV94xiV5oCkWxA2jVoo33Ce+FyZ9sHSjFchj5Tb07zY7pn3LFGaYfnvgTy
         43hk0/3GGRA9P5Dn5eddsCOG7+tEsHlTsm+0LFt5s0pYbNk651HLZ4/hzUAbS4mv+w1y
         QO0uvpngXp/eWuA/auBilSxA/ipScWfU4saRaovgnOna3UKOmv26fsq/6+6Rdi15Bv5X
         W2QA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5+ygTvAcyqtVJdg4qS39Mi/hllTk02x9RY0uYdlSVvHcosGcNULZys2lof+xsWsqu75HDaSXjCnQHtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzisaOQillyIx/xlP8nDRRM7c6f0dNc/gBIA0YOhGY1ilfuXZMM
	8+GkLSZNSkpFV8lIc3KYdJvRJUrYxdvsrV/2iUAyqy9gJevH2inro3gT
X-Gm-Gg: AfdE7cmb3Qj/p/xkEdRYfFxGlWHaJuHtevek5YfBuNL148f938HbKpwIOxWxIkVnXCB
	Z81f7Us8hGYwfLtkJ+Tec2AGehUazqL53HbBFQUYtUuy85auhpUfsumVV3/80v4EsKqTtcrhjoe
	Fntz1zp2ftDpzDZiMREzjHra2XxilG5PedsYpEoK07N/+b7weOYGw3RL6Lmx8mDA0b3cg7q3jS9
	awjlpXUaBh3hmOHVKu8ISpe2hvCRieiPezGa6r6ONzcX4VwruJSX50oewSoKkWL527Qm8V9FyMr
	ye5DFg1lETlCPOG/0a3+GDOy6feypH0gP8662yVxEYqqnjd5ceAv3LDrqURyYCwO7xqi8a4vbgF
	Gm6qg9Z294qNyU7s2k/NRwoM7q3Fi94bGhg/oPUpTCxcJF7kqxb4L5L89WMTQvFNtTR29BhnvYW
	YvdwQFa7w7/dYNcQJDHiRlwqSss+NoecfvnVM4ZQ2lyhlsx7VpdSIGt7hXqg==
X-Received: by 2002:a05:6a00:2e9a:b0:841:dca1:8b69 with SMTP id d2e1a72fcca58-8459700cb26mr2409225b3a.5.1782212268677;
        Tue, 23 Jun 2026 03:57:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d68130sm12343868b3a.10.2026.06.23.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:57:48 -0700 (PDT)
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
Subject: [PATCH v3 1/5] ASoC: intel: sst-mfld-platform-pcm: Use __free(kfree) for stream pointer
Date: Tue, 23 Jun 2026 17:57:17 +0700
Message-ID: <20260623105721.25865-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623105721.25865-1-phucduc.bui@gmail.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Declare 'stream' with __free(kfree) so it is automatically freed when
leaving scope. This allows direct returns from error paths and removes
the explicit kfree(stream) call.
Set 'stream' to NULL after ownership has been transferred to
runtime->private_data to prevent it from being freed on the success path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index f074af2499c8..47823443354c 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -304,7 +304,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 {
 	int ret_val = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct sst_runtime_stream *stream;
+	struct sst_runtime_stream *stream __free(kfree) = NULL;
 
 	stream = kzalloc_obj(*stream);
 	if (!stream)
@@ -330,7 +330,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	ret_val = power_up_sst(stream);
 	if (ret_val < 0)
-		goto out_power_up;
+		return ret_val;
 
 	/*
 	 * Make sure the period to be multiple of 1ms to align the
@@ -347,12 +347,19 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 	snd_pcm_hw_constraint_step(substream->runtime, 0,
 			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
 
-	return snd_pcm_hw_constraint_integer(runtime,
-			 SNDRV_PCM_HW_PARAM_PERIODS);
+	ret_val = snd_pcm_hw_constraint_integer(runtime,
+						SNDRV_PCM_HW_PARAM_PERIODS);
+
+	if (ret_val < 0)
+		return ret_val;
+
+	stream = NULL;
+
+	return ret_val;
+
 out_ops:
 	mutex_unlock(&sst_lock);
-out_power_up:
-	kfree(stream);
+
 	return ret_val;
 }
 
-- 
2.43.0

