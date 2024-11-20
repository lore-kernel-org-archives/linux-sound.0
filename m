Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBF18035
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086263; cv=none; b=Hs+ec7AwAw0q3uXgnUSaf4O2tGFjdyaALeqRud8KbD9tLaTw39wCcQk4k2yFza24cMgXvJnQecMl6mVPuA3IK5JPRJcDyrPnUdA+ErSRsvatR9igNzV4lw/3vSDBPvHgFZoPRuNBNLUcb32FKF1FJcmLaR9Lj7xo+NaFrDoS2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086263; c=relaxed/simple;
	bh=djMbS80n47dM1exAqRUrWCtiyNsf8/AePmdVHcWHTFA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahcFDb7AjfsVUJCRKHOi4n7KDafaw9Ci6lJ61DBN92xf470/5qch1CShJV6CCmiTQKC08f3cKYmhvYT6XIfu2fx8hm9o0UPv5so2PbQwmfN/4tuA8/VWtEggW5t/MQ3FIDnJJtRJ207XDvpHx/ug7/pGfrOIEolLmA5ggMqqnlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZZM9vb4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eEI9RP0Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZZM9vb4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eEI9RP0Z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZZM9vb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eEI9RP0Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZZM9vb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eEI9RP0Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FF4E2174C;
	Wed, 20 Nov 2024 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732086260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TxSSIAKtGUS1f3YR94BcTz+KRHtZBFPxCcdkGM1Y9I=;
	b=jZZM9vb4TVLXOJPtGFlMOOsZaY5J+n3d20YlSIAF2/3tcak7YBcyi2mEIV8lIWLJUEnLFt
	bUUniWBwe2WnmnEISagSlvSNKLIpCPRK5wixCmF/vESYa8Vsbcoi3gC6dgJ5I6ZNEs0dMA
	NqnLsKyGD+Zhj2m/pMcba5YeVLp2nrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732086260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TxSSIAKtGUS1f3YR94BcTz+KRHtZBFPxCcdkGM1Y9I=;
	b=eEI9RP0ZH6ejSxBXCblLyKQDV3LkafTtYp0E1/SPG3+PBDqr2BFVa0IQTPD+c6zfucgD4u
	FzGMXUVfD6v2qnBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jZZM9vb4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eEI9RP0Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732086260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TxSSIAKtGUS1f3YR94BcTz+KRHtZBFPxCcdkGM1Y9I=;
	b=jZZM9vb4TVLXOJPtGFlMOOsZaY5J+n3d20YlSIAF2/3tcak7YBcyi2mEIV8lIWLJUEnLFt
	bUUniWBwe2WnmnEISagSlvSNKLIpCPRK5wixCmF/vESYa8Vsbcoi3gC6dgJ5I6ZNEs0dMA
	NqnLsKyGD+Zhj2m/pMcba5YeVLp2nrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732086260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TxSSIAKtGUS1f3YR94BcTz+KRHtZBFPxCcdkGM1Y9I=;
	b=eEI9RP0ZH6ejSxBXCblLyKQDV3LkafTtYp0E1/SPG3+PBDqr2BFVa0IQTPD+c6zfucgD4u
	FzGMXUVfD6v2qnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D857E13297;
	Wed, 20 Nov 2024 07:04:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TBQBM/OJPWc2JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 07:04:19 +0000
Date: Wed, 20 Nov 2024 08:04:19 +0100
Message-ID: <875xoi5qto.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <13b257a1-8336-4286-b801-bb09082bd316@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
	<87o730uttl.wl-tiwai@suse.de>
	<5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
	<87ikt7v028.wl-tiwai@suse.de>
	<74e49336-4552-4224-9b14-204d4264d647@gmail.com>
	<871pzuujkc.wl-tiwai@suse.de>
	<18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
	<87a5e9g68w.wl-tiwai@suse.de>
	<e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
	<877c96szig.wl-tiwai@suse.de>
	<98af4276-927d-474e-a78f-7c6f0bae3090@gmail.com>
	<87jzcz5jww.wl-tiwai@suse.de>
	<13b257a1-8336-4286-b801-bb09082bd316@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FF4E2174C
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Wed, 20 Nov 2024 02:29:59 +0100,
Jaros³aw Janik wrote:
> 
> On 19.11.2024 16:21, Takashi Iwai wrote:
> > I'm not sure whether I already asked it: did you try to turn on/off
> > "Beep Playback Switch" (i.e. mute/unute "Beep" mixer element)?
> > It should control the digital beep of HD-audio's own beep input
> > device, but this might be also related with the internal beep from the
> > Lenovo firmware (and the output of pcspkr input device).
> 
> Both "Beep" mixer and mute switch don't affect beeps generated by ACPI
> firmware (and pcspkr module for that matter)
> 
> > And, judging from the fact that "Master" volume influences on the beep
> > sound, it also means that the sound is routed to DACs -- for Conexant
> > codecs, Master is a virtual control just changes both Speaker and
> > Headphone volumes/switches, and both Speaker and Headphone controls
> > are tied with the Audio Output widgets.  You can check whether the
> > beep tone volume from pcspkr or Thinkpad ACPI is also controlled via
> > Speaker and Headphone mixer volume and switch.
> 
> The volume of beeps from firmware and pcspkr is fixed, it's not changed
> by any available mixer setting; the only thing that affects those beeps
> is Master Mute Switch, which mutes them both on the speakers and on the
> headphones.
>
> And one more thing - both beep types are audible on the headphones even
> if Headphones mixer is set minimum and Headphones Mute Switch is set to
> mute (if Master is unmuted, obviously)

Hm, that's odd.  At this moment, do you hear from the speaker?  Or
Speaker Playback Switch is off?


Takashi
