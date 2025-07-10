Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E02D6417
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142315; cv=none; b=FxFD/ElKLg8TY68QLiqXJq6Nc6vE35N1olbi5UH1KMTtJfijSzayeRtwIx6CXt5m8MN6RVyyc0rAIkx1Ok4sZ0im3llR88SSCg/OUclb5vx3qdBjJCpcsDO/JYDoYuljImHvYIvOgZ+CI6DFDxMam2RkdOto38HPMK0pxDlek2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142315; c=relaxed/simple;
	bh=EbC+5EH9fZs0dgGmIvZXhh6icCcLa5FYB9dVqEVmhw4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hj8zkRiBh3UFMHreh84M+VW7xjKK0h/jI3TDLYTBOHf5czOAD2AaHWg8b+8FY/YxdKFDgiVA/TsKOhzvQj/wmmsjwL42N5iMU+/9pZ+YocTNmFOCJfYSBR3AFmWgY1US9tssljzb8dNMMk9KMUE/dzu04jLSpWpNJyBGVTSD+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tHLYAOJq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GDgRvLOV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tHLYAOJq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GDgRvLOV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tHLYAOJq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GDgRvLOV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tHLYAOJq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GDgRvLOV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9F101F78C;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1IxiuKnNkXCZSu2ktwev3colwFKRj8UjkPX0b9MgZs=;
	b=tHLYAOJqooiknDLTQstqLFQ5x86/NuK9HtF+9nv0MYHwXDctex+XVvwAfBtyMFyTiuzXQJ
	lxG/fRQ8gmgdgNdel6T5pcyCixmsgUAHyxAMRBAapG8xyRCoMrFnTqdl7YAEohxTcM6aqu
	AtDCL3rwTQwvLaB5IxrOIi92ePN0RNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1IxiuKnNkXCZSu2ktwev3colwFKRj8UjkPX0b9MgZs=;
	b=GDgRvLOVwVs02kfeLue/wsE0Zbrsl0ypxJZyXYPS4xPBdWqFLsQum/vo4WXzj9P86hyv7R
	wyqcNmKu0BLvzPCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1IxiuKnNkXCZSu2ktwev3colwFKRj8UjkPX0b9MgZs=;
	b=tHLYAOJqooiknDLTQstqLFQ5x86/NuK9HtF+9nv0MYHwXDctex+XVvwAfBtyMFyTiuzXQJ
	lxG/fRQ8gmgdgNdel6T5pcyCixmsgUAHyxAMRBAapG8xyRCoMrFnTqdl7YAEohxTcM6aqu
	AtDCL3rwTQwvLaB5IxrOIi92ePN0RNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1IxiuKnNkXCZSu2ktwev3colwFKRj8UjkPX0b9MgZs=;
	b=GDgRvLOVwVs02kfeLue/wsE0Zbrsl0ypxJZyXYPS4xPBdWqFLsQum/vo4WXzj9P86hyv7R
	wyqcNmKu0BLvzPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFAA113A70;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YBeJMfWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 097/103] ALSA: usx2y: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:19 +0200
Message-ID: <20250710100727.22653-98-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us122l.c     | 2 +-
 sound/usb/usx2y/usX2Yhwdep.c | 2 +-
 sound/usb/usx2y/usbusx2y.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 6bcf8b859ebb..2ace3ba46091 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -495,7 +495,7 @@ static int usx2y_create_card(struct usb_device *device,
 	init_waitqueue_head(&US122L(card)->sk.sleep);
 	US122L(card)->is_us144 = flags & US122L_FLAG_US144;
 	INIT_LIST_HEAD(&US122L(card)->midi_list);
-	strcpy(card->driver, "USB "NAME_ALLCAPS"");
+	strscpy(card->driver, "USB "NAME_ALLCAPS"");
 	sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
 	sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
 		card->shortname,
diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 9fd6a86cc08e..4d7925184826 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -102,7 +102,7 @@ static int snd_usx2y_hwdep_dsp_status(struct snd_hwdep *hw,
 	}
 	if (id < 0)
 		return -ENODEV;
-	strcpy(info->id, type_ids[id]);
+	strscpy(info->id, type_ids[id]);
 	info->num_dsps = 2;		// 0: Prepad Data, 1: FPGA Code
 	if (us428->chip_status & USX2Y_STAT_CHIP_INIT)
 		info->chip_ready = 1;
diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 5756ff3528a2..f34e78910200 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -382,7 +382,7 @@ static int usx2y_create_card(struct usb_device *device,
 	init_waitqueue_head(&usx2y(card)->us428ctls_wait_queue_head);
 	mutex_init(&usx2y(card)->pcm_mutex);
 	INIT_LIST_HEAD(&usx2y(card)->midi_list);
-	strcpy(card->driver, "USB "NAME_ALLCAPS"");
+	strscpy(card->driver, "USB "NAME_ALLCAPS"");
 	sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
 	sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
 		card->shortname,
-- 
2.50.0

