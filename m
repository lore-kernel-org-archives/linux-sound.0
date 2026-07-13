Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D81E0DE8
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955145; cv=none; b=ndJ9A6LM3lAkCDT9OX6j50nWvqBNb4tC8cWh2BvmOfEHPhDEXk0G/fjGXALolD+zJDP7pKwd7P5gdLU2gqBDNPEdWpbUnUdBTKiKjJuDao/0mjeW7/XhekzvJGpqZAUJjkQHIQPEM3jYgf3vkzUheQJrbkNAxi5mU4RwLCQRH8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955145; c=relaxed/simple;
	bh=+SENkzfKyH7VqdNAfDgd714RPxzXi8lw9PxDxDDD5Yw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5ONw5yhYUQRAqXEEbAOjj74dTsmunR9YckLyi37rAuNJaI8y+5AmHl5rDvKTXp92axKv3znRgWhfgSgmkUvNMClzavJMDZppP7PJFdv8bvLuPeFzifAJOUHEJk0wmdetg/2ru3IVFtLyrmSC8+rZnPCDw1aWgapKuc6bQo+WZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBAMW/Ix; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vqp81Iiz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n15W3S/x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rfbkqhrE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBAMW/Ix";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vqp81Iiz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n15W3S/x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rfbkqhrE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 40FB73E0A;
	Mon, 13 Jul 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783955142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KHkdJpK9Jo6XhNV9iGxs5AE5vt0cBcw0MKLCPOTcZ8=;
	b=PBAMW/IxagEKLxQz3Cq5r/a2SDp7AGHwTGRy6yOhgeWEsHKiPLfYh4x6b7ZJ/E5fSKHjQ1
	WcD67ovfTNU9vEpA392sm35Tiy2bDqxVAiNbgLyOl+J7Z9P8z7nVCjdT1D6lHb+gi+5Fme
	8AzyGBloYO9ovX6AE/TVeY0co42GcXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783955142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KHkdJpK9Jo6XhNV9iGxs5AE5vt0cBcw0MKLCPOTcZ8=;
	b=vqp81IizGZoD2wN4ATyfXYEnPEsVGNZd2//H7S3iXCawV7VUqfbcou1PzvRGqhrw/0SfGw
	f7VG7NZOKju0ptAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="n15W3S/x";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rfbkqhrE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783955141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KHkdJpK9Jo6XhNV9iGxs5AE5vt0cBcw0MKLCPOTcZ8=;
	b=n15W3S/xBgdRAU92FfsFTViPhT26QF41EcLJAxmXS2loNLcFPdX20iAsy+tDdrZf+kEASL
	0nlDi2MnQ1sSWMkCxOml/lcJvUNiepwbF0LJCpeeK5RZHGb5nXLQPYQZyXU9fb1XTZI2Ic
	JUfhhqHzLtnTLiOGp6yLYcA0XtZlMJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783955141;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KHkdJpK9Jo6XhNV9iGxs5AE5vt0cBcw0MKLCPOTcZ8=;
	b=rfbkqhrEB9r9NnvuZ8S7ldRE3nFyxqqsVnyrHxCtpVSElAB2t94j8vrMEFxsobLz34twoZ
	RuQO1EXuJPdfLQCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFFED779AE;
	Mon, 13 Jul 2026 15:05:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C+qNMcT+VGq1UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 15:05:40 +0000
Date: Mon, 13 Jul 2026 17:05:40 +0200
Message-ID: <87zezvx73v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gordon Chen" <chengordon326@gmail.com>
Cc: "Zhang Heng" <zhangheng@kylinos.cn>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<kees@kernel.org>,
	<jussi@sonarnerd.net>,
	<hulianqin@vivo.com>,
	<i@rong.moe>,
	<g@b4.vu>,
	<cryolitia@uniontech.com>,
	<pav@iki.fi>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio	 device
In-Reply-To: <18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
	<18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 40FB73E0A
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 13 Jul 2026 15:20:29 +0200,
Gordon Chen wrote:
> 
> On Mon, Jul 13, 2026 at 04:10:48PM +0800, Zhang Heng wrote:
> > +		/* Generic USB Audio (0x1e0b:d01e): use SIA for consistent scheduling */
> > +		if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e))
> > +			u->urb->transfer_flags |= URB_ISO_ASAP;
> 
> Not a maintainer, just a bystander who was Cc'd -- two small notes on the
> form of the patch, plus one question I can't answer myself.
> 
> A per-device usb_id comparison in the endpoint.c fast path seems like the
> kind of thing the quirk_flags_table in quirks.c exists to avoid. Would a
> QUIRK_FLAG_ISO_ASAP (set in the table, tested here as
> chip->quirk_flags & QUIRK_FLAG_ISO_ASAP) work for you? It keeps endpoint.c
> device-agnostic, and the next device with the same symptom becomes a
> one-line table entry rather than another if.
> 
> > +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
> > +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> > +		ep->skip_packets = 4;
> 
> The block immediately above this one already does exactly
> "type == SND_USB_ENDPOINT_TYPE_SYNC -> skip_packets = 4"; adding the ID to
> that condition would avoid the duplicate if. Also, the changelog doesn't
> say what this hunk contributes on its own -- is URB_ISO_ASAP alone
> insufficient, and if so, what does skipping the first 4 sync packets fix
> that ASAP doesn't? Right now the two changes are indistinguishable in the
> commit message, and skip_packets = 4 reads as belt-and-braces.
> 
> And the question. If xhci_get_isoc_frame_id() really does compute a
> stale Frame ID for TDs at index > 0 -- because the frame has advanced by
> the time validation runs -- then isn't that generic to any isoc URB with
> number_of_packets > 1, rather than specific to 1e0b:d01e? The index=0 TD
> gets clamped back into range, later TDs don't, and the endpoint ends up
> mixing explicit Frame IDs with SIA. Nothing in that description looks
> device-specific to me. If it is in fact generic, a per-device quirk in
> sound/usb papers over it for one device while every other multi-TD isoc
> consumer keeps hitting it -- and the fix would belong in xhci-ring.c.
> 
> I'm not familiar enough with the xHCI scheduling side to say whether
> that's right, so it may be worth Cc'ing Mathias Nyman
> <mathias.nyman@linux.intel.com> to get a verdict before this is settled as
> a usb-audio quirk. If your device is the only one that turns the mixed
> scheduling into audible corruption, then the quirk is arguably the right
> scope after all -- but that reasoning should be in the changelog.
> 
> One data point that cuts against my own question above: on an AMD xHCI
> here, streaming to a class-compliant USB audio device, I see no "beyond
> range" / "Ignore frame ID field" messages at all. If the index > 0
> staleness were unconditional I would expect to hit it too. So something
> about your device's packet layout or your host's timing is presumably
> what actually trips it -- which would make the device-specific scope
> defensible, but that is exactly the reasoning I would want to see spelled
> out in the changelog.

Agreed on all points!

Especially the workaround with URB_ISO_ASAP should be applied in a
more generic way.


thanks,

Takashi
