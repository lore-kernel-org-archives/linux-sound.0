Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659891;
	b=WiSFiSVW2ATWw4aLy+xxnzdQiiVO9XLJh7s9xW1bg9b+cNmY0dyz3NTSj02ZwV+Fe5Zn
	 4TSzZeS10R4upczEZtxHBRj3iPD14jWXuzucAYP6aJZZ23VRcSoTyzHa6Eu1UST6Vwk2O
	 5b3QAbbgcZdHyXePNKA+6+ilRDz6DNh4Ttk4UkxRY2q7V3hrLn12paH5r2TI12Vh83rtO
	 5VP37o2xquvWnBKNZlCkDYEfyRQqgAe/P7wruXj8ejInv65Mr+qhVwHBiL9UB/h9SGCD8
	 L5rfAeoYsM8kNuTsdQ6MyprxGFVH2w+yLSYxlzgkFfNwUeM78MArLO18sAcXGNHixAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ly5mY1YpdHlG2pNEDAgxsSa7OYgfPcjm8DIliwpwuw8=;
	b=d0e85yQoYxfg5kOZI2tbhraa3OaOnrRUnVeAeN1Wpbtgl+LGkNTYTZ+ggVdCXq4BNh4F
	 +yU0o4wh5S28rSIWyXxyBm+woVYeOiB3pNir2zPEaOxsOKjiqfmNq275NqhIQwW/jxidD
	 VEeFATxoW0773GQaUm+aY6hRoIzpNwV58uLC+MmzyxX0lCwbZFvzFRzpwj4cvtEAdTQZV
	 0/Lz37rvM5bRdMfBx0Gqn58MDreSUyA4QqxUOO5NnFQfsetZPkuDSMOwTfVuEbkHQqHgl
	 s/RWWUeCSFUTSaiaSnJSXoyYtO0/m5YyW+9mTswsM8qWSUsljS5UTE+wur2M394omew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HGxmun7n;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC8606A336
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CC8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HGxmun7n
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9d7791b00so7262635ad.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659890; x=1793264690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ly5mY1YpdHlG2pNEDAgxsSa7OYgfPcjm8DIliwpwuw8=;
        b=HGxmun7nCtCM1e6cnlqKTrCBjgmo42KHALITEK7i42Y388kaIDfCjBRCPelf8j1f/d
         NHJ5AOLOzhgvhg8O029t7s+/Za/JV7DuwiRgEllia1jBoYoPBdHdoJS5zaL5jVASNZ37
         mKy2HpZCpxCpkC/zi67MrlmXZrNziCV3CqFCSlQaTnkkZsLiXdyCIiEi9uEwUab2pFSm
         iPly5OzKpYWtGfwkdzOKuDioHSJ+Uqw77hfsbatn3dp6aFb3D0nff6I5J3k7pSl8jB9w
         UmGvhjg8sGtK1egoUKtEFv6wcQycCibDluyXADvSFbmUBf0ujM+nVVlCh7jQOsxCIlui
         J77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659890; x=1793264690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ly5mY1YpdHlG2pNEDAgxsSa7OYgfPcjm8DIliwpwuw8=;
        b=qxft0vwj39fMnhvg9t1nZLziEIb+slCdpnVbobYwPc5USERdEdb2sYBkZLxl/E+VJa
         Z6xKNHXzVSGxn8CWXbG1LiqxuSs1rA51hNUKYtMh6pdnI9Yo36Ot3nlpgdC5wDSPhQit
         UQ0rKnyueHakIitBwAWwox0bizvAxpYaeubpvCp1FCbVd4fC/wPz10G8IeQU3/48UKA/
         MkQfTz1ehctHI8YRksQGbe6uONU/ZA+OqMSih1e3yLeSqCFdDw+6aNli66XdozIvDUxC
         ChtELU2yWDR6lpOhvvtBmdaaK/De1ER3//fWe+tLjSUS/n2GZgAxZQ7813iG+IOVX4ax
         3cMA==
X-Gm-Message-State: AFq9FYLZVRtJ/gEaI6pEcYaJ/i5m7Y0Us32vi02bjZ0azKo5bYnOkhxh
	HwxGlQgVSZHVPiQw2Jw/r3vDqXcqli8WTTDjZGv2rxngbY5H/Y4iuqg1
X-Gm-Gg: AYBFou1Ehtalp+JhTn1GZAQwnkrM8+BYCQ8hghtdkTB7RSTuAIXJYZTKAs7vSkbV0qz
	csttEbLvPPheUKvPhuuiTib30dGRa44i1JB/LjngtHsULjftnucAf7oWwRO9hNlJus7TUt0w2He
	rAjhg5BJ0f4ZdsN8u5jFF3WICWCrMQYTz2CiIYtjzVEnpB6440bLhuPmknwZ5UJtrScrqn/mJPC
	O5YLiFeOXlB2mJRflICOS0GojAQKMhZfSL2HQMglq3YjCI/+hY3AElWlDS4ZcH+3T8kQrB9vTlB
	+3MYbQt878xiX/qsuwOU3NVYKyX5JY1cAYWqePxWZnvnh+/1f3XjLAZmkUXcwmtGx1y34okCLlB
	kIpnW3PwjRjPQH+JwZPQR67TWapgSr7W0SiRK5ywGkTRtXZX0fQV2dNvKbBcS3Qd1pfyfYSVgKX
	YebfeijWMEZfq5Ex3TGGqf5f8V4RtJTvT8WGQmR0iIEtwZs+0CmVjB5K3rn+qzs4RXc1eeXrEuj
	5tKP8N/Cr3rG3+DuftaXCb5T++o3bIGiHO2m3lMUsOlqCt1lhk=
X-Received: by 2002:a17:902:c948:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2ea43a199afmr35402125ad.24.1792659889739;
        Thu, 22 Oct 2026 02:04:49 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b307c43sm20895485ad.1.2026.10.22.02.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:04:49 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ALSA: pcm: Drain proc callbacks at device disconnect
Date: Thu, 22 Oct 2026 17:04:43 +0800
Message-Id: <pm-pmb-2439c851f82c443c3600-v6-cf4d8c3d01d51ad32b94@gmail.com>
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
while the controller and card remain registered.

With CONFIG_SND_VERBOSE_PROCFS, a prealloc write is buffered until file
release. Keep such a file open without an attached PCM runtime and unbind
the codec driver. The proc file does not hold a codec PCM reference, so
cleanup can free the preallocated buffer before the pending write runs:

  HDA codec unbind                    prealloc file release
  ----------------                    ---------------------
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

Proc rundown itself can also run this buffered write after the final
buffer cleanup, leaving its replacement allocation behind.

Remove and drain each stream's proc subtree at PCM disconnect, before
taking open_mutex, which the proc callbacks need. Retain the info entries
for their existing final cleanup: freeing the tree at disconnect would
leave the OSS child's saved proc_entry pointer dangling.

Add snd_info_disconnect() to separate proc rundown from entry freeing.
Mark the subtree disconnected and clear its proc pointers under
info_mutex, then remove the nodes outside that mutex so pending opens
can finish. Check ancestors under the same mutex when registering an
entry, preventing a later card registration or direct child registration
from republishing a disconnected subtree.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Follow Takashi's suggestion to remove and drain stream proc nodes at PCM
  disconnect rather than only moving final buffer cleanup.
- Run proc teardown before taking open_mutex and retain info entries for
  final cleanup, including the saved OSS child entries.
- Prevent later recursive or direct descendant registration from
  republishing a disconnected subtree.

Link to v1: https://lore.kernel.org/r/pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com

 include/sound/info.h |  3 +++
 sound/core/info.c    | 31 ++++++++++++++++++++++++++++++-
 sound/core/pcm.c     |  9 +++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/sound/info.h b/include/sound/info.h
index adbc506860d6..3775aed2d8ab 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -71,6 +71,7 @@ struct snd_info_entry {
 	void *private_data;
 	void (*private_free)(struct snd_info_entry *entry);
 	struct proc_dir_entry *p;
+	bool disconnected;
 	struct mutex access;
 	struct list_head children;
 	struct list_head list;
@@ -118,6 +119,7 @@ struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 					     const char *name,
 					     struct snd_info_entry *parent);
 void snd_info_free_entry(struct snd_info_entry *entry);
+void snd_info_disconnect(struct snd_info_entry *entry);
 
 int snd_info_card_create(struct snd_card *card);
 int snd_info_card_register(struct snd_card *card);
@@ -165,6 +167,7 @@ static inline char *snd_info_get_str(char *dest, char *src, int len) { return NU
 static inline struct snd_info_entry *snd_info_create_module_entry(struct module *module, const char *name, struct snd_info_entry *parent) { return NULL; }
 static inline struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card, const char *name, struct snd_info_entry *parent) { return NULL; }
 static inline void snd_info_free_entry(struct snd_info_entry *entry) { ; }
+static inline void snd_info_disconnect(struct snd_info_entry *entry) { }
 
 static inline int snd_info_card_create(struct snd_card *card) { return 0; }
 static inline int snd_info_card_register(struct snd_card *card) { return 0; }
diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..c74dd779d361 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -737,6 +737,30 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
 	entry->p = NULL;
 }
 
+/**
+ * snd_info_disconnect - remove proc nodes without freeing their info entries
+ * @entry: root of the info entry subtree
+ *
+ * Prevents registration of this subtree and drains its proc callbacks.
+ * The caller must serialize this with entry destruction and must not hold
+ * locks needed by the callbacks.  Entries remain for snd_info_free_entry().
+ */
+void snd_info_disconnect(struct snd_info_entry *entry)
+{
+	struct proc_dir_entry *p;
+
+	if (!entry)
+		return;
+
+	scoped_guard(mutex, &info_mutex) {
+		entry->disconnected = true;
+		p = entry->p;
+		snd_info_clear_entries(entry);
+	}
+	proc_remove(p);
+}
+EXPORT_SYMBOL(snd_info_disconnect);
+
 /**
  * snd_info_free_entry - release the info entry
  * @entry: the info entry
@@ -774,11 +798,16 @@ EXPORT_SYMBOL(snd_info_free_entry);
 static int __snd_info_register(struct snd_info_entry *entry)
 {
 	struct proc_dir_entry *root, *p = NULL;
+	struct snd_info_entry *parent;
 
 	if (snd_BUG_ON(!entry))
 		return -ENXIO;
-	root = entry->parent == NULL ? snd_proc_root->p : entry->parent->p;
 	guard(mutex)(&info_mutex);
+	for (parent = entry; parent; parent = parent->parent) {
+		if (parent->disconnected)
+			return 0;
+	}
+	root = !entry->parent ? snd_proc_root->p : entry->parent->p;
 	if (entry->p || !root)
 		return 0;
 	if (S_ISDIR(entry->mode)) {
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..ca1b72ba252a 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	return 0;
 }
 
+static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
+{
+	snd_info_disconnect(pstr->proc_root);
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
@@ -1094,6 +1100,9 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	int cidx;
 
 	guard(mutex)(&register_mutex);
+	/* Proc callbacks may take open_mutex, including at file release. */
+	for (cidx = 0; cidx < 2; cidx++)
+		snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
 	guard(mutex)(&pcm->open_mutex);
 	wake_up(&pcm->open_wait);
 	list_del_init(&pcm->list);
-- 
2.43.0

