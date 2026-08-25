Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE63F44FC;
	Tue, 25 Aug 2026 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651729; cv=none; b=hVtc9ks1Ogv8QbvTbPKVvLiEq6AG1fVOqbkk46lB9DHUUBjlr0Vfa6Xnut+sj/DrFnn/GGvwksQcsZwB9LOnoew9ONTeCQ3q2YNHgjyUOzklvva6Xw9xfz97i5xSH42FJWkT3uo9Ups5HE95ioIbkYf7vF7dTpKIZL5HysvQWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651729; c=relaxed/simple;
	bh=pryLJeY2JlCP71su+2mMboa9hqIpDqCGmH9L5O9Hsaw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9eU7eockIC7c/H/44rjLHKf28d8HNqk9iaPZ07NMI9LfpXFcJUAzGRFRxwPT5fu/VQhBFvRxydburilGc+qog/ou5xr7HX1gSa5ip4moWZa30Fbs6JCMGSuKjuH3A6KrnEW26tuAjJ/4FHrtrzGghmgTNazyyu1ILaD0lfIEXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Niz0Jj7k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s4MriL96; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qdJgioOx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q6ZNnv82; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Niz0Jj7k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s4MriL96";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qdJgioOx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q6ZNnv82"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9B8F1F7A8;
	Tue, 25 Aug 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787651722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icE26OqhRqhignKiuo00Y6xdhtjTrPTaPBQZb6RNDT4=;
	b=Niz0Jj7kvXSoJWY8dh/D/pZv1amEB9ckolCC5CJDpGkAnSMJ+PCq8K9j7d3ASJPHEbdKT8
	GbKeZnkO/JEbWljqqZrCCI9oP78LlVkCTw2MT7mf3OG1B8ADYzTxXTpGoiegoPaoglMZpT
	U+YUxFakDHPF1hq0xfIQyZCyo65cC00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787651722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icE26OqhRqhignKiuo00Y6xdhtjTrPTaPBQZb6RNDT4=;
	b=s4MriL96oAelW8w+o5ZpXuDZnoDygRStwnx7mIY1k5+xrhARmXwpY9+4DehHMv9aOdwr/x
	1d8oCcGJL7+LpLDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qdJgioOx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Q6ZNnv82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787651717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icE26OqhRqhignKiuo00Y6xdhtjTrPTaPBQZb6RNDT4=;
	b=qdJgioOx3Ut0ESTSazMHaBax1jAJm6AXAy7fh6CV3edOMEzRmFKlFNATTw0UH9jYsbJLvr
	XMhDdzxWPrXoWv8rXieXe6TGOOZtOZHyXeDMzEy4SU+AyS9AKCQWtbROGNavHVFvJMNHs6
	+haR8MlbJEbcX0Eid/3DIZ8Kv1wiDD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787651717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icE26OqhRqhignKiuo00Y6xdhtjTrPTaPBQZb6RNDT4=;
	b=Q6ZNnv82xOeojwb58G4nkbyyEZ94XPw/v21pnil+w7IV6VxEwv8QZxEsbRow7QcH3cs2dv
	LWpiUng/OSOVaHAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D357513331;
	Tue, 25 Aug 2026 09:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wGPyMoVmjWqEYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 09:55:17 +0000
Date: Tue, 25 Aug 2026 11:55:13 +0200
Message-ID: <87v78ysewu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
In-Reply-To: <20260825094536.1718716-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
	<20260825094536.1718716-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E9B8F1F7A8
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 25 Aug 2026 11:45:36 +0200,
songxiebing wrote:
> 
> Hi Takashi,
> 
> Yes, reading these registers is just to print out debugging information
> for problem analysis.

Then it's better to move the pin setup to the caller; it makes the
setup more consistent.  While we're at it, rename the function to be
more intuitive one.  So the change would be something like below.


Takashi

> 
> >On Tue, 25 Aug 2026 11:13:03 +0200,
> >songxiebing wrote:
> >>
> >> Hi Takashi,
> >>
> >> 0x19 is configured as a mic pin, in cx_update_headset_mic_vref, it
> >> executes cx_process_headset_plugin only after confirming that a mic
> >> present is detected. A 4-pole headset is detected as either CTIA or
> >> OMTP and sets 0x24, but the 3-pole mic case is not handled, so a
> >> setting of 0x24 is added here.
> >
> >OK, then you'd need to explain more in the patch description.
> >It implies that the patch corrects the debug output, too.
> >
> >And, this also opens another door: why do we read those registers at
> >all?  Now you always set the pin control 0x24 no matter what the
> >connection type is.  So the whole headset type detection becomes
> >practically moot; it's used only for showing a debug print.
> >
> >
> >thanks,
> >
> >Takashi

-- 8< --
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -207,7 +207,7 @@ static void cx_remove(struct hda_codec *codec)
 	snd_hda_gen_remove(codec);
 }
 
-static void cx_process_headset_plugin(struct hda_codec *codec)
+static void cx_process_headset_detect_plug_type(struct hda_codec *codec)
 {
 	unsigned int val;
 	unsigned int count = 0;
@@ -226,9 +226,8 @@ static void cx_process_headset_plugin(struct hda_codec *codec)
 	if (val & 0xc00) {
 		codec_dbg(codec, "headset plugin, type is %s\n",
 			  val & 0x800 ? "CTIA" : "OMTP");
-		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
 	} else {
-		codec_dbg(codec, "headphone plugin\n");
+		codec_dbg(codec, "headphone or mic plugin\n");
 	}
 }
 
@@ -241,10 +240,12 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 	 * Check hp&mic tag to process headset plugin & plugout.
 	 */
 	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
-	if (!(mic_present & AC_PINSENSE_PRESENCE)) /* mic plugout */
+	if (!(mic_present & AC_PINSENSE_PRESENCE)) { /* mic plugout */
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x20);
-	else
-		cx_process_headset_plugin(codec);
+	} else {
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
+		cx_process_headset_detect_plug_type(codec);
+	}
 }
 
 static int cx_suspend(struct hda_codec *codec)
