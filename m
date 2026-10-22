Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666707;
	b=BqOb1iX/Z3I8JP1PaXX+5xHVX+CoIQjn3lAf8/s7tp4qiSFyzVPyhBVlkmWc+U/HsXXH
	 IYXiKmXPWIIYiLifSEcop40SHHXT74y+VrQhxiIbnI53/jQ8nAPPB36XhDBr7ucGtc+mN
	 kGCNvzjH2dLZoD4NQT2oZKIHlcUk3Ppnm6TmbGPYniJjzgYknVMWFutvW5Xoft81IT6ar
	 o9L5KHZsQXXFj1CTC4StEqETy2XG3pe7nfdf2u7u/yguYSJeDSKbV+3Jj/8yQN+D56VhS
	 IwwIWKccYc5X9D3yykTnbvTyNgVwD/zPSxExnwA0+KczwL7NJc22WJRKz/XY0jk0IZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z3MwgKm/+4UvO+ITYM5MpQc83LJLwq1ofv4xjl5XGGs=;
	b=JWRmWQYJn5bVVQEoWuS794YnTSHKl3LNBiSUEKIDesQbCFhlMm8s2xIjCz97woiG9tF9
	 QmcBi7iGrf9MxD2lKa7/zAkDg4109iyKsHoVuXzA/5Acs9lqYQyfLnRNdcFuGfsS16NS+
	 r6mUtJrlkBivmk1AYSiWNlOxLfEkw6HuI9dDVQGHdQ6meSy56RPHA351kV9qr7tRItyGJ
	 O3SYt3vO8WlxwzniY+gPuyb8Yq7aAW00/BfoYuGOCQ5RZtgoNuRIysFyUFji5R7jyhPIi
	 7Yk86Iax1xZgRUL8yxgiOgaKZfGI9o1UQDHD9A3v6e8I0xJIZee1rqAJyAa+Ny2g9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZzNlTjb;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA0606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EA0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZzNlTjb
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so629901a12.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792666706; x=1793271506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3MwgKm/+4UvO+ITYM5MpQc83LJLwq1ofv4xjl5XGGs=;
        b=LZzNlTjbmqTV2zdBPi1O7mD6wTqP96RrJVULQ5mxD25wz7XeqwmcXQJNSOWTc/9NPe
         l7pVW3ZvIu2wJJD9h9JOuwiO/OhEnVQLPBc2rL+IMy/uOQEW00IZkUb5G48XSkEuyqC/
         sN8LPP9atenCGRfpdCDupon2HM404waKM1c+0mkzrNcBMSOJWZ8XyVSFraS27fkp6GL2
         /GaUlZChZBuhKr/KVeOS80ZIwNKaaJ0XU8jdHwvnS4eOkesc7yeFaOCVu1bv1mwepcWN
         mwZGQOP3BjH9dVQqeqyaYnIMFg+HCZYzWZJjO6cwlfnKEIhiDY4OsdnQoUHI4ZkRUoTu
         Sn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666706; x=1793271506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3MwgKm/+4UvO+ITYM5MpQc83LJLwq1ofv4xjl5XGGs=;
        b=AXh+nQ/jrJA5jTH/aB490yRxFeoEthd2B5wd419fNC+CT/ZQ2/S35XEVqUdMMtvsgl
         Wmmhko4beHf13D+AGJ45cBJ2DlhOMhK/xCNKbBrVjS/kOomJBgmhjRMEiwnKm3UGBARG
         WkaGHahRmpje7aSJbdgguJm2N15Y1ECKrb/6FxObtlz8npIvAMujcKTfXBZfEzp0PZF4
         AaaFG1lakJZuT6/IRFpKOaCH7BkZrKFbJQ6gLCWv43sSjpp0SxUBfspGkPeRw5g6p2uK
         yjdNnvsgWIg18WuL84aYSdRAGznMzF/9OAHFFZ0JAacfpnUOH7sBg8cAHVg3+za3X5B9
         o/yg==
X-Gm-Message-State: AFq9FYId0hx/gAMtWb2yv4gKtfs0vPpcwAPhqudx9+zaZhBiuk94oGHn
	Sf+fROyPfgXC7eCB2jm6ppBeLZbSdtpUwQ20fEUfPtDKgJDRHZQrg5bq
X-Gm-Gg: AYBFou3hRp6fHOZnDxYe6yPi/72yzu36wrAAzYYWEI58/0WD7px357H5XOAskth0521
	/Vqm5Qxk+kNqyTyHTKJzhW1PORR71i2pcARQZG+UYhJ202tNufl6KwTCmCM8TgaWVwRgsqrZQ7i
	qTY26MgYhTot+/VviATw+VBpSi4LDexsEgucGBgOyYN2hiyRQpIpIAzoK5DE9Y6cDZI9nd/2ebm
	+Dtvz0ghKkw+X4ZeWtgu4ZPm9Lkie0gv+jhHZX7kZf2LJkT7O6tVNk/UsbgC+fGAPUx7GVr8jIy
	9K0WUO4jAeoAaLIsOG2mUn5/bWS0Shb6qFyLFWBgPVMsMcG0CTRsPaK+emWXtAFm4cHmHMRNBba
	AWu67+Z9pZ5AtLH7+RG2YCqpvEuOt65wi0CxdVmxYN9Daxb4GVTND4PgctvyD2q7NyV9QpRBOxg
	J2Rm53EKHHS8oj6fjEtCr0bkJPs2VoYlPiwBxYcvwMbT8N0JM20N8rzp8OdbreK6uhGAErmmAlk
	6q1TBGpVugPHb+B5BWAyK7r8B2BL2Eihvfjsu7WdPJnsPEk/QI=
X-Received: by 2002:a17:903:35c6:b0:2e9:3f5a:de9b with SMTP id d9443c01a7336-2ea43d3a74amr38315375ad.9.1792666706494;
        Thu, 22 Oct 2026 03:58:26 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b412756sm22727845ad.24.2026.10.22.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:58:26 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3] ALSA: pcm: Drain proc callbacks at device disconnect
Date: Thu, 22 Oct 2026 18:58:20 +0800
Message-Id: <pm-pmb-2439c851f82c443c3600-v7-2774a482b7f03e1fef60@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Disconnecting an individual PCM leaves its proc files accessible until
snd_pcm_free_stream(). HDA codec-only sysfs unbind can take this path
while the controller and card remain registered. An open proc file pins
the card module, but does not hold a codec PCM reference.

With CONFIG_SND_VERBOSE_PROCFS, a prealloc write is buffered until file
release. Without an attached PCM runtime, its release can replace the
DMA buffer after final PCM cleanup has already freed the preallocation:

  HDA codec unbind                  prealloc file release
  ----------------                  ---------------------
  hda_codec_driver_remove()
    snd_hda_codec_disconnect_pcms()
      snd_device_disconnect()
        snd_pcm_dev_disconnect()
        /* proc nodes remain */
    snd_hda_codec_cleanup_for_unbind()
      codec_release_pcms()
        snd_device_free()
          snd_pcm_free()
            free preallocated buffer
                                    snd_info_text_entry_release()
                                      snd_pcm_lib_preallocate_proc_write()
                                        replace DMA buffer
            remove stream proc nodes
            free substream

The later proc rundown can itself invoke this buffered write and leave
the replacement allocation without a final free. A concurrent release
can also overlap the earlier buffer cleanup.

Extract snd_info_disconnect_entry() from snd_info_free_entry() to remove
proc nodes and drain callbacks without freeing the info entry objects.
Use it for both stream directions at PCM disconnect. Finish the existing
PCM state and device disconnection under open_mutex, then drop that lock
before proc rundown: even an otherwise idle proc file can run its
buffered release callback, which takes open_mutex, during proc_remove().

Keep entry ownership and final cleanup unchanged, including the saved
OSS child entries. As with existing info entry teardown, callers must
serialize registration with disconnection and release.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v3:
- Use the simpler snd_info_disconnect_entry helper suggested by Takashi and
  reuse it from snd_info_free_entry.
- Drop the persistent disconnected flag and ancestor registration checks;
  leave registration/teardown serialization to the caller.
- Complete the existing PCM state and device disconnection before dropping
  open_mutex and draining proc callbacks; export the helper and provide
  valid disabled-config stubs.

Changes in v2:
- Follow Takashi's suggestion to remove and drain stream proc nodes at PCM
  disconnect rather than only moving final buffer cleanup.
- Run proc teardown before taking open_mutex and retain info entries for
  final cleanup, including the saved OSS child entries.
- Prevent later recursive or direct descendant registration from
  republishing a disconnected subtree.

Link to v1: https://lore.kernel.org/r/pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-2439c851f82c443c3600-v6-cf4d8c3d01d51ad32b94@gmail.com

 include/sound/info.h |  2 ++
 sound/core/info.c    | 23 ++++++++++++++----
 sound/core/pcm.c     | 56 ++++++++++++++++++++++++++------------------
 3 files changed, 53 insertions(+), 28 deletions(-)

diff --git a/include/sound/info.h b/include/sound/info.h
index adbc506860d6..f216291e5c41 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -117,6 +117,7 @@ struct snd_info_entry *snd_info_create_module_entry(struct module *module,
 struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 					     const char *name,
 					     struct snd_info_entry *parent);
+void snd_info_disconnect_entry(struct snd_info_entry *entry);
 void snd_info_free_entry(struct snd_info_entry *entry);
 
 int snd_info_card_create(struct snd_card *card);
@@ -164,6 +165,7 @@ static inline int snd_info_get_line(struct snd_info_buffer *buffer, char *line,
 static inline char *snd_info_get_str(char *dest, char *src, int len) { return NULL; }
 static inline struct snd_info_entry *snd_info_create_module_entry(struct module *module, const char *name, struct snd_info_entry *parent) { return NULL; }
 static inline struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card, const char *name, struct snd_info_entry *parent) { return NULL; }
+static inline void snd_info_disconnect_entry(struct snd_info_entry *entry) { }
 static inline void snd_info_free_entry(struct snd_info_entry *entry) { ; }
 
 static inline int snd_info_card_create(struct snd_card *card) { return 0; }
diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..023b4736aa6d 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -737,6 +737,23 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
 	entry->p = NULL;
 }
 
+/**
+ * snd_info_disconnect_entry - remove proc nodes and drain their callbacks
+ * @entry: root of the info entry subtree
+ *
+ * Retains the info entries for snd_info_free_entry().  Callers must serialize
+ * registration and destruction, and must not hold locks needed by callbacks.
+ */
+void snd_info_disconnect_entry(struct snd_info_entry *entry)
+{
+	if (entry && entry->p) {
+		proc_remove(entry->p);
+		guard(mutex)(&info_mutex);
+		snd_info_clear_entries(entry);
+	}
+}
+EXPORT_SYMBOL(snd_info_disconnect_entry);
+
 /**
  * snd_info_free_entry - release the info entry
  * @entry: the info entry
@@ -749,11 +766,7 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 
 	if (!entry)
 		return;
-	if (entry->p) {
-		proc_remove(entry->p);
-		guard(mutex)(&info_mutex);
-		snd_info_clear_entries(entry);
-	}
+	snd_info_disconnect_entry(entry);
 
 	/* free all children at first */
 	list_for_each_entry_safe(p, n, &entry->children, list)
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..064df4cd3b50 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	return 0;
 }
 
+static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
+{
+	snd_info_disconnect_entry(pstr->proc_root);
+}
+
 static int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr)
 {
 	snd_info_free_entry(pstr->proc_root);
@@ -580,6 +585,7 @@ static int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream)
 
 #else /* !CONFIG_SND_VERBOSE_PROCFS */
 static inline int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr) { return 0; }
+static inline void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr) { }
 static inline int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr) { return 0; }
 static inline int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream) { return 0; }
 #endif /* CONFIG_SND_VERBOSE_PROCFS */
@@ -1094,33 +1100,37 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	int cidx;
 
 	guard(mutex)(&register_mutex);
-	guard(mutex)(&pcm->open_mutex);
-	wake_up(&pcm->open_wait);
-	list_del_init(&pcm->list);
-
-	for_each_pcm_substream(pcm, cidx, substream) {
-		snd_pcm_stream_lock_irq(substream);
-		if (substream->runtime) {
-			if (snd_pcm_running(substream))
-				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
-			/* to be sure, set the state unconditionally */
-			__snd_pcm_set_state(substream->runtime,
-					    SNDRV_PCM_STATE_DISCONNECTED);
-			wake_up(&substream->runtime->sleep);
-			wake_up(&substream->runtime->tsleep);
+	scoped_guard(mutex, &pcm->open_mutex) {
+		wake_up(&pcm->open_wait);
+		list_del_init(&pcm->list);
+
+		for_each_pcm_substream(pcm, cidx, substream) {
+			snd_pcm_stream_lock_irq(substream);
+			if (substream->runtime) {
+				if (snd_pcm_running(substream))
+					snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+				/* to be sure, set the state unconditionally */
+				__snd_pcm_set_state(substream->runtime,
+						    SNDRV_PCM_STATE_DISCONNECTED);
+				wake_up(&substream->runtime->sleep);
+				wake_up(&substream->runtime->tsleep);
+			}
+			snd_pcm_stream_unlock_irq(substream);
 		}
-		snd_pcm_stream_unlock_irq(substream);
-	}
 
-	for_each_pcm_substream(pcm, cidx, substream)
-		snd_pcm_sync_stop(substream, false);
+		for_each_pcm_substream(pcm, cidx, substream)
+			snd_pcm_sync_stop(substream, false);
 
-	pcm_call_notify(pcm, n_disconnect);
-	for (cidx = 0; cidx < 2; cidx++) {
-		if (pcm->streams[cidx].dev)
-			snd_unregister_device(pcm->streams[cidx].dev);
-		free_chmap(&pcm->streams[cidx]);
+		pcm_call_notify(pcm, n_disconnect);
+		for (cidx = 0; cidx < 2; cidx++) {
+			if (pcm->streams[cidx].dev)
+				snd_unregister_device(pcm->streams[cidx].dev);
+			free_chmap(&pcm->streams[cidx]);
+		}
 	}
+	/* Proc rundown can run release callbacks which take open_mutex. */
+	for (cidx = 0; cidx < 2; cidx++)
+		snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
 	return 0;
 }
 
-- 
2.43.0

