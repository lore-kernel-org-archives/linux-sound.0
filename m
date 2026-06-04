Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309A3BB11D
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 04:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780548517; cv=none; b=YOwmWiQSlr2FPABwruxxIFXEiw44A9XPquI0kV4w8xDBzoA3lrrdb9efJ8k935bhyh0uLvpI2wUY1aSzrsU5CKxYGqNGdWtmisIG+zPy0c5AR3OgjZvheDgGmm07ZI4ZroMwT5+0Do7aRRBVyp4klQE6QPeUmC0TTkSEfGDtdcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780548517; c=relaxed/simple;
	bh=VTqC5T08t5N6p9t4oNIq1rx1ZQSi6gYRVI278dTurDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mitRH8mJYpA2fhZ0jtrKDn8cqwyhwZKLwipTIaE9FlxuAu6xHtlv/3FvTY8hNqcEKfNsZ+n7MhamXrlml1Fm0bs2LoLtoqIJHpFAgIU3TdhdtyPs3cO6Dz7174AxqCnxU6mT4ieKohcK3O4N8jXoihMXra5P53fRDZlH5yb43Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIqzI6Og; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIqzI6Og"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3074adb8fcaso694296eec.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 21:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780548515; x=1781153315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOhjseitGxYyCE/0HYVcnxc2ztkwkRGdWC274GzxEno=;
        b=CIqzI6Ogk+uV3hi5lLMtNe03AyFC8Vphwmtr9kye8JbwYTyo1uloeMzYyYgwk0y7BT
         5K9Jwg1cUWNqpEwL18L/FpY6LzZWQ4ySt3Z5TDCV2DKY/RpQcwXyzc1EXTm9m154ZQ70
         cRN8A251HMj1ai90ChAMLmXnCohd5XxEHcQO1eAcewlZfOKKHUV4xCDrM+zh/agArrm5
         27MvgnXJRyoY+MCBCH8ezVc1F+HLIStYsLK/NWeoILoiGPWtDcksYy3ln/zJOwfB+6js
         U1aCQ4PTSiD0jslo1RHn01Gt1uqJw/gwxibRUfp3LN5vDbZjXysoBIquZ44hOzHdCWev
         Pmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780548515; x=1781153315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOhjseitGxYyCE/0HYVcnxc2ztkwkRGdWC274GzxEno=;
        b=cCgk3ic+4u2Ff4GavYMpW353ECT3WIB6Y7gwxCY030qA88LRAbmpvZVfVG0rvzjR32
         4l0Se/S60Z/KiXGHlZdbopXVR11Vi7K0sHcDbyZ21zyvqB4w7lSDQZDhzUVTqDB4bX82
         TxnM3zkxZ1eLdn8PQz0kJbdhlMl6Qs3ERUwnprcxs3LZUYnLEoySUP2zzLGVmJvRfFyi
         73BUkIsyhiZM07uDZ8T9XFqpYKlVDqt5cqjxQegG4lVwuE3fHWAEQD+i6NqEUUIV8EVL
         eG+GxjuaQ2S401ugikBBHwa3rPu6kd4kK0gLiaAJ4dWomD8l0KSwn++dEP9mgJeidDHu
         /+XQ==
X-Gm-Message-State: AOJu0Yw9MesrYpfRBJvw+9f1IVOEyXUmKsKKYVtDIOW8r2nwWUDp8lB4
	XoUvaC7iVxVYLvM3P5Q6ut8hGdMMwCy0p83nXrcj/SqrCA583YWYGwkB
X-Gm-Gg: Acq92OG6UjGgSxc7kUAzf6vncJKyhb8j1ErNcGYOG72144GljuIipckZ4AjpugCiquO
	L2xa0A8ES+zfAHrssugK8T42p+m+UsKXvqboilRTCX+95pSZggxWaUORsGllehyb7BnMIgsn3EU
	01FgxpqqC1DH36DfQze5CS6O4LEeZBeE5hVukNOYMMOvvt8hfmjPQbIcEgT3I7846FJQFUCjzj5
	EUTQnKGGx2+a7TW+Psn3+Z/z82Y9HZaJGXamzBtSLKX0NhZaO5kV5weQGnmqsLY1/HeS+uGvKpV
	+bXXG/W6GS380THBa7jvo8ftIfV5cdJAq5lLEc0m5wK5NW9tRfbhT7Ma5DUvBuWIncsm5Y6VZGp
	NyvvL/wxr8ogLIFALrFBonGIGHeJFDSR1Ar6QsxGmiHeFWDY273WgaPcGUGNhGlpzpycd6mQaUj
	yFfvnpeBkaiZnk2Se21/mLXeEId7R2/v0EnXdcgVTdyXA3mLZcs8mRrZxYLAfLNXWAxfsaDroFa
	g+sZcL8sdmB
X-Received: by 2002:a05:7300:4347:b0:2d1:d434:cfe3 with SMTP id 5a478bee46e88-3074f840d0amr3546539eec.0.1780548515389;
        Wed, 03 Jun 2026 21:48:35 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm3815039eec.10.2026.06.03.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:48:34 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 04 Jun 2026 01:48:14 -0300
Subject: [PATCH 3/3] ALSA: seq: oss: Use scoped cleanup for temporary MIDI
 use lock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-alsa-scoped-cleanups-v1-3-10c43152a728@gmail.com>
References: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
In-Reply-To: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3608;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=VTqC5T08t5N6p9t4oNIq1rx1ZQSi6gYRVI278dTurDM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmKzDNuaJ76WqSwYJtqEqPBnKD3nh+NU089a196uaGhf
 VdCSPf1jlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZhIWBTD//AjeyZtyw7g3PZw
 Ql6f7v/4pR8Pme6xETztJihlpKh/+SUjw6wFOa8nMuu/1b+X9mjVxhOHlHZKaRe9TWVjENgiyZI
 yiQkA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The OSS sequencer write and out-of-band paths may receive a temporary
snd_use_lock_t reference from snd_seq_oss_process_event(). This was added
to keep MIDI device data alive until events with embedded SysEx data are
dispatched.

Use a scoped cleanup helper for that temporary reference. This keeps the
lifetime rule local to the variable declaration and avoids future missing
snd_use_lock_free() paths if these event handling paths gain more exits.

No functional change is intended.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/seq/oss/seq_oss_event.h |  1 +
 sound/core/seq/oss/seq_oss_ioctl.c | 10 ++++------
 sound/core/seq/oss/seq_oss_rw.c    |  5 ++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_event.h b/sound/core/seq/oss/seq_oss_event.h
index a4524e51d0e9..54da1f810b3a 100644
--- a/sound/core/seq/oss/seq_oss_event.h
+++ b/sound/core/seq/oss/seq_oss_event.h
@@ -96,5 +96,6 @@ int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q,
 int snd_seq_oss_process_timer_event(struct seq_oss_timer *rec, union evrec *q);
 int snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *private_data, int atomic, int hop);
 
+DEFINE_FREE(seq_oss_use_lock, snd_use_lock_t *, if (_T) snd_use_lock_free(_T))
 
 #endif /* __SEQ_OSS_EVENT_H */
diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index ce7a69d52b30..f1a79776773f 100644
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -45,18 +45,17 @@ static int snd_seq_oss_oob_user(struct seq_oss_devinfo *dp, void __user *arg)
 {
 	unsigned char ev[8];
 	struct snd_seq_event tmpev;
-	snd_use_lock_t *lock = NULL;
 
 	if (copy_from_user(ev, arg, 8))
 		return -EFAULT;
 	memset(&tmpev, 0, sizeof(tmpev));
 	snd_seq_oss_fill_addr(dp, &tmpev, dp->addr.client, dp->addr.port);
 	tmpev.time.tick = 0;
-	if (!snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev, &lock)) {
+
+	snd_use_lock_t *lock __free(seq_oss_use_lock) = NULL;
+
+	if (!snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev, &lock))
 		snd_seq_oss_dispatch(dp, &tmpev, 0, 0);
-		if (lock)
-			snd_use_lock_free(lock);
-	}
 	return 0;
 }
 
@@ -178,4 +177,3 @@ snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long ca
 	}
 	return 0;
 }
-
diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index b7147ac78ee8..6e417b10a102 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -154,7 +154,6 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 {
 	int rc = 0;
 	struct snd_seq_event event;
-	snd_use_lock_t *lock = NULL;
 
 	/* if this is a timing event, process the current time */
 	if (snd_seq_oss_process_timer_event(dp->timer, rec))
@@ -166,6 +165,8 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 	event.type = SNDRV_SEQ_EVENT_NOTEOFF;
 	snd_seq_oss_fill_addr(dp, &event, dp->addr.client, dp->addr.port);
 
+	snd_use_lock_t *lock __free(seq_oss_use_lock) = NULL;
+
 	if (snd_seq_oss_process_event(dp, rec, &event, &lock))
 		return 0; /* invalid event - no need to insert queue */
 
@@ -175,8 +176,6 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 	else
 		rc = snd_seq_kernel_client_enqueue(dp->cseq, &event, opt,
 						   !is_nonblock_mode(dp->file_mode));
-	if (lock)
-		snd_use_lock_free(lock);
 	return rc;
 }
 		

-- 
2.54.0

