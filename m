Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3718E02A;
	Fri,  7 Aug 2026 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118650; cv=none; b=VehIk79lAHDMsXw2xMjvOEqT8cycKL0Q8Qu/rss9zruXRGUoYGleypMBe+QWC0Gtn01isu/bB5yk18byDoX61XsTjW9yE0RlDI0l43LvLwSOILBttVGzUA6cU6WvLFxnl/syfSbkNIrs+0HQfN4tyTz8NEZRwuuXQviKqhYfqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118650; c=relaxed/simple;
	bh=e4cMrDuWSjLyvOhl8A0lOFzvKlaKrbHp3e9h42xsmxQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6jzCerp3FnXrQNTSpaAKPfQ8ktcLExVvd2SdSKMwIZVvzDMS9im6hhyKbxAvQfPu3qd1j2vPcb+SNSmIznCnJbDYcMH2YW+7nTnfydcmwnNG9nuCKqKLjHEOQEYRsehIZOYqndu9QxKPtJzjHG+ncGey8DoLzL68Q3k7qhBgxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wBCixI/h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uOqmX+Xw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z9bULjIt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v+/Tz47T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wBCixI/h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOqmX+Xw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z9bULjIt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v+/Tz47T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8BB8806DC;
	Fri,  7 Aug 2026 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786118643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bnPQ6ROB3ehRzP1BZQMD+1jKwwnqnsINimDCJNpfRQ=;
	b=wBCixI/h7f8AizQkapnKaIyAT3dwwdcW5dHR0Y7CqII4OMmN0S49TKIHkdnbm44aSVbg21
	fWyn6VO7qdc7qhkz2RFm24XqxZNrfI1fcZHiEO2MNFwHeL48o+YgTW2p73vKcS0WIawHvs
	jsUOmypzhRz85/ePv1Lwz6OdQVKnAJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786118643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bnPQ6ROB3ehRzP1BZQMD+1jKwwnqnsINimDCJNpfRQ=;
	b=uOqmX+XwGmPjDHxJIZMXvHYIcsNviYuBNdhfSK0sK1waKY3AlGRshAvJmGRruBPsW2X/Ux
	nRTIMibA4NBNyGCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z9bULjIt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="v+/Tz47T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786118638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bnPQ6ROB3ehRzP1BZQMD+1jKwwnqnsINimDCJNpfRQ=;
	b=z9bULjIto6XlTKLB8/06KhNhQ5TqrIHPYya8ZWo/kbbX6s29H6aZc3x95tSOuNO2X6rK9E
	czh0BLuhDzCu27qQF9KzBMJaNpox946XpwggxlJPnHukM08xcS7/746V1EsBA1DgCSOt09
	ycFMvX4ulIlg1/RSoVCVbs+f5VIrnzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786118638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bnPQ6ROB3ehRzP1BZQMD+1jKwwnqnsINimDCJNpfRQ=;
	b=v+/Tz47TL39BwRD5UeJgNvytOuaswYFJ84kPDZquwBpZmWwpcZd8VtQ39bjYPxL2LQu8Nq
	akCrjoLWgB2d4QCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8AA68779B6;
	Fri,  7 Aug 2026 16:03:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 29QOIO4BdmqKCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 16:03:58 +0000
Date: Fri, 07 Aug 2026 18:03:58 +0200
Message-ID: <878q6hc3yp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	"Takashi Iwai" <tiwai@suse.com>,
	"Jaroslav Kysela" <perex@perex.cz>,
	"Kees Cook" <kees@kernel.org>,
	"Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
In-Reply-To: <DKITQMNPN2I7.CH00E8CSZMXI@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
	<87jyq2azz4.wl-tiwai@suse.de>
	<DKITQMNPN2I7.CH00E8CSZMXI@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: D8BB8806DC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Fri, 07 Aug 2026 17:41:36 +0200,
Mahad Ibrahim wrote:
> 
> On Fri Aug 7, 2026 at 5:15 PM PKT, Takashi Iwai wrote:
> > Honestly speaking, I'm against those conversions.
> > Why do we have to open-code at each place with strlen()+strscpy()?
> > It's just harder to read than strlcat(), even more error-prone.
> >
> > If an alternative is something like this, we really should reconsider.
> 
> Thank you for the quick response and feedback.
> 
> You are right that strlen() + strscpy() is tedious and annoying to read.
> 
> sound/ already has helpers that do this, but each is local to one file
> with its own signature:
> 
>   safe_append_string()  sound/core/ump.c
>   append_ctl_name()     sound/usb/mixer.c
>   hda_append_suffix()   sound/hda/common/hda_local.h
> 
> Each of these functions practice the same string append technique
> however to slightly different effect. safe_append_string uses
> safe_copy_string() whose function body is above it in the same file.
> safe_copy_string() performs analogous to strscpy() however adds a
> filter which drops non-printable ASCII characters during the copy phase.
> 
> append_ctl_name() is simply an strlcat wrapper which when transitioned
> would result in the same strlen() + strscpy(). Only separating feature
> is that it returns the length of characters that would have been
> written (not necessarily the actual amount). However none of the callers
> use its return functionality.
> 
> hda_append_suffix() is a verbatim copy of strlen() + strscpy().
> 
> A solution I would propose is that all these functions which do the same
> thing, aside from safe_append_string, could be moved where they are
> accessible globally across sound/. This would remove the redundant need
> to use strlen() + strscpy() in replacement for strlcat() and would unify
> the sub-system under a single string append API.
> 
> safe_append_string is only called once in the entire sub-system, and could
> be replaced either within the function with the unified string
> append function, and a separate filterer replacing the safe_copy_string
> function or removed all together and managed inline within the single
> caller. However this function would require a more involved removal as the
> internal safe_copy_string is called twice; it is called once in
> safe_append_string(), and in sound/core/ump.c for a wrapper function
> ump_set_rawmidi_name().
> 
> An argument against this suggestion is that it would confine a string
> append helper to a single sub-system, while the rest of the kernel uses
> something else.
> 
> Additionally patch 1/7 shouldn't have open-coded anything at all.
> safe_append_string() was already a few hundred lines above the site I
> touched, and I should have used it.
> 
> This was based on https://github.com/KSPP/linux/issues/370, which I
> should have linked in the cover letter.
> 
> Thank you for your time.
> 
> Best regards,
> Mahad Ibrahim

Well, that leads to a basic question: why do we have to drop strlcat()
if most of callers would just need the equivalent function.

If strlcat() were super-dangerous, it's understandable to drop.  But,
it's not, and issues discussed in the github are minor and something
that can be addressed in strlcat() implementation; that is, can't we
rather re-implement strlcat() in a safer way, instead of killing it?

Sure, there are code calling strlcat() that could be optimized better.
They can be cleaned up.  But it alone can't be a reason that strlcat()
must die without mercy.


thanks,

Takashi
