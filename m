Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A82036E9
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774688293; cv=none; b=uVPVhVj6wp4HHTEKYp0OF5IH6TQaQRPh/j7PQlyGoSXpSgIPRkYhHGANnLulut5H7Cnc7ZQikuj7q60hyeRsIDvJKyervKcmxexygYHFRyvk16QZDDhZfuuGFSMFZx6Bn7ZuwaaHtkf6fGN3iyxCKITK2B7xg+QJhK9JzS3Rx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774688293; c=relaxed/simple;
	bh=mMx+7S20krlqYmWTfRh7KL/YaPzzvyyFVYl1/Vfde8U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNQKK6J+RvOx2WkUy+kQ4WokmPH5pFZvEd+GKo7qRGtpOpxrRzB2JWfCptAk7yplKHeto+hK3Gwcv7Ud+uGW37VCCFHxD8wS9BAhcrLQrkhAazrV3B0KOnCf7JbISTnVkXaDwSggDX1WGwQc6SCWFENUIigXPpxLU7ZQEJsHWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NisN3uiY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/gx8Ga+1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NisN3uiY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/gx8Ga+1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NisN3uiY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/gx8Ga+1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NisN3uiY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/gx8Ga+1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 196915BDB1;
	Sat, 28 Mar 2026 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774688289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUtt81RNnTrpY8QpQlD1CMb0zatrQT8CtUxwulzmG4c=;
	b=NisN3uiYIobBF2g+O+dZebsum3gvjMR1PZQSQpzNqisTVnvx5Kx6CKKeFXroak69v2iZ6Q
	q3LqwbHq1/7BtP93ASFY5h+UrgCDIniLbj8xk0O9/9sRwFxR9c/3OCs50xmpk3F9+4xhzL
	q2+q+2KzIweV4wDIyVjDbGcf0oQgIaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774688289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUtt81RNnTrpY8QpQlD1CMb0zatrQT8CtUxwulzmG4c=;
	b=/gx8Ga+1V5RTsRU4maVyZkmQ2hy75HtvzBXv/bp3oCIZD8BV1CKtp9lVyTz3rD0yAxcDdj
	K9nVYOpy13r/7uAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NisN3uiY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/gx8Ga+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774688289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUtt81RNnTrpY8QpQlD1CMb0zatrQT8CtUxwulzmG4c=;
	b=NisN3uiYIobBF2g+O+dZebsum3gvjMR1PZQSQpzNqisTVnvx5Kx6CKKeFXroak69v2iZ6Q
	q3LqwbHq1/7BtP93ASFY5h+UrgCDIniLbj8xk0O9/9sRwFxR9c/3OCs50xmpk3F9+4xhzL
	q2+q+2KzIweV4wDIyVjDbGcf0oQgIaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774688289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUtt81RNnTrpY8QpQlD1CMb0zatrQT8CtUxwulzmG4c=;
	b=/gx8Ga+1V5RTsRU4maVyZkmQ2hy75HtvzBXv/bp3oCIZD8BV1CKtp9lVyTz3rD0yAxcDdj
	K9nVYOpy13r/7uAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E354C4A0A3;
	Sat, 28 Mar 2026 08:58:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +e7RNSCYx2ktEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 08:58:08 +0000
Date: Sat, 28 Mar 2026 09:58:08 +0100
Message-ID: <87fr5kwctb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v3] ALSA: usb-audio: Add support for Arturia AF16Rig
In-Reply-To: <20260328082431.4935-1-willerz@gmail.com>
References: <20260328082431.4935-1-willerz@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,perex.cz:email];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,perex.cz:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 196915BDB1

On Sat, 28 Mar 2026 09:22:40 +0100,
Phil Willoughby wrote:
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Tested-By: Phil Willoughby <willerz@gmail.com>
> Signed-off-by: Phil Willoughby <willerz@gmail.com>

A patch without a proper patch description is absolutely no-go.
Please give enough information for what you change.


thanks,

Takashi

> ---
> Removed the change to clock.c as that code path isn't used when the
> quirks table is filled-in.
> 
>  sound/usb/quirks-table.h | 165 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index eafc0d73cca1..8f79a15055a6 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -3900,5 +3900,170 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  QUIRK_RME_DIGIFACE(0x3f8c),
>  QUIRK_RME_DIGIFACE(0x3fa0),
>  
> +/* Arturia AudioFuse 16Rig Audio */
> +/* AF16Rig MIDI has USB PID 0xaf21 and appears to work OK without quirks */
> +{
> +	USB_DEVICE(0x1c75, 0xaf20),
> +	QUIRK_DRIVER_INFO {
> +		.vendor_name = "Arturia",
> +		.product_name = "AF16Rig",
> +		QUIRK_DATA_COMPOSITE {
> +			{ QUIRK_DATA_STANDARD_MIXER(0) },
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
> +					.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 34,
> +					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
> +					.fmt_bits = 24,
> +					.fmt_sz = 4,
> +					.iface = 1,
> +					.altsetting = 1,
> +					.altset_idx = 1,
> +					.endpoint = 0x01,
> +					.ep_attr = USB_ENDPOINT_XFER_ISOC|
> +						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
> +					.protocol = UAC_VERSION_2,
> +					.maxpacksize = 0x03b8,
> +					.rates = SNDRV_PCM_RATE_44100|
> +						 SNDRV_PCM_RATE_48000,
> +					.rate_min = 44100,
> +					.rate_max = 48000,
> +					.nr_rates = 2,
> +					.rate_table = (unsigned int[]) { 44100, 48000 },
> +					.clock = 41,
> +				}
> +			},
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
> +					.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 18,
> +					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
> +					.fmt_bits = 24,
> +					.fmt_sz = 4,
> +					.iface = 1,
> +					.altsetting = 1,
> +					.altset_idx = 1,
> +					.endpoint = 0x01,
> +					.ep_attr = USB_ENDPOINT_XFER_ISOC|
> +						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
> +					.protocol = UAC_VERSION_2,
> +					.maxpacksize = 0x03a8,
> +					.rates = SNDRV_PCM_RATE_88200|
> +						 SNDRV_PCM_RATE_96000,
> +					.rate_min = 88200,
> +					.rate_max = 96000,
> +					.nr_rates = 2,
> +					.rate_table = (unsigned int[]) { 88200, 96000 },
> +					.clock = 41,
> +				}
> +			},
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
> +					.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 10,
> +					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
> +					.fmt_bits = 24,
> +					.fmt_sz = 4,
> +					.iface = 1,
> +					.altsetting = 3,
> +					.altset_idx = 3,
> +					.endpoint = 0x01,
> +					.ep_attr = USB_ENDPOINT_XFER_ISOC|
> +						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
> +					.protocol = UAC_VERSION_2,
> +					.maxpacksize = 0x03e8,
> +					.rates = SNDRV_PCM_RATE_176400|
> +						 SNDRV_PCM_RATE_192000,
> +					.rate_min = 176400,
> +					.rate_max = 192000,
> +					.nr_rates = 2,
> +					.rate_table = (unsigned int[]) { 176400, 192000 },
> +					.clock = 41,
> +				}
> +			},
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
> +					.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 34,
> +					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
> +					.fmt_bits = 24,
> +					.fmt_sz = 4,
> +					.iface = 2,
> +					.altsetting = 1,
> +					.altset_idx = 1,
> +					.endpoint = 0x81,
> +					.ep_attr = USB_ENDPOINT_XFER_ISOC|
> +						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
> +					.protocol = UAC_VERSION_2,
> +					.maxpacksize = 0x03b8,
> +					.rates = SNDRV_PCM_RATE_44100|
> +						 SNDRV_PCM_RATE_48000,
> +					.rate_min = 44100,
> +					.rate_max = 48000,
> +					.nr_rates = 2,
> +					.rate_table = (unsigned int[]) { 44100, 48000 },
> +					.clock = 41,
> +				}
> +			},
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
> +					.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 18,
> +					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
> +					.fmt_bits = 24,
> +					.fmt_sz = 4,
> +					.iface = 2,
> +					.altsetting = 2,
> +					.altset_idx = 2,
> +					.endpoint = 0x81,
> +					.ep_attr = USB_ENDPOINT_XFER_ISOC|
> +						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
> +					.protocol = UAC_VERSION_2,
> +					.maxpacksize = 0x03a8,
> +					.rates = SNDRV_PCM_RATE_88200|
> +						 SNDRV_PCM_RATE_96000,
> +					.rate_min = 88200,
> +					.rate_max = 96000,
> +					.nr_rates = 2,
> +					.rate_table = (unsigned int[]) { 88200, 96000 },
> +					.clock = 41,
> +				}
> +			},
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
> +					.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 10,
> +					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
> +					.fmt_bits = 24,
> +					.fmt_sz = 4,
> +					.iface = 2,
> +					.altsetting = 3,
> +					.altset_idx = 3,
> +					.endpoint = 0x81,
> +					.ep_attr = USB_ENDPOINT_XFER_ISOC|
> +						   USB_ENDPOINT_SYNC_ASYNC,
> +					.datainterval = 1,
> +					.protocol = UAC_VERSION_2,
> +					.maxpacksize = 0x03e8,
> +					.rates = SNDRV_PCM_RATE_176400|
> +						 SNDRV_PCM_RATE_192000,
> +					.rate_min = 176400,
> +					.rate_max = 192000,
> +					.nr_rates = 2,
> +					.rate_table = (unsigned int[]) { 176400, 192000 },
> +					.clock = 41,
> +				}
> +			},
> +			{ QUIRK_DATA_IGNORE(3) }, /* Firmware update */
> +			QUIRK_COMPOSITE_END
> +		}
> +	}
> +},
> +
>  #undef USB_DEVICE_VENDOR_SPEC
>  #undef USB_AUDIO_DEVICE
> -- 
> 2.53.0
> 
