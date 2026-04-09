Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50E39DBFC
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727552; cv=none; b=ucACcVJ/nxzVmjmtG19dWAa0MkezWNgS1fOWXHC01x2rZ7ohM0IinB4cQjKlCJjCeqUT1QEreQ2ojTCn63oepWXvesNGweJk0PRSP0zMRCaD0b11HLs3Xvxaie30Wta9VCEL2Bs3os8QeY2hx/8ZczbnJubzTxRYi3AuE4XnKaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727552; c=relaxed/simple;
	bh=u6585DGnZ2MDUQeMopV5/IrvLE4dE8PJyKT/J/pV4TM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2TUt8pQ07OyJE2KUzzgay9jkXvp75akbCXAruTZwXNC16oq77FvX3USaqHOL58aBqYNp7jzSG8S8CuwLfm1LmxwVKlihhQ38xs23U3OUmKIEnjiF3/CFrM7f8V0iUEOVGOXM2uikIIlSFDP2GN8vHy2ds16llau+bkKNfjX06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sz+0yBOw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vz9xoZQs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sz+0yBOw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vz9xoZQs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sz+0yBOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vz9xoZQs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sz+0yBOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vz9xoZQs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 433C84EE89;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7NGkMW/s4R1a/NbeFkTRzp9SvLzac0b835k8gv15Go=;
	b=Sz+0yBOwj+qaMdV4ezZgnWLAOxgYg23Dvf6cGFsyTBaXs08XLiMkKUY+u4IHo2609Bn8rm
	OVfemmaixoOIKRRReaeKGmSxkrb7hsF0toA9TY6786rL9M0IIvVlkLZwJmboWJ3qw+TuZE
	S5osUmWzi5lFUoJfbgM5Ew+HsoKQZmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7NGkMW/s4R1a/NbeFkTRzp9SvLzac0b835k8gv15Go=;
	b=vz9xoZQsosaab7KLUTxQpIyH5chkLuW85Q2uh9oaPRca9QtUN0HjA+pKW+c3qRBwBZD8X9
	Sx0ruF8UVlHEoJDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7NGkMW/s4R1a/NbeFkTRzp9SvLzac0b835k8gv15Go=;
	b=Sz+0yBOwj+qaMdV4ezZgnWLAOxgYg23Dvf6cGFsyTBaXs08XLiMkKUY+u4IHo2609Bn8rm
	OVfemmaixoOIKRRReaeKGmSxkrb7hsF0toA9TY6786rL9M0IIvVlkLZwJmboWJ3qw+TuZE
	S5osUmWzi5lFUoJfbgM5Ew+HsoKQZmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7NGkMW/s4R1a/NbeFkTRzp9SvLzac0b835k8gv15Go=;
	b=vz9xoZQsosaab7KLUTxQpIyH5chkLuW85Q2uh9oaPRca9QtUN0HjA+pKW+c3qRBwBZD8X9
	Sx0ruF8UVlHEoJDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29DBF4A0B6;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UN/vCJdz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/10] ALSA: hda/conexant: Clean up with the new GPIO helper
Date: Thu,  9 Apr 2026 11:38:22 +0200
Message-ID: <20260409093826.1317626-10-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409093826.1317626-1-tiwai@suse.de>
References: <20260409093826.1317626-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
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

Use the new GPIO helper function to clean up the open code.

Merely a code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/conexant.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index aa726eb323eb..3a9717df39b4 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -154,14 +154,8 @@ static void cxt_init_gpio_led(struct hda_codec *codec)
 	struct conexant_spec *spec = codec->spec;
 	unsigned int mask = spec->gpio_mute_led_mask | spec->gpio_mic_led_mask;
 
-	if (mask) {
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
-				    mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
-				    mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_led);
-	}
+	if (mask)
+		snd_hda_codec_set_gpio(codec, mask, mask, spec->gpio_led, 0);
 }
 
 static void cx_fixup_headset_recog(struct hda_codec *codec)
@@ -775,9 +769,7 @@ static void cxt_setup_gpio_unmute(struct hda_codec *codec,
 {
 	if (gpio_mute_mask) {
 		// set gpio data to 0.
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA, 0);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK, gpio_mute_mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION, gpio_mute_mask);
+		snd_hda_codec_set_gpio(codec, gpio_mute_mask, gpio_mute_mask, 0, 0);
 		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_STICKY_MASK, 0);
 	}
 }
-- 
2.53.0

