Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C313DB9D
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710615; cv=none; b=VS2G+CMe4oqZX2U/SER9wadzeNYXBT3mbsjsw4Esc7QI9/wLTJ/aUB0hIbGvHvOhmX+jlCew4hWVIjHmpsV9rnIzERwAO9AGbdbwKzxYMXSsr3SGTY6/n0piXBBZH/3ZLHr1ciSylqBIpLJi4OFpcA53vOKIUsT9ofhv5NfTFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710615; c=relaxed/simple;
	bh=ReKO2Zi9I76AkOkNela/G4C96yutcdjEmcq7GWt/5U0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PsRE9jDFsjhgxvGAYTMV4/b9i5CwZKNQXKnWb7L6gVWpalcM5Qlrm1nuLbKFYINgveEilaZQsYJQZt7sN4CqXDQQD9GcLfz3pTr74UWshswbwgPNvgViCimbkihLzVJpWIdsKi/ijYaXjS1Qy/ykPOTGwOB7OK/Far1HH/9TG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DcNfMwgl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ij/cZ4Qj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DcNfMwgl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ij/cZ4Qj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DcNfMwgl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ij/cZ4Qj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DcNfMwgl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ij/cZ4Qj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FA16221CB;
	Fri, 23 Feb 2024 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQNDOA8eDYR7Nd/+4t3bWP+3iF5jfPy6jxjbNOAwyt4=;
	b=DcNfMwgl4ZoREbmYpVyJ4wy7elBYKTrshEeeLLL0CeQ6kbNXrx/Sj73fWIC1ZBbjD+BpXY
	CFXT2qJSUUGnxD90qqCnaMTy6tqjIShPS64JRm8in21e9CzumRdzCL3K4UgFCvGtgZdCpN
	bTEUf3u/dQQACf4Dd19FC0TPq/8HTUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQNDOA8eDYR7Nd/+4t3bWP+3iF5jfPy6jxjbNOAwyt4=;
	b=Ij/cZ4QjSZDi3wIo/UBRIew0QU3QkOplQE0lU9EMXnoe03u71e7yDPrM3p7Imrz3p/3s7Y
	cIVj80O+FYes9WDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQNDOA8eDYR7Nd/+4t3bWP+3iF5jfPy6jxjbNOAwyt4=;
	b=DcNfMwgl4ZoREbmYpVyJ4wy7elBYKTrshEeeLLL0CeQ6kbNXrx/Sj73fWIC1ZBbjD+BpXY
	CFXT2qJSUUGnxD90qqCnaMTy6tqjIShPS64JRm8in21e9CzumRdzCL3K4UgFCvGtgZdCpN
	bTEUf3u/dQQACf4Dd19FC0TPq/8HTUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQNDOA8eDYR7Nd/+4t3bWP+3iF5jfPy6jxjbNOAwyt4=;
	b=Ij/cZ4QjSZDi3wIo/UBRIew0QU3QkOplQE0lU9EMXnoe03u71e7yDPrM3p7Imrz3p/3s7Y
	cIVj80O+FYes9WDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41C8E132C7;
	Fri, 23 Feb 2024 17:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ELcRDtPa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 05/24] ALSA: hwdep: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:42 +0100
Message-Id: <20240223175001.24375-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

There are still a few remaining explicit mutex_lock/unlock calls, and
those are for the places where we do temporary unlock/relock, which
doesn't fit well with the guard(), so far.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/hwdep.c | 49 +++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index de7476034f2c..09e2398bb6d0 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -149,12 +149,12 @@ static int snd_hwdep_release(struct inode *inode, struct file * file)
 	struct snd_hwdep *hw = file->private_data;
 	struct module *mod = hw->card->module;
 
-	mutex_lock(&hw->open_mutex);
-	if (hw->ops.release)
-		err = hw->ops.release(hw, file);
-	if (hw->used > 0)
-		hw->used--;
-	mutex_unlock(&hw->open_mutex);
+	scoped_guard(mutex, &hw->open_mutex) {
+		if (hw->ops.release)
+			err = hw->ops.release(hw, file);
+		if (hw->used > 0)
+			hw->used--;
+	}
 	wake_up(&hw->open_wait);
 
 	snd_card_file_remove(hw->card, file);
@@ -272,8 +272,8 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
 
 			if (get_user(device, (int __user *)arg))
 				return -EFAULT;
-			mutex_lock(&register_mutex);
 
+			guard(mutex)(&register_mutex);
 			if (device < 0)
 				device = 0;
 			else if (device < SNDRV_MINOR_HWDEPS)
@@ -288,7 +288,6 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
 			}
 			if (device >= SNDRV_MINOR_HWDEPS)
 				device = -1;
-			mutex_unlock(&register_mutex);
 			if (put_user(device, (int __user *)arg))
 				return -EFAULT;
 			return 0;
@@ -296,19 +295,16 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
 	case SNDRV_CTL_IOCTL_HWDEP_INFO:
 		{
 			struct snd_hwdep_info __user *info = (struct snd_hwdep_info __user *)arg;
-			int device, err;
+			int device;
 			struct snd_hwdep *hwdep;
 
 			if (get_user(device, &info->device))
 				return -EFAULT;
-			mutex_lock(&register_mutex);
+			guard(mutex)(&register_mutex);
 			hwdep = snd_hwdep_search(card, device);
-			if (hwdep)
-				err = snd_hwdep_info(hwdep, info);
-			else
-				err = -ENXIO;
-			mutex_unlock(&register_mutex);
-			return err;
+			if (!hwdep)
+				return -ENXIO;
+			return snd_hwdep_info(hwdep, info);
 		}
 	}
 	return -ENOIOCTLCMD;
@@ -422,11 +418,9 @@ static int snd_hwdep_dev_register(struct snd_device *device)
 	struct snd_card *card = hwdep->card;
 	int err;
 
-	mutex_lock(&register_mutex);
-	if (snd_hwdep_search(card, hwdep->device)) {
-		mutex_unlock(&register_mutex);
+	guard(mutex)(&register_mutex);
+	if (snd_hwdep_search(card, hwdep->device))
 		return -EBUSY;
-	}
 	list_add_tail(&hwdep->list, &snd_hwdep_devices);
 	err = snd_register_device(SNDRV_DEVICE_TYPE_HWDEP,
 				  hwdep->card, hwdep->device,
@@ -434,7 +428,6 @@ static int snd_hwdep_dev_register(struct snd_device *device)
 	if (err < 0) {
 		dev_err(hwdep->dev, "unable to register\n");
 		list_del(&hwdep->list);
-		mutex_unlock(&register_mutex);
 		return err;
 	}
 
@@ -454,7 +447,6 @@ static int snd_hwdep_dev_register(struct snd_device *device)
 			hwdep->ossreg = 1;
 	}
 #endif
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 
@@ -464,12 +456,10 @@ static int snd_hwdep_dev_disconnect(struct snd_device *device)
 
 	if (snd_BUG_ON(!hwdep))
 		return -ENXIO;
-	mutex_lock(&register_mutex);
-	if (snd_hwdep_search(hwdep->card, hwdep->device) != hwdep) {
-		mutex_unlock(&register_mutex);
+	guard(mutex)(&register_mutex);
+	if (snd_hwdep_search(hwdep->card, hwdep->device) != hwdep)
 		return -EINVAL;
-	}
-	mutex_lock(&hwdep->open_mutex);
+	guard(mutex)(&hwdep->open_mutex);
 	wake_up(&hwdep->open_wait);
 #ifdef CONFIG_SND_OSSEMUL
 	if (hwdep->ossreg)
@@ -477,8 +467,6 @@ static int snd_hwdep_dev_disconnect(struct snd_device *device)
 #endif
 	snd_unregister_device(hwdep->dev);
 	list_del_init(&hwdep->list);
-	mutex_unlock(&hwdep->open_mutex);
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 
@@ -492,11 +480,10 @@ static void snd_hwdep_proc_read(struct snd_info_entry *entry,
 {
 	struct snd_hwdep *hwdep;
 
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	list_for_each_entry(hwdep, &snd_hwdep_devices, list)
 		snd_iprintf(buffer, "%02i-%02i: %s\n",
 			    hwdep->card->number, hwdep->device, hwdep->name);
-	mutex_unlock(&register_mutex);
 }
 
 static struct snd_info_entry *snd_hwdep_proc_entry;
-- 
2.35.3

