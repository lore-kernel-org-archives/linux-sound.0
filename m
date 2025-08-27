Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B062E3361
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279808; cv=none; b=IUfPdzaO+SmhwtqpUIvbrN0JALhU5GjXEVLK91i8MG3Y5/LNIqWP2AUck4kovS4XO50yRRlKK/E4dk3bWj4g9/XR9M2Zx4eYtdLThN42IfwqQo5NgGB9F4veex7S4LigqC5dIjxhtBkjhXkI+R7KDN/QN5qfjjHpvCX4trY/Duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279808; c=relaxed/simple;
	bh=VM8wMy4UPCbErLBiWQdjUQpW0GJzF5hgzlw/hpLR/VU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzYYUnP928jDAY50WF/Eqmb+/rGluJA6yWF5eCUqfPb4J4tVfjIfwZFBkjZNMx8MxZCBo6Fc4fQECr0LjrO85MKoWkJSQkuWnwYQiy0dpgBq6dqoJI8QmzGN52xmq3mLLxjFjx8ElkoIbL5at/WkC1it9NOxd3IvzBtsVngrGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzzX8oWu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WRd1bVKv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzzX8oWu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WRd1bVKv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzzX8oWu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WRd1bVKv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzzX8oWu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WRd1bVKv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3ACDA1FF16;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRiffLYqE+qcTTH/PztA4gWv6Ws3LlXTYwAUrPKTyiA=;
	b=JzzX8oWuBYv0Xg10i5KmnyipCrNr790XWg1PtM0clGT8lb+Nj24M2RqojQrAFUI2L/LyKe
	+4zswJWAQeXqOU8aDiC2T985R2A+xa3Hab64pmUgcMh6hXaaUaj97iI3rGTKXQz9kIv+DD
	uCKDwiTyn8GGuV6mnRbY6A5bUYhmewg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRiffLYqE+qcTTH/PztA4gWv6Ws3LlXTYwAUrPKTyiA=;
	b=WRd1bVKvvzhbgKcWQ/X+KmHkQOTVfn72ZWDOxvYB/IREwgOnYX4rkLJ7iEP/e+BpzdlVLt
	H632xYDUupLkSjDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRiffLYqE+qcTTH/PztA4gWv6Ws3LlXTYwAUrPKTyiA=;
	b=JzzX8oWuBYv0Xg10i5KmnyipCrNr790XWg1PtM0clGT8lb+Nj24M2RqojQrAFUI2L/LyKe
	+4zswJWAQeXqOU8aDiC2T985R2A+xa3Hab64pmUgcMh6hXaaUaj97iI3rGTKXQz9kIv+DD
	uCKDwiTyn8GGuV6mnRbY6A5bUYhmewg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRiffLYqE+qcTTH/PztA4gWv6Ws3LlXTYwAUrPKTyiA=;
	b=WRd1bVKvvzhbgKcWQ/X+KmHkQOTVfn72ZWDOxvYB/IREwgOnYX4rkLJ7iEP/e+BpzdlVLt
	H632xYDUupLkSjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11B5D13A31;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qBpoAtKzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 19/25] ALSA: hda/common: Use auto cleanup for temporary buffers
Date: Wed, 27 Aug 2025 09:28:59 +0200
Message-ID: <20250827072916.31933-20-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The release of temporary kmalloced buffers can be nicely handled via
the standard __free(kfree).

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c |  4 ++--
 sound/hda/common/sysfs.c | 33 ++++++++++++---------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 022086f8d4df..f6c9230f04cc 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1858,14 +1858,14 @@ static int check_follower_present(struct hda_codec *codec,
 /* call kctl->put with the given value(s) */
 static int put_kctl_with_value(struct snd_kcontrol *kctl, int val)
 {
-	struct snd_ctl_elem_value *ucontrol;
+	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+
 	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
 	if (!ucontrol)
 		return -ENOMEM;
 	ucontrol->value.integer.value[0] = val;
 	ucontrol->value.integer.value[1] = val;
 	kctl->put(kctl, ucontrol);
-	kfree(ucontrol);
 	return 0;
 }
 
diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
index 555c16ea60a5..f8c8483fd5e5 100644
--- a/sound/hda/common/sysfs.c
+++ b/sound/hda/common/sysfs.c
@@ -299,9 +299,9 @@ static void remove_trail_spaces(char *str)
 
 static int parse_hints(struct hda_codec *codec, const char *buf)
 {
-	char *key, *val;
+	char *key __free(kfree) = NULL;
+	char *val;
 	struct hda_hint *hint;
-	int err = 0;
 
 	buf = skip_spaces(buf);
 	if (!*buf || *buf == '#' || *buf == '\n')
@@ -313,10 +313,8 @@ static int parse_hints(struct hda_codec *codec, const char *buf)
 		return -ENOMEM;
 	/* extract key and val */
 	val = strchr(key, '=');
-	if (!val) {
-		kfree(key);
+	if (!val)
 		return -EINVAL;
-	}
 	*val++ = 0;
 	val = skip_spaces(val);
 	remove_trail_spaces(key);
@@ -326,25 +324,18 @@ static int parse_hints(struct hda_codec *codec, const char *buf)
 	if (hint) {
 		/* replace */
 		kfree(hint->key);
-		hint->key = key;
-		hint->val = val;
-		goto unlock;
+		goto replace;
 	}
 	/* allocate a new hint entry */
 	if (codec->hints.used >= MAX_HINTS)
-		hint = NULL;
-	else
-		hint = snd_array_new(&codec->hints);
-	if (hint) {
-		hint->key = key;
-		hint->val = val;
-	} else {
-		err = -ENOMEM;
-	}
- unlock:
-	if (err)
-		kfree(key);
-	return err;
+		return -ENOMEM;
+	hint = snd_array_new(&codec->hints);
+	if (!hint)
+		return -ENOMEM;
+ replace:
+	hint->key = no_free_ptr(key);
+	hint->val = val;
+	return 0;
 }
 
 static ssize_t hints_store(struct device *dev,
-- 
2.50.1

