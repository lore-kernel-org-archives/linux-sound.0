Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7202D5A01
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142144; cv=none; b=Fdc77adyohpHZlgcW3yv+tmBeiPxIcAvGyXohg5jTTCCeRlzOigLO3UyLsfwa8KlAm8S2fSTIr+hHe5f439L0U434988sTvRxG5tDz8oXuUk0RRZtQHKoNKxU4JgK9zNMT/G/ZjQeUhpoZbpP71d2TWZb3LDxjCByygnIgF/qcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142144; c=relaxed/simple;
	bh=qWFAO5AWROqoElQvryxOB57ywC4GcLj8fs5FblZgGHI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODfz88mNj3C3RimjO+qLYU69Ghb6ZBIltlAgJDwg4jnEsaYbN+L+6gKruzekz/dS3EDZC62dT527n/kIIUdoKaAGdOkNNTTtO+fPzQ1G7p0Y5rDMpOAWMli/jQr8fu7XhaJbp9sCVrP21Ah+Z2PMUfXocneJjzPrE/dYPdEgQRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0W/CEVSN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T7lKiqtp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0W/CEVSN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T7lKiqtp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0W/CEVSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T7lKiqtp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0W/CEVSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T7lKiqtp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 521D621189;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMCdgo/h8Kh4sV8SvtH2gH3HlkCrlNRu/0EOscFFydE=;
	b=0W/CEVSNoumA6E9Hq810P7dfe3RMdV2n/CBQnqxexDUF2cZM9qSgnIKVP9bOUGulKCqdSC
	OG0kIgsBNPZ4vNnBO7IqSoifjQChF2bTL+OaA/htz84cQeCd20h5l0sHeP2FF0hQ+9jvyq
	SjK5zIHyUy2tmbKt3oGnPem52PiYV1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMCdgo/h8Kh4sV8SvtH2gH3HlkCrlNRu/0EOscFFydE=;
	b=T7lKiqtpDc83qweHs4aLJQ021UwIdRN1oOwiootkvhvaUwMrmahP3IjZzysDsXXe9lbjtx
	GrBSsLBucfWKxCDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="0W/CEVSN";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T7lKiqtp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMCdgo/h8Kh4sV8SvtH2gH3HlkCrlNRu/0EOscFFydE=;
	b=0W/CEVSNoumA6E9Hq810P7dfe3RMdV2n/CBQnqxexDUF2cZM9qSgnIKVP9bOUGulKCqdSC
	OG0kIgsBNPZ4vNnBO7IqSoifjQChF2bTL+OaA/htz84cQeCd20h5l0sHeP2FF0hQ+9jvyq
	SjK5zIHyUy2tmbKt3oGnPem52PiYV1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMCdgo/h8Kh4sV8SvtH2gH3HlkCrlNRu/0EOscFFydE=;
	b=T7lKiqtpDc83qweHs4aLJQ021UwIdRN1oOwiootkvhvaUwMrmahP3IjZzysDsXXe9lbjtx
	GrBSsLBucfWKxCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38B0513A70;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AFSkDOuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 019/103] ALSA: firewire: motu: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:01 +0200
Message-ID: <20250710100727.22653-20-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 521D621189
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/motu/motu-hwdep.c | 2 +-
 sound/firewire/motu/motu-pcm.c   | 2 +-
 sound/firewire/motu/motu.c       | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 88d1f4b56e4b..1ed60618220d 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -290,7 +290,7 @@ int snd_motu_create_hwdep_device(struct snd_motu *motu)
 	if (err < 0)
 		return err;
 
-	strcpy(hwdep->name, "MOTU");
+	strscpy(hwdep->name, "MOTU");
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_MOTU;
 	hwdep->ops = ops;
 	hwdep->private_data = motu;
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index f3b48495acae..7b4d476af348 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -361,7 +361,7 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 		return err;
 	pcm->private_data = motu;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, motu->card->shortname);
+	strscpy(pcm->name, motu->card->shortname);
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index d14ab5dd5bea..fd2a9dddbfa6 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -41,9 +41,9 @@ static void name_card(struct snd_motu *motu)
 		}
 	}
 
-	strcpy(motu->card->driver, "FW-MOTU");
-	strcpy(motu->card->shortname, motu->spec->name);
-	strcpy(motu->card->mixername, motu->spec->name);
+	strscpy(motu->card->driver, "FW-MOTU");
+	strscpy(motu->card->shortname, motu->spec->name);
+	strscpy(motu->card->mixername, motu->spec->name);
 	snprintf(motu->card->longname, sizeof(motu->card->longname),
 		 "MOTU %s (version:%06x), GUID %08x%08x at %s, S%d",
 		 motu->spec->name, version,
-- 
2.50.0

