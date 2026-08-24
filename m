Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E13B14D9;
	Mon, 24 Aug 2026 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553899; cv=none; b=SQXzr0v5iP0Kbwmp73eMlFhHl8npUdzWMvUwws7yEhKjIlghYiGgzraGYiMuh5KFVjQOAZvRohxoob9YUPEi+73Xxi2KHnVy1XlX/u1ioV4UWf/3GR90gDC8aSqDYS8tBREEE8kK2DhDvhdesCCKFQpQVfgSMGTvO/u7cxYtJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553899; c=relaxed/simple;
	bh=+eHqnMSW5FSCVPVKIED1PDPqxhIPvfGUC4EGBrGUYms=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+bz+MAtesIvGiArRLfX0pqv9WY/Yx0qX+DjwoVxJ3QtqOZaWIgEX/I+UGydkn9gxcMA8CC98HOlim60+Jz8W5SkbrGCzS/JB8ePOrTnVpLTopAgFyS/notFAVo2IYx+W7Ia/9KcQ6SLiSaomX+h6YaRv6RH2n5QAba/4RWqLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jCvheQZr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MNQfBNbM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F0xO5AJE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m9Fvaiae; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jCvheQZr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MNQfBNbM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F0xO5AJE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m9Fvaiae"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AD548672B;
	Mon, 24 Aug 2026 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787553890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTy6Mqba0Jq8GhTx0npNoYFtYAIp1hrbRIWzyD34Fo8=;
	b=jCvheQZr1kvy0B8HAWEVLG8QSFX5X3kLLU6YicyBe/4ntgdSlz0FfUhhKs+uqPOuUkapcp
	i8S8A9dtsfZXeTKsShRJX0EHn7V/R2jHfXd6eiFgaQa2CXdZyuue/I8/NI+iWqJL+7kzo8
	fsv2svfes5FOlPRW1W/MeKDHuYI/5wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787553890;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTy6Mqba0Jq8GhTx0npNoYFtYAIp1hrbRIWzyD34Fo8=;
	b=MNQfBNbMTKSD+gXSigwDxwrSnsO7S44hcRApwNncN136desieyvKvINFjEPlsMHY3WjOIz
	axGWkJosxsTqEyDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F0xO5AJE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m9Fvaiae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787553886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTy6Mqba0Jq8GhTx0npNoYFtYAIp1hrbRIWzyD34Fo8=;
	b=F0xO5AJEEKU+M8i/G5OQ/gkB/cPjWyMwHleFKDoyT4kdj15b1roDY+xXo74p3NRzAaI+Nf
	QE4HNnJeBkd28KKtU7TYr3zrgdVvMUi+fBc4e2LHr3X+tX7NmXZBG1lWfG/oGWT/a+7JJa
	87iwroyj0eAOUTAeymgvBKSxnCsXSWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787553886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTy6Mqba0Jq8GhTx0npNoYFtYAIp1hrbRIWzyD34Fo8=;
	b=m9FvaiaeD2B/dsh6s4l9/HsyIa8xve95p9J/yqSkvKAa9TqI2jZ2/O/vYB4BbAxSDetPqx
	6ed/QOPVvqH3CiAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1436513331;
	Mon, 24 Aug 2026 06:44:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uHq7A17oi2rgQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Aug 2026 06:44:46 +0000
Date: Mon, 24 Aug 2026 08:44:45 +0200
Message-ID: <878q5wvwyq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Federico =?ISO-8859-1?Q?Valent=EDn?= Andrade <fandrade@frba.utn.edu.ar>
Cc: linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	perex@perex.cz,	tiwai@suse.com,	kuba@kernel.org,	alexander.deucher@amd.com,
	Federico =?ISO-8859-1?Q?Valent=EDn?= Andrade <ristarfede@gmail.com>
Subject: Re: [PATCH v2 1/2] ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
In-Reply-To: <20260823152733.740731-2-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
	<20260823152733.740731-2-fandrade@frba.utn.edu.ar>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,kernel.org,amd.com,gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 4AD548672B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sun, 23 Aug 2026 17:27:32 +0200,
Federico Valentín Andrade wrote:
> 
> The M-Audio Venom (0763:2084) is an USB Audio Class 1 compliant
> synth with an integrated audio interface, it does not implement
> GET_CUR on SAMPLING_FREQ_CONTROL, hanging up if requested on
> endpoint 0.
> 
> The first class request issued by the driver after enumeration is
> a GET_CUR on endpoint 0x02, freezing the device's USB microcontroller.
> Timing out on every transfer afterwards with -ETIMEDOUT, such as
> SET_INTERFACE, so neither the mixer nor any streaming interface is set up.
> 
> Analyzing a USBPcap capture of the Windows driver I found it never
> requests the sampling frequency, as the synth exposes a single
> discrete of 44100Hz on both streaming interfaces, thus asking for it
> is unnecessary.
> 
> So I applied get_sample_rate to avoid this check, and
> disable_autosuspend because the synth doesn't come back from being
> suspended.
> 
> Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
> Signed-off-by: Federico Valentín Andrade <ristarfede@gmail.com>
> Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>

You must have more than a doppelganger :)

A single Signed-off-by as in v1 is enough.  Please cleanup and
resubmit v3.


thanks,

Takashi


> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index f4e1eac639..64c802bef0 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2334,6 +2334,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>  	DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
>  		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
> +	DEVICE_FLG(0x0763, 0x2084, /* M-Audio Venom */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_DISABLE_AUTOSUSPEND),
>  	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
> -- 
> 2.55.0
> 
