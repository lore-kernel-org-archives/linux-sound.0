Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086384;
	b=OoMjRbKPD+o6Bwxuk3iWPd8KJgxW3KaKokdBELeUeZ4HFgm6//QVNUH/ZhtuSWN5D+gY
	 sKVHj8FxeiIofGV6RXSAZOuztkfJOo6VAU7hfjNXZtEw6xUPbBKaLpGjfQFltb6hCP9eb
	 Xz9n6//gb8uGQ2WFuq1VbkxykyyRM9ur+oo2F9burwKrJa5B4v2/rDkntVKkp7yInd26W
	 4QTmfs3P78/zct5jtX6yrnz5Fqgi0Jb9HneoQQA9Sp0EE+fSQK2HlgxtrySYa0FsByfHx
	 nHLNb1dvOXD4pwzBYCXcctgxfF8oQGb2V4mO6F5TZOqlu69e9t9ldG1b+EWSuu5ZS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086384;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=97IrQL5dz1GNzKcBkoGAWMYLpK10P13Hkd6+uSIBcfM=;
	b=IkoEVj1BLctU2Yq0sjpV04b83leolPXAIzEQm88GtN6FTnjcDdycDfz+fBei/LMLhvfN
	 WlYYjUFP9QM3xJcNmHS7yv+NTEvuUlkr6lMvzPqknQcnfcLa7Piz+IFQZOe39oM/tPDaS
	 vx+qbPnF54YXTao/YMET0q3C3xPHO48UlUfEt2dMc6Xfzs9678IUUEv8Z/KmHMVWiioa7
	 DAsCJtD5t2rBJBv0Y2h0cGDK1z0ZeEO2UdAdDs9daMpNlOwoUiuE7Rr3Oa3rgKFM3YFDs
	 jxGjltQBCNp/D8LiKm+1WwE7nXKIenF/3Z/nRipWZ1TE7QnOuD8gEucEGKPLv3lfBvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1XX6CKbb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sFg0V3dJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1XX6CKbb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sFg0V3dJ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB794606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 07:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB794606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1XX6CKbb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sFg0V3dJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1XX6CKbb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sFg0V3dJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AAA3521E95;
	Tue, 27 Oct 2026 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97IrQL5dz1GNzKcBkoGAWMYLpK10P13Hkd6+uSIBcfM=;
	b=1XX6CKbbUX9IproeQic5XxDI/9j4J0zoc+UpdNKeYSFbF7isIyi3+tUAVqiZ5zKDZMPBYY
	UbX/5tqExc3a8VlJ+2GXqWfeLMRfm+7pLLdSS6vp5c1wFTPVrS89f1iP3twsl7O+KoHg2w
	0g9X9z+og7QrNmQ6e/aPL6ki19diCII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97IrQL5dz1GNzKcBkoGAWMYLpK10P13Hkd6+uSIBcfM=;
	b=sFg0V3dJtjG+R/wIuAuvL66qTLxXf9J6hynh2um6FMAPZrH1Hp6o3C6USYSjGuq1PhaUgH
	KVx6N5M7qDS4nGDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1XX6CKbb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sFg0V3dJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97IrQL5dz1GNzKcBkoGAWMYLpK10P13Hkd6+uSIBcfM=;
	b=1XX6CKbbUX9IproeQic5XxDI/9j4J0zoc+UpdNKeYSFbF7isIyi3+tUAVqiZ5zKDZMPBYY
	UbX/5tqExc3a8VlJ+2GXqWfeLMRfm+7pLLdSS6vp5c1wFTPVrS89f1iP3twsl7O+KoHg2w
	0g9X9z+og7QrNmQ6e/aPL6ki19diCII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97IrQL5dz1GNzKcBkoGAWMYLpK10P13Hkd6+uSIBcfM=;
	b=sFg0V3dJtjG+R/wIuAuvL66qTLxXf9J6hynh2um6FMAPZrH1Hp6o3C6USYSjGuq1PhaUgH
	KVx6N5M7qDS4nGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28CEF13319;
	Tue, 27 Oct 2026 07:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ba5OO6xT4GqtVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 07:33:01 +0000
Date: Tue, 27 Oct 2026 08:33:00 +0100
Message-ID: <87qzhb38er.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sally Marcher <marcher@student.tugraz.at>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	Alexander Tsoy <alexander@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: MOTU MicroBook II playback fix
In-Reply-To: <d5dfd044-69f6-4fc3-9884-6599d88afb55@student.tugraz.at>
References: <6690AE3A-5D2A-488D-BB09-1588948491D9@student.tugraz.at>
	<abf3bf13-4f91-4026-89ea-74b5f42ea935@student.tugraz.at>
	<fc46e94ecb01b6f09ad3548e1654d128d74dea03.camel@tsoy.me>
	<1ceb66f2-d5c2-4419-b75f-33afb2f52fbd@student.tugraz.at>
	<e79d259f7a3892aba307b3674b235c53b68e1ed3.camel@tsoy.me>
	<d5dfd044-69f6-4fc3-9884-6599d88afb55@student.tugraz.at>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: AAA3521E95

On Mon, 26 Oct 2026 17:01:32 +0100,
Sally Marcher wrote:
> 
> Hi,
> patch is attached to this email.

OK, I applied manually now.


thanks,

Takashi

> 
> Thanks,
> Sally Marcher
> 
> On 10/26/26 2:57 PM, Alexander Tsoy wrote:
> > ÷ ðÎ, 26/10/2026 × 14:40 +0100, Sally Marcher ÐÉÛÅÔ:
> >>  šFrom cd7f80a8beaa40bcb2b313586a3c698d35982c21 Mon Sep 17 00:00:00
> >> 2001
> >> From: Sally Marcher <me@gry.sh>
> >> Date: Mon, 26 Oct 2026 14:29:34 +0100
> >> Subject: [PATCH] Add correct datainterval in the quirks-table for
> >> Microbook II
> >> 
> >> This patch fixes playback issues on the Microbook II.
> >> The correct value was in the older driver for this device
> >> (
> >> https://github.com/manuel-rhdt/snd-microbookii/blob/dd304c097bb6a9d522
> >> 76ac29c6969fa02bc7674a/audio.c#L914).
> >> 
> >> Datainterval needs to be set explicitly.
> >> 
> >> Signed-off-by: Sally Marcher <me@gry.sh>
> >> ---
> >>  ššsound/usb/quirks-table.h | 2 ++
> >>  šš1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> >> index 71444c2898b4..ac7861c3d26c 100644
> >> --- a/sound/usb/quirks-table.h
> >> +++ b/sound/usb/quirks-table.h
> >> @@ -2781,6 +2781,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
> >>  šš š š š š š š š š š š.rates = SNDRV_PCM_RATE_96000,
> >>  šš š š š š š š š š š š.ep_attr = USB_ENDPOINT_XFER_ISOC |
> >>  šš š š š š š š š š š š š š š USB_ENDPOINT_SYNC_ASYNC,
> >> +š š š š š š š š š š .datainterval = 1,
> >>  šš š š š š š š š š š š.rate_min = 96000,
> >>  šš š š š š š š š š š š.rate_max = 96000,
> >>  šš š š š š š š š š š š.nr_rates = 1,
> >> @@ -2803,6 +2804,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
> >>  šš š š š š š š š š š š.rates = SNDRV_PCM_RATE_96000,
> >>  šš š š š š š š š š š š.ep_attr = USB_ENDPOINT_XFER_ISOC |
> >>  šš š š š š š š š š š š š š š USB_ENDPOINT_SYNC_ASYNC,
> >> +š š š š š š š š š š .datainterval = 1,
> >>  šš š š š š š š š š š š.rate_min = 96000,
> >>  šš š š š š š š š š š š.rate_max = 96000,
> >>  šš š š š š š š š š š š.nr_rates = 1,
> > Hi!
> > 
> > You should send this path to linux-sound@vger.kernel.org and CC
> > mainterners: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
> > <perex@perex.cz>
> > 
> > Also your email client garbles the patch. For example tabs are replaced
> > by spaces. If you cannot fix that, then it's better to just attach the
> > patch as a text file.
> From cd7f80a8beaa40bcb2b313586a3c698d35982c21 Mon Sep 17 00:00:00 2001
> From: Sally Marcher <me@gry.sh>
> Date: Mon, 26 Oct 2026 14:29:34 +0100
> Subject: [PATCH] Add correct datainterval in the quirks-table for Microbook II
> 
> This patch fixes playback issues on the Microbook II.
> The correct value was in the older driver for this device (https://github.com/manuel-rhdt/snd-microbookii/blob/dd304c097bb6a9d52276ac29c6969fa02bc7674a/audio.c#L914).
> 
> Datainterval needs to be set explicitly.
> 
> Signed-off-by: Sally Marcher <me@gry.sh>
> ---
>  sound/usb/quirks-table.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 71444c2898b4..ac7861c3d26c 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -2781,6 +2781,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  					.rates = SNDRV_PCM_RATE_96000,
>  					.ep_attr = USB_ENDPOINT_XFER_ISOC |
>  						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
>  					.rate_min = 96000,
>  					.rate_max = 96000,
>  					.nr_rates = 1,
> @@ -2803,6 +2804,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  					.rates = SNDRV_PCM_RATE_96000,
>  					.ep_attr = USB_ENDPOINT_XFER_ISOC |
>  						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
>  					.rate_min = 96000,
>  					.rate_max = 96000,
>  					.nr_rates = 1,
> -- 
> 2.56.0
> 
