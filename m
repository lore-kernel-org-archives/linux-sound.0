Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BD2882DE
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990766; cv=none; b=ozEMnHmiC6b18jn8tFnE/2Ft5eJmofG8EQzm0OA2BzIU/T+4OGmhD1b92mdLosQPa27O5tAJ3q8QyMT3yAAs1rYQo/l1hPQa/HbZJPqBewWR/WnzRT3uZNnWLl9WsTHKx7wft+abaAppxZDzmoCnATXAxQoTiTpCAzC6N1oLY1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990766; c=relaxed/simple;
	bh=+1fpYDeKOlw1HVXoT9/bdkHMQssi2yLOEzPz4fxMkPY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfZpx1yv7xpn1bd7uR82YFdsHTGVGXOqVtm1t5giYeCHQB94ZcQjeTX8M2ZTeF1WZYmBjUNbXx+Ql11oX2L3r5neknHhVYFfu/0er0tL6LR1CEAnm7I68dNrHMnl/23BzLeZJxyExxNvon1eZiQoMe8eBvQDapdHOpycdD8pWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y9yBbHcU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ngohb5hr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y9yBbHcU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ngohb5hr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y9yBbHcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ngohb5hr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y9yBbHcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ngohb5hr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AECE34392;
	Sat, 25 Jul 2026 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784990756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20BC1cgvdA193K/50vtcZCpBNJ2HjBa5vjoFnjauMsc=;
	b=Y9yBbHcUREMi4onqwSPYB6WD4vhpF2XcXpy8YsnEC/fdNP/+FojNV1l6dwFN2q8FVryHHK
	vFgFfaKbDHESUmEL/mlLBLKdNHjq/L1owevE2qn5mcuCC59Yxy/J15JRdVX32iun+zdeKy
	u72MVeVlWnlwu0mv5WMtGw6UWy4AoUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784990756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20BC1cgvdA193K/50vtcZCpBNJ2HjBa5vjoFnjauMsc=;
	b=Ngohb5hr4Co+SE9gImxlCmD7kpjIYsYlrRp9YAw9HDr8glcG/eFqugDQMismJJePh+o8Xm
	1TRjxIf2Ete3yhAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784990756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20BC1cgvdA193K/50vtcZCpBNJ2HjBa5vjoFnjauMsc=;
	b=Y9yBbHcUREMi4onqwSPYB6WD4vhpF2XcXpy8YsnEC/fdNP/+FojNV1l6dwFN2q8FVryHHK
	vFgFfaKbDHESUmEL/mlLBLKdNHjq/L1owevE2qn5mcuCC59Yxy/J15JRdVX32iun+zdeKy
	u72MVeVlWnlwu0mv5WMtGw6UWy4AoUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784990756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20BC1cgvdA193K/50vtcZCpBNJ2HjBa5vjoFnjauMsc=;
	b=Ngohb5hr4Co+SE9gImxlCmD7kpjIYsYlrRp9YAw9HDr8glcG/eFqugDQMismJJePh+o8Xm
	1TRjxIf2Ete3yhAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72871779B9;
	Sat, 25 Jul 2026 14:45:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lElmGiTMZGpMDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 25 Jul 2026 14:45:56 +0000
Date: Sat, 25 Jul 2026 16:45:56 +0200
Message-ID: <87pl0bb00r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baul Lee <baul.lee@xbow.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	clemens@ladisch.de,
	perex@perex.cz,
	Federico Kirschbaum <federico.kirschbaum@xbow.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix out-of-bounds write in snd_usbmidi_akai_output()
In-Reply-To: <CAEM_DMFgNNvwP7iXA-OVo7A7g_wuQEfTFOi35tzdP1RP6kpPuA@mail.gmail.com>
References: <CAEM_DMFgNNvwP7iXA-OVo7A7g_wuQEfTFOi35tzdP1RP6kpPuA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sat, 25 Jul 2026 11:40:13 +0200,
Baul Lee wrote:
> 
> 
> snd_usbmidi_akai_output() computes its fill-loop bound
> 
> buf_end = ep->max_transfer - MAX_AKAI_SYSEX_LEN - 1;
> 
> as a signed int, so a small device-advertised bulk-OUT max_transfer makes
> buf_end negative.  The loop guard then compares the u32
> urb->transfer_buffer_length against that negative int: the usual arithmetic
> conversion turns buf_end into a large unsigned value, so the guard stays
> true and each iteration keeps appending SysEx framing and payload bytes
> past the end of the URB transfer buffer, which is only max_transfer bytes
> long.
> 
> A USB device that advertises a tiny bulk-OUT endpoint can therefore trigger
> an attacker-length- and content-controlled heap out-of-bounds write when a
> process writes to the created /dev/snd/midiC*D* node.
> 
> Perform the comparison in signed arithmetic so that a negative buf_end
> stops the loop instead of wrapping to a huge unsigned bound.
> 
> Fixes: 4434ade8c933 ("ALSA: usb-audio: add support for Akai MPD16")
> Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>
> Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
> Reported-by: Baul Lee <baul.lee@xbow.com>

First of all, please put your Signed-off-by tag.  It's a legal
requirement for upstreaming.

About the patch:

> ---
>  sound/usb/midi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> index d87e3f357cf7..cc7df77632a1 100644
> --- a/sound/usb/midi.c
> +++ b/sound/usb/midi.c
> @@ -799,7 +799,7 @@ static void snd_usbmidi_akai_output(struct
> snd_usb_midi_out_endpoint *ep,
>   buf_end = ep->max_transfer - MAX_AKAI_SYSEX_LEN - 1;
> 
>   /* only try adding more data when there's space for at least 1 SysEx */
> - while (urb->transfer_buffer_length < buf_end) {
> + while ((int)urb->transfer_buffer_length < buf_end) {
>   count = snd_rawmidi_transmit_peek(substream,
>    tmp, MAX_AKAI_SYSEX_LEN);
>   if (!count) {
> --

The spaces are malformed due to your mailer, hence the patch can't be
applied cleanly via git-am.  Please check your mailer setup.

At best, test once submitting to yourself and check whether you can
apply the patch cleanly via git-am locally beforehand.

BTW, your patches don't seem reached to linux-sound ML by some reason;
I couldn't find your posts in lore.kernel.org.  I'm not sure what went
wrong.

All points above applied to your two other patches, too.


thanks,

Takashi
