Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE193D3D02
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212283; cv=none; b=lFl24uzb/47jHr23KMXxQhzYJRC8vbvcdqa8CsxaOiP29SAggBsCCwG18zF4Yttysrp7VZxCFOzMKnZR6+Ry8VpD+x/y8rDseFBODOXAC3Qf8kObjmf1T/Ewf+Of/jMqJ7156T6Zo9Mh8S7KOyotTa6tWq9c5wUuww48jinqrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212283; c=relaxed/simple;
	bh=yQ+b0+Yh+tSw6FXpk4KFs4YQO4dkLK4m4nL24WBDiSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oX+e8hG6fy8LjrdiBnN2NZvIn6wuQaISieFX92yr38zKQalt6Wu1xZduy+EA/296Qn4K+9fVhFhYfx2w0/Ung4eXRaqkyQQyXycI+ADf0AfHZyj3EBRr0bvhfXhAa8+EtlmMGVmcY6zzM9pL9/zODtnIdopYP8842AxH+rAWVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKV77I/G; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKV77I/G"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4846247b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212281; x=1782817081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9amYXv01a25fa7AwOIHQNiRuhcOLts7ItnGhz8lHhhY=;
        b=sKV77I/GDl6s6KjgU0p5gV5/2U/BgF0fwVUpLZkAyVglDqMCkRPc9o2zbNr55VcvQL
         osEu8gffx3KHwmVs782Q/D4uHVZOqNokJNxEXrhG5O9YEmzugro9ukQYDE7XWQhxR7qu
         mTY7/vzI8JiG1dUcpeO2ezNzDAP94M+4d+SSb7PBf86UioXztWmO+E07/xvmpxFxkelX
         EmHSAIJlQfkTJMa8wwm5RYYFehpHZbHW6HjeU4POhm6rMU8jQEYkM1OKHlgIVxJj40fW
         k8i4s8MJnctDjb1tebQWDT0lXILhYe3vInStQtfJfyAetj+nv0WG91nUa0aeMpc7+miq
         GDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212281; x=1782817081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9amYXv01a25fa7AwOIHQNiRuhcOLts7ItnGhz8lHhhY=;
        b=To2l9Y9KgMFzkEGsS37pYqLxbuaSea7ag+Pi6MxYc7eUJD03cv+zqJ3jQmKdHHfwQJ
         NT2+8YLHN5M6Nr69lTsMc5ohXK8Ga68EmvTt8epZ+OosV1fNau50PPgkaVJgkdpmLTyE
         LhEuF76pWwnC0P8HgPrByh9Y6aGR53EKt2s2cWXMIg1l++f/lcoH/zU/H6XNoDIqj/2a
         mvzhw4/nmcBs5d2ZjILqnNvW+za8D9J60auPthL1feoo7/taxwRoNLnnazqgqrMxkOSQ
         pZl8IRZBZ/1z1g6KzhFVuscelsCLC/Jblgg3cZWmUtuY7JYqbz7mMiAxjnbOtU3Tn++S
         YJow==
X-Forwarded-Encrypted: i=1; AHgh+RoPV07NrARQgW4I8MrOjeCliDD5+XB9vWOnMpdZC+F0FmT/Jsfi49Tcl6BsNlM6b2C/S/k/Zj+7vGXhuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJ8COcDaNVhsCWCOsWmlzbgzg/c95M4Grr4g96NK1spDwpMvt
	KqcsnVkwcqOcOfgxp/BWBtlET05Mu9eqMNx6imXwq4/PZ2zDBDxRQ3O/
X-Gm-Gg: AfdE7cllHrByC5gGEqh+mAdV71yzhRzJ7C/tFlRdnpSYzdFl0atGinaMb4C+yMkyJHg
	K2Q0rqUW0pF/pkTiDubjPGiM3E8Mt+gtL0Z644DmkbUcDiItLKYvxWKNtsAfZsghTyMSw/ECdhB
	+GOFyuqUQNYFY5IekiAkqruS06Z7XFB9zNi/Y/MOm6RkXqYKP19VA4TMDlA3VJB6XHnYIWILPxL
	GJLE0cRxqdBJAWW06F1prKV4I0v2G1+5M8eDKqDm6RD65Pghizn48JM5uNdZ6qvS/3UJ8AyTJ3K
	ureLwTIARR7TUut3Wqq9aqYYmYBUpMlb01H+hc7ydKOAICsxnfI/A1VUQxm78X4Kxi88d8Rtfq0
	CMdSN6i+FrwS9f1cn+FP/yJTLUqcAQDdSvP1mYtuJRP/tYa/CB7evV4H/VOrqHgNg2kqHEWd/IT
	Q86j7DLfktqQKgdZslQDvrZjhoOv8b6hhPp2NDPxgNuKlKNMA=
X-Received: by 2002:a05:6a00:4fcc:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-845970fe8a1mr2476183b3a.45.1782212281503;
        Tue, 23 Jun 2026 03:58:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d68130sm12343868b3a.10.2026.06.23.03.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:58:01 -0700 (PDT)
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
Subject: [PATCH v3 4/5] ASoC: Intel: atom: Use scoped_guard() for scoped locking
Date: Tue, 23 Jun 2026 17:57:20 +0700
Message-ID: <20260623105721.25865-5-phucduc.bui@gmail.com>
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

Clean up the code using scoped_guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-atom-controls.c     | 38 ++++++++++----------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 20 ++++-------
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 3629ceaaac17..6f3a0646f6a0 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -761,27 +761,29 @@ int sst_handle_vb_timer(struct snd_soc_dai *dai, bool enable)
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
index 47823443354c..f679258a030e 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -312,15 +312,14 @@ static int sst_media_open(struct snd_pcm_substream *substream,
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
 
@@ -355,11 +354,6 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
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

