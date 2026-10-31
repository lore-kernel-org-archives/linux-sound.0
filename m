Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423690;
	b=m3XQGmSeNDUtKHeDR7TtZu4l9XEcN9bYlJZgEHjelnQHcWj8wOJsFftmcK4xghGOU0hR
	 8bjVr7Xvz6oqYApdi3FAt2gd9j5jMvtr6BVT17VlGBDNJsf1B/iYTCFKLq/Pi3Z1sMPJZ
	 NPhmzKkynlmuc6K/PlWDECWof3ziIQEG8Xa8Qc5UUfKDAazuQFath8keNi3MvVtw5X2r2
	 OzcKIPQH6tW9x3JIr1UqSWjDDBXy+riBlxmSHYPxhfMTldc4XFeaUXJVsr04V0auLkS4P
	 1oSEPILWqcZaoknP6GS00D6rKi77pcA9sV53gX5LPFyb6/1Ne8hu//jgzlg88he06Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sMk+aO1HxiMWS2A1tTKxQ3TMdAvdblT1rpmN9ngcm0s=;
	b=a1P2xHOKFd/UM9DwI2H+iG20/0b3SKi00Xl19OXslPHGOOT52uH4CBlj8z65ybV1Bbsa
	 fUAjgYDYxPQ8n8/7OXsC03Gn9dqyK7Y5/ctVtnYSbLyPkBwl7lwUDOfE05TD8ZBDQfHH8
	 ym/UJHanMHNQmS0aROyK5+5sCPLfPVGIbf6t4KU3dCMrKJBe1PybbyBLzBe32HiN8AkUW
	 zBFQsP0y07/UN1giw3mVd7Iznsh9yCK6JGAGbN3i1CvzBrV+FPCwlUpEHkFl6APcVTtLl
	 rlSJPuv9JEm1o3G1CggCKd3iHYcBWMGH3ZAaCMIfftt3dLZtf2x6JW/3RG/VU4XzVZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNKuhD1v;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2D606A31E
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 05:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E2D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNKuhD1v
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so532093a12.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 22:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423689; x=1794028489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMk+aO1HxiMWS2A1tTKxQ3TMdAvdblT1rpmN9ngcm0s=;
        b=hNKuhD1v18P75+N2/6LoF32q29CqftO9BbA1ngcl8bsBUp3Ses11WZgpAxkJgm4wTI
         EQ9zpk16WP/bREKswbWLvQ13a2FcBAZk2NHV/Gtx3hjb+UtevtHx8SBIlpCbCq9C0pJk
         qyZ4TMiWtqVfdR/qYoTvYMGRrUn+UhHYE5nRfyEHUbKLFvcjklzvw1o+p3XZyGJhEPFZ
         3IRNVJU/VsEf//hx+5SpMu/lnoS3S488tCvga8fWCEudeZaBn2lLnmBjHQEe3cWD+2bv
         RHulXCp21DrcQvFwNJxp8IzqrQV7tzwPhl14De/7MH8NHvlyewk5ZGuqfeT4OpnDHKle
         Q/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423689; x=1794028489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMk+aO1HxiMWS2A1tTKxQ3TMdAvdblT1rpmN9ngcm0s=;
        b=sxEeLg/+aH1p4ba8osKnPa6gR4NWb3CBh1YvNfDTkQodAmbH3RblueW4JOqN0pxdZl
         rcrls/KIwFpLpHmGLBK2F0XP954NsXCpxBdjBm8B5f03uBGLbvuejXLBxWlgbr68CCOf
         uOzUhNWqIX+Kzc7R198cRL1FFEGEOouoqZ/lr8M6paZmeR8shDf6j+2pH8wtG2Uf77UU
         MXiTIEUeaEFYZnaXn2JdwawadCBndqjFP/Jf2hLrggA6ujRYcI2CNq+83t5iupuHDNdf
         n+ZzzmuSykr1Y6FO6Wex485v8KR1fEp/Jkd2ZpKhPT311EFdc9Gl6MULakF9cYWI6kRK
         hvvg==
X-Gm-Message-State: AFq9FYLWO3r1dcRRLdTvc7i43nJlwqiNu7aAfc1wNuOIodyHJ9x7waZS
	MCZVzGxHDrd9YBXw00STAt9XxOdVfdCM/uoOLlIUiUHlsqTrCoa9WI3g
X-Gm-Gg: AYBFou3mXdu+TF+5yA8s5UFkyw+KI8uSj5RlyuG977iAqG3VQu5YAOsG3xs9s+2jmQX
	Dmu8VpRm26otT9X7AmhT77it2+HMkLTeJyl5OfYsiXg4IT+9zEMzeTL9YGqyP2am2PuLiLRH67e
	oK5E82FFCdwXNUknK/Fn82XEF2NN47d3wN37SPq3B4xaAOOLetttpX2x0h0Tpr876JeogYmXN5Z
	WcYfU3gofCXIwBNgv09Ewea6Qk0unm4nuhnE6pcKx7/lkUpzGhNTGb8xQkmu9gRHkfQeYih/Z4E
	grfQxWuZRnZUKxP+zTWZkfE3Cx7CMvgUHIz6B4qvkaXbSi2UVknHqdHYgVD+otl4b34xVZmN7bX
	Ltv8CoO9HSqY74FrlFPFyjSFiolQ6rp6W3rOHhvb7QYAKQ+f5G29vpm1LoeJJETrPnn6Dc7Lf1r
	d6S6oqmV2p3MMkrndgUNmDX3Od4PbNRw4PBVAu9LP+CS0dd7lBx28DISjJxhd0dO4ImBWnb0p2I
	mLtnEZ9rY9rlCYLkx51+mLmK5mu/S+/BnXSkfBzr2E9FDeeJXSEVBzVWapnM9vayV53W3K8ud8c
	lD7zQ4YW2XQLUiyMHIKfQIZqWIDzMzkvuGGkGY8VYwZvAw==
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr3451029a91.19.1793423689295;
        Fri, 30 Oct 2026 22:14:49 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:48 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 2/5] ALSA: core: Add the card file while looking up a minor
Date: Sat, 31 Oct 2026 13:14:27 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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
