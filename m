Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761037B014
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793833; cv=none; b=jXOzrnlGCHjbNwk2yoGGWc5fQCbfbTWaEdpcQFXz+Wof2/3jzBaCrOorgyZyLl5RNbdJUCkRtlXkTriUqKdLWxM7cQbiltgRtymEqSPiPMofwUx0/9u5jRCfPAE8BfiTJOklp+vlzOoIP3J/yPErzl+ex+lJqs/Q1ebU9Ys2pkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793833; c=relaxed/simple;
	bh=x2WxDK9hsTfOREZW7/Loy9BK384/SVTxyGUkU7yqQt0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=suB48Z1425Oz1xOQtDGqmgVP6vR9Ua15CVpMxnhgszdRAOX7Miy85WJQs8YA79P2C8lbm3cHfNSKDwvMa4+YoyD1lsCik3QFlLMFWK4xjBrzjK8Rpg7FPiec5cFdmNKwLOA51Mo65+7NxQg+7jCXr8JpG0jAYPWAvn+H6XE/S4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P9eIivNo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Um4H2o3w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P9eIivNo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Um4H2o3w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P9eIivNo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Um4H2o3w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P9eIivNo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Um4H2o3w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E1085C178;
	Fri,  6 Mar 2026 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772793830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGVEHa6EYMi1zRI6r6THaZteKNDGxx68SZ3Qp6nGYyE=;
	b=P9eIivNo1+zCRIgiOBK5fE2Ea5Cvh56xE0x5cr7YVDmwYkFEQ4th6nYbQkT1KjErdyNlQ0
	Y5cfFIUOtjfIEx3eFwqm8VYLWkAZUHFSqcCOsNOaZWK9+nT9Kt45n16gKzkRnSfkIKXNlT
	sa4QYL/EWG6+QooO2++LlY/7KlMQgoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772793830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGVEHa6EYMi1zRI6r6THaZteKNDGxx68SZ3Qp6nGYyE=;
	b=Um4H2o3wihXRCxdr4Ay3XIZwLa+jy5O+xf3lXdHnbSnrsATB9aq2lL6VFvfut2mHYmaDd5
	pYrp3VjHooG52UDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P9eIivNo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Um4H2o3w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772793830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGVEHa6EYMi1zRI6r6THaZteKNDGxx68SZ3Qp6nGYyE=;
	b=P9eIivNo1+zCRIgiOBK5fE2Ea5Cvh56xE0x5cr7YVDmwYkFEQ4th6nYbQkT1KjErdyNlQ0
	Y5cfFIUOtjfIEx3eFwqm8VYLWkAZUHFSqcCOsNOaZWK9+nT9Kt45n16gKzkRnSfkIKXNlT
	sa4QYL/EWG6+QooO2++LlY/7KlMQgoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772793830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGVEHa6EYMi1zRI6r6THaZteKNDGxx68SZ3Qp6nGYyE=;
	b=Um4H2o3wihXRCxdr4Ay3XIZwLa+jy5O+xf3lXdHnbSnrsATB9aq2lL6VFvfut2mHYmaDd5
	pYrp3VjHooG52UDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4434C3EA75;
	Fri,  6 Mar 2026 10:43:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wow3D+avqmk4SAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Mar 2026 10:43:50 +0000
Date: Fri, 06 Mar 2026 11:43:49 +0100
Message-ID: <87zf4lutju.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card components
In-Reply-To: <3174b8c9-8801-4d09-8e30-450899b40ca2@perex.cz>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
	<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
	<87seagx6c4.wl-tiwai@suse.de>
	<c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
	<87v7fay4l1.wl-tiwai@suse.de>
	<cf59b85f5bfa3607b7ef799714df56bf42daa67a.camel@opensource.cirrus.com>
	<87pl5iy3z6.wl-tiwai@suse.de>
	<3174b8c9-8801-4d09-8e30-450899b40ca2@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 7E1085C178
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 06 Mar 2026 10:39:46 +0100,
Jaroslav Kysela wrote:
> 
> On 3/5/26 11:18, Takashi Iwai wrote:
> > On Thu, 05 Mar 2026 11:11:40 +0100,
> > Maciej Strozek wrote:
> >> 
> >> W dniu czw, 05.03.2026 o godzinie 11∶04 +0100, użytkownik Takashi Iwai
> >> napisał:
> >>> On Thu, 05 Mar 2026 10:54:35 +0100,
> >>> Maciej Strozek wrote:
> >>>> 
> >>>> W dniu wto, 03.03.2026 o godzinie 16∶47 +0100, użytkownik Takashi
> >>>> Iwai
> >>>> napisał:
> >>>>>> 
> >>>>>> + */
> >>>>>> +struct snd_ctl_card_components {
> >>>>>> + int card;
> >>>>>> + unsigned int length;
> >>>>>> + unsigned char *components;
> >>>>>> +};
> >>>>> 
> >>>>> And the ioctl can serve for two purposes:
> >>>>> 
> >>>>> - When length=0 is set, the kernel stores the current number of
> >>>>> bytes
> >>>>>    and returns without copying.  User-space can use this mode for
> >>>>>    allocating the buffer.
> >>>>> 
> >>>> In alsa-lib all data must be allocated beforehand, so this
> >>>> length==0
> >>>> query is not very useful there, it will just go into a [512] array
> >>>> anyway. Are there any other users that may benefit from this?
> >>> 
> >>> My suggested API can work even with the fixed size 512, too, if 512
> >>> is
> >>> hight enough.  It's just more flexible.  And there is no restriction
> >>> about alsa-lib data allocation; the function can query the size then
> >>> allocate, too.
> >>> 
> >>> 
> >>> Takashi
> >> 
> >> OK, will prepare v4 with this, thanks
> > 
> > Well, let's see how others think, too.  The API design needs more
> > considerations because we can't change it any longer once after
> > defined.
> 
> I think that the indirect pointer in ioctl structure is the best at
> the moment unless we decide to use the fixed char array.

OK, it might be indeed better if the user-space API is something like:

int snd_ctl_card_components(snd_ctl_t *ctl, unsigned char *buf, size_t len);

Then it's simpler to pass the pointer as is without copying.

> But (for
> discussion) we may try to be a bit clever and define universal bytes
> ioctl which may carry also other things in future like:
> 
> enum {
> 	SND_CTL_CARD_BTYPE_COMPONENTS = 1
> };

So this is for future extensions?

> struct snd_ctl_card_bytes {
> 	unsigned int card;		// this is duplication with info ioctl
> 					// to be removed?

Right, it sounds like superfluous.  I thought we were to allow
extracting a card info for a different card number, but it doesn't
look so.

> 	unsigned int type;		// e.g. SND_CTL_CARD_BTYPE_COMPONENTS
> 	unsigned int data_allocated;	// overall size of data
> 	unsigned int data_len;		// actual data len
> 	unsigned char *data;		// pointer to data array
> };
> 
> Scenarios:
> 
> data_allocated = 0 or data == NULL -> driver just returns data_len
> data_allocated < data_len -> driver returns -ENOMEM
> data_allocated >= data_len -> driver will copy data
> 
> Note that data_len will be zero from the user space for read
> operations (driver knows it). But we can eventually use this ioctl to
> set some data in future, so data_len/data will be used for the write
> operation.

In all cases, data_len is filled with the expected data size in
return, right?


thanks,

Takashi
