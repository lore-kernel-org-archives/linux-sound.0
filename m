Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F11D3E5599
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462581; cv=none; b=lfWAaYvrv/Sm++c6Mp4xqL/ki9QXQQ4/9gUP48pmiTPtr8RHkbXejzl44vSZxkP6C7pQFPdYYYrhhn4hRmVMkq2nDftvYcV2s24AjdgyBiKlUrwN8dtEH7B/9HWzxCWXry6FaYFd1wDQtA6nSaYucvP9fvEeGZ29xo6/YTQee2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462581; c=relaxed/simple;
	bh=UXHJAmlXNESOzLWgFCYAkLO6a7PCdsPm/sU4cVQ489o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDj1l4d0Ed6bRr+N3LiosAT3fqnV6nLkNVzoD5xYaHaVhY4lr4o8okWyGBaoqxwAa4XZ6Hy9zjj7O9yCLhSfvyk9U9luNjJxgKfWWzSuyst3VUhovlaG2KrRIFRVFzZEpVzRZ2Z7Qj4vR7f2h51zTvmn6nvGd89wkIJcPAsGihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmlLQWNO; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmlLQWNO"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8ff15af279so454360a12.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462578; x=1783067378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnC/KTm8/lGG/pCjPtXCtDzzd1NJTdJhFKdzhH6Wel0=;
        b=RmlLQWNOWjEueH/qLWNPAmhRxQ5FlGZoBGZtpUhqJFMnuPwHSW51w2Ef1lr1kSjAQ9
         ZMqyJcUl5Z6FntYlsJpwDRs6UwWZAA58iUSBMEtjcL0bHn7bH1bbqjRNyXo9B1IYw4mF
         YbmWdz0h/UvMusMv0XU5N2hSYUx2FQmB2Tzx2MXZhohEnFhUXChoVAiLTL4brFMwY+ff
         disPz+4Wu3Rhgn+DPcd3gYjKFmzHbym5qUe+QgHNPf48DQ7Dwdvg3ESHhm5G/dOOhdlS
         x5GAmI6hW4ninJwTcEMChEWK/1PfnEWYJPMTSzwE4PQ1s7OBhucPM8y6ykZnKgcTIaiW
         TK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462578; x=1783067378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gnC/KTm8/lGG/pCjPtXCtDzzd1NJTdJhFKdzhH6Wel0=;
        b=k9ZCGLH23/8RiIADPeoAf9ncmzLP7796FZ4mo8OLCb40oAwgpabmY74Vta09XH8uem
         On+2H9HsPVJLeTmAw09w/O4BgUqNdeWo3ipBWCZo5qRnRi3tbgmqPXwKgA7+k1WNANf0
         HRELo1X2ikuizxWRUP0ZDJtvEk8U0CcHe+a7Zh0CUhH+ogVoVet8BLcxYg6amkaY1Yao
         K/S4A4SdE3VLc0ITphptNpzN0ky+xANX7VxK5577pAHeF6QN5C0pXb3FyYlaHI+z1AVA
         wO1ZdjxFNmKObX+KgHM29wg8HBhXFgGhy3GTw2hP5kimTHcK7VND3rOXf71rBu5WQEee
         VAAA==
X-Forwarded-Encrypted: i=1; AFNElJ9sT8qcQ0nPsSGQ+zVmoKgkNDOIcMEg7TyD6hDFCEBH0TAxfgRjA2llqcihwj4SwyVbXrA2ihT3MOMWsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQODWLmgHF52fVG2vJmTiyxddAi1vC89x/VARbeETEOoib1CY2
	VviFSgeCSGt4BCvUd7tt2t4mQekO03F9g2JrDiF6HcCLBSrzO+9Ujg0uRhLWsA==
X-Gm-Gg: AfdE7cklgHue/PhfMN4H4ofG6S0VkX7hKD4HzikPW3EZ7bHfgeINucnlk8mnuhMHsNt
	W7q6/jE73ObqydJkYVGAoVy7aHRh8DZwUMvNnPU4hVmmDA6LiGlY/ilFZB7WSJRqYGXxsOONAyk
	XYFhoJCdG2UoCuDBjX3l+gcJqe3k88gdWRcZmhSsUA3UU5WlokLN5tYREktGwQy0kI+r6IFw5Vc
	rKhPeEYEaSTP5yM+WjBfwgoW39PJ7iGS0aDQMWNY1hdiAMY3qWi49cAmuOogzx1mYOOTTUdL7lh
	wiLDUuS6KofJ3rMV9uhycZyBZBXl5fqH53BWz86bV+tk5ua5iR1pParZC5iUwsaRhP+i8ZSSjri
	1qijwZJyevIeCkc7DWa+THC5bMYrbL/zTUgpACIF5NG95qscivbXjytkThkZIvNMkyfiE59ZfQ8
	DBsLDoDgYIFuh6GlLnbK9WCnAomSp4pyqY8zaCqb/RvzIGgs4=
X-Received: by 2002:a05:6a00:6f12:b0:845:b735:5aa with SMTP id d2e1a72fcca58-845b73509a2mr5010634b3a.47.1782462578575;
        Fri, 26 Jun 2026 01:29:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm6708789b3a.29.2026.06.26.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:29:38 -0700 (PDT)
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
Subject: [PATCH v4 3/5] ASoC: intel: atom: Use __free(kfree) for stream pointer
Date: Fri, 26 Jun 2026 15:29:02 +0700
Message-ID: <20260626082904.32344-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626082904.32344-1-phucduc.bui@gmail.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
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

This cleanup is a preparation step for upcoming locking changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Add cleanup.h include where needed.
 - update commit message

 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index f074af2499c8..67506a718158 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -11,6 +11,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -304,7 +305,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 {
 	int ret_val = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct sst_runtime_stream *stream;
+	struct sst_runtime_stream *stream __free(kfree) = NULL;
 
 	stream = kzalloc_obj(*stream);
 	if (!stream)
@@ -330,7 +331,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	ret_val = power_up_sst(stream);
 	if (ret_val < 0)
-		goto out_power_up;
+		return ret_val;
 
 	/*
 	 * Make sure the period to be multiple of 1ms to align the
@@ -347,12 +348,19 @@ static int sst_media_open(struct snd_pcm_substream *substream,
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

