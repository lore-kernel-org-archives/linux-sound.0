Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551D30E0C8
	for <linux-sound@vger.kernel.org>; Wed, 24 Dec 2025 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766593607; cv=none; b=R3WL3JPHHmIeIhCZvsyMrTnk3NfSvUKkWQSfnv+e1oLC7p+5+IUboJAu0GDqlrAm/83NeuqWd6v1URhf3OzNIxluYbd/r9qgU6rJH0qYcuXfJYzDt3uFgfbvjsKq1Re7BV+eNjAhkivEXIuN0Yj7QvEJLfSep2clHiK2elzwbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766593607; c=relaxed/simple;
	bh=MpADY4H1/9EaIyzglL4HK1096jkY3MXoPy93CMhG7VI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFlitPGMe3X1ntg/xo1eyOH9mSVPpQEn7dSUGxPA3U4MGzyFk3V5cX0XtV1K88MXcQWTVd8VXXForNh1SW0PFnETMeS6+dAHNfV545cBF1ZHcLaeY0GCtzFn7iZ0NXjz6RFylci2+DJZrUi6cbL2nWH5x2OloGAPLmYeOAcTECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CYA1EB/1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CYA1EB/1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3223198f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 24 Dec 2025 08:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766593602; x=1767198402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjvNui8uf2x+1V38SwszVb0XjMPh4oFaiakgdH7Uzno=;
        b=CYA1EB/1kbHhRsiqA9rPITnAIRThSxM9DnGLGaKGmNNS5PRqmOuOi++MphckxGMBYZ
         CDWFcRHzSw9VHwzh2J4DtP6YfyDiDw2EGYhoVfZHRXG2fojXbZpFayM6m33YNTR50zco
         a0eAzCNviiV0iaXDwrRo98B90C2eYvIlJQGWABhBnxxnUm413cizTd9d+u9g/KH/DU0Q
         O/pSuN5Wp3NJKWYTkWhvwq5cfrp2dL5OVwA5ympLUskw7XBDBZM+cobUvP5hziruFkmt
         sK0HotcRb4OFgoY2/xrQhGgjdRszksFePjvM2w3MVYiCtX1EVBddyECdkoIISgNkwoIf
         M01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766593602; x=1767198402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjvNui8uf2x+1V38SwszVb0XjMPh4oFaiakgdH7Uzno=;
        b=tvI/SyGbr1vtjTYfvzZYGib+Ks0tBV4P0McgtXOhBLIlKciBHSrXCe+add1WytCm54
         9+amK4i3HMNNeaSp8rgYkql+XmZaHdif73Aa/6X95u6a7lTRMQ05iMqfUWsyr4/wOzFu
         BYf+n8Myaah6MgII3cO+wdPULAkojnRUQ9eTotjC6/32mJaz+FC1grstGYTcd+q+TYmC
         cnwC4Qdgvb7wrJg52NJI5xRQ/ifsMfPM/8vSItskDSgzDQpF8USUTa1vDdeofGBELas9
         PK2KpbBG45SNpBosybbx7Ccov2xgyIpNUZzygXo2Hg9Wo4Kxsi8ZkwVrmDUY3HQkXwnC
         nVrg==
X-Forwarded-Encrypted: i=1; AJvYcCVaNHT+KsJGEed7dHz//DL1sWpDolJd6ppaGs7YJ4+Is9ixQVBK+z+m9K53Hqv1/An7wNSTQghnLdN5SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1P1sp4r+5eOIOEYmusj7mI3V05Lcgv8CNCifu8uVd6zqTYPgO
	ePX2ujenE454KBwrZ9ad+IS3sWpHkqpl1f6O1agucTuuZ/iqo43sQx98zYrHOI/CGJc=
X-Gm-Gg: AY/fxX6Q+e7zZ2cD3ax+pxUx4IDBcqDlPong9mDN/Jafbxndrrq3edGsD48NPwJzNj8
	/5QM+64yBDz6pJzEtb6qLpOcIWsaC+dRbSu9EtWEaW4HMOBfBnWOwd0aFiGrjN7Go2gOA58AOQh
	1pSYi1u+JnlQUybUtgtcHfbPR5/4LanJAEJ5xOvP42caVaYYDxfdlVPmBxgOg4oV9iHlMTFl3fC
	2efhNTsgnhMggCw8+tGVvD8gIRk/Xs1AuX+7EWf90EW7DC99TB9KStorad81N6u+YR/bTYaqiUp
	RZ+NknFyGY5Do2LKlNr8x30gzIcf7iB6WlBhf+FONcs+rttITJrH7Que2YEE4rCutdVYqQRyD44
	TliDF6aiVx7NdsW02w5k7MW7mFFIhbrSewBmf6H0iQp2VjR1KG58TXE1+6YCPgcK9wD16aPe4QD
	L7iAxYq/IEAjxufTYiYw3DdbvyoJqVfgIFTVs=
X-Google-Smtp-Source: AGHT+IFCu50eZvBBr2W+oec47RQVvfOW6P5PuRs/XfFOVA0cuo+RwrbxG9N+vhqR7T8rBeKlQ9vuqA==
X-Received: by 2002:a05:6000:2211:b0:42f:bbc6:edab with SMTP id ffacd0b85a97d-4324e4fb405mr22339532f8f.29.1766593601769;
        Wed, 24 Dec 2025 08:26:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm34171552f8f.8.2025.12.24.08.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:26:41 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: SDCA: Replace use of system_wq with system_percpu_wq
Date: Wed, 24 Dec 2025 17:26:35 +0100
Message-ID: <20251224162635.147710-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 sound/soc/sdca/sdca_ump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
index 8aba3ff16872..96537545c1f9 100644
--- a/sound/soc/sdca/sdca_ump.c
+++ b/sound/soc/sdca/sdca_ump.c
@@ -257,6 +257,6 @@ void sdca_ump_schedule_timeout(struct delayed_work *work, unsigned int timeout_u
 	if (!timeout_us)
 		return;
 
-	queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us));
+	queue_delayed_work(system_percpu_wq, work, usecs_to_jiffies(timeout_us));
 }
 EXPORT_SYMBOL_NS_GPL(sdca_ump_schedule_timeout, "SND_SOC_SDCA");
-- 
2.52.0

