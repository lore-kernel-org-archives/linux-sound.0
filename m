Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69234D4CC
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894028; cv=none; b=hwgI7rM3VNIXP0GdSIem08aIBSMFb7qA0giWTw+bf/YP0d60p0ptDy4NXff6j7I66hyRiwHKlhw3O6ERkWwgxXsFh+autGrNqYTAheXKXRqodSTG6+19SNuu6/KYAxrrUnztNQYCCWtumN/4KP5lWXFLBzYLXem6RmGGBXqI2h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894028; c=relaxed/simple;
	bh=6l+XzLRwMk4tFQkpYjg1uQIuAvJctAs/tqsu7Lrhw8w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+dj2mmsKeyTHCBF/2psCcHaMUE1HrfmHhpBtFBKYO3xp0mrLReKjEwxLRyZopW22uMT73/UwDYggRimLxg5mPK1KzLZ6eGRaSJQH7iNrDyxEQAVNprfAPCFpfzfJThk+AB6TXiQWC+HDYyoZeiRUiIxh1ZWNT+J+EpDkGizlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y/uk9LMM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/x9y3Z9+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y/uk9LMM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/x9y3Z9+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y/uk9LMM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/x9y3Z9+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y/uk9LMM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/x9y3Z9+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B9BF336AE;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WseXAOBHYkpS72B4G4KhLLmYZKGge8Jei7aDKZY1Y1Y=;
	b=Y/uk9LMMEifyBw9u6CkZEsWw9CzKeYtJ0FDQEAbOB58vheQ9II06STFm+OkO2iRZgCAWei
	K5h0YXThXFUlOnO2NUqi6sip9mn7wpVNLnCqV6eUfoJQK1hgsoHyACXR57qGMLfeehlP02
	PS5sVtVQHRWX8+AIcqO74IUOwUvqgAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WseXAOBHYkpS72B4G4KhLLmYZKGge8Jei7aDKZY1Y1Y=;
	b=/x9y3Z9+Uyxq7063GVC/pwXrF1xbmfQXHXyR4w6UuhrOsqZzZGBSdLJVqd0nkmyyfJsw0S
	bB1M94giwgaEuSAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WseXAOBHYkpS72B4G4KhLLmYZKGge8Jei7aDKZY1Y1Y=;
	b=Y/uk9LMMEifyBw9u6CkZEsWw9CzKeYtJ0FDQEAbOB58vheQ9II06STFm+OkO2iRZgCAWei
	K5h0YXThXFUlOnO2NUqi6sip9mn7wpVNLnCqV6eUfoJQK1hgsoHyACXR57qGMLfeehlP02
	PS5sVtVQHRWX8+AIcqO74IUOwUvqgAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WseXAOBHYkpS72B4G4KhLLmYZKGge8Jei7aDKZY1Y1Y=;
	b=/x9y3Z9+Uyxq7063GVC/pwXrF1xbmfQXHXyR4w6UuhrOsqZzZGBSdLJVqd0nkmyyfJsw0S
	bB1M94giwgaEuSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F23F23EA68;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kBKROnJnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/11] ALSA: vmaster: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:30 +0100
Message-ID: <20251216140634.171890-9-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216140634.171890-1-tiwai@suse.de>
References: <20251216140634.171890-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.898];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.78

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Fixes: fb9e197f3f27 ("ALSA: vmaster: Use automatic cleanup of kfree()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/vmaster.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index c657659b236c..76cc64245f5d 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -56,10 +56,10 @@ struct link_follower {
 
 static int follower_update(struct link_follower *follower)
 {
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int err, ch;
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (!uctl)
 		return -ENOMEM;
 	uctl->id = follower->follower.id;
@@ -74,7 +74,6 @@ static int follower_update(struct link_follower *follower)
 /* get the follower ctl info and save the initial values */
 static int follower_init(struct link_follower *follower)
 {
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
 	int err;
 
 	if (follower->info.count) {
@@ -84,7 +83,8 @@ static int follower_init(struct link_follower *follower)
 		return 0;
 	}
 
-	uinfo = kmalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kmalloc(sizeof(*uinfo), GFP_KERNEL);
 	if (!uinfo)
 		return -ENOMEM;
 	uinfo->id = follower->follower.id;
@@ -341,9 +341,9 @@ static int master_get(struct snd_kcontrol *kcontrol,
 static int sync_followers(struct link_master *master, int old_val, int new_val)
 {
 	struct link_follower *follower;
-	struct snd_ctl_elem_value *uval __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uval __free(kfree) =
+		kmalloc(sizeof(*uval), GFP_KERNEL);
 
-	uval = kmalloc(sizeof(*uval), GFP_KERNEL);
 	if (!uval)
 		return -ENOMEM;
 	list_for_each_entry(follower, &master->followers, list) {
-- 
2.52.0

