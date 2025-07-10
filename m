Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5688B2D5C89
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142242; cv=none; b=oqVS+N/kLjZzJdJ7SwQjfYJ9p5gEVAxRwi8f59OrhcWtJosgGTJfbJxqMxgmJQCuOy5LURkQU7bsALMRYEhaUfJB35f95pCSEwtr+ONz0hNDl0kp1LI8ZrgXnk9LhV8bZcA5JQvPaKSPXpsvaAM1JB3OIkAJwIipKMOlOFskuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142242; c=relaxed/simple;
	bh=d37bDUy7RHuk/Y9+NSiJtX0IoWhcUDoEvrZ7V5EoyQ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbwnNLhCDHZb0zSOHo0VZsp5zusN7ANDN4idbZP4PW1oHZT+8vIIXBGgb2Wbj1MkC45IVoUiOCdXv1zJbg5D6FYC26Z207q3U1YNto3QHiF+YFVeH2x+P4v9d+G07X/JP0KN8mO6WP+Ea2IKPSY2X+nmjeUxJO0s6F/yYrvgGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g8eyaJ8I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMsjAm52; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g8eyaJ8I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMsjAm52; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g8eyaJ8I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMsjAm52";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g8eyaJ8I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMsjAm52"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4DB121F766;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNwU3Nrv9nZASU6G27/cpHDpjXfikgQelTgsZRQFLVM=;
	b=g8eyaJ8I1Galj/GherOMJaxPxFwikVt0uuQnRIsRHylZMc2PDdV4/U4uiTDLAhvc5thD82
	/f+GuvOE8Jqx8rr+uQSrkIgQyFQOb2uT06BbblxJ2t0uWOSot+6YyThN8qXaH1SKOg+uSv
	AX0SxS5SRCErKCn3PPXwyW05KARIsh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNwU3Nrv9nZASU6G27/cpHDpjXfikgQelTgsZRQFLVM=;
	b=RMsjAm52Ad9SrtAVXyqxLZpfPL2klHUGYZZLAwDujdXxXdbXp/Td56InJSIAvPHA7GfoYP
	XP8GCkzdLGNk/eCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNwU3Nrv9nZASU6G27/cpHDpjXfikgQelTgsZRQFLVM=;
	b=g8eyaJ8I1Galj/GherOMJaxPxFwikVt0uuQnRIsRHylZMc2PDdV4/U4uiTDLAhvc5thD82
	/f+GuvOE8Jqx8rr+uQSrkIgQyFQOb2uT06BbblxJ2t0uWOSot+6YyThN8qXaH1SKOg+uSv
	AX0SxS5SRCErKCn3PPXwyW05KARIsh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNwU3Nrv9nZASU6G27/cpHDpjXfikgQelTgsZRQFLVM=;
	b=RMsjAm52Ad9SrtAVXyqxLZpfPL2klHUGYZZLAwDujdXxXdbXp/Td56InJSIAvPHA7GfoYP
	XP8GCkzdLGNk/eCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31B75136DC;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uDrLCvOQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 078/103] ALSA: rme32: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:00 +0200
Message-ID: <20250710100727.22653-79-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/rme32.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 4bf122abea48..f07b6023473a 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1314,7 +1314,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 		return err;
 	rme32->spdif_pcm->private_data = rme32;
 	rme32->spdif_pcm->private_free = snd_rme32_free_spdif_pcm;
-	strcpy(rme32->spdif_pcm->name, "Digi32 IEC958");
+	strscpy(rme32->spdif_pcm->name, "Digi32 IEC958");
 	if (rme32->fullduplex_mode) {
 		snd_pcm_set_ops(rme32->spdif_pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				&snd_rme32_playback_spdif_fd_ops);
@@ -1344,7 +1344,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 			return err;
 		rme32->adat_pcm->private_data = rme32;
 		rme32->adat_pcm->private_free = snd_rme32_free_adat_pcm;
-		strcpy(rme32->adat_pcm->name, "Digi32 ADAT");
+		strscpy(rme32->adat_pcm->name, "Digi32 ADAT");
 		if (rme32->fullduplex_mode) {
 			snd_pcm_set_ops(rme32->adat_pcm, SNDRV_PCM_STREAM_PLAYBACK, 
 					&snd_rme32_playback_adat_fd_ops);
@@ -1879,16 +1879,16 @@ __snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "Digi32");
+	strscpy(card->driver, "Digi32");
 	switch (rme32->pci->device) {
 	case PCI_DEVICE_ID_RME_DIGI32:
-		strcpy(card->shortname, "RME Digi32");
+		strscpy(card->shortname, "RME Digi32");
 		break;
 	case PCI_DEVICE_ID_RME_DIGI32_8:
-		strcpy(card->shortname, "RME Digi32/8");
+		strscpy(card->shortname, "RME Digi32/8");
 		break;
 	case PCI_DEVICE_ID_RME_DIGI32_PRO:
-		strcpy(card->shortname, "RME Digi32 PRO");
+		strscpy(card->shortname, "RME Digi32 PRO");
 		break;
 	}
 	sprintf(card->longname, "%s (Rev. %d) at 0x%lx, irq %d",
-- 
2.50.0

