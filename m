Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D83C2770
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327846; cv=none; b=Xh7hys0PQGo3bnGL2mvTQnsANIp6q09ce8F1mxTE8ygxCwCJLj/kDipEBasS0aNp9Dr4e5T9zdajgAli3vmjKmkLqsmer0pQ5HrXFFo94mbwR+R2V7kvfaNrFxteLZXnkCXxGM8aSBve5gJ/GCJcW7YAX522iiEE+CdcekNRsGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327846; c=relaxed/simple;
	bh=db5RJ2tmE6l/dT+o++KtVIbJ/fyYos1+O4TTVJb7K9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIMibPqEADHl4LvUEr3u0HTIeodUpB9d/JCG7D9PNDA2wJkygAofFUI884QAp612gOm/C+/pKzaKtooFqEyVzEMCEYmionx8YbeMa3OBUC6ffgNkusysdZXN96o5qeVgbGCK1IF12pOXw9D4FFLuv3SzcxtEZyzImLSEBd0+mS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXLJh4ny; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXLJh4ny"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84347ad88edso3925875b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327832; x=1783932632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1G/oBUGupjbaXr0RnxijMav+BBz6qUuhO3vayI0gEo=;
        b=cXLJh4nyH60a4q2HkqhAUJSuXAI1QQHNUCetQY8sR58iPluNMPHaYwoOPTtroouDrL
         Fu3sHer2lXnl0W9U0BIcLMB1YgSt2zpNQaeOKXNVKkBzxa56KRWTxTS30Pajy9Yy80uh
         UpaaFlV/W4T3WBS2Et4rJvjlUZzPfaLBz10yloSPXebSIp19UHh6pjH2FSykNquRTxDl
         hn3nrin6uDFxIcMli8Ih/CD0Ec6JYYJWlrQOhLMUditOeKKFyeZsefLvDrS1NicaLcn2
         lZzmZ5h8AvJJ3rI6CCVT3AiFou3f3WjFqNZjWDUD+P9jsPMy2DDy11f8pl33zvn9ijSk
         mNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327832; x=1783932632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1G/oBUGupjbaXr0RnxijMav+BBz6qUuhO3vayI0gEo=;
        b=gDdCaJHJHvzc6E96np+9WeJwUxknr38bjIvSszt+QmQ7dNuSIvOo2PXfuWT9liUQUK
         mBveNnqsVDVv8L61mY8xwFIjnIYfC2Qgbbvw7o/NS4sWgynNzfab8/vXEb8tM85gspny
         AJHuN85BJcZT1r/3fpkYyt3D9xLasDSf760HSQhopyfCppUEccRh7b3YOL+zXt4jFjap
         k87Hx0cdbymvFLEcurRYZYaJWwnjBrgadJ9HHLOo5mE7wCXFudcJd0zxrEX+aK1RSthY
         Rmvt9NYeFII0CKF17CfbZwLaevvX+KVX2Ocn727FsBCbzmuGR+ww5xd1pjYthNNGGjyO
         RDwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf+pgGyWC5m5GGX+kekwdQotZd97VlViHorgnkjlyri2KD673JMi8Ou3F8ZkBecczLJy3FCvoGuZiPfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQZWRzTkxqBjsetzOwiZoeZBjAIkn0jiUR4xSNOHwGENMDaUr
	+l8MKgei9Tjvfr/EBcphjo5erCUNOCm9FydkPZvbjLu7IwQ6wVS4D18u
X-Gm-Gg: AfdE7clW+WM7U0uvusDhrdTtVwILbm67csi6nIxGAqfZYj5ArFTo4RyswcoNGpSsVly
	e+7RvvGSm8pNfnQRTKsDuwErmz1RiR+6IIsQfQ3ktPlzo7YpLXGrLFvcBWD6jWwqI0l5zvQtQ5z
	0pxiule79FbYJvFMXc+5j4lQeqIICqmcbZGxGXmG0HzO7BylWwYJVqViJ6hb4+Rf3BX3QQcn+Rn
	4cTBkJAYO+E1LOWSjJdS40Xss2mdDBiaw/G2JAJOgCkkZIkiETYFDcpB9XJz/2S/qDg6Df/IJxA
	AY0tLs+F+NDiYEP0s+EYaFX365GjkB4X6aRfhrzhf0GxyQL/weMMS6eJrrGZ0PkBUH1zHgn5m6n
	GZpKnRiwZRZR46bvSNvqMSUrH85hZil9hdbkGnpu55y5zlk3yjmQBFB2tcDM88jnbpvuyWwX3F6
	ZNg8pQDJ1nQY0615XtgonNKG0GmHBrWX2j2T7fo/o4D0qaHs8=
X-Received: by 2002:a05:6a00:8d86:b0:847:6738:3b69 with SMTP id d2e1a72fcca58-847f6f3e6b3mr8750289b3a.47.1783327832157;
        Mon, 06 Jul 2026 01:50:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/6] ALSA: pcm: Return -ENODEV instead of -EFAULT in snd_pcm_open()
Date: Mon,  6 Jul 2026 15:49:50 +0700
Message-ID: <20260706084950.49331-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706084950.49331-1-phucduc.bui@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in snd_pcm_open(), the owning module is going
away and the device is no longer usable, so -EFAULT ("bad address") is the
wrong error. Return -ENODEV, matching the other unavailable-device paths
in this function(the NULL pcm check and the card->shutdown check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 3462cd5275a2..4fe5fab8d096 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2913,7 +2913,7 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 	if (err < 0)
 		goto __error1;
 	if (!try_module_get(pcm->card->module)) {
-		err = -EFAULT;
+		err = -ENODEV;
 		goto __error2;
 	}
 	init_waitqueue_entry(&wait, current);
-- 
2.43.0

