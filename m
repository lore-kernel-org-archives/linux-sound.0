Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900D7223336
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306945; cv=none; b=iXwN2FTmvlV4l95/8tUHPP86heDBvZhBn4aXM92SoFv9rhq7SgFG5zF3K+7Um9NDUybHbgI1NbjiqS9orW7/L9ihtvBT7f/QqTNfUN7VZ2nN7lU4dRQb/4ZiACZ5Twoih6PSARLT3fimq2BzbASDYyghZw6/YNCCZ24h3/OPu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306945; c=relaxed/simple;
	bh=q8+wk+PFRef0/b+8PMCbITMCShfo4tfOHZcyrWuzLMo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6816yeVD4/mgWMzadtH6kdYLScFz81d7WVKmPmMQB0/kPCKyJBWOEpp9mKTa9KLp6kiIg00O4tVd+q1ATJkJzSDAKdOce+PuNbw8fBktwFRomP+icknALfdUzMb1/6hAFaID42OqGye8UI5D15oS1UOiHh2RGbL1Vzdq03qEF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WukxPFOf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oAnikVEh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WukxPFOf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oAnikVEh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WukxPFOf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oAnikVEh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WukxPFOf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oAnikVEh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3E6C5BCDC;
	Tue, 13 Jan 2026 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768306942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apSrpptBhUAlTI3jBowki6e8qk4aH5Om2BN4S+cX7Q8=;
	b=WukxPFOfi5rnpM/L2yjb0cRNXdV23RpzVPmyLHdkVsCWPkXLMT7RJ+DXKEsd/oMIY0BXJA
	B1X3rheTolOQVFhbYw4SePdcMwzAzJXK/QSpX9nwVA+fD/3Xkd23YbmbQQhxgzj2Z3i0cF
	5tgzVo0tCb8xbb0aRw0cLZN8KbTyEiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768306942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apSrpptBhUAlTI3jBowki6e8qk4aH5Om2BN4S+cX7Q8=;
	b=oAnikVEhg1o3tR9y1WuqruLvslHbnSaej2/YhKbEJPti7rw+pEaZJlF/3HfGdApkS8v5WU
	sStGXEdaFiKttfBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WukxPFOf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oAnikVEh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768306942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apSrpptBhUAlTI3jBowki6e8qk4aH5Om2BN4S+cX7Q8=;
	b=WukxPFOfi5rnpM/L2yjb0cRNXdV23RpzVPmyLHdkVsCWPkXLMT7RJ+DXKEsd/oMIY0BXJA
	B1X3rheTolOQVFhbYw4SePdcMwzAzJXK/QSpX9nwVA+fD/3Xkd23YbmbQQhxgzj2Z3i0cF
	5tgzVo0tCb8xbb0aRw0cLZN8KbTyEiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768306942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apSrpptBhUAlTI3jBowki6e8qk4aH5Om2BN4S+cX7Q8=;
	b=oAnikVEhg1o3tR9y1WuqruLvslHbnSaej2/YhKbEJPti7rw+pEaZJlF/3HfGdApkS8v5WU
	sStGXEdaFiKttfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B8CA3EA63;
	Tue, 13 Jan 2026 12:22:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ShIsJf44Zmm+TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 12:22:22 +0000
Date: Tue, 13 Jan 2026 13:22:18 +0100
Message-ID: <87ecntr9c5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: fenugrec@mail.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	roy.vegard.ovesen@gmail.com,
	mickflemm@gmail.com
Subject: Re: [PATCH v2 0/2] ALSA: usb-audio: presonus s1810 minor cleanup and document
In-Reply-To: <20260111-preso_clean1-v2-0-44b4e5129a75@mail.com>
References: <20260111-preso_clean1-v2-0-44b4e5129a75@mail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[mail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: B3E6C5BCDC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sun, 11 Jan 2026 22:36:39 +0100,
fenugrec via B4 Relay wrote:
> 
> patch v2 : apologies, I had missed an __le32 field.
> 
> - Use __le32 fields for structures sent/received over USB
>  Addresses a comment from when this driver was initially merged:
>   https://lore.kernel.org/all/s5hd0agcjw1.wl-tiwai@suse.de/
> 
> - Document constants and protocol details common to the Studio 1810 and
> 1824c devices
> 
> Except for a hypothetical big-endian platform (which I cannot test) where the first
> commit would make a difference, both these should have no functional
> change.
> 
> Signed-off-by: fenugrec <fenugrec@mail.com>
> ---
> Changes in v2:
> - fix an overlooked __le32 conversion for .tag and .len fields
> - Link to v1: https://lore.kernel.org/r/20260110-preso_clean1-v1-0-ce2dd3ea4506@mail.com

Thanks for the patches.  The code changes look OK, so I can take as
is.

But I wonder about your identity "fenugrec".  Is it a real name?
The Signed-off-by line needs to be a real name (or a known identity) 
for legal reasons.


thanks,

Takashi
