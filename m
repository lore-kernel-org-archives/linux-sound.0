Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493983876DB
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727545; cv=none; b=LsB+cdtkc6mGAR+9Fwv3Qtdjr3V1EgmsB24oOgAtD2jnzIijFmwHinJvkPdK9GqDWAjLAh5NSTS8ZP7gXo3AnGewNhmGZbbm/B2AcujIi0K7RTtUmn1Uc96La3RN/9oh1L7H8AXjPdw7y5jQ8TFlY7ZD+Hmk3kVOrQkZhUrbYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727545; c=relaxed/simple;
	bh=F5lGocbNsXQTabhkcspCdZtMM07X+5K4RkGgZaQubk8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzGDJxUUm3YE+nCOwJ2v60GlarT7nAqER4HfT11sjJbVk7Xb9tMe8eWOj7MMtIWrwVxxReUY+RjyL0gl2Zvo8WWz6EzDIO1H5W1OL2H3MjPj/qijHPNjRHaJ3vOgElDj1EkdaSlxpBX1dVBcNvyfXfVSxoY86dUK1/MKn9aiJxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b1ZmDWgv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4HxpyPve; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b1ZmDWgv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4HxpyPve; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b1ZmDWgv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4HxpyPve";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b1ZmDWgv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4HxpyPve"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 62AF25BD2B;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLCYc6YBG61z4N7Sf56p9H/nNOUieIGMQZUDpfVxnVc=;
	b=b1ZmDWgv5WszZRz7M0LhBqcBIA9KRDjFt/YvgWhXbXvSqXM1/H8Q1b64z6lvuKvs3fDVKH
	lZXaSE2PdnQPjI7GhnDImVbBhdaN+W+b60tiBdyczB/TSRo+yXVmrbp5TCG154qzD/S3B2
	GwltsHjm5sxZUUUbYtylgxDMRbdWy9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLCYc6YBG61z4N7Sf56p9H/nNOUieIGMQZUDpfVxnVc=;
	b=4HxpyPveyT/9w+nJabKLj+lnPdz12wiU+cHzE8pbbnBHLf/cStlb1Qmy6AwEolR/jIDx8O
	cDpl7ED4vQBVLWAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLCYc6YBG61z4N7Sf56p9H/nNOUieIGMQZUDpfVxnVc=;
	b=b1ZmDWgv5WszZRz7M0LhBqcBIA9KRDjFt/YvgWhXbXvSqXM1/H8Q1b64z6lvuKvs3fDVKH
	lZXaSE2PdnQPjI7GhnDImVbBhdaN+W+b60tiBdyczB/TSRo+yXVmrbp5TCG154qzD/S3B2
	GwltsHjm5sxZUUUbYtylgxDMRbdWy9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLCYc6YBG61z4N7Sf56p9H/nNOUieIGMQZUDpfVxnVc=;
	b=4HxpyPveyT/9w+nJabKLj+lnPdz12wiU+cHzE8pbbnBHLf/cStlb1Qmy6AwEolR/jIDx8O
	cDpl7ED4vQBVLWAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 493284A0B3;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SBepEJdz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/10] ALSA: hda/senarytech: Clean up with the new GPIO helper
Date: Thu,  9 Apr 2026 11:38:23 +0200
Message-ID: <20260409093826.1317626-11-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
 sound/hda/codecs/senarytech.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 29b554cdd81d..3ee8bc0ea3ab 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -159,14 +159,8 @@ static void senary_init_gpio_led(struct hda_codec *codec)
 	struct senary_spec *spec = codec->spec;
 	unsigned int mask = spec->gpio_mute_led_mask | spec->gpio_mic_led_mask;
 
-	if (mask) {
-		snd_hda_codec_write(codec, codec->core.afg, 0, AC_VERB_SET_GPIO_MASK,
-				    mask);
-		snd_hda_codec_write(codec, codec->core.afg, 0, AC_VERB_SET_GPIO_DIRECTION,
-				    mask);
-		snd_hda_codec_write(codec, codec->core.afg, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_led);
-	}
+	if (mask)
+		snd_hda_codec_set_gpio(codec, mask, mask, spec->gpio_led, 0);
 }
 
 static int senary_init(struct hda_codec *codec)
-- 
2.53.0

