Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689B1AC427
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496255; cv=none; b=mVsWT5V/mWRI9QWp7YL8FypLDQvbRi76iqB86uuXwNthgAHn+Ktdx2sXEZARjHAjZN9+db7TW7wAYpGpPF4zTgv2OSDmLtix5HKTmaG2zIOgqe3fFvvDDhqGX0/iIXuSZDYIvPMbHGDZ2n73aEE0PCYo0pCtkbhZY8EyVjy1Smc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496255; c=relaxed/simple;
	bh=h0kheS2rTC1Ne6UzIbajj5dBPzgqR4oGMTT/LXF7ZpQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGZlr9L5lAwCBEroOUih7jDalxHk10mt+DwmCXlunP33PKlRXgbQ9zsWVEa4qCOGbc09KLlBuRwRSrj9NPIBozWooEDN+GhYzUckSzgCoqHyNdmdZ/6xOf8al03MoBm3UkqSI+9XLolSDmknV0CAMufT3YOYNgkrc6PzLEYOkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SdSrm5o4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5qqItf3S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SdSrm5o4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5qqItf3S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SdSrm5o4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5qqItf3S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SdSrm5o4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5qqItf3S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B368D211D0;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umwm5iVF5t7iDU7YBE3mKtrWNtGE6HgJMuiAWjRE/t8=;
	b=SdSrm5o4iM9PoI/udugrFJtvwnwcJyyQHHx7PD8K60wNY7k9hRAMbJYy/egi8gH/RWySpk
	4Lk+TU0ZfBq8NVqV/JfTJbAaVyIY+iKhynagwfF9tvfw+ZL9gDeGUxYnCCBfrM5dBiMpVO
	uCFQe/ntI+OSNgo7b1rGdw/sGWX7A2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umwm5iVF5t7iDU7YBE3mKtrWNtGE6HgJMuiAWjRE/t8=;
	b=5qqItf3SYop/7K+9RSG3uCnkFXvR40hcfJkjamHj5dX3xghX+U6thp0cMgsH8sQy+1LfAA
	Q4DSRCVFDNGHieAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SdSrm5o4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5qqItf3S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umwm5iVF5t7iDU7YBE3mKtrWNtGE6HgJMuiAWjRE/t8=;
	b=SdSrm5o4iM9PoI/udugrFJtvwnwcJyyQHHx7PD8K60wNY7k9hRAMbJYy/egi8gH/RWySpk
	4Lk+TU0ZfBq8NVqV/JfTJbAaVyIY+iKhynagwfF9tvfw+ZL9gDeGUxYnCCBfrM5dBiMpVO
	uCFQe/ntI+OSNgo7b1rGdw/sGWX7A2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umwm5iVF5t7iDU7YBE3mKtrWNtGE6HgJMuiAWjRE/t8=;
	b=5qqItf3SYop/7K+9RSG3uCnkFXvR40hcfJkjamHj5dX3xghX+U6thp0cMgsH8sQy+1LfAA
	Q4DSRCVFDNGHieAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C7D13301;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SFZrIzaJNGe3UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:10:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/5] ALSA: 6fire: Release resources at card release
Date: Wed, 13 Nov 2024 12:10:39 +0100
Message-ID: <20241113111042.15058-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113111042.15058-1-tiwai@suse.de>
References: <20241113111042.15058-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B368D211D0
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The current 6fire code tries to release the resources right after the
call of usb6fire_chip_abort().  But at this moment, the card object
might be still in use (as we're calling snd_card_free_when_closed()).

For avoid potential UAFs, move the release of resources to the card's
private_free instead of the manual call of usb6fire_chip_destroy() at
the USB disconnect callback.

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 33e962178c93..d562a30b087f 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -61,8 +61,10 @@ static void usb6fire_chip_abort(struct sfire_chip *chip)
 	}
 }
 
-static void usb6fire_chip_destroy(struct sfire_chip *chip)
+static void usb6fire_card_free(struct snd_card *card)
 {
+	struct sfire_chip *chip = card->private_data;
+
 	if (chip) {
 		if (chip->pcm)
 			usb6fire_pcm_destroy(chip);
@@ -72,8 +74,6 @@ static void usb6fire_chip_destroy(struct sfire_chip *chip)
 			usb6fire_comm_destroy(chip);
 		if (chip->control)
 			usb6fire_control_destroy(chip);
-		if (chip->card)
-			snd_card_free(chip->card);
 	}
 }
 
@@ -136,6 +136,7 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	chip->regidx = regidx;
 	chip->intf_count = 1;
 	chip->card = card;
+	card->private_free = usb6fire_card_free;
 
 	ret = usb6fire_comm_init(chip);
 	if (ret < 0)
@@ -162,7 +163,7 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	return 0;
 
 destroy_chip:
-	usb6fire_chip_destroy(chip);
+	snd_card_free(card);
 	return ret;
 }
 
@@ -181,7 +182,6 @@ static void usb6fire_chip_disconnect(struct usb_interface *intf)
 
 			chip->shutdown = true;
 			usb6fire_chip_abort(chip);
-			usb6fire_chip_destroy(chip);
 		}
 	}
 }
-- 
2.43.0

