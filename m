Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921792E7382
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451295; cv=none; b=c8dXPjH8bUWDRAoLMSl+CBZotCzTYlDYZCz26iFOoUL1Xf5iRXIs5qtJnK4nJ0gwbeqgiXHLoKjovNf3RV5CMMs8r+el4zhOzb5t0CH5UXmPHWFVkSKEZPTJ8kjkIrGx4iBEvsfDWknZ4L6kEn2pFXIV1L4sV0qWcvf7lDzZW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451295; c=relaxed/simple;
	bh=zUdE6IbZJcKS79MROYFu2XNdk8InXook2wsJUICkfIc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNnjTHnedz0gOGEc8zkE6QTwyTsfDdOuNp5SFO7Orz94nl2PWR7S0JlDE9aa4kzoe9QXSDi9Xfzjox0mjNXjZPqrbG4gYCRcXUDPmLpqoFtz8R7NvF2jzRiGj1ZPAv74JhSdlcZgnW/2kMFsrnsB/9hKTuAKmTSVoPj9EOsjTe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z71utieH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=27jzS3LY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z71utieH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=27jzS3LY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z71utieH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="27jzS3LY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z71utieH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="27jzS3LY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A8FD7798BD;
	Sun, 19 Jul 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784451291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERTsq/PdwuyqE7x32WdFqGrT4Nz7M9N4M1X8ItbZCUo=;
	b=Z71utieHdhJoH3R17nJ6GrIaMsn7FJmBUenUWJessGPlNwoZR1BevSugqJB2ZliHI2EusA
	CNFc8HsvhHnksO33V0AeT2QFbWv79tN0/HokrPo27nkGyWkW2AgqA1IfzN0ZXpERH7tnng
	cj5WKvyKsrZ7CTgAClWmYhOwbzwjrBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784451291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERTsq/PdwuyqE7x32WdFqGrT4Nz7M9N4M1X8ItbZCUo=;
	b=27jzS3LYwxkMuH4pyAkITkoiX9ozUR2I4yuN0tE+5/iLYu2eKU1qMAYvRFQc8Df+FQJ6Zb
	Oizw1p+RQJM9/8BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784451291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERTsq/PdwuyqE7x32WdFqGrT4Nz7M9N4M1X8ItbZCUo=;
	b=Z71utieHdhJoH3R17nJ6GrIaMsn7FJmBUenUWJessGPlNwoZR1BevSugqJB2ZliHI2EusA
	CNFc8HsvhHnksO33V0AeT2QFbWv79tN0/HokrPo27nkGyWkW2AgqA1IfzN0ZXpERH7tnng
	cj5WKvyKsrZ7CTgAClWmYhOwbzwjrBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784451291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERTsq/PdwuyqE7x32WdFqGrT4Nz7M9N4M1X8ItbZCUo=;
	b=27jzS3LYwxkMuH4pyAkITkoiX9ozUR2I4yuN0tE+5/iLYu2eKU1qMAYvRFQc8Df+FQJ6Zb
	Oizw1p+RQJM9/8BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51E99779AA;
	Sun, 19 Jul 2026 08:54:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h3C3EduQXGoOUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jul 2026 08:54:51 +0000
Date: Sun, 19 Jul 2026 10:54:50 +0200
Message-ID: <878q77s6jp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	Gordon Chen <chengordon326@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	jussi@sonarnerd.net,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio device
In-Reply-To: <d77254b3-1e6f-483e-8c03-b8f1e033d7a0@kylinos.cn>
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
	<18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
	<87zezvx73v.wl-tiwai@suse.de>
	<d77254b3-1e6f-483e-8c03-b8f1e033d7a0@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,suse.com,kernel.org,sonarnerd.net,vivo.com,rong.moe,b4.vu,uniontech.com,iki.fi,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Level: 

On Tue, 14 Jul 2026 15:09:46 +0200,
Zhang Heng wrote:
> 
> 
> From 11c25cb49a0a233fda643b2eb6c0bca7bc726d37 Mon Sep 17 00:00:00 2001
> From: Zhang Heng <zhangheng@kylinos.cn>
> Date: Tue, 14 Jul 2026 17:55:54 +0800
> Subject: [PATCH] ALSA: usb-audio: Fix boot-time crackling for Generic USB
>  Audio device
> 
> The Generic USB Audio device (0x1e0b:d01e) produces crackling noise during
> system boot when the boot music plays. The issue disappears once the system
> has fully started.
> 
> Kernel logs show xhci-ring warnings when the device initializes:
> [    9.654586] xhci_hcd 0000:03:00.3: Frame ID 644 (reg 5154, index 13) beyond range (645, 1539)
> [    9.654589] xhci_hcd 0000:03:00.3: Ignore frame ID field, use SIA bit instead
> [    9.655053] xhci_hcd 0000:03:00.3: Frame ID 644 (reg 5158, index 14) beyond range (645, 1539)
> [    9.655055] xhci_hcd 0000:03:00.3: Ignore frame ID field, use SIA bit instead
> 
> These warnings indicate that xhci_get_isoc_frame_id() returns -EINVAL for
> TDs at index > 0 because their calculated Frame IDs become stale before
> validation completes. This causes a fallback to SIA mode for those TDs,
> while index=0 TD uses direct Frame ID. The resulting mixed scheduling within
> the same data endpoint causes audio data misalignment and crackling.
> 
> Fix by adding QUIRK_FLAG_ISO_ASAP and setting URB_ISO_ASAP flag for the
> data endpoint. This ensures all TDs use consistent SIA scheduling. Also add
> a quirk to skip the first 4 sync packets, as some devices send incorrect
> feedback data during stream startup.
> 
> Using the quirk mechanism keeps endpoint.c device-agnostic and allows easy
> addition of new devices with the same symptom.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
> v1->v2:
>  
> - Replace hardcoded USB ID check in endpoint.c with QUIRK_FLAG_ISO_ASAP
> - Add QUIRK_TYPE_ISO_ASAP = 31 enum and QUIRK_FLAG_ISO_ASAP macro in usbaudio.h
> - Add device entry to quirk_flags_table in quirks.c for Generic USB Audio (0x1e0b:d01e)
> - Add ISO_ASAP string entry to snd_usb_audio_quirk_flag_names
> - Add documentation comment for QUIRK_FLAG_ISO_ASAP in usbaudio.h
> - Keep endpoint.c device-agnostic, allowing easy addition of new devices
> 
>  sound/usb/endpoint.c | 2 ++
>  sound/usb/quirks.c   | 8 ++++++++
>  sound/usb/usbaudio.h | 8 ++++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index 24cd7692bd01..155b3858dac9 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -1256,6 +1256,8 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
>  			goto out_of_memory;
>  		u->urb->pipe = ep->pipe;
>  		u->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
> +		if (ep->chip->quirk_flags & QUIRK_FLAG_ISO_ASAP)
> +			u->urb->transfer_flags |= URB_ISO_ASAP;
>  		u->urb->interval = 1 << ep->datainterval;
>  		u->urb->context = u;
>  		u->urb->complete = snd_complete_urb;
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 2949a0d2d961..f5e5b662bfd3 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1938,6 +1938,10 @@ void snd_usb_endpoint_start_quirk(struct snd_usb_endpoint *ep)
>  	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
>  		ep->skip_packets = 4;
>  
> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> +		ep->skip_packets = 4;
> +

Please add some comment why the device needs this workaround.
IIUC, the reason is different from the others in your case.

Also, please verify that the problem is reproduced in the latest
upstream kernel, and the workaround works as expected there, too.


thanks,

Takashi
