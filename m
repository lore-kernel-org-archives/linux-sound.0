Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98F396595
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668407; cv=none; b=aXElY+hU4mvYtPWpdqAz0bWdpIDrFH3zQlIxtrEfEEVqva6q1b5pIlHalPI4tLOFyxUR4PjybAb8VkliNscs5Kw0/ktE50n30OpZRDDukani/4gsS4GyVYQhr+MUbgq6pjCVQI8Eg+0Y/2KnVEW9ZErVzdum3pgb05SHfCVTnnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668407; c=relaxed/simple;
	bh=sKyQH35ghxIj5e5o1dSdTuIDLY+HV1BGPGzDv+i/p8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CVcGYIvHPP/74H9UBpxBeF5710jp/VOvJe4w7gfbzeEQFtpUcR0qOZ37jDVAyd0UUnmyO4JHZbQ+w1hN72GAOn+C3NZJOVMqHN6ZbUJlBrRsyZw5wFNDPP5fJX/TSXvS72DSexmDCAU5EPf8RLmk8dKOYhmb4PFWamyzQSpdzZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3dpIPnf; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3dpIPnf"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b4520f6b32so6416363eec.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773668405; x=1774273205; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UAkxgZR7Mfx6piu37ajKAIMdT55O/YxifamFQJCQ4oc=;
        b=V3dpIPnfZFdCaPvs8RPqCsiwjdvz+ylCixv13RnHTVsj5jElWhl++5JpFa4ritFY8j
         ipgrJ1mL66TuqyuIX45dij3I1ccthyn+2j2BWf3s6LHHiAJvq7C6z2LzXVH7yqs4y8ho
         n71jFIMucZbJGeSDUFMwNTfi3b3wOYSJFPyHJJ2MMYU/voN2DDcoIjuQp1U4wJg23052
         m2R8qq/XEbi9PK6POdfYVTxK8JgvsK4IjLfZdMgk6MlOOi7b0LaoX5uVIUDNbSgwmzcT
         4esw7GGhQvT1xHVCrii46pz1Ooj/+TnhJrwxh29uSI+zlHCea5K9bCM+HJh8l/VGNY43
         GzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668405; x=1774273205;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAkxgZR7Mfx6piu37ajKAIMdT55O/YxifamFQJCQ4oc=;
        b=gGMOPd8HcRdW3athYQ4tIVURaQCt1IZgLQN05I+DTthJ2TrD/0huo5WH5V2cALySbf
         TQdRWXv9Ip+QrkVhen9JKogk852KuOT9hpeC++sleTcaT+T9PKZZVwQOxQu/iY/3QFHY
         BJAm+X6EvbJipX3l7Vzs9gnIkwrVkU1f4e3H9Ky1Xrj2wER2q9/RLGrI1ElkBkK/6R7L
         cdm4Y6urpZK2YtkA0hhxzx00nIwGZzYldLsDIdZwJB+P2XV1pzPIhrh5v6Ait2IjNO1V
         w8gdGJB9Xu/TZ9hP4V/DoCDKrLuQhvSGokKhkzNQcpcjdTPT5AJ9xviP4qXwDSzArkMr
         VXgA==
X-Gm-Message-State: AOJu0YzR0IutnNR39+MtYo+ozvkZij7+cI361D1Mf7gF36oI+tWYQLn4
	3IXOhkAbZ8boW8q+1MiD4hAVSwiACWFvKQtVxTS+tZFUyuX9FlkonaWyVfyv3/ht
X-Gm-Gg: ATEYQzzvGpm//dcpd0ycGj+y42cZhHCvW9oCjLxXQ3roLrUs0WKUwUyrLAMs5nR1qCN
	QyfzKh56jgsEyNTe4jeC4NFIGPdF5/EXTzRfJJIaye27vr07P1OJ624xrcZTnSHTyUOOhe5lJN2
	if5qiVvzTja1eTzW++5rruMEl/7T3sWyTEzNit7eEKl+KOOLqX3yoaKvD9tyI2faBnXvWLH3DiD
	3O0oVf9Sv/vStf61XL6T4V2ypi8LZRy290PNs+KIuVm0Gf2Bfe64q33wEJIkxjRLK65ADGuGXIO
	u0YPVhZ4lWq/BGghW+YPIIZgggs7hggXafRRcl/x6WxfE67Y9hNoF4wLudeMicMHRat9mfAR+aJ
	KK9W2BjKBd2z51q7xCV6VmXVVeMxpxN9r1ZQ0eolx0RzLuTO1zIkdmKTFrWRWk8ahYabnvDlccD
	2O86IyfV4LWzRjGqLwPaErdcYAHxrxilGF9slrSF4AIl2TR9l80Dexhk1ARJFzBLjVAFqLawJ0q
	jM=
X-Received: by 2002:a05:693c:3113:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2bea547ecd8mr5393919eec.14.1773668404850;
        Mon, 16 Mar 2026 06:40:04 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3a1117sm17403792eec.3.2026.03.16.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:40:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 16 Mar 2026 10:39:38 -0300
Subject: [PATCH] ALSA: timer: keep a list of open masters for slave lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-alsa-timer-master-list-v1-1-fb95e547110a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G6hVi/oV8VBtqgE3miKC+HeLp
 2EOMw8IBSaBLnsg0MXCx56kyDOYFrvPhOySg1baqLIwaFexGHmjgJuVmLCyRPSaKjfWTd0aByk
 +A3m+/3E/vO8HAepOjGgAAAA=
X-Change-ID: 20260316-alsa-timer-master-list-f2e4db58596d
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=sKyQH35ghxIj5e5o1dSdTuIDLY+HV1BGPGzDv+i/p8s=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk7OHQlKp7s65wSoWrPH2DOdbTPYYHK/OdVbFIReikXt
 s46wVTaUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABORu83IMHnWBaYLV9857ns3
 //fC3tY+ySdPjP9nrtLS+xy27cgbi8MM/8ymHfe/O7XfctOZQ5V32h0MtKtC866+47II6VVkuVf
 4gRsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_timer_check_slave() still walks all registered timers and all open
timer instances to find a matching master for a newly opened slave.

Maintain a global list of open master instances that can accept slave
links and use it for the slave lookup path instead. This keeps the
existing matching semantics while avoiding the nested walk over
snd_timer_list and each timer open_list_head.

The reverse path in snd_timer_check_master() already scans only the
pending slave list, so this makes both lookup paths closer in shape
without changing the master/slave linking logic.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/timer.h |  1 +
 sound/core/timer.c    | 29 ++++++++++++++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/sound/timer.h b/include/sound/timer.h
index 760e132cc0cd..83bafe70cf33 100644
--- a/include/sound/timer.h
+++ b/include/sound/timer.h
@@ -102,6 +102,7 @@ struct snd_timer_instance {
 	unsigned int slave_id;
 	struct list_head open_list;
 	struct list_head active_list;
+	struct list_head master_list;
 	struct list_head ack_list;
 	struct list_head slave_list_head;
 	struct list_head slave_active_head;
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6a70df7ae019..820901d503af 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -129,6 +129,9 @@ static LIST_HEAD(snd_timer_list);
 /* list of slave instances */
 static LIST_HEAD(snd_timer_slave_list);
 
+/* list of open master instances that can accept slave links */
+static LIST_HEAD(snd_timer_master_list);
+
 /* lock for slave active lists */
 static DEFINE_SPINLOCK(slave_active_lock);
 
@@ -161,6 +164,7 @@ struct snd_timer_instance *snd_timer_instance_new(const char *owner)
 	}
 	INIT_LIST_HEAD(&timeri->open_list);
 	INIT_LIST_HEAD(&timeri->active_list);
+	INIT_LIST_HEAD(&timeri->master_list);
 	INIT_LIST_HEAD(&timeri->ack_list);
 	INIT_LIST_HEAD(&timeri->slave_list_head);
 	INIT_LIST_HEAD(&timeri->slave_active_head);
@@ -245,6 +249,12 @@ static int check_matching_master_slave(struct snd_timer_instance *master,
 	return 1;
 }
 
+static bool snd_timer_has_slave_key(const struct snd_timer_instance *timeri)
+{
+	return !(timeri->flags & SNDRV_TIMER_IFLG_SLAVE) &&
+		timeri->slave_class > SNDRV_TIMER_SCLASS_NONE;
+}
+
 /*
  * look for a master instance matching with the slave id of the given slave.
  * when found, relink the open_link of the slave.
@@ -253,19 +263,15 @@ static int check_matching_master_slave(struct snd_timer_instance *master,
  */
 static int snd_timer_check_slave(struct snd_timer_instance *slave)
 {
-	struct snd_timer *timer;
 	struct snd_timer_instance *master;
 	int err = 0;
 
-	/* FIXME: it's really dumb to look up all entries.. */
-	list_for_each_entry(timer, &snd_timer_list, device_list) {
-		list_for_each_entry(master, &timer->open_list_head, open_list) {
-			err = check_matching_master_slave(master, slave);
-			if (err != 0) /* match found or error */
-				goto out;
-		}
+	list_for_each_entry(master, &snd_timer_master_list, master_list) {
+		err = check_matching_master_slave(master, slave);
+		if (err != 0) /* match found or error */
+			goto out;
 	}
- out:
+out:
 	return err < 0 ? err : 0;
 }
 
@@ -377,6 +383,8 @@ int snd_timer_open(struct snd_timer_instance *timeri,
 	timeri->slave_id = slave_id;
 
 	list_add_tail(&timeri->open_list, &timer->open_list_head);
+	if (snd_timer_has_slave_key(timeri))
+		list_add_tail(&timeri->master_list, &snd_timer_master_list);
 	timer->num_instances++;
 	err = snd_timer_check_master(timeri);
 list_added:
@@ -431,6 +439,9 @@ static void snd_timer_close_locked(struct snd_timer_instance *timeri,
 			num_slaves--;
 	}
 
+	if (!list_empty(&timeri->master_list))
+		list_del_init(&timeri->master_list);
+
 	/* force to stop the timer */
 	snd_timer_stop(timeri);
 

---
base-commit: 6447e32cb0a0b05b75d7a591501660ac3cfe5c31
change-id: 20260316-alsa-timer-master-list-f2e4db58596d

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

