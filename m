Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7C2D5A0A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142161; cv=none; b=Fb66Rzff/R2wgrAZQgjXGe8NJmdRwkYQAYmD0Bj+lXkpUX8mN8PPPAb3ZJJ6OID5Ycy3wdAH/ElpnGis/SLNO0isOYZwz+VLArwQphP1eL63Wfd+WLfGfJe7yoeL49nluE18gO+HA4BaNq9NqczSGiZeeBhPwcMGeugi45XFTL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142161; c=relaxed/simple;
	bh=7iqbLrYSFza7S8Tnuc6sTb5zfsz12mC4pc0adfRAbIQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNDqocMlWgeuEMCE4DX9zZl7WChDuTRQX4iUD3n5rVJ6+YX/QLVqIh2nJvHplEYAhYnJb4bMae8jrEID7y/B+yJElE0PxqgkeAmzxRG3xvwr8Ap1hhgbqa7D6Hbj2XTqMbmDYmqK5Jt+qdv6NM1QunNullSOf7p+KhzoYcp7hu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tkeSpUfE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r92vdZX0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tkeSpUfE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r92vdZX0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tkeSpUfE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r92vdZX0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tkeSpUfE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r92vdZX0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 42C261F461;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNUorJtgY6dtQaEIctIB5kozcEFMAP+Tq9NOOSX5sJ4=;
	b=tkeSpUfEPPTnv6PLcqMeU1aTtxQwcXaTXc06xu6V+2cCXc7NYqCxkES9gujx7AZpO3F20V
	pPQw36zhJVkF6r5gEHIdtTXKRBrVnOI/osZHlHFJNt0nw+qGzt+mvWRxYSYCYjT4Wt0L1o
	p0sS2QvxgHcbhk4/2MbrMYLWiIaYmBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNUorJtgY6dtQaEIctIB5kozcEFMAP+Tq9NOOSX5sJ4=;
	b=r92vdZX07oZOoVjf2aA7LjHulYdbCAq3Be00nj8/INaWY1gVoALKBWbZ7D7vTUly/lnvMx
	eAjymY0p0/o8wDBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tkeSpUfE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=r92vdZX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNUorJtgY6dtQaEIctIB5kozcEFMAP+Tq9NOOSX5sJ4=;
	b=tkeSpUfEPPTnv6PLcqMeU1aTtxQwcXaTXc06xu6V+2cCXc7NYqCxkES9gujx7AZpO3F20V
	pPQw36zhJVkF6r5gEHIdtTXKRBrVnOI/osZHlHFJNt0nw+qGzt+mvWRxYSYCYjT4Wt0L1o
	p0sS2QvxgHcbhk4/2MbrMYLWiIaYmBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNUorJtgY6dtQaEIctIB5kozcEFMAP+Tq9NOOSX5sJ4=;
	b=r92vdZX07oZOoVjf2aA7LjHulYdbCAq3Be00nj8/INaWY1gVoALKBWbZ7D7vTUly/lnvMx
	eAjymY0p0/o8wDBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A16013A70;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4IQPCe+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 049/103] ALSA: au88x0: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:31 +0200
Message-ID: <20250710100727.22653-50-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 42C261F461
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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
 sound/pci/au88x0/au88x0.c       | 4 ++--
 sound/pci/au88x0/au88x0_mixer.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index fd986247331a..de56e83d8e10 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -220,7 +220,7 @@ __snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	snd_vortex_workaround(pci, pcifix[dev]);
 
 	// Card details needed in snd_vortex_midi
-	strcpy(card->driver, CARD_NAME_SHORT);
+	strscpy(card->driver, CARD_NAME_SHORT);
 	sprintf(card->shortname, "Aureal Vortex %s", CARD_NAME_SHORT);
 	sprintf(card->longname, "%s at 0x%lx irq %i",
 		card->shortname, chip->io, chip->irq);
@@ -270,7 +270,7 @@ __snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		snd_vortex_synth_arg_t *arg;
 
 		arg = SNDRV_SEQ_DEVICE_ARGPTR(wave);
-		strcpy(wave->name, "Aureal Synth");
+		strscpy(wave->name, "Aureal Synth");
 		arg->hwptr = vortex;
 		arg->index = 1;
 		arg->seq_ports = seq_ports[dev];
diff --git a/sound/pci/au88x0/au88x0_mixer.c b/sound/pci/au88x0/au88x0_mixer.c
index aeba684b8d18..00781a7fd28c 100644
--- a/sound/pci/au88x0/au88x0_mixer.c
+++ b/sound/pci/au88x0/au88x0_mixer.c
@@ -15,7 +15,7 @@ static int remove_ctl(struct snd_card *card, const char *name)
 {
 	struct snd_ctl_elem_id id;
 	memset(&id, 0, sizeof(id));
-	strcpy(id.name, name);
+	strscpy(id.name, name);
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	return snd_ctl_remove_id(card, &id);
 }
-- 
2.50.0

