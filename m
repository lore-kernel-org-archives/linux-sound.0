Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD83FE47
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=PMPpaL5wrqHDNFdr51Xf6ccpBOzjevwBjCtbD8u/KfpEU+4UGzRbOoWTHsuFdEEmpfRNq1Ax5yNDpr4m2RJYLCov0qXeG68/Lv+MbM2eYZca84nEAjJa2PDhK4JbuMiYXUOzHvtiOws5XZeU9/ahrp9us+Txq8RNk/ZRBvV3rjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=goxJHjhQ0hO8kobsOFUIsqj/UydaE19RqOFquOcGia8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y5PgQyQPrjAPd8ggo375Qn5CW7NTHIoeILbr8b5pz5ioJwixavkaBHOiY3sXqgLkFFM9uLzbJwWmCl1FbM/zqQe1jwHfJNOs4Xape3OeJCVawPA7suko5TeRVxl8DcY+ZCk+y3UFAaWs0EKR3gdfemU1CdBcLSS/fb4Qoc4u53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j2JjgQRe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w/BCoSP9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j2JjgQRe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w/BCoSP9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j2JjgQRe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w/BCoSP9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j2JjgQRe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w/BCoSP9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9341C222C7;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DprHbQrli7MkE0KaOfQRuhcFcM76VsPF09onaI+K3/E=;
	b=j2JjgQReSCUD6ihagFgyNMxAHn9/UMrLD/FC90qmcRhFj6JjxAgiSFwqGFedFBYS/K8XHD
	r8tr9oSZaZrI7zl0+QkOEd+wUH43sWnsiNxWg9s5fWaWtg6KxwRYnGbHNp0+y17KQ2WHRF
	sMz4Ph8KXPfsoi8lvBmzEg5MgTWeW3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DprHbQrli7MkE0KaOfQRuhcFcM76VsPF09onaI+K3/E=;
	b=w/BCoSP9jQfizU8sEg/8gvhfu4wVbnWbJU5kQb22dcJzKB867bfXH0B3pxuTyI7HsBwKR9
	wVkjR6gmhnQ0NWAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DprHbQrli7MkE0KaOfQRuhcFcM76VsPF09onaI+K3/E=;
	b=j2JjgQReSCUD6ihagFgyNMxAHn9/UMrLD/FC90qmcRhFj6JjxAgiSFwqGFedFBYS/K8XHD
	r8tr9oSZaZrI7zl0+QkOEd+wUH43sWnsiNxWg9s5fWaWtg6KxwRYnGbHNp0+y17KQ2WHRF
	sMz4Ph8KXPfsoi8lvBmzEg5MgTWeW3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DprHbQrli7MkE0KaOfQRuhcFcM76VsPF09onaI+K3/E=;
	b=w/BCoSP9jQfizU8sEg/8gvhfu4wVbnWbJU5kQb22dcJzKB867bfXH0B3pxuTyI7HsBwKR9
	wVkjR6gmhnQ0NWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7886413A8C;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ALNJHMMs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/9] ALSA: control: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:02 +0100
Message-Id: <20240222111509.28390-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j2JjgQRe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="w/BCoSP9"
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: 9341C222C7
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

A caveat is that some allocations are memdup_user() and they return an
error pointer instead of NULL.  Those need special cares and the value
has to be cleared with no_free_ptr() at the allocation error path.

Other than that, the conversions are straightforward.

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c        | 23 +++++--------
 sound/core/control_compat.c | 69 ++++++++++++++-----------------------
 2 files changed, 34 insertions(+), 58 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 59c8658966d4..c8cd70aed6af 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -932,7 +932,7 @@ EXPORT_SYMBOL(snd_ctl_find_id);
 static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 			     unsigned int cmd, void __user *arg)
 {
-	struct snd_ctl_card_info *info;
+	struct snd_ctl_card_info *info __free(kfree) = NULL;
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info)
@@ -946,11 +946,8 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 	strscpy(info->mixername, card->mixername, sizeof(info->mixername));
 	strscpy(info->components, card->components, sizeof(info->components));
 	up_read(&snd_ioctl_rwsem);
-	if (copy_to_user(arg, info, sizeof(struct snd_ctl_card_info))) {
-		kfree(info);
+	if (copy_to_user(arg, info, sizeof(struct snd_ctl_card_info)))
 		return -EFAULT;
-	}
-	kfree(info);
 	return 0;
 }
 
@@ -1339,12 +1336,10 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 
 	result = snd_ctl_elem_read(card, control);
 	if (result < 0)
-		goto error;
+		return result;
 
 	if (copy_to_user(_control, control, sizeof(*control)))
-		result = -EFAULT;
- error:
-	kfree(control);
+		return -EFAULT;
 	return result;
 }
 
@@ -1406,23 +1401,21 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 				   struct snd_ctl_elem_value __user *_control)
 {
-	struct snd_ctl_elem_value *control;
+	struct snd_ctl_elem_value *control __free(kfree) = NULL;
 	struct snd_card *card;
 	int result;
 
 	control = memdup_user(_control, sizeof(*control));
 	if (IS_ERR(control))
-		return PTR_ERR(control);
+		return PTR_ERR(no_free_ptr(control));
 
 	card = file->card;
 	result = snd_ctl_elem_write(card, file, control);
 	if (result < 0)
-		goto error;
+		return result;
 
 	if (copy_to_user(_control, control, sizeof(*control)))
-		result = -EFAULT;
- error:
-	kfree(control);
+		return -EFAULT;
 	return result;
 }
 
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 63d787501066..8392183c77ed 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -79,61 +79,56 @@ struct snd_ctl_elem_info32 {
 static int snd_ctl_elem_info_compat(struct snd_ctl_file *ctl,
 				    struct snd_ctl_elem_info32 __user *data32)
 {
-	struct snd_ctl_elem_info *data;
+	struct snd_ctl_elem_info *data __free(kfree) = NULL;
 	int err;
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (! data)
 		return -ENOMEM;
 
-	err = -EFAULT;
 	/* copy id */
 	if (copy_from_user(&data->id, &data32->id, sizeof(data->id)))
-		goto error;
+		return -EFAULT;
 	/* we need to copy the item index.
 	 * hope this doesn't break anything..
 	 */
 	if (get_user(data->value.enumerated.item, &data32->value.enumerated.item))
-		goto error;
+		return -EFAULT;
 
 	err = snd_ctl_elem_info(ctl, data);
 	if (err < 0)
-		goto error;
+		return err;
 	/* restore info to 32bit */
-	err = -EFAULT;
 	/* id, type, access, count */
 	if (copy_to_user(&data32->id, &data->id, sizeof(data->id)) ||
 	    copy_to_user(&data32->type, &data->type, 3 * sizeof(u32)))
-		goto error;
+		return -EFAULT;
 	if (put_user(data->owner, &data32->owner))
-		goto error;
+		return -EFAULT;
 	switch (data->type) {
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
 		if (put_user(data->value.integer.min, &data32->value.integer.min) ||
 		    put_user(data->value.integer.max, &data32->value.integer.max) ||
 		    put_user(data->value.integer.step, &data32->value.integer.step))
-			goto error;
+			return -EFAULT;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
 		if (copy_to_user(&data32->value.integer64,
 				 &data->value.integer64,
 				 sizeof(data->value.integer64)))
-			goto error;
+			return -EFAULT;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
 		if (copy_to_user(&data32->value.enumerated,
 				 &data->value.enumerated,
 				 sizeof(data->value.enumerated)))
-			goto error;
+			return -EFAULT;
 		break;
 	default:
 		break;
 	}
-	err = 0;
- error:
-	kfree(data);
-	return err;
+	return 0;
 }
 
 /* read / write */
@@ -169,7 +164,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 			int *countp)
 {
 	struct snd_kcontrol *kctl;
-	struct snd_ctl_elem_info *info;
+	struct snd_ctl_elem_info *info __free(kfree) = NULL;
 	int err;
 
 	down_read(&card->controls_rwsem);
@@ -193,7 +188,6 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 		err = info->type;
 		*countp = info->count;
 	}
-	kfree(info);
 	return err;
 }
 
@@ -289,7 +283,7 @@ static int copy_ctl_value_to_user(void __user *userdata,
 static int ctl_elem_read_user(struct snd_card *card,
 			      void __user *userdata, void __user *valuep)
 {
-	struct snd_ctl_elem_value *data;
+	struct snd_ctl_elem_value *data __free(kfree) = NULL;
 	int err, type, count;
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
@@ -299,21 +293,18 @@ static int ctl_elem_read_user(struct snd_card *card,
 	err = copy_ctl_value_from_user(card, data, userdata, valuep,
 				       &type, &count);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_ctl_elem_read(card, data);
 	if (err < 0)
-		goto error;
-	err = copy_ctl_value_to_user(userdata, valuep, data, type, count);
- error:
-	kfree(data);
-	return err;
+		return err;
+	return copy_ctl_value_to_user(userdata, valuep, data, type, count);
 }
 
 static int ctl_elem_write_user(struct snd_ctl_file *file,
 			       void __user *userdata, void __user *valuep)
 {
-	struct snd_ctl_elem_value *data;
+	struct snd_ctl_elem_value *data __free(kfree) = NULL;
 	struct snd_card *card = file->card;
 	int err, type, count;
 
@@ -324,15 +315,12 @@ static int ctl_elem_write_user(struct snd_ctl_file *file,
 	err = copy_ctl_value_from_user(card, data, userdata, valuep,
 				       &type, &count);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_ctl_elem_write(card, file, data);
 	if (err < 0)
-		goto error;
-	err = copy_ctl_value_to_user(userdata, valuep, data, type, count);
- error:
-	kfree(data);
-	return err;
+		return err;
+	return copy_ctl_value_to_user(userdata, valuep, data, type, count);
 }
 
 static int snd_ctl_elem_read_user_compat(struct snd_card *card,
@@ -366,49 +354,44 @@ static int snd_ctl_elem_add_compat(struct snd_ctl_file *file,
 				   struct snd_ctl_elem_info32 __user *data32,
 				   int replace)
 {
-	struct snd_ctl_elem_info *data;
-	int err;
+	struct snd_ctl_elem_info *data __free(kfree) = NULL;
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (! data)
 		return -ENOMEM;
 
-	err = -EFAULT;
 	/* id, type, access, count */ \
 	if (copy_from_user(&data->id, &data32->id, sizeof(data->id)) ||
 	    copy_from_user(&data->type, &data32->type, 3 * sizeof(u32)))
-		goto error;
+		return -EFAULT;
 	if (get_user(data->owner, &data32->owner))
-		goto error;
+		return -EFAULT;
 	switch (data->type) {
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
 		if (get_user(data->value.integer.min, &data32->value.integer.min) ||
 		    get_user(data->value.integer.max, &data32->value.integer.max) ||
 		    get_user(data->value.integer.step, &data32->value.integer.step))
-			goto error;
+			return -EFAULT;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
 		if (copy_from_user(&data->value.integer64,
 				   &data32->value.integer64,
 				   sizeof(data->value.integer64)))
-			goto error;
+			return -EFAULT;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
 		if (copy_from_user(&data->value.enumerated,
 				   &data32->value.enumerated,
 				   sizeof(data->value.enumerated)))
-			goto error;
+			return -EFAULT;
 		data->value.enumerated.names_ptr =
 			(uintptr_t)compat_ptr(data->value.enumerated.names_ptr);
 		break;
 	default:
 		break;
 	}
-	err = snd_ctl_elem_add(file, data, replace);
- error:
-	kfree(data);
-	return err;
+	return snd_ctl_elem_add(file, data, replace);
 }  
 
 enum {
-- 
2.35.3

