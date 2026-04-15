Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344633D34AB
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261909; cv=none; b=FFQsXYfrEeF312yyhMf00oIPpJwS2l1QHh6WnY3207R8wPerC+GQsPdQgy+WxRndkUtHoXnS3MSzc++wcluJSZpAyvT/krhInCEotKu7+r3OeXdfuIoJg9DXVc7pGujCKUjiIFhAvjmd7gQgGk8Vte+wCLN/0Z79G4X0so8/EFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261909; c=relaxed/simple;
	bh=s5adX5EnBbrdGBnYktZDeOC3CI1QiGpxVAiL1de++G8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7oxi0AxpyiOWHhQQCKU8oHnbJUab3kzxN14O4OrGWwzn0mWvL+W9ZccqgB17zGC6JURKx8e1XhHA4/bNcsQRzTZyaY/8xu8zCb6kp5nuJymXTe2r33wdGCgqfA4RjkE2awtQz+W87CWYPhuPC1PGP0BQgXO9wF5G7R9mS5qdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i9d/R7DF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LU1altDH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i9d/R7DF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LU1altDH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i9d/R7DF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LU1altDH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i9d/R7DF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LU1altDH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5CDEC5BE3A;
	Wed, 15 Apr 2026 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776261906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4k6Apno3vrQPKB0CzfivJrMdt0Xy1WUXrCMEI5wnRI8=;
	b=i9d/R7DF6ljGlozzvlZlQkfkeVtCidwad+8VilXxjAMdDa9x0/rcD3q8660GVVjGBmdv4x
	uZTvdfIq4rpStHbti1Mix2BecIxHB9cuSQjK6VqavwLpssEIHxado76vioUEulCANURMPL
	S4X4+Of6Cz3oFTaEFbtY2bqJXuJcxis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776261906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4k6Apno3vrQPKB0CzfivJrMdt0Xy1WUXrCMEI5wnRI8=;
	b=LU1altDHdVe1CBI0KFTCyboOVgR4yg20ZGScNOqJZZ8nkU8vmBJMsGAx/RgYuiGOUzPWK6
	IKscb31jHYBB3BAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="i9d/R7DF";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LU1altDH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776261906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4k6Apno3vrQPKB0CzfivJrMdt0Xy1WUXrCMEI5wnRI8=;
	b=i9d/R7DF6ljGlozzvlZlQkfkeVtCidwad+8VilXxjAMdDa9x0/rcD3q8660GVVjGBmdv4x
	uZTvdfIq4rpStHbti1Mix2BecIxHB9cuSQjK6VqavwLpssEIHxado76vioUEulCANURMPL
	S4X4+Of6Cz3oFTaEFbtY2bqJXuJcxis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776261906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4k6Apno3vrQPKB0CzfivJrMdt0Xy1WUXrCMEI5wnRI8=;
	b=LU1altDHdVe1CBI0KFTCyboOVgR4yg20ZGScNOqJZZ8nkU8vmBJMsGAx/RgYuiGOUzPWK6
	IKscb31jHYBB3BAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C2694BA46;
	Wed, 15 Apr 2026 14:05:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZboBEhKb32kgCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Apr 2026 14:05:06 +0000
Date: Wed, 15 Apr 2026 16:04:57 +0200
Message-ID: <87fr4wfhfa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Juan Pablo Fuentealba <jpfuentealbabizama@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
In-Reply-To: <CALB_=sh1ONfaueYQ_rzMbzz9xXGTSQaA_km8qEiUfhgLLCq2Qw@mail.gmail.com>
References: <CALB_=sh1ONfaueYQ_rzMbzz9xXGTSQaA_km8qEiUfhgLLCq2Qw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5CDEC5BE3A

On Wed, 15 Apr 2026 15:33:49 +0200,
Juan Pablo Fuentealba wrote:
> 
> From 7a57eecb5a332da652a0bb3c006fb4ce5316fa17 Mon Sep 17 00:00:00 2001
> From: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
> Date: Wed, 15 Apr 2026 09:16:47 -0400
> Subject: [PATCH] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01

Embedding those headers (except for From:) in the patch looks wrong.
I can trim them, but please check your setup for submission.

> Add quirk entry for SmartlinkTechnology M01 USB microphone
> to enable the standard mixer interface.
> 
> Signed-off-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
> ---
>  sound/usb/quirks-table.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 803e03d4d77b..9edfafb7d274 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -3772,6 +3772,21 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>                 }
>         }
>  },
> +{
> +       /*
> +        * SmartlinkTechnology M01
> +        * USB audio device that needs standard mixer quirk
> +        */
> +       USB_DEVICE(0x301a, 0x159b),
> +       QUIRK_DRIVER_INFO {
> +               .vendor_name = "SmartlinkTechnology",
> +               .product_name = "M01",
> +               QUIRK_DATA_COMPOSITE {
> +                       QUIRK_DATA_STANDARD_MIXER(QUIRK_ANY_INTERFACE),
> +                       QUIRK_COMPOSITE_END

Any reason for using the composite type here?
You should be able to use QUIRK_DATA_STANDARD_MIXER() for single
entry.


thanks,

Takashi
