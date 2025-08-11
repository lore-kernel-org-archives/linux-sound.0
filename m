Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A8C221F2F
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906970; cv=none; b=saZyD8HYuRx/mF7AGsvbQEheA/m/dJjocALe3zxgzsOrjEKzxO7vbVOF5RUBUtYYhhbmFAkxMhC9ohS1xzUJ05ofus9BU+d0EtAVgbGcaNo8MBRdUCClC0dj+tT2YiBQWzr/dB3+DGHRyKQTQr5NZKZ2++g1A+xIIeItIj8dxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906970; c=relaxed/simple;
	bh=JnKege5tCywejrs17kmAFmWKkH0wiR058xaT1WE0Wu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7GvTER/L6igJyl1d/qlxKQKDC/nyDOhVdgo+sONYgAFIi4NePPhPpvNl2qA0RTVzvep+KLl0O+FJvNnlzVGzdO3U1jzNTFOUSBTZxatIBUXbLe49NlEK/NWwKVJtRdlSlg9gx4CIGkEOilvLqhLeask3FIhW2aQMVlck0+tGn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RZUDst9j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9x790yL4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RZUDst9j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9x790yL4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RZUDst9j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9x790yL4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RZUDst9j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9x790yL4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A620E5BE40;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbJPhz/zlCVRFwcFIWoPuierA0T4ZhxvRv/YrDK8eg8=;
	b=RZUDst9jSEjLuvM3XA/PjH74jmcnA9Q5AKak4xOaTS/2FsEggqeDpnsBR1umyl4JRFIbxp
	6E1jeyjG0a5J6F+RSrLDqk05cLaAPIsZHP973D0D+TXysWtDHHtk9iud22A2wLyh8tfoWT
	jdqDaE5/MvYyu7zj8bekXUBe5Cm/h54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbJPhz/zlCVRFwcFIWoPuierA0T4ZhxvRv/YrDK8eg8=;
	b=9x790yL4Xzbe+0yjyG7RQpsTCuW2NSo7RxaOBH1aGC4WKGxoxQnaSyj2WkGnWA3EfvqoW8
	t9LB4NYcqAxC1jDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbJPhz/zlCVRFwcFIWoPuierA0T4ZhxvRv/YrDK8eg8=;
	b=RZUDst9jSEjLuvM3XA/PjH74jmcnA9Q5AKak4xOaTS/2FsEggqeDpnsBR1umyl4JRFIbxp
	6E1jeyjG0a5J6F+RSrLDqk05cLaAPIsZHP973D0D+TXysWtDHHtk9iud22A2wLyh8tfoWT
	jdqDaE5/MvYyu7zj8bekXUBe5Cm/h54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbJPhz/zlCVRFwcFIWoPuierA0T4ZhxvRv/YrDK8eg8=;
	b=9x790yL4Xzbe+0yjyG7RQpsTCuW2NSo7RxaOBH1aGC4WKGxoxQnaSyj2WkGnWA3EfvqoW8
	t9LB4NYcqAxC1jDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FB6713A7E;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kDMTGhHBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 19/25] ALSA: hda/common: Use auto cleanup for temporary buffers
Date: Mon, 11 Aug 2025 12:07:53 +0200
Message-ID: <20250811100807.7962-20-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
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
index 9bc3d260e20d..1aff14686c47 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1859,14 +1859,14 @@ static int check_follower_present(struct hda_codec *codec,
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

