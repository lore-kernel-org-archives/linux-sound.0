Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08F1ADC83
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909217; cv=none; b=jufVSN3bWxQOQtQi7S/CaiSMp6vymr8r0SadOuAXxhzd1kuRsh3AFy5zsD01ZvoqME/sclv0z2eravbpJl5uJ7EXhcIHzVsUXKmNQQIPaPjtJSb97xO/tFDyUGznDOrWsbthShr6/lNGIeiZmry55dtWNXD3KoC2yzTKmQdyr3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909217; c=relaxed/simple;
	bh=qqTw9OcirFPDGVkvd+SlMkq0qkH3VpmHZoAwP0O5eHs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lj2MXbNxP1xaN2+C8bMABcUK0LCzjkZ/zOMZhldCgC9tLPoAGK19qenmTeXyQxP9EE4tbz7XXrPBv6yW6RYooAvJY9W8i3IybRSzFjIbPN40eB9j8RX3yvqPH7Eo0E2s2zDI/KA3wLNXhTuF7KFzWpmn66YvJQkFg3TonJpvI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZCEK5/Io; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GaRBLKpQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZCEK5/Io; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GaRBLKpQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCEK5/Io";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GaRBLKpQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCEK5/Io";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GaRBLKpQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 809B06B39C;
	Mon,  4 May 2026 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777909214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMMW7ZEXFiQyDF6jeCPQ8dGti5hnqgNfh8gzjqrLB70=;
	b=ZCEK5/IosQMwlCunr8HQdC6EB6CORBLk1DnEHIuQvAuJbUoJdWnGOJR/yaLTVpFQkVGI8k
	XWgvV92PiCeKhL1g6+Uy9SvohUo7R8lZejCwOzz2AIm/XPYhASG4acd2dQwkFTMgp8DzWH
	deZWtI/xhoYtop3AANxJBhU8/MAOurU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777909214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMMW7ZEXFiQyDF6jeCPQ8dGti5hnqgNfh8gzjqrLB70=;
	b=GaRBLKpQBzHoF7na3yy3xvPTX+6JwtuKXP8oHo7NTBhFQ7bxmwBzAt4c0a8d7ndvMHyZ+v
	keML2DVdmHykwOCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777909214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMMW7ZEXFiQyDF6jeCPQ8dGti5hnqgNfh8gzjqrLB70=;
	b=ZCEK5/IosQMwlCunr8HQdC6EB6CORBLk1DnEHIuQvAuJbUoJdWnGOJR/yaLTVpFQkVGI8k
	XWgvV92PiCeKhL1g6+Uy9SvohUo7R8lZejCwOzz2AIm/XPYhASG4acd2dQwkFTMgp8DzWH
	deZWtI/xhoYtop3AANxJBhU8/MAOurU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777909214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMMW7ZEXFiQyDF6jeCPQ8dGti5hnqgNfh8gzjqrLB70=;
	b=GaRBLKpQBzHoF7na3yy3xvPTX+6JwtuKXP8oHo7NTBhFQ7bxmwBzAt4c0a8d7ndvMHyZ+v
	keML2DVdmHykwOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 554EC593A3;
	Mon,  4 May 2026 15:40:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ka6fE969+GlFIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 15:40:14 +0000
Date: Mon, 04 May 2026 17:40:13 +0200
Message-ID: <87wlxjw5cy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flags for JBL Pebbles
In-Reply-To: <20260504-uac-jbl-pebbles-v1-1-c888d592a286@rong.moe>
References: <20260504-uac-jbl-pebbles-v1-1-c888d592a286@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 04 May 2026 13:38:05 +0200,
Rong Zhang wrote:
> 
> JBL Pebbles is a pair of desktop speakers with UAC interface. Its
> Playback and Capture mixers use linear volume with val = 0/999/1 and
> 0/3996/4. Meanwhile, the reported sample rates are truncated to
> multiples of 0x100 (i.e., 44100 => 44032), resulting in noisy kmsg, as a
> warning message is printed each time a stream is opened.
> 
> Add a quirk table entry matching VID/PID=0x05fc/0x0231 and applying
> linear volume and sample rate quirk flags, so that it can work properly.
> 
> Also note that the volume control knob on device is an incremental
> encoder. It does nothing but sends KEY_VOLUMEUP and KEY_VOLUMEDOWN per
> rotation, controlling the UAC Playback volume mixer indirectly. Hence,
> the linear volume quirk flags also enable the volume control knob to
> function properly.
> 
> Quirky device sample:
> 
>   usb 5-1.1: new full-speed USB device number 12 using xhci_hcd
>   usb 5-1.1: New USB device found, idVendor=05fc, idProduct=0231, bcdDevice= 1.00
>   usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 5-1.1: Product: JBL Pebbles
>   usb 5-1.1: Manufacturer: Harman International Industries
>   usb 5-1.1: SerialNumber: 1.0.0
>   usb-storage 5-1.1:1.0: USB Mass Storage device detected
>   scsi host0: usb-storage 5-1.1:1.0
>   usb 5-1.1: Found last interface = 1
>   usb 5-1.1: 2:1: add audio endpoint 0x5
>   usb 5-1.1: Creating new data endpoint #5
>   usb 5-1.1: 2:1 Set sample rate 44100, clock 0
>   usb 5-1.1: current rate 44032 is different from the runtime rate 44100
>   usb 5-1.1: 3:1: add audio endpoint 0x84
>   usb 5-1.1: Creating new data endpoint #84
>   usb 5-1.1: 3:1 Set sample rate 44100, clock 0
>   usb 5-1.1: current rate 44032 is different from the runtime rate 44100
>   usb 5-1.1: [2] FU [PCM Playback Switch] ch = 1, val = 0/1/1
>   usb 5-1.1: Warning! Unlikely big volume step count (=999), linear volume or wrong cval->res?
>   usb 5-1.1: [2] FU [PCM Playback Volume] ch = 2, val = 0/999/1
>   usb 5-1.1: [5] FU [Mic Capture Switch] ch = 1, val = 0/1/1
>   usb 5-1.1: Warning! Unlikely big volume step count (=999), linear volume or wrong cval->res?
>   usb 5-1.1: [5] FU [Mic Capture Volume] ch = 2, val = 0/3996/4
>   input: Harman International Industries JBL Pebbles as /devices/pci0000:00/0000:00:08.3/0000:67:00.3/usb5/5-1/5-1.1/5-1.1:1.4/0003:05FC:0231.0018/input/input55
>   hid-generic 0003:05FC:0231.0018: input,hidraw2: USB HID v2.01 Device [Harman International Industries JBL Pebbles] on usb-0000:67:00.3-1.1/input4
> 
> Signed-off-by: Rong Zhang <i@rong.moe>

Applied now.  Thanks.


Takashi
