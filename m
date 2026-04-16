Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02E2368275
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352747; cv=none; b=qJyfjzGeWioMXFWOPLA0m8K7ZJEfQzFxY9hk9zvY7bz7HeWcQBjaAIkP4vK+R031dFn7JhsgyUp19QDhcZFV2q3RIxvaQOgcjDURyIlYq91edx3iyjry1Gg/FDNPWH3c8KgnGCnbcfBBAbsZhdiIBi5juTBCEt8wnlI5UJwREpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352747; c=relaxed/simple;
	bh=ZrSJvQAEDnIqL2UZ2QTv1nHv1Wqy1KcbaZqNHu6yiPY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZzESAO0ZWovj7n7IKgd52YaPkhRMjPudWQWWZLkdnQmL2DMOb4QzRkL5qeRCRg9z4aQ7E8pLXV35aJI/ozRY7cjfKZtDWmncbjzEkWvg9f3HbwxY926bRibfXkPXRf8wnqCAsgbbjoy+ns2n37qtyUFbionjUc045iYqb/EFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ip6ZpfAr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FOEfQSCY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=obz/C8ND; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f5jQL4X2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ip6ZpfAr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FOEfQSCY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="obz/C8ND";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f5jQL4X2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DAAF55BE36;
	Thu, 16 Apr 2026 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776352744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOKfnSnwPPwtu2OdYO/IYZ59puVbn51ir+L03HYYdMA=;
	b=ip6ZpfArNPqWZEpcz4ZF7FV91aSCLEv1clLWasp9Yn+nXnXrF4csGjMx74P6pI48SzKDWg
	ouNIajYkKV7dI6l9CuCDwEmj8A039iKMUY+VC0QCYQUP4lFUTq+GgguF7K/by2yYadFaZg
	KATGGlCgdD5GAo1wRvhyFGckd5iJUBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776352744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOKfnSnwPPwtu2OdYO/IYZ59puVbn51ir+L03HYYdMA=;
	b=FOEfQSCYlGTuNuvb794xvvSlsV9j4ECjAAsxnoMw2mLmlejy+9oQxk2QS5ifmpSVHsgeDq
	hBbx6QuTXGytQMCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="obz/C8ND";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f5jQL4X2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776352743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOKfnSnwPPwtu2OdYO/IYZ59puVbn51ir+L03HYYdMA=;
	b=obz/C8NDrjSAfTTQIeqtLTOQ8N87zkLZcLBqOH9WXESP+P3Q4zApicenpRB1WAWQX8rCgC
	SJWxYMqEx86qlzzb190HVbEcKottuNHe0eyTzK7wfaKBjc+JaljmILail9AaXXHTX0PtvC
	N8hughZF9oVvxa9QJlZ9sB42YuRjU2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776352743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOKfnSnwPPwtu2OdYO/IYZ59puVbn51ir+L03HYYdMA=;
	b=f5jQL4X2KIDV1zZCZ69vIDXyt0OQZ6TZ0epalxxdToNwyU3zCRsqJKhCFRZ8G3xpaY5N6Q
	hQJ00k5BlRqqPgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1964593A3;
	Thu, 16 Apr 2026 15:19:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V/g0Juf94Gk5RwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Apr 2026 15:19:03 +0000
Date: Thu, 16 Apr 2026 17:19:03 +0200
Message-ID: <87se8vdjbs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Juan Pablo Fuentealba <jpfuentealbabizama@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
In-Reply-To: <CALB_=sif39301fM28W7tkcRmAmwKeixaHGA=kSC6BS3ap4Netg@mail.gmail.com>
References: <CALB_=sif39301fM28W7tkcRmAmwKeixaHGA=kSC6BS3ap4Netg@mail.gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DAAF55BE36

On Thu, 16 Apr 2026 17:08:15 +0200,
Juan Pablo Fuentealba wrote:
> 
> From 782a75f5847b23659af978b7b61325205c32c947 Mon Sep 17 00:00:00 2001
> From: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
> Date: Wed, 15 Apr 2026 09:16:47 -0400
> Subject: [PATCH v2] ALSA: usb-audio: Add quirk for SmartlinkTechnology
>  M01
> 
> Add quirk entry for SmartlinkTechnology M01 USB microphone to enable
> the standard mixer interface.
> 
> Signed-off-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>

The patch isn't applicable yet, as the tabs/spaces are broken.
And, it's strange that you put From, Date and Subject headers inside
the patch description, too.

Please try to send in a proper format, preferably via git-send-email.


thanks,

Takashi

> ---
>  sound/usb/quirks-table.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 803e03d4d77b..283135d880db 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -3772,6 +3772,18 @@ YAMAHA_DEVICE(0x7010, "UB99"),
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
> +               QUIRK_DATA_STANDARD_MIXER(QUIRK_ANY_INTERFACE)
> +       }
> +},
>  #define QUIRK_RME_DIGIFACE(pid) \
>  { \
>         /* Only claim interface 0 */ \
> --
> 2.53.0
