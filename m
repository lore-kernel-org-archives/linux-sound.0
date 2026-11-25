Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596235;
	b=gtbfgPDQkosSvuE2zJYKBIOFWIBdUmNsVAjq/9ltWDHb7cLvqaXLKraE8qvhXuIp3cad
	 5gghSFcCMevtr5pbR4dHBl4dVqp4XGL+L0yihG8it1JHbg5famC/5VA4Nnb/PdE8JSVLk
	 Nc1j3/BiRjWRR6A3ZMPgZ6Z3yNmjNaARLeQSfo+TMnJ7HZSaHRUYVNbR8IO673FH3MkBt
	 2an3r5dDK/XvdBdhTWpEEVBmqlyfMteICU/NIZkZo6j5Ti43hYJhSQ67xY0fhspBd1DeA
	 sQyMZybyMz/7mDkDd8/HQD4d5Fb/BnenLw3tnJEzZaxwWuwoYdVRZp+L7yaCAf1hghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I0dqCF/aThIiDafyh6DDh0Xjc0ZnuFb8l+reQW+4vQE=;
	b=B+BWRMQPm/sJZaPU8iKaJYH4nyXuFSEDXrh89UFHnMCW1huf6RPeKuqezO14tCdtMtps
	 WMJVDA4ONt75ZhHeRVjUB/2TyYVNvBQnmAOoTxqZehtpO5aJdEvSuk1X8wDlrtSEmw9JU
	 lvUqovutlBznPBFFcm5YleBoqdP9p99Aqsvpjfh2nXANAeELzUYOMkcLon3dC4iMhn1qp
	 ddxIy71EyTT9+j15g5yJFGCGs15RY2UzzQdvrwCXWa0sv4w7LfbZDyRT7N8H74YtVQYpS
	 dgqzmrgFM7X4amnCRg+1H/o96C5M8IDYN9zoj5hqweghHASTO6sfmKoVP75hkBaY+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCsvPD7y;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9C606A327
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E9C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCsvPD7y
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18818daa3e7so3264625c88.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596234; x=1796201034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0dqCF/aThIiDafyh6DDh0Xjc0ZnuFb8l+reQW+4vQE=;
        b=RCsvPD7yEXdkYl5Fj/SCcvUdjYbckUHnZc2iBk8ZXGQSw7ScjtM8TZux+6Vy03oHTg
         a7T/gH24lg6H5hsI6EQmh9KjGqtA4PkdcaAf1+OPQrK+1h365ITVpKElt5q6UoMY+3vG
         X9wILFPdsmhkzDi+DQYoc0J1ldNkFP9SOB1ALQP1MnxTzcBg81WmeGG+jmQ1kZVCCARC
         G9nhjkrWJ46g6UWGWzdCwIA9t7euu7C52B2lK6X88OToMZ42wnXBwwdBBAYAeA2yivh6
         Wx9Ph6tn43yf+yXe5vysulSsn4hUDu6Z57W5QEOqrCNJFNa0LodZFo85GN3cZP2YmmII
         YgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596234; x=1796201034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I0dqCF/aThIiDafyh6DDh0Xjc0ZnuFb8l+reQW+4vQE=;
        b=ZnBHG8t9MAC72Ut+Xd0OEhGx4Cp9HWOXG+7mZuApLSlybKO0ZiIrPiAo3PCoyPsjh7
         kMhvzjxdxG2es7aHq1Q/vsTMNurdWR+0Bn2mg0fS7Rd4frDeLFUjYAhOrR+D/CopBCnf
         F7D5oYUs29WSdK4DbGjszlL8wOPIbg/6JxumP3p70iKKVqNcVI9khjrCOqKHVzJx6TAB
         XY4nFBBVTFwKTbCSieIDf5WHooEezjdjdmls1VenvqraJ8oUaKLqUMpJ5ZeUsaTJrt9o
         NW5y/Nx3IlDUrVDXFaCIo8QnmvQlsis9mCFxEWATpXXjFVF+BoXGehmx19leE+FkJH2a
         HgUQ==
X-Forwarded-Encrypted: i=1; AL+hErGQFX2SN0YJ+y+Ay08jAAgfpzSPlxs91u8qkyPnDZrrBQ0xPj/UPCGBmFTPcwqyUhar+PO/kWpQS2EdFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JjtN/Hf3YodTsc4j0UX7X0l+njC3zMv1TEGN4ascqiunDUh26
	/W2id7+i4ML9U7+m6alcWz4mRU/YGOmld4IA09VXSLx2xH6AjdDuuYu7
X-Gm-Gg: AZFdTZe0xgGP0sLKDkz70WTM5yOpKUMOonfVVRyS5BSy2qZQdfkeV5HclO9by1+bSvc
	ny34aKarl/a4l4JNYItFjYUEIbMNUfeGoTx30ek3VtZBGUZEATrvVes5dK2u9ghCpttOghWdsBp
	KgI0HUg2vrVGXnsOg5WufRW1BbjK2eHq+Gy0vVnqPypx1OvYYFGYjv7vORh5miaCgu6Qpa31bNH
	hVs+VCdZ10p79OD1+xjm26yuudUo0O/FB7wVm84RbwbEWIkRPjGd59wdhXJtd0ijrivfPKAM5DT
	vvbxM/phH97jmv3KfzuDwqq6iaZuTaA+z3tnJdRN7PiX79Mp/FMQYy/HeW2XIe6Xg2Y6KEywXze
	2ZJ8W/IaBCoDG9lP2YjQhLANPpxM+DscKrhG0zXHDUlsryobzBSFVojjTGmFCYZsnckhu4l9o71
	NeJItAdM5YZjlzOuhUnyNoLjGij3N8pSAIkZd4TQyXsqiZIV+Ihhm/bCO85HOH2aNjaQQKg0Obx
	6O7etjaDsCC1QF949bTCTuJ4rkV6M4LLU/ax0ig+Ql4sZu1Yk+3i7TjZi5nmw8/trw6FiI79uvk
	OxGGgNqAlrfl88bPjvCNm6TyA8WHE0OO7CkOlfJNK1vMlTB5HVU=
X-Received: by 2002:a05:7023:a41:b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1b55691518fmr16313131c88.17.1795596234387;
        Wed, 25 Nov 2026 00:43:54 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm46168566c88.13.2026.11.25.00.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:53 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v3] ALSA: core: Reject zero major number
Date: Wed, 25 Nov 2026 08:43:24 +0000
Message-ID: <20261125084324.4151-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6bd8ijb.wl-tiwai@suse.de>
References: <87o6bd8ijb.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reject a zero major number before calling register_chrdev(),
as ALSA expects a fixed major number.

Remove the redundant major and cards_limit variables and
use snd_major and snd_ecards_limit directly with
module_param_named().

Update device number creation and character device
registration and unregistration to use snd_major.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Update the unregister_chrdev() call in alsa_sound_exit() to use snd_major.
v2:
 - Reject major=0 before calling register_chrdev().
 - Remove redundant major and cards_limit variables.
 - Use snd_major and snd_ecards_limit directly with module_param_named().
 - Update device number creation, registration and unregistration to use snd_major.

 sound/core/sound.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..4c71f2bf440a 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -18,28 +18,25 @@
 #include <linux/kmod.h>
 #include <linux/mutex.h>
 
-static int major = CONFIG_SND_MAJOR;
-int snd_major;
+int snd_major = CONFIG_SND_MAJOR;
 EXPORT_SYMBOL(snd_major);
 
-static int cards_limit = 1;
+/* this one holds the actual max. card number currently available.
+ * as default, it's identical with cards_limit option.  when more
+ * modules are loaded manually, this limit number increases, too.
+ */
+int snd_ecards_limit = 1;
+EXPORT_SYMBOL(snd_ecards_limit);
 
 MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
 MODULE_DESCRIPTION("Advanced Linux Sound Architecture driver for soundcards.");
 MODULE_LICENSE("GPL");
-module_param(major, int, 0444);
+module_param_named(major, snd_major, int, 0444);
 MODULE_PARM_DESC(major, "Major # for sound driver.");
-module_param(cards_limit, int, 0444);
+module_param_named(cards_limit, snd_ecards_limit, int, 0444);
 MODULE_PARM_DESC(cards_limit, "Count of auto-loadable soundcards.");
 MODULE_ALIAS_CHARDEV_MAJOR(CONFIG_SND_MAJOR);
 
-/* this one holds the actual max. card number currently available.
- * as default, it's identical with cards_limit option.  when more
- * modules are loaded manually, this limit number increases, too.
- */
-int snd_ecards_limit;
-EXPORT_SYMBOL(snd_ecards_limit);
-
 #ifdef CONFIG_SND_DEBUG
 struct dentry *sound_debugfs_root;
 EXPORT_SYMBOL_GPL(sound_debugfs_root);
@@ -61,7 +58,7 @@ void snd_request_card(int card)
 {
 	if (snd_card_locked(card))
 		return;
-	if (card < 0 || card >= cards_limit)
+	if (card < 0 || card >= snd_ecards_limit)
 		return;
 	request_module("snd-card-%i", card);
 }
@@ -280,7 +277,7 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 	}
 
 	preg->dev = device;
-	device->devt = MKDEV(major, minor);
+	device->devt = MKDEV(snd_major, minor);
 	err = device_add(device);
 	if (err < 0)
 		goto error;
@@ -396,18 +393,19 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
-	snd_ecards_limit = cards_limit;
+	if (!snd_major)
+		return -EINVAL;
 
-	err = register_chrdev(major, "alsa", &snd_fops);
+	err = register_chrdev(snd_major, "alsa", &snd_fops);
 	if (err < 0) {
-		pr_err("ALSA core: unable to register native major device number %d\n", major);
+		pr_err("ALSA core: unable to register native major device number %d\n",
+		       snd_major);
 		return err;
 	}
 
 	err = snd_info_init();
 	if (err < 0) {
-		unregister_chrdev(major, "alsa");
+		unregister_chrdev(snd_major, "alsa");
 		return err;
 	}
 
@@ -426,7 +424,7 @@ static void __exit alsa_sound_exit(void)
 	debugfs_remove(sound_debugfs_root);
 #endif
 	snd_info_done();
-	unregister_chrdev(major, "alsa");
+	unregister_chrdev(snd_major, "alsa");
 }
 
 subsys_initcall(alsa_sound_init);
-- 
2.55.0

