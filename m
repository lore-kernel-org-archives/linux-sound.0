Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCBC379971
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255886; cv=none; b=snFU/TosX2ubwdRbUeugx2/ZwDqTBUj1cBpzZ9dX++9q6ungwedT6Ds5v3S4OzVpKM9xNf62HUGVm3zIBSMttkxDHTrV3CopUqPZyNes9ULuRS4YrXRZg2zUuSNLLyYeQl0heJr4+3vRzJhFx1276jzK/xq4/GiY754Y0t3+JJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255886; c=relaxed/simple;
	bh=cOczFNpNJzmkh+WcKr72pnjNm9/i/mj/bk8QXqOwFSU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrhJv+1HyKSBGTG82EdfAJxTH+jerKK2Vy/80/QGoFvMB15JmMhKu4ejNFu/YiQ+9zd5T2bfWkcSgrWc9zwvkpgI/lgJee/4C66wNcwqOnWFuKSF4EQOjUip8JmsLb20YJo4JfWlXg5q6j779Y/IIa1oWIa0m0D+PO7YyK14Dj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXWGRX2D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pu1lTsZA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nZeYbdfh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XWX/uL53; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXWGRX2D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pu1lTsZA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nZeYbdfh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XWX/uL53"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 33FB33E15;
	Tue, 28 Jul 2026 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785255879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1FdfHkUHBMLmu1CisXrdutTM9aJ4fDj7W/TuHzHJ4s=;
	b=MXWGRX2DYYqXTMlQm2R4TJCHWesFTvl8NKEY3DyV9ywunqJBz53CXI+3e9A6pXM7fq7z54
	PYWBdcR8sPKuUi61BLYM4hFPYZ5OO5roScfe8Kq1/E4k31Lt/VzyvtPHE518WbElEm7T7i
	ND4QbQEZdaPKjSiKXHbXgvXfkP0Tshk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785255879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1FdfHkUHBMLmu1CisXrdutTM9aJ4fDj7W/TuHzHJ4s=;
	b=Pu1lTsZAj+W2Rkq56MUKKW9S8QnuEf0bVRiOpa5E07cVbY22kS7eQ8LA7rTUQl04kSQqrf
	hDjTXQDzfCGmF1CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785255875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1FdfHkUHBMLmu1CisXrdutTM9aJ4fDj7W/TuHzHJ4s=;
	b=nZeYbdfhHBCCwZW8rHF4yfKnZnrSIiTpllPrrKm0zQ7r70DliavpJFEdb3TblnMDcqCiaM
	MuxZO6sUp8t2l4Sq6JtTmzs/ZDMQ5fBsiQx1joRGmpGXWXauY/7L9f7P8n2fZu9cgf9jaJ
	2MscbTfFAlzXPHY7TjPOfFEELwJFXU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785255875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1FdfHkUHBMLmu1CisXrdutTM9aJ4fDj7W/TuHzHJ4s=;
	b=XWX/uL53gc8rCB0V49ZbJX3494P5b8S1woJcTzD4CLCKPfWFWRJObbjCjTC09Lq6cCNUsl
	WThByTkjyG7oPXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 011FB779B1;
	Tue, 28 Jul 2026 16:24:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pxpkOsLXaGrgBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 16:24:34 +0000
Date: Tue, 28 Jul 2026 18:24:34 +0200
Message-ID: <875x1z6q0t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Shi <liaronce@hotmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Gordon Chen <chengordon326@gmail.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8
In-Reply-To: <OS3PR01MB8827BF7068BF30726C2C8A1BDECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
References: <20260526072906.90106-1-chengordon326@gmail.com>
	<OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<87bjbr6tth.wl-tiwai@suse.de>
	<OS3PR01MB8827BF7068BF30726C2C8A1BDECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hotmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org,perex.cz];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 28 Jul 2026 17:46:05 +0200,
Mark Shi wrote:
> 
> Hi Takashi,
> 
> 在 2026/7/28 23:02, Takashi Iwai 写道:
> > On Tue, 28 Jul 2026 16:27:35 +0200,
> > Mark Shi wrote:
> >> Hi Gordon,
> >> 
> >> 在 2026/5/26 15:29, Gordon Chen 写道:
> >>> The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
> >>> declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
> >>> its UAC2 endpoint companion descriptor. After 5-35 minutes of
> >>> continuous playback, the device occasionally returns a capture URB in
> >>> which every iso_frame_desc has a non-zero status (-EXDEV bursts,
> >>> visible as rate-limited "frame N active: -18" lines in dmesg from
> >>> pcm.c).
> >>> 
> >>> In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
> >>> and falls into the early "skip empty packets" return originally added
> >>> for M-Audio Fast Track Ultra. As a result the playback EP loses its
> >>> sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
> >>> stops advancing while substream state remains RUNNING. Only USB
> >>> re-enumeration recovers.
> >>> 
> >>> Three independent ftrace captures (taken at the moment of stall via a
> >>> userspace watchdog) consistently show:
> >>> 
> >>>     - 60-70 capture URB completions in the 70ms window before the marker
> >>>     - 0 retire_playback_urb / queue_pending_output_urbs /
> >>>       snd_usb_endpoint_implicit_feedback_sink calls
> >>>     - every usb_submit_urb in the window comes from
> >>>       snd_complete_urb+0x64e (capture self-resubmit), none from the
> >>>       queue_pending_output_urbs path
> >>> 
> >>> Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
> >>> early return is skipped and we fall through to enqueue a packet_info
> >>> whose packet_size[i] are all 0 (the existing loop already maps
> >>> status!=0 packets to size 0). prepare_outbound_urb then emits a
> >>> silence packet, the OUT ring keeps moving, and the device rides
> >>> through the glitch.
> >>> 
> >>> The default behaviour (early return) is preserved for all existing
> >>> devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
> >>> 
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Gordon Chen <chengordon326@gmail.com>
> >>> 
> >> Device: Mechrevo WUJIE14Pro A-7BC4U
> >> CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
> >> Firmware Version: T140_PHX_V20
> >> Firmware Release Date: 2024.1.8
> >> Kernel version: 7.1.4
> >> 
> >> In Linux kernel 7.1.4, I found that my laptop couldn't wake up from S3
> >> suspend; I had to hold down the power button to force a shutdown and
> >> then restart it.
> >> 
> >> Using `git bisect`, I discovered that if I revert this patch, the
> >> laptop resumes from S3 normally.
> > Do you have this USB-audio device (Behringer Flow 8 with USB ID
> > 1397:050c)?  The commit must be harmless unless you have this device.
> > That is, if you don't have this device, it's likely a false-positive
> > bisection result.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> I don't have that device, but I partially reverted the code in that
> section, and it went back to normal.

Hmm, that's odd.

> 
> 
> Thanks,
> 
> Mark Shi
> 
> ---
>  sound/usb/endpoint.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index 24cd7692bd01..6fbcb117555c 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -1780,16 +1780,8 @@ static void snd_usb_handle_sync_urb(struct
> snd_usb_endpoint *ep,
>          /*
>           * skip empty packets. At least M-Audio's Fast Track Ultra stops
>           * streaming once it received a 0-byte OUT URB
> -         *
> -         * However, on devices where bytes==0 means every sync-source
> -         * packet errored (e.g. Behringer Flow 8 returning -EXDEV bursts
> -         * for entire capture URBs), an unconditional return starves the
> -         * IFB-fed OUT ring permanently. Such devices set
> -         * QUIRK_FLAG_IFB_SILENCE_ON_EMPTY to fall through and enqueue a
> -         * packet_info with size 0 packets, so playback emits silence
> -         * and the OUT ring keeps moving.
>           */
> -        if (bytes == 0 && !(ep->chip->quirk_flags &
> QUIRK_FLAG_IFB_SILENCE_ON_EMPTY))
> +        if (bytes == 0)
>              return;
> 
>          spin_lock_irqsave(&ep->lock, flags);

Could you put a debug print what value does ep->chip->quirk_flags
have on your device?


thanks,

Takashi
