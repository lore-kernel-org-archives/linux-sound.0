Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1172D59F7
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142131; cv=none; b=hypf1sShRDypYBk6af20oSSHHRlngPI/6/GIcjf9lu7B7L5L/Wxq27dxYK3Jw+QE38z86SNlMtgatq01zrY5ck8gSKJZJAn4QDvJHbVfBcTRI5xJViobeYM/ksXvWxK7+bXeXClAMj3HZ565eXDOfO1/DoYhAqTX/qx8KkoJvRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142131; c=relaxed/simple;
	bh=5dddD7jTYp5NdfV6MFaiI1r7k9cLHcZYd5/NbUqZzOo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G70FuS2L5bFuPOeCenIeYVitL4Ll+qsGTq8OT57Yli7C5/c2OEACuJ8gFSPXfyBsWbtOfSbmY4hnuOLnjsR0PPMxeJwd9euJdYRm3gIvs5sAbCldCCUtpBEdNNMy/h/ftjFia7zCQSvT3t/+Jeo/eMaBWsivJqx0nyAlhqagve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iJ75m+Z7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9645AXay; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iJ75m+Z7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9645AXay; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iJ75m+Z7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9645AXay";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iJ75m+Z7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9645AXay"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2230D21188;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNyYR6yingE46mVjREB7eltWwPwZwcCbAzrK7Jx3Oo0=;
	b=iJ75m+Z7Hy1z2/EmWMUbF2ZJCIJz0DOwhcHpm88XAwKL2FxHr8YcRvTT20N8I94r1lnGxD
	Fjt2JoSjfkvCmpkv0VQpAtxd5UcEC/GeHjVIANGf1B261dzVWtOEwbo+/+EkRogcKuglrD
	yk6Ti9E53g0/70b/eIeHUX7RW8DzGnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNyYR6yingE46mVjREB7eltWwPwZwcCbAzrK7Jx3Oo0=;
	b=9645AXayD0jTxLe0FX24HJkxplYraErCIJI7uhkuZp9crcV7btOtSA1NwUN3vcQL21xNh+
	mHE5ZbtZcA4khlAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNyYR6yingE46mVjREB7eltWwPwZwcCbAzrK7Jx3Oo0=;
	b=iJ75m+Z7Hy1z2/EmWMUbF2ZJCIJz0DOwhcHpm88XAwKL2FxHr8YcRvTT20N8I94r1lnGxD
	Fjt2JoSjfkvCmpkv0VQpAtxd5UcEC/GeHjVIANGf1B261dzVWtOEwbo+/+EkRogcKuglrD
	yk6Ti9E53g0/70b/eIeHUX7RW8DzGnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNyYR6yingE46mVjREB7eltWwPwZwcCbAzrK7Jx3Oo0=;
	b=9645AXayD0jTxLe0FX24HJkxplYraErCIJI7uhkuZp9crcV7btOtSA1NwUN3vcQL21xNh+
	mHE5ZbtZcA4khlAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEA5D13A70;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sFbyOOqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 017/103] ALSA: firewire: fireworks: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:59 +0200
Message-ID: <20250710100727.22653-18-tiwai@suse.de>
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

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireworks/fireworks.c       | 6 +++---
 sound/firewire/fireworks/fireworks_hwdep.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index e3ed4e094ccd..69f722244362 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -90,9 +90,9 @@ get_hardware_info(struct snd_efw *efw)
 		 (hwinfo->arm_version >> 16) & 0xff);
 	efw->firmware_version = hwinfo->arm_version;
 
-	strcpy(efw->card->driver, "Fireworks");
-	strcpy(efw->card->shortname, hwinfo->model_name);
-	strcpy(efw->card->mixername, hwinfo->model_name);
+	strscpy(efw->card->driver, "Fireworks");
+	strscpy(efw->card->shortname, hwinfo->model_name);
+	strscpy(efw->card->mixername, hwinfo->model_name);
 	scnprintf(efw->card->longname, sizeof(efw->card->longname),
 		  "%s %s v%s, GUID %08x%08x at %s, S%d",
 		  hwinfo->vendor_name, hwinfo->model_name, version,
diff --git a/sound/firewire/fireworks/fireworks_hwdep.c b/sound/firewire/fireworks/fireworks_hwdep.c
index 3a53914277d3..037833cd066e 100644
--- a/sound/firewire/fireworks/fireworks_hwdep.c
+++ b/sound/firewire/fireworks/fireworks_hwdep.c
@@ -319,7 +319,7 @@ int snd_efw_create_hwdep_device(struct snd_efw *efw)
 	err = snd_hwdep_new(efw->card, "Fireworks", 0, &hwdep);
 	if (err < 0)
 		goto end;
-	strcpy(hwdep->name, "Fireworks");
+	strscpy(hwdep->name, "Fireworks");
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_FIREWORKS;
 	hwdep->ops = ops;
 	hwdep->private_data = efw;
-- 
2.50.0

