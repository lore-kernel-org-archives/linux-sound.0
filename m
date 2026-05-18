Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B283890F0
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133235; cv=none; b=iKV99xgyhj1ZgQKfl3Gk250FLBORpa8SWGAqZ/XlmC3VGbpXibywlsu+FeQL2vPDae1EVKkTBtvlp6kNQmthsKgYZItDzRfCkVRJJ0iH5q84zyATBDRicmbkA5OFkAmFujS1LSJX1Sgzbj5Ca1yu4Sm4hnQblGpuKQ43TmKYkSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133235; c=relaxed/simple;
	bh=wKXl8y8wUe+rJNJmHqOBxEz0hRo+ZGkdSMCkKFWiIbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gk3NkCAHWyl3NcqrxKNdxtFUnXuS72MPGymBTG5LsiNgQVKeTwwJmMpgy+5y5WAvHFooqjio46UKFTNtkNslYz4yTxyGgV84yLOXgiJEtNF+KjU0IXCy+UjBy9AWCRS6g4vuVWNwwStmP90pfoJBsA591zGXwxxGXlPZVZb+G6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iov1aCj1; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iov1aCj1"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8027e876fcso1115717a12.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779133230; x=1779738030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwhsmHK7kOuOjmpUhw7nH/iDxBwlkv7cOTMO53PauZM=;
        b=iov1aCj1B5kLO/CyqR41fCrLiXy/x4ERvlbv7EIJNLRkYN3MaG66fcMV43zPJhDSUd
         iyqZA3gMNcReelt+zhTwHwXY7xPnfG1rIEraltoUzzDrwXuupnYjo+Ri4DGgCJ8BEHsW
         gOU5CpCTKF+xc3bVix5X7tAF8DcHwegE8TGOAH4ynn893m5SPJPtD9RJjL9D/4Bk36bX
         zXkhvKlby+DoquapRurYImVZmmF2s4++Thrfz3KA/8i7WVvMAjDXO563xdUUDtXWEHTX
         dYt06aeGd+TJHZoo3/OHYUSe+t2zWhTCWKKr9j9UPqNJbgdaPl+fLYXg4eLEZRA6A0bs
         HGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779133230; x=1779738030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwhsmHK7kOuOjmpUhw7nH/iDxBwlkv7cOTMO53PauZM=;
        b=Zmss8rHyGkFlLmfXp+JeQnA0jj+4CMp4DnR7PuMXJBcmTmC60EfL8qMypJrfOVAxI2
         DgDJtOsAKTfxXvfxoBL67VQRmu43gFYp4BiEuoJBUVPMilU12j5mpNd2e123qLs+EK3A
         6Mv3BnLrm2yOetCryUljF3E54B9S4c9D0pQzlgRsthb7HSQLXuydE4owQseh05vQnsT6
         huI8NtPyRVfPRCnwRLRCvFHY2ojD9MG6SSikC4O0yksvc2bxrhXy3TkYVKlAul0IHub4
         WWKlhGRLdNJeQfwf9NWSeoTUhaI+ZkjKZA+Vlmlx04ufj8cXg4hIJIx+9R+S4bLHVU4n
         uScA==
X-Gm-Message-State: AOJu0YyZCOIcL7/n5tXWDYmFr5WC5RQ3C/2ooJ4qMxhHCQzsrYjIychG
	oiYq06zbZRBHBUQ+tOxSIkpw2d7Qk+ZqqOkCFUj1EEDDyqxW+UKXXVPfmDFX7Q==
X-Gm-Gg: Acq92OGrDS9OJIuvFnAWQiUKLTGy6c7Rsr7tv6YjYyjnU3kQdRwYtIMSF5nirVUbL8E
	4eHtB4lGHz0rXUssnZajtyt/lklbggA4ZdN2HwxnWcwre8cf9m+0ECt3Pq9egaeCZHMdj9OsCWY
	bHcKfGqWcZheug4AJqZSlZ/kV/WPwMYk/cTjtcvbD0NNvUh8t2xdeeuWWwYE4SERpAyZi45JSmi
	thnTbmtAwYI5DUkjQfZxtP/ZJliac/Ou1tXNJQt72SHRhYoBQdb3N8cBboIZhOmU1zJWoXeDne/
	3kmfoxPXFktIlmRHzGDNH0jXsNYx2FO+Xdl3CthXpI63oG2g4PwrOiq//6cajqN6VI0UTJ4FKeR
	HVtLY6TRnJAM5/mYiU5/6rDzb/Y4TuGR9sagvVfOaFZh8UFYqK9dA0GGNCu1gfuLghcZuEWjAkd
	LMCzLpBR12SSxDyszC3XeJVAyU6sgTge7670wCEDaHimaNiiWP2sQHtihKUm8=
X-Received: by 2002:a05:6a20:7f93:b0:3aa:60e0:b2ed with SMTP id adf61e73a8af0-3b22ebc68ddmr18073852637.27.1779133230087;
        Mon, 18 May 2026 12:40:30 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2fesm14237808a12.9.2026.05.18.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:40:29 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: timer: avoid past-the-end iterator in snd_timer_dev_register()
Date: Tue, 19 May 2026 03:40:22 +0800
Message-Id: <20260518194023.1667857-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518194023.1667857-1-maoyixie.tju@gmail.com>
References: <87o6ic4izy.wl-tiwai@suse.de>
 <20260518194023.1667857-1-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_timer_dev_register() walks snd_timer_list looking for the
ordered insertion point and on loop fall-through passes
&timer1->device_list to list_add_tail():

    list_for_each_entry(timer1, &snd_timer_list, device_list) {
            ...
            break;        /* on found-position */
            ...
    }
    list_add_tail(&timer->device_list, &timer1->device_list);

When the loop walks all entries without break, timer1 is
past-the-end. &timer1->device_list aliases &snd_timer_list (the
list head) via container_of offset cancellation, so the insert
lands at the list tail. That is the intended behaviour, but the
access is undefined per C11 even though it works in practice.

Track an explicit insert_before pointer initialised to the list
head and overwritten to &timer1->device_list only when the loop
breaks early. The observable behaviour is unchanged.

Fixes: 9244b2c3079f ("[ALSA] alsa core: convert to list_for_each_entry*")
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 sound/core/timer.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

--- a/sound/core/timer.c	2026-05-18 19:17:08.274971549 +0800
+++ b/sound/core/timer.c	2026-05-18 19:17:46.598676455 +0800
@@ -1007,6 +1007,7 @@
 {
 	struct snd_timer *timer = dev->device_data;
 	struct snd_timer *timer1;
+	struct list_head *insert_before = &snd_timer_list;
 
 	if (snd_BUG_ON(!timer || !timer->hw.start || !timer->hw.stop))
 		return -ENXIO;
@@ -1016,28 +1017,36 @@
 
 	guard(mutex)(&register_mutex);
 	list_for_each_entry(timer1, &snd_timer_list, device_list) {
-		if (timer1->tmr_class > timer->tmr_class)
+		if (timer1->tmr_class > timer->tmr_class) {
+			insert_before = &timer1->device_list;
 			break;
+		}
 		if (timer1->tmr_class < timer->tmr_class)
 			continue;
 		if (timer1->card && timer->card) {
-			if (timer1->card->number > timer->card->number)
+			if (timer1->card->number > timer->card->number) {
+				insert_before = &timer1->device_list;
 				break;
+			}
 			if (timer1->card->number < timer->card->number)
 				continue;
 		}
-		if (timer1->tmr_device > timer->tmr_device)
+		if (timer1->tmr_device > timer->tmr_device) {
+			insert_before = &timer1->device_list;
 			break;
+		}
 		if (timer1->tmr_device < timer->tmr_device)
 			continue;
-		if (timer1->tmr_subdevice > timer->tmr_subdevice)
+		if (timer1->tmr_subdevice > timer->tmr_subdevice) {
+			insert_before = &timer1->device_list;
 			break;
+		}
 		if (timer1->tmr_subdevice < timer->tmr_subdevice)
 			continue;
 		/* conflicts.. */
 		return -EBUSY;
 	}
-	list_add_tail(&timer->device_list, &timer1->device_list);
+	list_add_tail(&timer->device_list, insert_before);
 	return 0;
 }
 
-- 
2.34.1
