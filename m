Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C7D374A0F
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311149; cv=none; b=A57ZTxe/Ed5oJ2ZETMZYkKQ9MkW9N7nJvibkYwLbtoWUwfalp/ds6D9DLil5iAiWtoBx/0h8uKUKghu2HV/UTJmE9HI0TJ5grKVluKb7S1l1HwvmGsBH/3yJo2RIyJKoEyBjM+2Ixma/n6wyDYksmNyB5IAGGFctJrggnZfNd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311149; c=relaxed/simple;
	bh=fbEx4Sz6SgpgINWZ4WcYzWhGHIdTUVoX95cvUkAAya4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT6U2B2+HI8tGKlHmZBn+T4HbpCQw4FsvWplTU8Ri7IXh8Z9ohaKU4e9aXZdKLL4OaQTGuZDjTxEggXXLsk8MhJZ3lBG+4fYrxNTJwkGnfYDG57oX2J/sesMpADXODBI/rDEWZ6BltvHP1fIv4xE5IV+7da4Wi0kdldQQIej2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WjczwPsZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YkgX0NvZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n6vCGRrK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IC7fWf30; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WjczwPsZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YkgX0NvZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n6vCGRrK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IC7fWf30"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1DBE97C958;
	Wed, 29 Jul 2026 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEibFS8xXSoY/+I6JD5fBepSvkaw0X6Cjr2pWBQTQFw=;
	b=WjczwPsZ06iSLY3HCBRFSn0I1N4SrdNqvXc0gov1wJuJwZO8NlMJo6usxqnY+kYEZlzpjo
	5kbANtognrIhuJo588LurFFyxtolhrVWKtVkC8xcIYnBYS8kOVpNs9A6NHvNxj+2RrGKNi
	BBpJao/THeH8zBxNOj5JlhbFoqNR3CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEibFS8xXSoY/+I6JD5fBepSvkaw0X6Cjr2pWBQTQFw=;
	b=YkgX0NvZhgfF2EPfh0HIYJKjiRs6HK1jbTWVvR1cZUO4vTlZ1vhGZ97IFECuGfdQ/KrLdc
	GMBKAjuBb55TAgCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n6vCGRrK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IC7fWf30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEibFS8xXSoY/+I6JD5fBepSvkaw0X6Cjr2pWBQTQFw=;
	b=n6vCGRrKNJs9Mu+ZpkyE8+kTNOimFrBUr/l1ZX76T+qWGOpLZPwa2aSMqghu9IN+uAlr5a
	ELktMXhriVOyHna+Psre9ncgqeX6hFdF3NPWVDhQGIBYqkcu/Lu6bnpaREeuNPya0a8s8W
	gsVHJfoK0t5A7A8SU0xYCTdAWM7cNug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEibFS8xXSoY/+I6JD5fBepSvkaw0X6Cjr2pWBQTQFw=;
	b=IC7fWf30fE06YBoAZPfqZWIRQqJv7LoGFjae6xa64UsGumITleJfX8ydAmffJ8ol/jVKbb
	xy7fjBsV0Ln3ZRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3ABF779BC;
	Wed, 29 Jul 2026 07:45:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MLpOOpWvaWolJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:45:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: usb-audio: Extend quirk_flags to 64bit
Date: Wed, 29 Jul 2026 09:45:17 +0200
Message-ID: <20260729074523.92761-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729074523.92761-1-tiwai@suse.de>
References: <20260729074523.92761-1-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 1DBE97C958
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Now we reached the limit of 32bit bitmap for quirk flags.
In order to be future-ready, simply extend the flag bitmap to 64bit.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     |  2 +-
 sound/usb/quirks.c   | 10 +++++-----
 sound/usb/quirks.h   |  2 +-
 sound/usb/usbaudio.h |  4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index b36f513dccb9..24112e491779 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -715,7 +715,7 @@ static void snd_usb_init_quirk_flags(int idx, struct snd_usb_audio *chip)
 
 	/* old style option found: the position-based integer value */
 	if (quirk_flags[idx] &&
-	    !kstrtou32(quirk_flags[idx], 0, &chip->quirk_flags)) {
+	    !kstrtou64(quirk_flags[idx], 0, &chip->quirk_flags)) {
 		snd_usb_apply_flag_dbg("module param", chip, chip->quirk_flags);
 		return;
 	}
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 52dbbdb7f9a1..77adefe4f9cb 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2145,7 +2145,7 @@ struct usb_string_match {
 
 struct usb_audio_quirk_flags_table {
 	u32 id;
-	u32 flags;
+	u64 flags;
 	const struct usb_string_match *usb_string_match;
 };
 
@@ -2638,7 +2638,7 @@ const char *snd_usb_quirk_flag_find_name(unsigned long index)
 	return snd_usb_audio_quirk_flag_names[index];
 }
 
-u32 snd_usb_quirk_flags_from_name(const char *name)
+u64 snd_usb_quirk_flags_from_name(const char *name)
 {
 	int i;
 
@@ -2647,7 +2647,7 @@ u32 snd_usb_quirk_flags_from_name(const char *name)
 
 	for (i = 0; snd_usb_audio_quirk_flag_names[i]; i++) {
 		if (strcasecmp(name, snd_usb_audio_quirk_flag_names[i]) == 0)
-			return BIT_U32(i);
+			return BIT_U64(i);
 	}
 
 	return 0;
@@ -2705,7 +2705,7 @@ void snd_usb_init_quirk_flags_parse_string(struct snd_usb_audio *chip,
 {
 	u16 chip_vid = USB_ID_VENDOR(chip->usb_id);
 	u16 chip_pid = USB_ID_PRODUCT(chip->usb_id);
-	u32 mask_flags, unmask_flags, bit;
+	u64 mask_flags, unmask_flags, bit;
 	char *p, *field, *flag;
 	bool is_unmask;
 	u16 vid, pid;
@@ -2759,7 +2759,7 @@ void snd_usb_init_quirk_flags_parse_string(struct snd_usb_audio *chip,
 				is_unmask = false;
 			}
 
-			if (!kstrtou32(flag, 16, &bit)) {
+			if (!kstrtou64(flag, 16, &bit)) {
 				if (is_unmask)
 					unmask_flags |= bit;
 				else
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index f24d6a5a197a..54f4cca8d7af 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -57,6 +57,6 @@ void snd_usb_init_quirk_flags_parse_string(struct snd_usb_audio *chip,
 					   const char *str);
 
 const char *snd_usb_quirk_flag_find_name(unsigned long flag);
-u32 snd_usb_quirk_flags_from_name(const char *name);
+u64 snd_usb_quirk_flags_from_name(const char *name);
 
 #endif /* __USBAUDIO_QUIRKS_H */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index dc1d0c8c9c80..31e612500050 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -44,7 +44,7 @@ struct snd_usb_audio {
 	atomic_t active;
 	atomic_t shutdown;
 	struct snd_refcount usage_count;
-	unsigned int quirk_flags;
+	u64 quirk_flags;
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
 	int num_interfaces;
 	int last_iface;
@@ -298,7 +298,7 @@ enum {
 /* Please also edit snd_usb_audio_quirk_flag_names */
 };
 
-#define QUIRK_FLAG(x)	BIT_U32(QUIRK_TYPE_ ## x)
+#define QUIRK_FLAG(x)	BIT_U64(QUIRK_TYPE_ ## x)
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE		QUIRK_FLAG(GET_SAMPLE_RATE)
 #define QUIRK_FLAG_SHARE_MEDIA_DEVICE		QUIRK_FLAG(SHARE_MEDIA_DEVICE)
-- 
2.55.0

