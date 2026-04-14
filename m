Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3A5225775
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172944; cv=none; b=Ak4juTwkgy4WMGjVRMOLnMTAYyM9XdiSU8bLTFex8rs3K+J+0WzaFeGnar8nWJQ4kF19TWaD/+c6TaV+YJ1/ySm90nx7p17vN9kXdHo3Cv6Jer9bmCQKlFOzbIZ4/63URrvhFIP5E39X+5s6/DK0SEdAMGN9ElLkH7hG/apHbcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172944; c=relaxed/simple;
	bh=+XqhA5zEyfen1JU9jcHVFs/bkZW9t2M0TVWNo9b8skc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWWj22+anc0ue3bzkG8NhjOiTTn+THFTD3QuF9NB3z5YNeLY6WS97fgvQcy9PCkUva2gA7jq7x5BxQM8kJCManl8mGAZ/CY6/I6dgfPO0gBQE+S70KE+KZ74XwrzT18CwQF9qNmXGTdXtLncqFbA3FF9QgBR7lGjTuMHHegOp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bcGWKYgi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OruPAgZz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bcGWKYgi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OruPAgZz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcGWKYgi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OruPAgZz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcGWKYgi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OruPAgZz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE4E05BDE0;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4vLbxuGkWCUskZoKIE4e/Vu/WPX1U2Yuw+VrjUC8R0=;
	b=bcGWKYgig/AuqLXzU9JUb+KBcTlDS3y/eNBAoZy18/XjtKdgv+VMLSlCKXniWae8m4RV3J
	OpjdvWmZbwIn4p5QkozW7LekhAh5MKUjGh3bR5zHLQQ1lVvZd8xWdn1tbiuirRtKZqbGsy
	+L09Q2+AMLoGfA2LQZxhVnm8RWXgUp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4vLbxuGkWCUskZoKIE4e/Vu/WPX1U2Yuw+VrjUC8R0=;
	b=OruPAgZzN+burHEoEAtkT/Y13EkE/IYwejmEbHY3XoLdhPi5umKmoe+mPyvQBvNMelFoPl
	PNxI29OFTBbkQmCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bcGWKYgi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OruPAgZz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4vLbxuGkWCUskZoKIE4e/Vu/WPX1U2Yuw+VrjUC8R0=;
	b=bcGWKYgig/AuqLXzU9JUb+KBcTlDS3y/eNBAoZy18/XjtKdgv+VMLSlCKXniWae8m4RV3J
	OpjdvWmZbwIn4p5QkozW7LekhAh5MKUjGh3bR5zHLQQ1lVvZd8xWdn1tbiuirRtKZqbGsy
	+L09Q2+AMLoGfA2LQZxhVnm8RWXgUp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4vLbxuGkWCUskZoKIE4e/Vu/WPX1U2Yuw+VrjUC8R0=;
	b=OruPAgZzN+burHEoEAtkT/Y13EkE/IYwejmEbHY3XoLdhPi5umKmoe+mPyvQBvNMelFoPl
	PNxI29OFTBbkQmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94B0E4B476;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8EoVI40/3mnbOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 13:22:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ALSA: 6fire: Drop unnecessary NULL checks
Date: Tue, 14 Apr 2026 15:22:14 +0200
Message-ID: <20260414132218.411013-5-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414132218.411013-1-tiwai@suse.de>
References: <20260414132218.411013-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: AE4E05BDE0
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The NULL checks of chip pointer in usb6fire_chip_abrt() and
usb6fire_card_free() are utterly useless, as it's guaranteed to be
non-NULL.  Drop them for increasing the readability.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 556882bd9022..2c5648966412 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -43,32 +43,28 @@ static DEFINE_MUTEX(register_mutex);
 
 static void usb6fire_chip_abort(struct sfire_chip *chip)
 {
-	if (chip) {
-		if (chip->pcm)
-			usb6fire_pcm_abort(chip);
-		if (chip->midi)
-			usb6fire_midi_abort(chip);
-		if (chip->comm)
-			usb6fire_comm_abort(chip);
-		if (chip->control)
-			usb6fire_control_abort(chip);
-	}
+	if (chip->pcm)
+		usb6fire_pcm_abort(chip);
+	if (chip->midi)
+		usb6fire_midi_abort(chip);
+	if (chip->comm)
+		usb6fire_comm_abort(chip);
+	if (chip->control)
+		usb6fire_control_abort(chip);
 }
 
 static void usb6fire_card_free(struct snd_card *card)
 {
 	struct sfire_chip *chip = card->private_data;
 
-	if (chip) {
-		if (chip->pcm)
-			usb6fire_pcm_destroy(chip);
-		if (chip->midi)
-			usb6fire_midi_destroy(chip);
-		if (chip->comm)
-			usb6fire_comm_destroy(chip);
-		if (chip->control)
-			usb6fire_control_destroy(chip);
-	}
+	if (chip->pcm)
+		usb6fire_pcm_destroy(chip);
+	if (chip->midi)
+		usb6fire_midi_destroy(chip);
+	if (chip->comm)
+		usb6fire_comm_destroy(chip);
+	if (chip->control)
+		usb6fire_control_destroy(chip);
 }
 
 static int usb6fire_chip_probe(struct usb_interface *intf,
-- 
2.53.0

