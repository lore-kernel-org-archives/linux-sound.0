Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347440;
	b=apsP7TdaP7x2hhex68eBbMYtnaYxeBFbpDJs//hEUMuvjxeN35EkraXywz2XI/E52aap
	 uzrm3QtX+e5VcbGp4Q5AeN3DqrRnFtl/A28hX8WZzHcj9hbdlgfYg58vZeKLlBUJlUpkK
	 ZWJZc+fiJlo0L5XcbOYH8C63YRKNrG0MG9gypKzSEo5eTHBJXDCS+BuNXhsmbeC41OGU/
	 7Uyys5u1Mgq953d8gZqNzuWYty71xCDmUUv3W0A3tG3slY1ugcDxew4Fjmf6VKSdevmUU
	 qPKyFC9JYpmwjY0VQcJQm5lTZs/YXAqeopvrTY/1KRtwqMl5mxUnYR0ZhrGUwV9vA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dZNJDvIaGRH6cLfzhNMYE6D8QKHsbCCKVjQ0ML4vgu4=;
	b=D6E1shKnLWZpYQP3t0iAvcOvsDmbLRXsvpiiB0GHORxlOAqEVath2mThZC87TE9kCKGk
	 RfgwE6siYUAb5u2OcqOVitYYkCIBvVEFOJX+LQ0S/7uVEKsUzLP0EByNFBYCGoPogkq9q
	 I4OsJsV65TRMQM26jj6BMbq3XcyAgwRxyKlcS7URGgBMg0Pj42P51wU1J2t/qzRNFcWVx
	 LkhecY3N+fIfNPlmkaY2hzjZdZ2JyQsw3JchuPqIWHyaJyb+o2Ezz4oJbsjR4xzxIeLv9
	 jVFo4gQET3mINIk4B2ti9Vbkf3eius40jxWeAK6bZJXFXjCthrKbl+L9H5hNYPq/j/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g5/FLv82";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBE606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5/FLv82
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so851778a91.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347439; x=1793952239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZNJDvIaGRH6cLfzhNMYE6D8QKHsbCCKVjQ0ML4vgu4=;
        b=g5/FLv82L71PHUKmY79dd5DAtvshpRKL/jrE2PwHlbLeoV0JJ0hg8GLC6vLCuC4XyS
         wcHmcp6zYJY19w7bEke7UkHXHMbLD6pITbDn7hzkVSMMzUmmj50ht2BkzwJGmC813eEl
         XWzzUkS+SbiyXXq2k3VDU1vRIE5HduQfVLUDmvNT6Hlx78tPO93soLGwsnLxrGVo1QCF
         ilwD/ngIpk8L9/QlRboiqVizEvxsYTPv+XLaHaHYgBHcjo7kGUjhqU/q8g9EjQtP5Xi9
         LL/9vUdMDdwFtGLHZH4bj1qi9a2dEhL0+GUeTb8aH8dzmZFL2oUx6zqud/9QKKVi1l2P
         FPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347439; x=1793952239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZNJDvIaGRH6cLfzhNMYE6D8QKHsbCCKVjQ0ML4vgu4=;
        b=b60NneU7zqyp0tsdcRSFJW7r0KbuzoYf0VkUoywrikYlrHe73ijnTZWHdwJECXfuoE
         02ioar/b6A6mNt10O4XTxITqOSpCIENpgMBfrtpwdDc04qnH1ytSQVBWt8djUZyf3EyZ
         wvqgKftPtzLEQxlHjzow7RtO9BNfUB56xyeKXxLV1cmcnZ5UYZdwhgN16X/E0UzU8dUC
         5X7d/OOYB7/6Lw9WqKxKPR238vaIAslbuqF4qjVRlXXxt52ByZoNtb1a+igZHD+mcOGW
         tkKwT6Q6wycjQU9bN6VGuw7GGcI2Dmf73NVBRVTvYSXiUeePca9DmNhO6RGJJRcHbolH
         wBlA==
X-Gm-Message-State: AFq9FYJrR6v4rDCxQmhcwBmyyKGfEdBI/OHnKcOZFpz0Bs7MpCgpeyv9
	n3wHKoEudvZ9SkXoVMAfN/+1hHbHaG4f8x8BEqQ+KfypCplz9+FWbdz+
X-Gm-Gg: AYBFou2M3qaSoLSrBg/+qIrlQwVA8gpMVQxYa6HCc/TBMnTbhGtiGqmjoD/SSK91ovm
	TuKWFDUEKwWllvkUn34ijyMdjhBA/QcPrmIry0D2yW9Q4aQa6BtoXvzySj+UziIFOzObm3DxA/o
	CsOgFAXbRENOe/5eXktByzJyausUp38dHJz0l8bFtKJN3vLM3jO5r3t9e9+yHt86IUDSxKQL/kS
	3IPa14T5HeMwRN1ELGGpz2eSX/QIsM1qqtElh2OjJg4xpEuMRtlYrfuhkQTuQT7NndQiF6a09Dp
	vPY/b2gLA1el1Q77Gxwn/EqbsastpsyfHAsJsws/T0w7boueGDIZhTkpuuP5LOnXSW6DHqbzMy8
	B56Eghq1hJBgdtc0w86NDBtE56XjEfREJV6cw111BwP93maRROoZfYDUsgn3+YRRurl1VJZKgvR
	RI4iahyGbNxm1w6tbzq1kY11ieeb/WjaDAm9K7GhSOtGyT7NM9esrAvKSjHVS/Kv//GDOrhVx/9
	RAn5kKMU8VK6yKpKT/S4JrrXnYHLcxpkKRUT4mKUFeHQS8mQRSHvjJCGzA6mVwMpIMcrXhud3Sf
	A0jtRXvktlBeY69RNqvVo5qa
X-Received: by 2002:a17:90b:1c0f:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3ae896d7df6mr812597a91.11.1793347438867;
        Fri, 30 Oct 2026 01:03:58 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:03:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 2/5] ALSA: core: Add the card file while looking up a minor
Date: Fri, 30 Oct 2026 16:03:40 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
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

An open looks up its device with snd_lookup_minor_data(), which takes a
card reference, and adds its file to the card with snd_card_file_add()
only afterwards. The card reference does not keep alive a device that
its driver frees while the card stays registered, as the HD-audio codec
remove does with its PCMs. A remove that waits for the files of the card
can miss an open between the lookup and snd_card_file_add().

Add snd_lookup_minor_data_file() and snd_lookup_oss_minor_data_file(),
which add the file to the card while the minor lock is still held, and
record the device data of the minor with the file. After the minor has
been unregistered, an open either has its file on the card already or
does not find the device.

Add snd_card_file_sync() to wait until the files opened for a device are
gone, and wake its waiters in snd_card_file_remove(). Waiting for the
files of one device instead of all files of the card matters, because
the card files include the control device, which a sound server keeps
open for as long as it runs.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/core.h   |  7 +++++
 sound/core/init.c      | 61 +++++++++++++++++++++++++++++++++++++-----
 sound/core/sound.c     | 34 +++++++++++++++++++++++
 sound/core/sound_oss.c | 21 +++++++++++++++
 4 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index d6584967fd49..4cecf04204f4 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -271,12 +271,16 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 			void *private_data, struct device *device);
 int snd_unregister_device(struct device *dev);
 void *snd_lookup_minor_data(unsigned int minor, int type);
+void *snd_lookup_minor_data_file(unsigned int minor, int type,
+				 struct file *file);
 
 #ifdef CONFIG_SND_OSSEMUL
 int snd_register_oss_device(int type, struct snd_card *card, int dev,
 			    const struct file_operations *f_ops, void *private_data);
 int snd_unregister_oss_device(int type, struct snd_card *card, int dev);
 void *snd_lookup_oss_minor_data(unsigned int minor, int type);
+void *snd_lookup_oss_minor_data_file(unsigned int minor, int type,
+				     struct file *file);
 #endif
 
 int snd_minor_info_init(void);
@@ -323,7 +327,10 @@ int snd_card_add_dev_attr(struct snd_card *card,
 			  const struct attribute_group *group);
 int snd_component_add(struct snd_card *card, const char *component);
 int snd_card_file_add(struct snd_card *card, struct file *file);
+int snd_card_file_add_data(struct snd_card *card, struct file *file,
+			   const void *data);
 int snd_card_file_remove(struct snd_card *card, struct file *file);
+void snd_card_file_sync(struct snd_card *card, const void *data);
 
 struct snd_card *snd_card_ref(int card);
 
diff --git a/sound/core/init.c b/sound/core/init.c
index d518cb838777..ee660dc4098b 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -24,6 +24,7 @@
 /* monitor files for graceful shutdown (hotplug) */
 struct snd_monitor_file {
 	struct file *file;
+	const void *data;	/* device data from the minor lookup, or NULL */
 	const struct file_operations *disconnected_f_op;
 	struct list_head shutdown_list;	/* still need to shutdown */
 	struct list_head list;	/* link of monitor files */
@@ -1075,17 +1076,18 @@ int snd_component_add(struct snd_card *card, const char *component)
 EXPORT_SYMBOL(snd_component_add);
 
 /**
- *  snd_card_file_add - add the file to the file list of the card
+ *  snd_card_file_add_data - add the file of a device to the file list
  *  @card: soundcard structure
  *  @file: file pointer
+ *  @data: the device data the file is opened for
  *
- *  This function adds the file to the file linked-list of the card.
- *  This linked-list is used to keep tracking the connection state,
- *  and to avoid the release of busy resources by hotplug.
+ *  Like snd_card_file_add(), but also records @data for
+ *  snd_card_file_sync().
  *
  *  Return: zero or a negative error code.
  */
-int snd_card_file_add(struct snd_card *card, struct file *file)
+int snd_card_file_add_data(struct snd_card *card, struct file *file,
+			   const void *data)
 {
 	struct snd_monitor_file *mfile;
 
@@ -1093,6 +1095,7 @@ int snd_card_file_add(struct snd_card *card, struct file *file)
 	if (mfile == NULL)
 		return -ENOMEM;
 	mfile->file = file;
+	mfile->data = data;
 	mfile->disconnected_f_op = NULL;
 	INIT_LIST_HEAD(&mfile->shutdown_list);
 	guard(spinlock)(&card->files_lock);
@@ -1104,6 +1107,22 @@ int snd_card_file_add(struct snd_card *card, struct file *file)
 	get_device(&card->card_dev);
 	return 0;
 }
+
+/**
+ *  snd_card_file_add - add the file to the file list of the card
+ *  @card: soundcard structure
+ *  @file: file pointer
+ *
+ *  This function adds the file to the file linked-list of the card.
+ *  This linked-list is used to keep tracking the connection state,
+ *  and to avoid the release of busy resources by hotplug.
+ *
+ *  Return: zero or a negative error code.
+ */
+int snd_card_file_add(struct snd_card *card, struct file *file)
+{
+	return snd_card_file_add_data(card, file, NULL);
+}
 EXPORT_SYMBOL(snd_card_file_add);
 
 /**
@@ -1135,7 +1154,7 @@ int snd_card_file_remove(struct snd_card *card, struct file *file)
 				break;
 			}
 		}
-		if (list_empty(&card->files_list))
+		if (list_empty(&card->files_list) || (found && found->data))
 			wake_up_all(&card->remove_sleep);
 	}
 	if (!found) {
@@ -1148,6 +1167,36 @@ int snd_card_file_remove(struct snd_card *card, struct file *file)
 }
 EXPORT_SYMBOL(snd_card_file_remove);
 
+static bool snd_card_has_data_file(struct snd_card *card, const void *data)
+{
+	struct snd_monitor_file *mfile;
+
+	list_for_each_entry(mfile, &card->files_list, list) {
+		if (mfile->data == data)
+			return true;
+	}
+	return false;
+}
+
+/**
+ *  snd_card_file_sync - wait until the files opened for a device are closed
+ *  @card: soundcard structure
+ *  @data: the device data registered for the minors of the device
+ *
+ *  Waits until every file added for @data by snd_lookup_minor_data_file()
+ *  or snd_lookup_oss_minor_data_file() has been removed from @card.  The
+ *  minors of the device must already be unregistered, so that no new file
+ *  can be added for it.
+ */
+void snd_card_file_sync(struct snd_card *card, const void *data)
+{
+	guard(spinlock_irq)(&card->files_lock);
+	wait_event_lock_irq(card->remove_sleep,
+			    !snd_card_has_data_file(card, data),
+			    card->files_lock);
+}
+EXPORT_SYMBOL_GPL(snd_card_file_sync);
+
 #ifdef CONFIG_PM
 /**
  * snd_power_ref_and_wait - wait until the card gets powered up
diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..94334cbc02b5 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -115,6 +115,40 @@ void *snd_lookup_minor_data(unsigned int minor, int type)
 }
 EXPORT_SYMBOL(snd_lookup_minor_data);
 
+/**
+ * snd_lookup_minor_data_file - get user data of a device and add the file
+ * @minor: the minor number
+ * @type: device type (SNDRV_DEVICE_TYPE_XXX)
+ * @file: the file being opened
+ *
+ * Like snd_lookup_minor_data(), but instead of taking a reference to the
+ * card, adds @file to the file list of the card while the minor is still
+ * registered, and records the user data for snd_card_file_sync().  The
+ * caller must call snd_card_file_remove() when it is done with the file.
+ *
+ * Return: The user data pointer if the specified device is found, %NULL if
+ * it is not found, or an error pointer if the file cannot be added.
+ */
+void *snd_lookup_minor_data_file(unsigned int minor, int type,
+				 struct file *file)
+{
+	struct snd_minor *mreg;
+	int err;
+
+	if (minor >= ARRAY_SIZE(snd_minors))
+		return NULL;
+	guard(mutex)(&sound_mutex);
+	mreg = snd_minors[minor];
+	if (!mreg || mreg->type != type || !mreg->private_data ||
+	    !mreg->card_ptr)
+		return NULL;
+	err = snd_card_file_add_data(mreg->card_ptr, file, mreg->private_data);
+	if (err < 0)
+		return ERR_PTR(err);
+	return mreg->private_data;
+}
+EXPORT_SYMBOL(snd_lookup_minor_data_file);
+
 #ifdef CONFIG_MODULES
 static struct snd_minor *autoload_device(unsigned int minor)
 {
diff --git a/sound/core/sound_oss.c b/sound/core/sound_oss.c
index 7eb49f2cada5..2f0bc481a46d 100644
--- a/sound/core/sound_oss.c
+++ b/sound/core/sound_oss.c
@@ -41,6 +41,27 @@ void *snd_lookup_oss_minor_data(unsigned int minor, int type)
 }
 EXPORT_SYMBOL(snd_lookup_oss_minor_data);
 
+/* Like snd_lookup_minor_data_file(), for OSS minors */
+void *snd_lookup_oss_minor_data_file(unsigned int minor, int type,
+				     struct file *file)
+{
+	struct snd_minor *mreg;
+	int err;
+
+	if (minor >= ARRAY_SIZE(snd_oss_minors))
+		return NULL;
+	guard(mutex)(&sound_oss_mutex);
+	mreg = snd_oss_minors[minor];
+	if (!mreg || mreg->type != type || !mreg->private_data ||
+	    !mreg->card_ptr)
+		return NULL;
+	err = snd_card_file_add_data(mreg->card_ptr, file, mreg->private_data);
+	if (err < 0)
+		return ERR_PTR(err);
+	return mreg->private_data;
+}
+EXPORT_SYMBOL(snd_lookup_oss_minor_data_file);
+
 static int snd_oss_kernel_minor(int type, struct snd_card *card, int dev)
 {
 	int minor;
-- 
2.43.0


