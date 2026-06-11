Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931B3E7BD5
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179201; cv=none; b=GhHDsjDdEpfiaclElx7t2seS5hy+nxD29kPPme6WeWAPqOKKUn67UKaWpb5OuBISGmmQ3+j88JQrRHbL6ULU1Ud5uhXWgfckJ/wU7Tr+AoZ9iUz2O+fz230hef7pzqxh0iQ7xnv7qhWGMXUefwgJIHTqd/PAwtJYBljLz78usxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179201; c=relaxed/simple;
	bh=0Qu1T0DLgWvSExG+B/f+73rXhwS6u0CS4Fx2E2X2Qn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rvt7QRfew97iGxWpBLhPgkzFGDcgiVizTvuJsGt/yJ3E6BHc9UT2cFtPFX7mhAPfcqA9zOIsdT4McY8jYxHayymlYv+uPXrKckcxofq98bOgMHj8600r+rzUFgmXMkreL4ehl9/aKoPdC6j+ut0v0RbtvUPXIhlFxwaOERR1KXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myWGZyi0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myWGZyi0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so384033a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179200; x=1781784000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp9sTV6xE4E6rCpOk32LYLzSrSoJ8rXNHMUMH4tkdXc=;
        b=myWGZyi0yGIujEuUTYfG16+rBhRUNyPZKFwLsUn9LOEoBcIjP0+CcWpUl+Cv+SrIpF
         XfOHwng0lT5X7BhKNwfWfqTSD2wwe0JxyOPS+VNO6BRRs2C8JP4vHUksBQ2rfODd9n4r
         hj7A5AxDb61aQ4t8lPpQyfMc45C2s9GL0j9OpMYAhULv+YEYJg+svsJq9srjGcqhjoC+
         djl2KDov/Szad34sH7CUNuBiFjK9uDNvHuNLdgYf3W62zhzouaYOJG/pLPfl/xByAB8p
         y1lSSplez17fUvw/Ss2YH1KoBHx1OR79vlzzCWRz7KklAyRLpSZ0vmPXCXJK5T82hzYC
         nkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179200; x=1781784000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xp9sTV6xE4E6rCpOk32LYLzSrSoJ8rXNHMUMH4tkdXc=;
        b=VwVQaiKZQ9Kp1cn20Nkkordj8XsyNNvC7Wrrl4a1bSoaIQIsPxBGgqiWVxjygJ+/Wm
         dH6aaziyFHoLJPMA13YlfNop/OryUVfcBAlL5T26470tRG0NZBOqfiq9KQr9lidGVXK5
         PC/fbffoQOVK0plRzJsm9x9EByPfA2fgI/Gzlzqxmm6vpNpUS5cwPfikLAEROV1CtO+D
         zJSRUzliRMLlfO+LIYtjRZOedyNamtWxDoo74vnw4G/5V+5q+hONLcIx/PGZbcr+wqb5
         JwnbM9HzlBuwSp8rSlXGbohH3lZwlLLmEsJ4/CaktBhxOQio+ODzmWPUC/hff0V3POzJ
         CxLA==
X-Forwarded-Encrypted: i=1; AFNElJ9iKCvoPKSPdVNmR1/NwxChGqpcbINKIkW77lCZ58OQj7mlD7NWgdYbrYOMaziKsv0aO+cGY1HLsoMGBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZP6cLV8StfvhCiklXb6VJhB+lq+e448bTs1uSV/6Dafvxk5K0
	nIPv1oaY6rUrXYMgGp214xTpo/eB8eTBE0VJSPSjHj2xjGdL00GzsgqW
X-Gm-Gg: Acq92OFRLSw0q4YuYhD9j+gXrfmQK5bsdx1uSIEN++YAC+rWMKY+bP6ObG/g6/UrNXF
	9q5MNwBr2NTiY0TnOnvcAHwcxRQ/XZUUniNJ3Tqm/dJAQCk/BRpbAJxd7sBwr9GmojnpmGxX7fs
	9vAr3FXnwZ/L3spHz0DjHkw8KFCM4+AquU+prWdxcXnj/VGdot6dby56722pAQPsfX8eZ1heDbT
	WmgEWv4Kzt3XvhrKfNlY89odZuk7SBbbaGGxCjtGZyGzdziwz8mGZVW043096zyD0ET56bB6MzH
	4Acd5WSNWBItLAMVMLSTA4H9FQl9WBsXg+dy2KZDw0xjfQE5TooclnO4FUTQ8JCp7hfe7QL5YSt
	eij8QbPf79uGq2kccLgEQcP6n4jbvWv0tShFNnN950/DkDjIGnq/F+b9ohQEpSKaTNXi1RuJSYM
	g1sC6A001wCQdO5Ep8u6Qa4ghiGHdWMTHr39BgZK1gjqTyINncYHV1ObUDb0PFo6v7GEA6
X-Received: by 2002:a17:90b:254a:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-377eba824bcmr2051152a91.5.1781179199920;
        Thu, 11 Jun 2026 04:59:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:59 -0700 (PDT)
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
Subject: [PATCH 10/20] ASoC: Intel: avs: debugfs: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:51 +0700
Message-ID: <20260611115901.80438-11-phucduc.bui@gmail.com>
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
 sound/soc/intel/avs/debugfs.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 701c247227bf..f398ebd68e13 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -251,24 +251,22 @@ static int strace_release(struct inode *inode, struct file *file)
 	union avs_notify_msg msg = AVS_NOTIFICATION(LOG_BUFFER_STATUS);
 	struct avs_dev *adev = file->private_data;
 	unsigned long resource_mask;
-	unsigned long flags, i;
+	unsigned long i;
 	u32 num_cores;
 
 	resource_mask = adev->logged_resources;
 	num_cores = adev->hw_cfg.dsp_cores;
 
-	spin_lock_irqsave(&adev->trace_lock, flags);
+	scoped_guard(spinlock_irqsave, &adev->trace_lock) {
+		/* Gather any remaining logs. */
+		for_each_set_bit(i, &resource_mask, num_cores) {
+			msg.log.core = i;
+			avs_dsp_op(adev, log_buffer_status, &msg);
+		}
 
-	/* Gather any remaining logs. */
-	for_each_set_bit(i, &resource_mask, num_cores) {
-		msg.log.core = i;
-		avs_dsp_op(adev, log_buffer_status, &msg);
+		kfifo_free(&adev->trace_fifo);
 	}
 
-	kfifo_free(&adev->trace_fifo);
-
-	spin_unlock_irqrestore(&adev->trace_lock, flags);
-
 	module_put(adev->dev->driver->owner);
 	return 0;
 }
-- 
2.43.0

