Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A83A7F69
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727524; cv=none; b=tWV6jBW7K/7jGMRaaHw8Uo0qzajORRb80RSivj0gLNho2xeyS66LoUmrpfUg00GMdif2L63i6iWE3PXj1EPPeSlKji9CIofXkPcyq/sq9SIinQiVY8QEO7suC6rccPZuZd/egXOxfZsmZkoVfACi0x+LaUhGqMARQE3plrwXI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727524; c=relaxed/simple;
	bh=ZAlVKWfDFgm/9AUhNimvdJ5ZP70P0aGCQWDIMAucRMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGxX3AQnakhNPvfw6Vcyahp8FefIxT4JIVPzAK7d88XF+AWGDcu9J8ism5rtYpYa53eIQ1BFyDHk/mP3JBfkZcxrKROIhp3YKkrlBsugxQoZJnhhzYpSxxHdaHqxS9J7oL7Tr+ZpaYLY1QUvdCjjoZMPfqqvHC52IsunxqfRCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=neGMPrU0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wj4lDwdB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=neGMPrU0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wj4lDwdB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="neGMPrU0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wj4lDwdB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="neGMPrU0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wj4lDwdB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6E895BD25;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/IzLbTPMQ/absuYsIvhcc0439QCDhr0lXOMGov0slc=;
	b=neGMPrU0bdb6GxqjyxDlQbngXZ1vW7iUKWrvG9nxSUxrqI148bznkGaB7iUrOh28ZVDP8D
	4YKEE9EoVQRDmbfBMVVSoH0ZLqvlA7lO9HfH5as3EuHcLIS9LAU008mxAEJTSvFBSur/cS
	bc70+42Om1PZk6LWcBatPwRX3NFJHLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/IzLbTPMQ/absuYsIvhcc0439QCDhr0lXOMGov0slc=;
	b=wj4lDwdBWn0crYBZ/lC2LQMtm7knSDGa/mkkxCEsw9UT4TTk4Llxz3EuAKOvi2tSKf1M2W
	Dx6D+e710ThOHKCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=neGMPrU0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wj4lDwdB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/IzLbTPMQ/absuYsIvhcc0439QCDhr0lXOMGov0slc=;
	b=neGMPrU0bdb6GxqjyxDlQbngXZ1vW7iUKWrvG9nxSUxrqI148bznkGaB7iUrOh28ZVDP8D
	4YKEE9EoVQRDmbfBMVVSoH0ZLqvlA7lO9HfH5as3EuHcLIS9LAU008mxAEJTSvFBSur/cS
	bc70+42Om1PZk6LWcBatPwRX3NFJHLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/IzLbTPMQ/absuYsIvhcc0439QCDhr0lXOMGov0slc=;
	b=wj4lDwdBWn0crYBZ/lC2LQMtm7knSDGa/mkkxCEsw9UT4TTk4Llxz3EuAKOvi2tSKf1M2W
	Dx6D+e710ThOHKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A3144A0B4;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +PGBIJZz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/10] ALSA: hda/analog: Fix GPIO verb orders
Date: Thu,  9 Apr 2026 11:38:18 +0200
Message-ID: <20260409093826.1317626-6-tiwai@suse.de>
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
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: A6E895BD25
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

So far we used the verb cache to restore the GPIO mask, direction and
data bits at PM resume.  But, due to the nature of the cache resume
mechanism, the calling order isn't guaranteed, and this might lead to
some inconsistency at the restored state.

For assuring the GPIO verb orders, use the new GPIO helper function to
explicitly set up the GPIO bits, instead of using the codec verb
caches, while keeping the current data bits in ad198x_spec.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/analog.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/analog.c b/sound/hda/codecs/analog.c
index 11b1d30b23fd..1ba8ae54e25e 100644
--- a/sound/hda/codecs/analog.c
+++ b/sound/hda/codecs/analog.c
@@ -38,6 +38,8 @@ struct ad198x_spec {
 
 	unsigned int beep_amp;	/* beep amp value, set via set_beep_amp() */
 	int num_smux_conns;
+
+	unsigned int gpio_data;
 };
 
 
@@ -934,9 +936,9 @@ static void ad1884_vmaster_hp_gpio_hook(void *private_data, int enabled)
 
 	if (spec->eapd_nid)
 		ad_vmaster_eapd_hook(private_data, enabled);
-	snd_hda_codec_write_cache(codec, 0x01, 0,
-				   AC_VERB_SET_GPIO_DATA,
-				   enabled ? 0x00 : 0x02);
+	spec->gpio_data = enabled ? 0x00 : 0x02;
+	snd_hda_codec_write(codec, 0x01, 0,
+			    AC_VERB_SET_GPIO_DATA, spec->gpio_data);
 }
 
 static void ad1884_fixup_hp_eapd(struct hda_codec *codec,
@@ -948,12 +950,7 @@ static void ad1884_fixup_hp_eapd(struct hda_codec *codec,
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		spec->gen.vmaster_mute.hook = ad1884_vmaster_hp_gpio_hook;
 		spec->gen.own_eapd_ctl = 1;
-		snd_hda_codec_write_cache(codec, 0x01, 0,
-					  AC_VERB_SET_GPIO_MASK, 0x02);
-		snd_hda_codec_write_cache(codec, 0x01, 0,
-					  AC_VERB_SET_GPIO_DIRECTION, 0x02);
-		snd_hda_codec_write_cache(codec, 0x01, 0,
-					  AC_VERB_SET_GPIO_DATA, 0x02);
+		spec->gpio_data = 0x02;
 		break;
 	case HDA_FIXUP_ACT_PROBE:
 		if (spec->gen.autocfg.line_out_type == AUTO_PIN_SPEAKER_OUT)
@@ -961,6 +958,9 @@ static void ad1884_fixup_hp_eapd(struct hda_codec *codec,
 		else
 			spec->eapd_nid = spec->gen.autocfg.speaker_pins[0];
 		break;
+	case HDA_FIXUP_ACT_INIT:
+		snd_hda_codec_set_gpio(codec, 0x02, 0x02, spec->gpio_data, 0);
+		break;
 	}
 }
 
-- 
2.53.0

