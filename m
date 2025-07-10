Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24FB2D59F5
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142118; cv=none; b=ZffJaeBPfMDPaYDiefLCOMgAdzU2JhSgAby3qfi/8bNA+oupG63HWex3M8QP/IJfTv/NPST6YsZeBrXF+kvCFlmLEH3/I71VUhN1hqFTCwr5KehtqqzsTuyXgZXfWJ329RWPOq01vrNtcBJZ6BezfkEJZe4k8fFbmGOTS/deskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142118; c=relaxed/simple;
	bh=GnFqBMTkzPNM4fcYnNdcz1oSKhVa1Gvdn+mpi5YqLiA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fg79Y0nAZsfeJiqKI40SZlrm6mPCOmUHjuLfLho5MPY1zwWXazQTy1RqGA+Hh77kT0nn/00HNpVLAoRbpfXFTlMU9uqW/oknjBGWdfkGCCYMs7cFHbLy9vVhz6gsEwMLl8E6UGfkH/pZEJ+7GlJxkNwEUT5I+Grh9DnN/7ogQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=snBAdo4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=puFXm3eQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=snBAdo4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=puFXm3eQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="snBAdo4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="puFXm3eQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="snBAdo4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="puFXm3eQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 793B521185;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrARApiT4jOunKGEj+V/OeefXeWu8bXMeG9TmKQmRAI=;
	b=snBAdo4LchD1aOcknIzQidzt4ksfVuVuHE5uJO5exU+krGnz6UC86DccOkZ7FDIA3HlKkE
	7kv7wCpIlNdDVQr1r1a+O43GRAtkps4Qy+D/KYM9q0ZepT3xhBmmOI2d5rc1oY0sMN8n9E
	cDb3kQ4RTSjiGtCF9VX4Duty+w3319Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrARApiT4jOunKGEj+V/OeefXeWu8bXMeG9TmKQmRAI=;
	b=puFXm3eQ7VMR+T1DWiUDYbbG2PCU6dfWTUuPmk0Igibekv9qyK81X7FKswN5LVpGSjKSHo
	akSDK5WyjyH1FiBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=snBAdo4L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=puFXm3eQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrARApiT4jOunKGEj+V/OeefXeWu8bXMeG9TmKQmRAI=;
	b=snBAdo4LchD1aOcknIzQidzt4ksfVuVuHE5uJO5exU+krGnz6UC86DccOkZ7FDIA3HlKkE
	7kv7wCpIlNdDVQr1r1a+O43GRAtkps4Qy+D/KYM9q0ZepT3xhBmmOI2d5rc1oY0sMN8n9E
	cDb3kQ4RTSjiGtCF9VX4Duty+w3319Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrARApiT4jOunKGEj+V/OeefXeWu8bXMeG9TmKQmRAI=;
	b=puFXm3eQ7VMR+T1DWiUDYbbG2PCU6dfWTUuPmk0Igibekv9qyK81X7FKswN5LVpGSjKSHo
	akSDK5WyjyH1FiBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F2E313A70;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SO0OFuqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 013/103] ALSA: firewire: bebob: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:55 +0200
Message-ID: <20250710100727.22653-14-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 793B521185
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/bebob/bebob.c       | 6 +++---
 sound/firewire/bebob/bebob_hwdep.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 2ba5962beb30..4ebaeff16455 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -105,9 +105,9 @@ name_device(struct snd_bebob *bebob)
 	if (err < 0)
 		goto end;
 
-	strcpy(bebob->card->driver, "BeBoB");
-	strcpy(bebob->card->shortname, model);
-	strcpy(bebob->card->mixername, model);
+	strscpy(bebob->card->driver, "BeBoB");
+	strscpy(bebob->card->shortname, model);
+	strscpy(bebob->card->mixername, model);
 	snprintf(bebob->card->longname, sizeof(bebob->card->longname),
 		 "%s %s (id:%d, rev:%d), GUID %08x%08x at %s, S%d",
 		 vendor, model, hw_id, revision,
diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index 6f9331655d43..5779e99a6bb2 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -183,7 +183,7 @@ int snd_bebob_create_hwdep_device(struct snd_bebob *bebob)
 	err = snd_hwdep_new(bebob->card, "BeBoB", 0, &hwdep);
 	if (err < 0)
 		goto end;
-	strcpy(hwdep->name, "BeBoB");
+	strscpy(hwdep->name, "BeBoB");
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_BEBOB;
 	hwdep->ops = ops;
 	hwdep->private_data = bebob;
-- 
2.50.0

