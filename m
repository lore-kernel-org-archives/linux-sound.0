Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F37226D06
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648594; cv=none; b=bpNgwO3T+9aFAl1f73/+yVmizUeHHD0r7j0U2XO6IBXuCh/Cy+W0EMcheLnqlrlFyO86gpqhl2jE2DHVRtartK5kV4LjIfE0BdOHqpO2kkHT+3hk+554KJhgJeZZ5r5vQfEc1UGpkHVMDxz2AwvwDyk5L0IAp9FVtwbOBgJN96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648594; c=relaxed/simple;
	bh=I3mDeRx7rxnJ4LTh7ZogIPS6AJ8mxxyjt3Cq4t/ANoM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGG7ztSE7T0o9K2oWBg/3Cyu4cg5MHn+8qpWRFbJlhHUa+2GCkZWRJsE4M6uk1hw03zZDJIpv4de5XkK0nXY6DEhe16Qu7WR//zV8LMSQSgD4OZGdp2lqRNCb0r738w81b7uvF1Lv6O7fLkKxm8rMN1LuLcWDao5IcDMy925bxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IjFcVZjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mcCjXHPT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IjFcVZjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mcCjXHPT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IjFcVZjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mcCjXHPT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IjFcVZjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mcCjXHPT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 484122116B;
	Thu, 27 Feb 2025 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740648591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QAbe1rj9OWB4ylCK0lFo4wK2Li66+MkAKoL+EjX4UZ0=;
	b=IjFcVZjM+c/R8Zh3bhuhDAkOBA3YUt+GzOoLmNs86PS6RyegiEBC52LpSmpMtdY5yl++b8
	8qdOsh/1aTEZd79sw3xpfOPAKRYLcX/qnG+133gU1EfQDGf+vDeqDCyZOpeylSZTyIuz3J
	UPtcVARweGHLJPApnpjHp1ALgX434nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740648591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QAbe1rj9OWB4ylCK0lFo4wK2Li66+MkAKoL+EjX4UZ0=;
	b=mcCjXHPTbdKqUX++dp0hQ75NZQIUH2MeW67tTQg26QLxzg7kAY2/r5qITHrC8w4zIektew
	Juzi4OKCq6ZdAHBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IjFcVZjM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mcCjXHPT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740648591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QAbe1rj9OWB4ylCK0lFo4wK2Li66+MkAKoL+EjX4UZ0=;
	b=IjFcVZjM+c/R8Zh3bhuhDAkOBA3YUt+GzOoLmNs86PS6RyegiEBC52LpSmpMtdY5yl++b8
	8qdOsh/1aTEZd79sw3xpfOPAKRYLcX/qnG+133gU1EfQDGf+vDeqDCyZOpeylSZTyIuz3J
	UPtcVARweGHLJPApnpjHp1ALgX434nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740648591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QAbe1rj9OWB4ylCK0lFo4wK2Li66+MkAKoL+EjX4UZ0=;
	b=mcCjXHPTbdKqUX++dp0hQ75NZQIUH2MeW67tTQg26QLxzg7kAY2/r5qITHrC8w4zIektew
	Juzi4OKCq6ZdAHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 171E413888;
	Thu, 27 Feb 2025 09:29:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D3XxA48wwGdjFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Feb 2025 09:29:51 +0000
Date: Thu, 27 Feb 2025 10:29:50 +0100
Message-ID: <87mse77n1t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amin Dandache <amin.dandache@googlemail.com>
Cc: linux-sound@vger.kernel.org,
	Amin Dandache <git@amin85.de>
Subject: Re: [PATCH] rename s1810c* to presonus_studio to get s1824c working
In-Reply-To: <20250227064308.154758-1-git@amin85.de>
References: <20250227064308.154758-1-git@amin85.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 484122116B
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[googlemail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 27 Feb 2025 07:43:08 +0100,
Amin Dandache wrote:
> 
> ---
>  sound/usb/Makefile                            |   2 +-
>  sound/usb/format.c                            |  12 +-
>  ...mixer_s1810c.c => mixer_presonus_studio.c} | 247 +++++++++---------
>  sound/usb/mixer_presonus_studio.h             |   8 +
>  sound/usb/mixer_quirks.c                      |  12 +-
>  sound/usb/mixer_s1810c.h                      |   7 -
>  sound/usb/quirks.c                            |   9 +-
>  7 files changed, 161 insertions(+), 136 deletions(-)
>  rename sound/usb/{mixer_s1810c.c => mixer_presonus_studio.c} (59%)
>  create mode 100644 sound/usb/mixer_presonus_studio.h
>  delete mode 100644 sound/usb/mixer_s1810c.h

First off, could you give the reason why you must rename the whole
stuff?  Is it just to add the support of a new device ID 194f:010d?
If so, we don't have to rename everything, but just keep using the
same function as is.  You can put simply a comment that the function
supports both devices, instead.

And, the patch should be formatted properly. You need a proper subject
prefix (e.g. "ALSA: usb-audio: ....."), then put more detailed patch
description texts.

Last but not least, most importantly, we need your Signed-off-by tag.
It's a legal requirement.

Could you address the above and resubmit?


thanks,

Takashi
