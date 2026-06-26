Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A43E451A
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462590; cv=none; b=WKYM4XQYf2rm0Y1mSwf0aP0qhC+pA1ImEyHSE583R3cisovPNd74ZM92YUUrl+iNXqXZLp6byfTn87bvbw7tLWTJaYvrb6rOQitdhY2HA+wculeYFeKy/6lMEmeZcdkqC+FgGWnzTfLX56hJ4Foxj1lFfDCHipEMG6m0xXkku2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462590; c=relaxed/simple;
	bh=suzK3gGMP9V0L9I4x2dEm+tcY9D7ZqEks0pLmeKX8x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+yV9gvrHR7zDXYAMlfwqLcOrFienM4xBhiYJkSAiFC7mTpRvCziE5xzhOTqIpELpVtnph9GRMDuUgo5578RyNAi3FTjUUePJeNzC+ZWUzPTKvXI8EsEU3t88yus4TRZgQ8iyj0kO4pJfxBQYs6T28bXCVpa/mQZ2XyOPhSchtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn6XSVIQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn6XSVIQ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-842358aaf36so283397b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462588; x=1783067388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNl7MaQInFa9VForV88gG+7boy7vN5O3P/61t1cZ6iU=;
        b=qn6XSVIQCZAPCL+dvaBfCRuuymPbXbWNpDAjYLxWHLXHlFNzJBqjfV4zpG+Vwf093l
         zjC0hB+UOp6rvA8k7nLV+yvYszlKDFRlmpjT5HpIxFJ9jYPh0PgHei/0ZrsUzthZGZty
         7rv+/raL9rsKPJAgEFGyQgTInmg8MuONAjHNES53t5te754fc5O4ka/A5LfBvwyE0ro1
         hoQdKauJc3+EsRQuvHkamvW9izZ4nji62eyrVYaKFFvwowJQviKCRIVHYLRd58+1Tx05
         RIxeLgAt7IzMneeAYXT/qn5O2Qh/9jVbXXzbrcNVNEbg00r+QmSmTRq2eqrP/32Ces2j
         9stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462588; x=1783067388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vNl7MaQInFa9VForV88gG+7boy7vN5O3P/61t1cZ6iU=;
        b=T0YqSy0cdcqeoe/5Fn42BYfibhVQxTyNR7/j4DFcJyy/IhboNvZNqMB76XS7Tsv7bL
         cq/MT9yIQizdhgbc5CMAgCmjg2+PRQD+Tg3liiFanK2Hm87embmpk60VvtQcX1Qq5P9a
         Y37D5cQ3EXBu2W8MbImb7hjzIF0G3pPcBps1cLL/jUvzhp2KDZL4yEpyNfGd9HA1QOPd
         HIzd0BoNXKN/fs3lETMRU8x9KQdPGvD30sunHgXiCObPZIGrdcvZ4PdEuEeDVfmg3kJB
         2cDvRPGhOTO1qeNlyZecDRfi/qhJdzT1id3RcgOpPPSkUAM8ZHvHd1bjcz4ccYS3o7k7
         D6uA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4NeLRIgXhpioOUkGfbB4C4pT4EgsqCsnl1MDFc610IxVGvCq5ccAdS3uGx59hj1KBPSlKUU1ONtu4TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmk0VR2ITYKtoC/zGwVZ2BbwPRKGskSe0u+pYBQ29eIyh/3Zoo
	68C+Rvlt+yY9TdmEHE474rvifZ+uTYxOVh+R6pQKwa1W4Ypu5MNE+8l1
X-Gm-Gg: AfdE7claFZKdEYpnefv4CRlPLy0P4laCjZHeRcaM1J9DxNGRHZNxl3Jn7rqDnucDI6U
	bd1/5RndmRV2rl/b2iaC6tHLVqC6qr6BmbhENbgOdsS9oER0VJA5+tZDLj47fjVbh/eJ/ZQJJt0
	PKBk6JbZ1PBYZ8utThbQf/Ruxgk9BOZEnpHIY6HS/DZ87EUXh3JFLN+gIF8HrKWErd6tmD7epdN
	5oDUTLidaezFzQy8cOTOr1KYtd2bUXM6D054KRZD4UjRezXbNyeN5HrXlMxKY3ELc1KConJ/1TP
	0d5hQj7Yy2pIWjXa8vtO9w7z9pNJ605vxZ+UL4pWHE34+L7kB+JGWMxaYlR5Ae4aizwXRbC63ls
	QbyVRTsdBCUsgCtMoOkdug+o8ScxLmk/HHQy09daIMAEniizhpN0tIoNw3BLiofoAzslPLVxwaB
	TTLWj3x9lEQOroGKxto6boFgrMJGdXvcSy2xYDUrIGWth8TwY=
X-Received: by 2002:a05:6a00:94f1:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-845b3b0411cmr6499167b3a.46.1782462588250;
        Fri, 26 Jun 2026 01:29:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm6708789b3a.29.2026.06.26.01.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:29:48 -0700 (PDT)
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
Subject: [PATCH v4 5/5] ASoC: Intel: atom: Use scoped_guard() for scoped locking
Date: Fri, 26 Jun 2026 15:29:04 +0700
Message-ID: <20260626082904.32344-6-phucduc.bui@gmail.com>
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

Clean up the code using scoped_guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-atom-controls.c     | 38 ++++++++++----------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 20 ++++-------
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 701369349fb6..82df398237da 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -750,27 +750,29 @@ int sst_handle_vb_timer(struct snd_soc_dai *dai, bool enable)
 			return ret;
 	}
 
-	mutex_lock(&drv->lock);
-	if (enable)
-		timer_usage++;
-	else
-		timer_usage--;
-
-	/*
-	 * Send the command only if this call is the first enable or last
-	 * disable
-	 */
-	if ((enable && (timer_usage == 1)) ||
-	    (!enable && (timer_usage == 0))) {
-		ret = sst_fill_and_send_cmd_unlocked(drv, SST_IPC_IA_CMD,
-				SST_FLAG_BLOCKED, SST_TASK_SBA, 0, &cmd,
-				sizeof(cmd.header) + cmd.header.length);
-		if (ret && enable) {
+	scoped_guard(mutex, &drv->lock) {
+		if (enable)
+			timer_usage++;
+		else
 			timer_usage--;
-			enable  = false;
+
+		/*
+		 * Send the command only if this call is the first enable or last
+		 * disable
+		 */
+		if ((enable && timer_usage == 1) ||
+		    (!enable && timer_usage == 0)) {
+			ret = sst_fill_and_send_cmd_unlocked(drv, SST_IPC_IA_CMD,
+							     SST_FLAG_BLOCKED,
+							     SST_TASK_SBA, 0, &cmd,
+							     sizeof(cmd.header) +
+							     cmd.header.length);
+			if (ret && enable) {
+				timer_usage--;
+				enable  = false;
+			}
 		}
 	}
-	mutex_unlock(&drv->lock);
 
 	if (!enable)
 		sst->ops->power(sst->dev, false);
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index c757e4dcd7cf..9ee4d9926e06 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -304,15 +304,14 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 	spin_lock_init(&stream->status_lock);
 
 	/* get the sst ops */
-	mutex_lock(&sst_lock);
-	if (!sst ||
-	    !try_module_get(sst->dev->driver->owner)) {
-		dev_err(dai->dev, "no device available to run\n");
-		ret_val = -ENODEV;
-		goto out_ops;
+	scoped_guard(mutex, &sst_lock) {
+		if (!sst ||
+		    !try_module_get(sst->dev->driver->owner)) {
+			dev_err(dai->dev, "no device available to run\n");
+			return -ENODEV;
+		}
+		stream->ops = sst->ops;
 	}
-	stream->ops = sst->ops;
-	mutex_unlock(&sst_lock);
 
 	stream->stream_info.str_id = 0;
 
@@ -347,11 +346,6 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
-
-out_ops:
-	mutex_unlock(&sst_lock);
-
 	return ret_val;
 }
 
-- 
2.43.0

