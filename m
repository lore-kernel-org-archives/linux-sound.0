Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83C142A7BB
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981946; cv=none; b=HiOZlA44E/eTE7auphwU481n+X/ApqnAXj+ZHLB/5/CbYs2N2uZFB14CWi+/njbtM//v05dERpFRlzxDiATW2itd2KM/GH8YzXurJTjfbH58Oefqx8EMAW3/X9NGxJeLbu0RiatqwKnNQTsiGw3Cc0kobSOTDuEUCrisFHo3f9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981946; c=relaxed/simple;
	bh=4crvM8I+mi0jd9EroVSRWD+oIFzf0Zyou2RqB+XOKak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnyDUxvBiVMOSwVWEH8UB8+jz2c/TsVhhbuS6aR12UtWD8dVPuS81HhhRNxS6Tsh/9+h95j1B/U7PQl8bQorpT1Gxuy0fZ+9Ydc1l2rWBZldy8TNpZMmQpgUHjv9oaBSn1aaCuuclZqBxo+a5lIMTDp7+WUDmz+gVbNevlc1ZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dhw/MCYz; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dhw/MCYz"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso1241669a91.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981945; x=1783586745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBlJ+QeAVyM2NHg8yhIeB9ggxANOGaldtPjbK9BYxqc=;
        b=Dhw/MCYzVgoYD4iZc/5DNH/lZq8OT1FDH7Qa10EC/szvqBcQgqPPvVElA6KEHmmmQz
         rZ24hPg0GLcWDMHuycv4oPaF4dORIovE+j0gB/8CBZxyUK9Gi9istHnChEDySG3T2ETt
         p4ANZ2b9zR6nvEOtjOWx9Ng3Ljysk0iChZznsJVBuTlKxXM0FQd49fbSka6gJthieEmz
         X/BdAYU7OeEEo/n0z9X88JwjaEoyXB6VBKD5Wz8oNmYRNEfsU0kUyZ0rkIFHHFffWtws
         0lGNCyaqa9pvcgdwlkUlG/DZ+OLCp6qPgUesxN/0EpbB4HqW0duxi2rlKIQClHw67TVe
         EGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981945; x=1783586745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBlJ+QeAVyM2NHg8yhIeB9ggxANOGaldtPjbK9BYxqc=;
        b=PB2k28MKOXJjPZnQ5KeDM7z2fuShGow4eNve86dyd4qh9IYRkoz4paE0vHH3LIs7it
         jdJ8b2POl9AN37AYWMhn15MPqxrZs2IAkMmbs44xfBveVAUKNlDaLZa7GrqnRQu77m18
         EpWzSUv/zFTIObXb+fxGDFKnu3ajVVwzAVOQPXWKPJwFun/+gh4RoDG3LMoGJ2rgXol1
         /571JNCLMDmlYe1/6xwwTO6HrW1o/z8O3H11+6/T3Kby+0EhzV9e+iLb43cCKIaSFEMV
         LbSQoh3dJYRTGqs2zPnFbqnNTaDorF5K+rvZ6sFBEbIlpfASBjk1+NYgH628mZAE9/Ow
         G3kg==
X-Forwarded-Encrypted: i=1; AHgh+RoZed7UBSlFXAU+hlAdoQdOP2VeTtJtNI0HRhjBbMgERYli/UoouQIoJBeDs2MHjGXjKp4n6hmDC20A6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+l3+ECuf6qRn9/R/V1AJ6GwRVebLSzJKdL1HuhZSGmRSvz/Y
	8Dl4xpZ7OoDCipw5o9HXEaFexd4snfXUmvIMaqOKdMo50XEOdQ1W+wLA
X-Gm-Gg: AfdE7clNb5lRXoNkojncVVhuJypH34jCwIDBdOowNVOQowN15eJGg0FzrWxI+Qo+Szl
	nGOxI3IWKB831ElK7JHx52R4vGCSwzMSVIvHWwX3uuNrdn7bN0vAUlIBDEDWj0S2uMKsOGzyAUn
	y1Qrk9mwBdRu9BpRdkDkNF9GC1LFAaySQMwrV2rk4sjF7odbF8/Y5u0AqnxrnKV5tYJMAroEuyj
	cSsZnCu427+Yb4j6ip1+oH3gDmGvRFdzTC8nMljMeTD9Q54YklwZoin8V4TldPMFkZ9lzoU0QMN
	NX6MbrOh57qgfVHwYj2Bpwu5XPWb4+X+VNk2BAf7kgbixP3vJNQpdHxmtkZ/im7eIR9vFKJhY2p
	rcLjGYsBngWhlxA0pi0Tysrc1qQGxEEZ74HuHKTtKvkdh274wPxJdDsPfcaXMqn8x+APkuYr9xs
	6ggx1i65amwvIqhomKrNCGglgeeXreKSZMnF6gQ0H/gDK+h/4=
X-Received: by 2002:a17:90b:3502:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-380ba80ebf3mr4391227a91.4.1782981944929;
        Thu, 02 Jul 2026 01:45:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:44 -0700 (PDT)
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
Subject: [PATCH v2 6/7] ALSA: seq: Drop redundant stream_open() return check
Date: Thu,  2 Jul 2026 15:44:43 +0700
Message-ID: <20260702084445.519669-7-phucduc.bui@gmail.com>
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
 sound/core/seq/seq_clientmgr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 28782e1776fa..8fe872367568 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -296,11 +296,8 @@ static int snd_seq_open(struct inode *inode, struct file *file)
 	int c, mode;			/* client id */
 	struct snd_seq_client *client;
 	struct snd_seq_user_client *user;
-	int err;
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	scoped_guard(mutex, &register_mutex) {
 		client = seq_create_client1(-1, SNDRV_SEQ_DEFAULT_EVENTS);
-- 
2.43.0

