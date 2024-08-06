Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F961FA5
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722948378; cv=none; b=EkW4tB4ppwchFBufrcQCPy6O4qNDcPujjRVZIDSejB33RePDsfJPEmjo3451csZ00O6SPOMjAal6B4G4Znn5IcHnxKHIaSdy115lgtL/iEG7UsDtrsDOr4cuSGngyWe1aqDm8WNu6/ELWgZC3rEtMegfV8FJYhdASQoSheJWPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722948378; c=relaxed/simple;
	bh=fqYlmaMc3sNF7QCm1ilFOJkhERVjyCm7TqDEFf+67Kw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AIs5YmX6c2N2PRlivUKaw7Ij6aqFYjSLVnG7AC5CCve4tK+81edRvnmkfTQ3J45GwDoacqI7YSAk2cO77vNds8gUKASs8RL75T/rOdrnTq/Do2dSdUB2rT9R4UjJLTKH6EvSAv8hfNdPijBOs10gAcOuPlUTiNVRrB0NVcmgrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5o4/K5O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pVYY0wHH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5o4/K5O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pVYY0wHH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5o4/K5O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pVYY0wHH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5o4/K5O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pVYY0wHH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A66271FB4A;
	Tue,  6 Aug 2024 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722948374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DB77dkJAclKt3WMGMiIJN86vv2sIcw2sDnKMHjKYiv4=;
	b=D5o4/K5OvWk887Dzjj08J/LWDNe/efE8bg8BA1fHzeTYDBpHkUBUre/qvHrumFrOGmbfmz
	xV8bZlHKowmq/9izNF496j3q5svozjzVE4S2iUWHK4WmHTihZEn+7CAG9hXGNNfsEE8nPW
	epvR4e+FPGF1Vnw942BC9/LCozxps4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722948374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DB77dkJAclKt3WMGMiIJN86vv2sIcw2sDnKMHjKYiv4=;
	b=pVYY0wHHhn1HxyNHSQYCgVcRBuNvK6GMBD408HQlAf/Kk/92C5WcHFAlkZwLObYnVyi3Yc
	jo7nNE9NCgNZ7YAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="D5o4/K5O";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pVYY0wHH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722948374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DB77dkJAclKt3WMGMiIJN86vv2sIcw2sDnKMHjKYiv4=;
	b=D5o4/K5OvWk887Dzjj08J/LWDNe/efE8bg8BA1fHzeTYDBpHkUBUre/qvHrumFrOGmbfmz
	xV8bZlHKowmq/9izNF496j3q5svozjzVE4S2iUWHK4WmHTihZEn+7CAG9hXGNNfsEE8nPW
	epvR4e+FPGF1Vnw942BC9/LCozxps4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722948374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DB77dkJAclKt3WMGMiIJN86vv2sIcw2sDnKMHjKYiv4=;
	b=pVYY0wHHhn1HxyNHSQYCgVcRBuNvK6GMBD408HQlAf/Kk/92C5WcHFAlkZwLObYnVyi3Yc
	jo7nNE9NCgNZ7YAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97EB213770;
	Tue,  6 Aug 2024 12:46:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hu14JBYbsmYjOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 12:46:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add input value sanity checks for standard types
Date: Tue,  6 Aug 2024 14:46:50 +0200
Message-ID: <20240806124651.28203-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: A66271FB4A

For an invalid input value that is out of the given range, currently
USB-audio driver corrects the value silently and accepts without
errors.  This is no wrong behavior, per se, but the recent kselftest
rather wants to have an error in such a case, hence a different
behavior is expected now.

This patch adds a sanity check at each control put for the standard
mixer types and returns an error if an invalid value is given.

Note that this covers only the standard mixer types.  The mixer quirks
that have own control callbacks would need different coverage.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 35 +++++++++++++++++++++++++++--------
 sound/usb/mixer.h |  1 +
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index f7ce8e8c3c3e..2d27d729c3be 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1377,6 +1377,19 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 
 #define get_min_max(cval, def)	get_min_max_with_quirks(cval, def, NULL)
 
+/* get the max value advertised via control API */
+static int get_max_exposed(struct usb_mixer_elem_info *cval)
+{
+	if (!cval->max_exposed) {
+		if (cval->res)
+			cval->max_exposed =
+				DIV_ROUND_UP(cval->max - cval->min, cval->res);
+		else
+			cval->max_exposed = cval->max - cval->min;
+	}
+	return cval->max_exposed;
+}
+
 /* get a feature/mixer unit info */
 static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_info *uinfo)
@@ -1389,11 +1402,8 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 	else
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = cval->channels;
-	if (cval->val_type == USB_MIXER_BOOLEAN ||
-	    cval->val_type == USB_MIXER_INV_BOOLEAN) {
-		uinfo->value.integer.min = 0;
-		uinfo->value.integer.max = 1;
-	} else {
+	if (cval->val_type != USB_MIXER_BOOLEAN &&
+	    cval->val_type != USB_MIXER_INV_BOOLEAN) {
 		if (!cval->initialized) {
 			get_min_max_with_quirks(cval, 0, kcontrol);
 			if (cval->initialized && cval->dBmin >= cval->dBmax) {
@@ -1405,10 +1415,10 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 					       &kcontrol->id);
 			}
 		}
-		uinfo->value.integer.min = 0;
-		uinfo->value.integer.max =
-			DIV_ROUND_UP(cval->max - cval->min, cval->res);
 	}
+
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = get_max_exposed(cval);
 	return 0;
 }
 
@@ -1449,6 +1459,7 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *cval = kcontrol->private_data;
+	int max_val = get_max_exposed(cval);
 	int c, cnt, val, oval, err;
 	int changed = 0;
 
@@ -1461,6 +1472,8 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 			if (err < 0)
 				return filter_error(cval, err);
 			val = ucontrol->value.integer.value[cnt];
+			if (val < 0 || val > max_val)
+				return -EINVAL;
 			val = get_abs_value(cval, val);
 			if (oval != val) {
 				snd_usb_set_cur_mix_value(cval, c + 1, cnt, val);
@@ -1474,6 +1487,8 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 		if (err < 0)
 			return filter_error(cval, err);
 		val = ucontrol->value.integer.value[0];
+		if (val < 0 || val > max_val)
+			return -EINVAL;
 		val = get_abs_value(cval, val);
 		if (val != oval) {
 			snd_usb_set_cur_mix_value(cval, 0, 0, val);
@@ -2337,6 +2352,8 @@ static int mixer_ctl_procunit_put(struct snd_kcontrol *kcontrol,
 	if (err < 0)
 		return filter_error(cval, err);
 	val = ucontrol->value.integer.value[0];
+	if (val < 0 || val > get_max_exposed(cval))
+		return -EINVAL;
 	val = get_abs_value(cval, val);
 	if (val != oval) {
 		set_cur_ctl_value(cval, cval->control << 8, val);
@@ -2699,6 +2716,8 @@ static int mixer_ctl_selector_put(struct snd_kcontrol *kcontrol,
 	if (err < 0)
 		return filter_error(cval, err);
 	val = ucontrol->value.enumerated.item[0];
+	if (val < 0 || val >= cval->max) /* here cval->max = # elements */
+		return -EINVAL;
 	val = get_abs_value(cval, val);
 	if (val != oval) {
 		set_cur_ctl_value(cval, cval->control << 8, val);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index d43895c1ae5c..167fbfcf01ac 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -88,6 +88,7 @@ struct usb_mixer_elem_info {
 	int channels;
 	int val_type;
 	int min, max, res;
+	int max_exposed; /* control API exposes the value in 0..max_exposed */
 	int dBmin, dBmax;
 	int cached;
 	int cache_val[MAX_CHANNELS];
-- 
2.43.0

