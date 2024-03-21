Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7F12C52B
	for <linux-sound@vger.kernel.org>; Thu, 21 Mar 2024 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711037831; cv=none; b=DrCO1jrQC7Js++2hVkjO557CCRMnMIV+oY4g/rSglrcHnFyUpmnY7s9BA7z6F5UrgfszdCZQFPxGi9F2AEU01zewpnp0msIvrEIlq8mQmNsv5TNrPFrR4inzwAbyEFFRbt1p/b9eIEJkqhj8xsXaRV754HpPE91opTkqAWb6xNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711037831; c=relaxed/simple;
	bh=iCvxqjV8nvENU9QhU5KtACphTO4DgKMFcObGcyiE06A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAQGlQ9VJwHC48Xy4G/mbHWIQ/nK6wyx95bmxTMvpnck56hVR3pVPPajcz/Cqvd1mzcBckSjrRenca2TMIg7Z0zeGE17sHjhTS1/g6proHCUKYXXG4kg6q1BVxEuQHUHJ2OQNaKzehApw+4wb/oLkUIv8JNdF6Myq2Ury8rNKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=vUMoiJEn; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="vUMoiJEn"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-430b7b22b17so7648121cf.2
        for <linux-sound@vger.kernel.org>; Thu, 21 Mar 2024 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1711037827; x=1711642627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GblkM0rXkobGOvAznWFXNMB8PHw+JhTurN6nTmP6yek=;
        b=vUMoiJEnC/mouzRlDN62P1GJ42N5P7VgELwelDb5GEIedHAPzJqjNrN7953cuqx51y
         pXuU+SV7+Vt3h34mJcH1gORmVu/a49WJHZByQP1zRBJSoBJF/mjNSPjFzXpnWh0n3Cta
         cCkycKUPa+PRMs5eSuAAv2rTcWMECD4zoUM95FZOUAkf4v09IUuMyg3y7pim3/VdBs+P
         x/y0zjhZcrL9yJSHgs5Aeo4AdBZQ6wDtN+COZSW8sNE/hhPeLJayDZwdZaSCRY4jOTxK
         5ygSrl3dt7KgX8tKE7HQzXSK+wrFAtmt9NB3gZfI6gKGmujXn66rHeyaEAg+jEZrQhd/
         Qx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711037827; x=1711642627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GblkM0rXkobGOvAznWFXNMB8PHw+JhTurN6nTmP6yek=;
        b=mWAMm6Ez1Pu1OYlgNzC6la7MdHgrlX7UpnwEyNO2izXHPwuLksOPtB4S2IIrwoT5HQ
         r+P4YpuOEPAfxMGT/rMdN6uRrMutNrEH9dyd0ZUUFrjBDvJCZ4DDHHlep9QCAi+q8Zpe
         HdZ/bZ5kYe2UWZVmHF3YKJHP5tptFLAQUs/C236fEFS8pPyu13l3uAfWuoiv48Lkw+AW
         5FQUskt1mMFr0ShwbVjf4XdjR91enwZFb54piubT1DxWpa1iglqorYDN3Lbuo2/sHCHl
         vIEMbbDfZTU7Dv2duMNihRBER1qIvdbLDhJGMnv+vrucZgtHf5FXIoB0nhKJxG6+/Ya1
         Vsug==
X-Forwarded-Encrypted: i=1; AJvYcCU3Z8OqUHgS+kunYgHUtTesQ0DM0vH5nEBd5ckHr7vvDM1JAmGcpX4U2g2T/WlaxGxB00J116UbzkWCGMAEBNpUFyMaoWnp4mcSWYE=
X-Gm-Message-State: AOJu0YzMzGUKQYdzEyvn80YZKQYu82UQeRPqn/415HyqKp1ksIFYtEsS
	y1WNfTlEmemBsu3hhiDJitA7KqCLDQM5O9FWPxW1NMprIB9DSrRmNRE8w1CHXNDpUXlcSAyebLw
	x
X-Google-Smtp-Source: AGHT+IEkMIUX5FBkoVAsY/o5aRSeEBHHMCbQRrZJMyq82UZg8ZQv8JQaK8mGhWFKdcA1ZdOtiV9Z3w==
X-Received: by 2002:a05:622a:106:b0:431:1def:c7c5 with SMTP id u6-20020a05622a010600b004311defc7c5mr3547484qtw.43.1711037826656;
        Thu, 21 Mar 2024 09:17:06 -0700 (PDT)
Received: from localhost (2603-7000-0c01-2716-da5e-d3ff-fee7-26e7.res6.spectrum.com. [2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id e8-20020ac85988000000b0042c61b99f42sm15309qte.46.2024.03.21.09.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 09:17:05 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control: fix memory leak in snd_ctl_elem_read_user()
Date: Thu, 21 Mar 2024 12:17:00 -0400
Message-ID: <20240321161700.2926-1-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With 6.9, I noticed kmalloc-2k blowing up to tens of gigabytes over
several days. Kmemleak shows a long string of these:

unreferenced object 0xffff8f1bddbce800 (size 2048):
  comm "wireplumber", pid 1058, jiffies 4294690193
  hex dump (first 32 bytes):
    14 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00  ................
    4d 61 73 74 65 72 20 50 6c 61 79 62 61 63 6b 20  Master Playback
  backtrace (crc bd965d91):
    [<ffffffff85ac328b>] __kmalloc_node_track_caller+0x25b/0x370
    [<ffffffff85a79375>] memdup_user+0x25/0x80
    [<ffffffff85fa5d63>] snd_ctl_ioctl+0x753/0x880
    [<ffffffff85b18119>] __x64_sys_ioctl+0x89/0xb0
    [<ffffffff861ee190>] do_syscall_64+0x80/0x170
    [<ffffffff862000ab>] entry_SYSCALL_64_after_hwframe+0x46/0x4e

When 1052d9882269 ("ALSA: control: Use automatic cleanup of kfree()")
converted a few sites to automatic freeing, it removed the kfree from
snd_ctl_elem_read_user() but forgot to add the __free hook.

Fixes: 1052d9882269 ("ALSA: control: Use automatic cleanup of kfree()")
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 8367fd485371..7da0d6afb766 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1275,7 +1275,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 static int snd_ctl_elem_read_user(struct snd_card *card,
 				  struct snd_ctl_elem_value __user *_control)
 {
-	struct snd_ctl_elem_value *control;
+	struct snd_ctl_elem_value *control __free(kfree) = NULL;
 	int result;
 
 	control = memdup_user(_control, sizeof(*control));
-- 
2.44.0

