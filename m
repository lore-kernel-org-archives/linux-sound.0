Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C02D5A04
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142150; cv=none; b=USf3IsBDIc8ddv5nO/bzF2CWE3yUKEr+83o5E2MPiaBN42wfx4QykRrP4BCjII7f8BpEjAb+KOva5v5dbXYWnCZQUZ/JSBjNSDvf8GgqTcJOZl52iayEWtHK8nMk1dUB/HbHVpjltoWn3BBXcvWPpVMjBSLF2j/2Emm3XUFyhdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142150; c=relaxed/simple;
	bh=fES2z1PSpvzxQzXqRMjfgC+79wp1wYy0uew+lZ559sI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXbv7EF4bd4xHFmC0kuRXL+fbfFwq3Ga6grghPRkIkv569LY3jowHrfgdhtgMTxrC2R6wzmUYA0aZXFTzBjNz8cFshsG1RQ4J+QAzJhViq0H72zb1plG728x5Td8TEHRgC0ZuCjf40YHpAKQeUD4hCIz/n+4MbEFkDafjwiYjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A3uD/bnE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DPU1gc5o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A3uD/bnE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DPU1gc5o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A3uD/bnE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DPU1gc5o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A3uD/bnE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DPU1gc5o"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77C7D2118B;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95cHyrISWCTYwhCedI4mFKOnNmM7PIV3H8A5b/PssnQ=;
	b=A3uD/bnEXDahSb8BHXBD4xyqJKBbyNfDEUTxw8obqHzpdMSxGujE+0F4r+f5a4a+WGzghg
	XUne9uaT6rfaBS4SQ0zBY1zQUbDB1m+m71x+vHKI17JdjliO/GMvglVD3k+4aIFJbmpiOp
	AwGeJdqhDi0RVLw3LvGzw69Pg8Tvb00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95cHyrISWCTYwhCedI4mFKOnNmM7PIV3H8A5b/PssnQ=;
	b=DPU1gc5oK+jz2nOJoGt9c3GFQ7EC/0QIHdPDexWmK5BSFaoOd1/M2d2jJ3Opn+g1nPUGIk
	PYZO32yi2+64vVDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95cHyrISWCTYwhCedI4mFKOnNmM7PIV3H8A5b/PssnQ=;
	b=A3uD/bnEXDahSb8BHXBD4xyqJKBbyNfDEUTxw8obqHzpdMSxGujE+0F4r+f5a4a+WGzghg
	XUne9uaT6rfaBS4SQ0zBY1zQUbDB1m+m71x+vHKI17JdjliO/GMvglVD3k+4aIFJbmpiOp
	AwGeJdqhDi0RVLw3LvGzw69Pg8Tvb00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95cHyrISWCTYwhCedI4mFKOnNmM7PIV3H8A5b/PssnQ=;
	b=DPU1gc5oK+jz2nOJoGt9c3GFQ7EC/0QIHdPDexWmK5BSFaoOd1/M2d2jJ3Opn+g1nPUGIk
	PYZO32yi2+64vVDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 588E2136DC;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aLVaFOuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 020/103] ALSA: firewire: oxfw: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:02 +0200
Message-ID: <20250710100727.22653-21-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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
 sound/firewire/oxfw/oxfw-hwdep.c | 2 +-
 sound/firewire/oxfw/oxfw-pcm.c   | 2 +-
 sound/firewire/oxfw/oxfw.c       | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index a0fe99618554..3be214d8a922 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -177,7 +177,7 @@ int snd_oxfw_create_hwdep(struct snd_oxfw *oxfw)
 	err = snd_hwdep_new(oxfw->card, oxfw->card->driver, 0, &hwdep);
 	if (err < 0)
 		goto end;
-	strcpy(hwdep->name, oxfw->card->driver);
+	strscpy(hwdep->name, oxfw->card->driver);
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_OXFW;
 	hwdep->ops = hwdep_ops;
 	hwdep->private_data = oxfw;
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 8ca9dde54ec6..e13dc817fc28 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -441,7 +441,7 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 
 	pcm->private_data = oxfw;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, oxfw->card->shortname);
+	strscpy(pcm->name, oxfw->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	if (cap > 0)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 98ae0e8cba87..7a985f3cb8f6 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -105,9 +105,9 @@ static int name_card(struct snd_oxfw *oxfw, const struct ieee1394_device_id *ent
 		m = model;
 	}
 
-	strcpy(oxfw->card->driver, d);
-	strcpy(oxfw->card->mixername, m);
-	strcpy(oxfw->card->shortname, m);
+	strscpy(oxfw->card->driver, d);
+	strscpy(oxfw->card->mixername, m);
+	strscpy(oxfw->card->shortname, m);
 
 	scnprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
 		  "%s %s (OXFW%x %04x), GUID %08x%08x at %s, S%d",
-- 
2.50.0

