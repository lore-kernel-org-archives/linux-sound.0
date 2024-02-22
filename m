Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE103FE4F
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=Z7zI9bEz+xIhraAJxzP/Ohvg+fRgE5Z/hFZ7SP1fItkdQemA89+iivDrV+gXAj1Ufd1YYF26VQdDLgRXEpjnLw7zFRSZ43V8DJF6h/Jggpq64QipXagfjboyhofYh6YOoccPoSywuNuAvpr9y/N/E2TDeLXqpfotvJmBpCkzdYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=AinP8AP+fJ7FIwJSlBFkfzJgsc1vyRgbgW9JamN+TBc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DjCyv5NHPvzjHG7+RZ+4qakcy8+sdyzVvcJM7RtDU3wtUkw2IZOZAK7wI9vhFRMXX8kMU92fl2bLTebddzjqL5FLgianfmNQ7y6tlftl85spus7HJQJp+bml8tdVLsdmNhz1hatGbGJCE5C5xhe1zebBQto611kVjGfKsirQPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xemtInKD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=079jjeiy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NXoFHKS4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fx2+YNFc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xemtInKD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="079jjeiy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NXoFHKS4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fx2+YNFc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA5091FB9C;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3cQABJ055rDEKcBBqaO7xLNOvSYR/RAKSr95j1ZQek=;
	b=xemtInKDCRm41NI29l2OPdVmSO9nnTLvMYIgVLq+enGAy36so1TilgMrzPvUdPiE7gn2h3
	Rgm0P96mOx//gy204wix+GdUHL1w7HKls9xT9pFnj28Q6FL9F2iuFMgHjkUFrJHjuXsv63
	jY8jLDEYy/PkcVgUmbAX2jMkdOkW+EE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3cQABJ055rDEKcBBqaO7xLNOvSYR/RAKSr95j1ZQek=;
	b=079jjeiyvPGDCSVDWFXNx27rkqsYasH/iv8LDMl6Cgj48yCXI0uLAzNPkxdeG4mdmKs4Zq
	x3cfVhrC2lE1BpAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3cQABJ055rDEKcBBqaO7xLNOvSYR/RAKSr95j1ZQek=;
	b=NXoFHKS4o7+Q1pFmg6S8TOd36ueSDDJMt0wrdLmiGRRhIOLlnfntS0XK1jXEX4DS1kLV12
	KqJyHDRu/iR9hDurcVfmJO2Wxr2p93cvX3SruaHdgOY+FYHm2r0ZFnM34YQHihhAfsFHQO
	c5IdKwN6Lj3rP4bl+VH8jWEhiBiBrHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3cQABJ055rDEKcBBqaO7xLNOvSYR/RAKSr95j1ZQek=;
	b=fx2+YNFcxtZQYLeYZW47HsAigwqMUkjRJ3FltIlk8g0LDQPMeovbtW/HMBjAu1ewk8i6K+
	br3hEYjvStYjhXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1DF013A8C;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WCkfMsMs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/9] ALSA: vmaster: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:05 +0100
Message-Id: <20240222111509.28390-6-tiwai@suse.de>
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
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NXoFHKS4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fx2+YNFc
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.45 / 50.00];
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
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.04)[58.21%]
X-Spam-Score: 3.45
X-Rspamd-Queue-Id: EA5091FB9C
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/vmaster.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index 378d2c7c3d4a..04a57f7be6ea 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -56,7 +56,7 @@ struct link_follower {
 
 static int follower_update(struct link_follower *follower)
 {
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int err, ch;
 
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
@@ -65,18 +65,16 @@ static int follower_update(struct link_follower *follower)
 	uctl->id = follower->follower.id;
 	err = follower->follower.get(&follower->follower, uctl);
 	if (err < 0)
-		goto error;
+		return err;
 	for (ch = 0; ch < follower->info.count; ch++)
 		follower->vals[ch] = uctl->value.integer.value[ch];
- error:
-	kfree(uctl);
-	return err < 0 ? err : 0;
+	return 0;
 }
 
 /* get the follower ctl info and save the initial values */
 static int follower_init(struct link_follower *follower)
 {
-	struct snd_ctl_elem_info *uinfo;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
 	int err;
 
 	if (follower->info.count) {
@@ -91,22 +89,18 @@ static int follower_init(struct link_follower *follower)
 		return -ENOMEM;
 	uinfo->id = follower->follower.id;
 	err = follower->follower.info(&follower->follower, uinfo);
-	if (err < 0) {
-		kfree(uinfo);
+	if (err < 0)
 		return err;
-	}
 	follower->info.type = uinfo->type;
 	follower->info.count = uinfo->count;
 	if (follower->info.count > 2  ||
 	    (follower->info.type != SNDRV_CTL_ELEM_TYPE_INTEGER &&
 	     follower->info.type != SNDRV_CTL_ELEM_TYPE_BOOLEAN)) {
 		pr_err("ALSA: vmaster: invalid follower element\n");
-		kfree(uinfo);
 		return -EINVAL;
 	}
 	follower->info.min_val = uinfo->value.integer.min;
 	follower->info.max_val = uinfo->value.integer.max;
-	kfree(uinfo);
 
 	return follower_update(follower);
 }
@@ -341,7 +335,7 @@ static int master_get(struct snd_kcontrol *kcontrol,
 static int sync_followers(struct link_master *master, int old_val, int new_val)
 {
 	struct link_follower *follower;
-	struct snd_ctl_elem_value *uval;
+	struct snd_ctl_elem_value *uval __free(kfree) = NULL;
 
 	uval = kmalloc(sizeof(*uval), GFP_KERNEL);
 	if (!uval)
@@ -353,7 +347,6 @@ static int sync_followers(struct link_master *master, int old_val, int new_val)
 		master->val = new_val;
 		follower_put_val(follower, uval);
 	}
-	kfree(uval);
 	return 0;
 }
 
-- 
2.35.3

