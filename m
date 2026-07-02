Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FC478E36
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981954; cv=none; b=FVuNv0KBBQPhwThz4lEKMd69zKTlrmBrOwZ08rHxYrLQ6YLdCn9KNEfrUyJOFW+nyXnygYvmsC76nF7dNlIkMy6/xje6dr5W7ElvekQRBbg6+wEEjYwlyGKk/oIdIqjbMpjxMlWWkMTHxgIvsK8ntj6Bk4MPwzjeUxFTvD13IW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981954; c=relaxed/simple;
	bh=evE+TvX2NtRzKjLiDuvZUfawVMgocYOWLwTcygQd0O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSgor2yfYGZmtzM/KeHhbvUE3yPyP2Lo31NOsARvUWxdyKjdJr0CkXgc0jHiQBb+lov8h51Y01GDbBq6tISEaONnGUczLHMqnCa5E7A/RLhfUbPyUPc/h04K4Lw1XI0qiT+ZyTBjl+CsjW4YNRmezn+Mr+2PWIqMwKFO60SRzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZWsEeCX; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZWsEeCX"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1096384a91.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981952; x=1783586752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUYQI+aVX/CowEJabh4Yqp4CSkcclRPBoL5+5ad+gHE=;
        b=RZWsEeCX5djRAusqgEokE7U2g+/oi4ggp+NWinMcOz89hL6ZpFnvC/G10p1C6fMprR
         vb3EZAte07p2VM8DEAKc7nfY6Xl884hm5Hv6m4xfzQaYzOFuZ6/V27aFBSC+BY/xhens
         ivKOZbYp5ByrZNSPIPpLWWN9lxyjvejzDr0PeuWu7+8XG0t0Wtox9G5Rm9kyD0LXtm3p
         xSxAytyvPgTyNopcWuISPzqhi9rxDGAdbHH27dmKe6ooHO+fIDiPTRtMJdRAkqFKM7z6
         A80LdcopYrSO+MSuZictVA3T0CjntFh5EAQ+2BpzU+BOm03zGuj1tyDUI3oXAxSYdm6J
         zrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981952; x=1783586752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUYQI+aVX/CowEJabh4Yqp4CSkcclRPBoL5+5ad+gHE=;
        b=SFfgOtQB/9/tEEd1yr3qCUQkgWhOF8Vn99JXCPsf24H3xLCA9IcEHvtXhBTT9jlCCp
         vIYds0VbYdJSZ4bbDQ4WnF/8c1D/W4Dlw5X4Zmu8fZlPgf7BH319Y89lPGIA7rv/KuRF
         cs014/UjaOFUbFpPuvjoFma5jAnQndoaCbVhrvB/Hk0Ktx5lNHdmljomdS5lebAXoLD4
         vb0UbCgMVarGMNTqBpcGeidElM6QYEXM2hQMroCv9etWUA1PM8/ehpXwbVY9XfbI4RVY
         OkbrM8ONhuMcwMaiV9t4qdJ1vkAvQkeOTxeW0+K88e/NxDXCFhHogvDedpMphcaeWkEM
         a3WA==
X-Forwarded-Encrypted: i=1; AHgh+RrglK8/nt/kOswKNJJ555wuWQeoWCSrj0bvYq1rR090k0+GG/Iy+fPKpn14cgd/UEHxboJmBarfdd4Vdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPTrLn2+iIcpoHe4rr4Vo3t3wNlVDmbIYLh1g0glTgZsYTyFIk
	FqOaqLfHWMM3N7PXxYzpwA7evxfmK1BdgfWNkBEqq3KUROW3rcCP4oth
X-Gm-Gg: AfdE7cmk3HqYM4+UClJ8nn2QCLrdKvEWfkFU8S5qTx8Edh6BvZoxr+jT0cHdPRvOTLB
	XA2pdPztW+mezcIgGprO3ybEMZ+4pL4ERWxgogqNWrcHPji4kv6iwPcKbQ8bz0CxQc9J819Uz5q
	J3N6OrQJft9zTtKkYoe1qzr81OhHPItAo8ygNOk1a0xitSEylZfjAYX7swkGsrGXbB4whiwCoPp
	wn8w6oLqghcZVOkfWJ6YZ6BkU/c6kGXCO975cpFzv+7L/OfM4PirA975Kjm2JPQdCbHh0AfaTnw
	xkCIDrcZ+ZE/hNE9t9QqNJbA8khnE5c1DOYj0tG/dC2MB6kwsbWTUY+Wk2j8b/aqqA/mT/PV8bf
	I4Ls/awnmWPfyR7S7K4MMmsGzjzDjYoYvkf236/FwMm93j12GBHtKv3fHYXDi3o/2yq9Ddc8o/b
	zxXphAvBUYRGc0Ytdg+QKyixKMu62lc6ufHzLtXLT7fdlt524=
X-Received: by 2002:a17:90b:1c8d:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-380aa260f7bmr5259098a91.29.1782981951988;
        Thu, 02 Jul 2026 01:45:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:51 -0700 (PDT)
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
Subject: [PATCH v2 7/7] ALSA: timer: Drop redundant stream_open() return check
Date: Thu,  2 Jul 2026 15:44:44 +0700
Message-ID: <20260702084445.519669-8-phucduc.bui@gmail.com>
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

The previous conversion from nonseekable_open() to stream_open() retained
the existing error check.
Since stream_open() always returns 0, remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/timer.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 51c6ac4df9f4..937d7996f7ab 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1531,11 +1531,8 @@ static int realloc_user_queue(struct snd_timer_user *tu, int size)
 static int snd_timer_user_open(struct inode *inode, struct file *file)
 {
 	struct snd_timer_user *tu;
-	int err;
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	tu = kzalloc_obj(*tu);
 	if (tu == NULL)
-- 
2.43.0

