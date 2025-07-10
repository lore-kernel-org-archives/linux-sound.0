Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DC2D5A0D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142155; cv=none; b=sruJZCBlPwDLoG8MLyw0tgik3fZv+PSxOCdqymmNpVHoYyvrfDbQ+Ew/wX4TyXXzTutIkHfnm1wbG6dIJeDwZVbXHAfBAACZrnC9pmdlULiYrWV4pxvSE5D4MgLbboCTZXuBLCO9zIcH/5F13ufSFcInvZb5HKAz7l6OANgDUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142155; c=relaxed/simple;
	bh=098Zv6g/zqLBPJ8N9UqeG/eA48ZNcAEwYtYilknuVos=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miITioOfODfxrfbURYh5rBZyYxfaiYtv5tC7wkBp+Y1vJSXYgqvFCd/yrf9MUGvhUxDiQUz1QzLuXZ5fuRosTmfCWDDsc/rLyN1OK8JI3oucFhseHENn9UrDBTQgTLtXxCU+PDetWI72JovqWsDQQxoP82tyKILKC/f2VSfowVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SmtV7gfF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IAtu/ZnW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SmtV7gfF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IAtu/ZnW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SmtV7gfF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IAtu/ZnW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SmtV7gfF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IAtu/ZnW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9AE6D2118C;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtzRPGpomf0VT6MBJWLRl24kbabS36tJlu2quypwsm8=;
	b=SmtV7gfFTG3mI7v9pMH0e5G5b1ytOcYFtywjIoNp5YQ0YdPaQTZ1QWF2ZXro5nrQ9FyISC
	J/F+ub4cKPG3Xs2v2PfCyD4YGKHseS2lxxCPv7g9CXhgaUF7ItlrTW7T8WQrd6GjEARxQx
	KpBtL+76bZVeUN0SwiUXw5U7h3PUHJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtzRPGpomf0VT6MBJWLRl24kbabS36tJlu2quypwsm8=;
	b=IAtu/ZnWKwh3QZGdaODAhVi1ajnzvyzgVeU2obd+lCgWhuUOcl+Z16RpTfXswKNo3kXHWu
	J9k3BVdQk7uLUNDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SmtV7gfF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="IAtu/ZnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtzRPGpomf0VT6MBJWLRl24kbabS36tJlu2quypwsm8=;
	b=SmtV7gfFTG3mI7v9pMH0e5G5b1ytOcYFtywjIoNp5YQ0YdPaQTZ1QWF2ZXro5nrQ9FyISC
	J/F+ub4cKPG3Xs2v2PfCyD4YGKHseS2lxxCPv7g9CXhgaUF7ItlrTW7T8WQrd6GjEARxQx
	KpBtL+76bZVeUN0SwiUXw5U7h3PUHJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtzRPGpomf0VT6MBJWLRl24kbabS36tJlu2quypwsm8=;
	b=IAtu/ZnWKwh3QZGdaODAhVi1ajnzvyzgVeU2obd+lCgWhuUOcl+Z16RpTfXswKNo3kXHWu
	J9k3BVdQk7uLUNDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DA6413A70;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KP9RHeuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 021/103] ALSA: firewire: tascam: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:03 +0200
Message-ID: <20250710100727.22653-22-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9AE6D2118C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/tascam/tascam-hwdep.c | 2 +-
 sound/firewire/tascam/tascam.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 74eed9505665..8fc30cba29d5 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -265,7 +265,7 @@ int snd_tscm_create_hwdep_device(struct snd_tscm *tscm)
 	if (err < 0)
 		return err;
 
-	strcpy(hwdep->name, "Tascam");
+	strscpy(hwdep->name, "Tascam");
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_TASCAM;
 	hwdep->ops = ops;
 	hwdep->private_data = tscm;
diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index 86880089de28..4f68bb4c58bc 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -73,9 +73,9 @@ static int identify_model(struct snd_tscm *tscm)
 	if (tscm->spec == NULL)
 		return -ENODEV;
 
-	strcpy(tscm->card->driver, "FW-TASCAM");
-	strcpy(tscm->card->shortname, model);
-	strcpy(tscm->card->mixername, model);
+	strscpy(tscm->card->driver, "FW-TASCAM");
+	strscpy(tscm->card->shortname, model);
+	strscpy(tscm->card->mixername, model);
 	snprintf(tscm->card->longname, sizeof(tscm->card->longname),
 		 "TASCAM %s, GUID %08x%08x at %s, S%d", model,
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
-- 
2.50.0

