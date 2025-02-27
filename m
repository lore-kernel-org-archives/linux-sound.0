Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF33224231
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650650; cv=none; b=JtBMV+JlCgVWffPrUDqLQ86AsvVlepeVxcwpNKCoh66k0NVEg9RKo5K0AIDqWksx3/nTY5nntVxZZwcKIHunlT0NrwehdyZ4sVNku9trCQIeyeS3vDrDSNOlzYYqRlqObsjGHWz4AGxD4WgykgHul42GmSv/0e5+qBUTfPfiCYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650650; c=relaxed/simple;
	bh=0CzS3Nynpm7UO5MecfkYP3SFxyICtrPqie2rmAWFP70=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/I3LRqhNPiEFcvXBvjYly1/ZFKsqH0PaWVgCuynVie2vNFGcgf7nPhxOYEociBhgqeM4MxCyckqIX72fWRTFfX25tPcobp8qWxVSpDrH/7+3i844A4wSqf47ESWBG5MWi2x/bM3eik8jCUo0Csa3jOxg+xflrwhSYDVDIp7Z4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x7aKGXqH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dTi11XW7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x7aKGXqH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dTi11XW7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x7aKGXqH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dTi11XW7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x7aKGXqH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dTi11XW7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A34641F38A;
	Thu, 27 Feb 2025 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740650646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+9C6v2Nm92Gjix8rx9Sy1gW/F9Ei3QTtGpESqcHmQ=;
	b=x7aKGXqH7BrT/MBToNOfjQKXpeXR9qzGTW1qJUcPhZMP5ZYRrVw2MCm039rDMVbRlh16gx
	HPP1AROP0d9nvr/agu6R475lmTtdVG6KlHDZHSumxNU5aUiUe7fqqXMuCYrC0mrmaP4twH
	t18UlHUJxIvfqyU3MrboZebkVwkBv6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740650646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+9C6v2Nm92Gjix8rx9Sy1gW/F9Ei3QTtGpESqcHmQ=;
	b=dTi11XW7JczqAxV0eHWTEXmxINGYU0fAgXoXgMIbcF/ymeNSBWu8em+rp0qjWGHWX+fky7
	PHUQHERmgJkw1gAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x7aKGXqH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dTi11XW7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740650646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+9C6v2Nm92Gjix8rx9Sy1gW/F9Ei3QTtGpESqcHmQ=;
	b=x7aKGXqH7BrT/MBToNOfjQKXpeXR9qzGTW1qJUcPhZMP5ZYRrVw2MCm039rDMVbRlh16gx
	HPP1AROP0d9nvr/agu6R475lmTtdVG6KlHDZHSumxNU5aUiUe7fqqXMuCYrC0mrmaP4twH
	t18UlHUJxIvfqyU3MrboZebkVwkBv6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740650646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+9C6v2Nm92Gjix8rx9Sy1gW/F9Ei3QTtGpESqcHmQ=;
	b=dTi11XW7JczqAxV0eHWTEXmxINGYU0fAgXoXgMIbcF/ymeNSBWu8em+rp0qjWGHWX+fky7
	PHUQHERmgJkw1gAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B6E21376A;
	Thu, 27 Feb 2025 10:04:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /s93HJY4wGcSIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Feb 2025 10:04:06 +0000
Date: Thu, 27 Feb 2025 11:04:06 +0100
Message-ID: <87h64f7lgp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amin Dandache <amin@s7u.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] rename s1810c* to presonus_studio to get s1824c working
In-Reply-To: <ecdb2314-fb78-47d6-96d0-dcd4a51ee397@s7u.net>
References: <20250227064308.154758-1-git@amin85.de>
	<87mse77n1t.wl-tiwai@suse.de>
	<ecdb2314-fb78-47d6-96d0-dcd4a51ee397@s7u.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A34641F38A
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 27 Feb 2025 10:53:40 +0100,
Amin Dandache wrote:
> 
> Hi,
> 
> 
> Yes, the previous file was named after the exact model 1810c.
> I would not like to put the 1824c into the file as it suggest its just
> one model.
> It feels like monkey patching for me.
> 
> Also it's the same series: Presonus Studio.

Heh, and who knows that the name will keep in the next model? ;)

Don't get me wrong: if there will be more handful new models with
completely different names in future, we should think of renaming,
indeed.  Or, if the code varies significantly depending on the model,
or if we need some fundamental changes, we can take a drastic change,
sure.

But, a case like yours would need only a small bit of actual code
change, while the whole renaming makes really hard to see what the
actual change is.

So, don't mix up two things.  If a rename is mandatory, do only
rename but nothing else.  Then apply another fix (a new device ID
support) afterwards -- or vice versa.


thanks,

Takashi

> And yes it's just a new device ID, but there are some features missing
> like SPDIF which i could not test yet, also if every function is
> adopted by the 1810c.
> 
> I just tested the basic functionality and it works perfect for analog
> signals.
> 
> In the future there could be some differences in the handling for the
> models, so i tried to prepare that and rename it to a global name that
> supports more devices inside and more cases for the devices.
> like the mixer_scarlett.c which supports all focusrite scarlett
> devices in one file.
> 
> I will refactor the proper subject and try put the signed-off-by tag,
> as this is my first commit i have to learn a little bit new.
> 
> 
> Best Regards,
> Amin
> 
> On 27.02.25 10:29, Takashi Iwai wrote:
> > On Thu, 27 Feb 2025 07:43:08 +0100,
> > Amin Dandache wrote:
> >> ---
> >>   sound/usb/Makefile                            |   2 +-
> >>   sound/usb/format.c                            |  12 +-
> >>   ...mixer_s1810c.c => mixer_presonus_studio.c} | 247 +++++++++---------
> >>   sound/usb/mixer_presonus_studio.h             |   8 +
> >>   sound/usb/mixer_quirks.c                      |  12 +-
> >>   sound/usb/mixer_s1810c.h                      |   7 -
> >>   sound/usb/quirks.c                            |   9 +-
> >>   7 files changed, 161 insertions(+), 136 deletions(-)
> >>   rename sound/usb/{mixer_s1810c.c => mixer_presonus_studio.c} (59%)
> >>   create mode 100644 sound/usb/mixer_presonus_studio.h
> >>   delete mode 100644 sound/usb/mixer_s1810c.h
> > First off, could you give the reason why you must rename the whole
> > stuff?  Is it just to add the support of a new device ID 194f:010d?
> > If so, we don't have to rename everything, but just keep using the
> > same function as is.  You can put simply a comment that the function
> > supports both devices, instead.
> > 
> > And, the patch should be formatted properly. You need a proper subject
> > prefix (e.g. "ALSA: usb-audio: ....."), then put more detailed patch
> > description texts.
> > 
> > Last but not least, most importantly, we need your Signed-off-by tag.
> > It's a legal requirement.
> > 
> > Could you address the above and resubmit?
> > 
> > 
> > thanks,
> > 
> > Takashi
