Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4733710F
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771497014; cv=none; b=o+43siLyhDh1cwPefpT8cZ0gv6nwurdzGJbcmoEPdED0FkDrTO3MhU5AWIAuhw5oUVXv0kiJc++vlZ86pLibue5bQBSQ9HAMRHEd6bR9CtvLaprnEA65W7hQUfOj3atnjbkEPAMyKts5TyaUUqEUedc4YXcwWp2TjvaAg4zTETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771497014; c=relaxed/simple;
	bh=BgJrDfnnQEl+2fAPXgEPEgBkfpKhj/yPdpBa6JDMe2c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4OQDvMswq3B0aIBla3NPvww0sRMi6wb3WS4J0j2uM92f3zrf9aoAX4/7Ckfz9nhljvQv4PiztgPcTlFdWwtL8aPIICk5qmqtnyd7x99FJR7cyp/qHnEQF/vScuoMJNaCtFLShu1BSj1adHE76GYaQz1Ippg/Bjqasi9v4kOeAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpBFf+JO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2JRXD8DM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpBFf+JO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2JRXD8DM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpBFf+JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2JRXD8DM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpBFf+JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2JRXD8DM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA0335BCC8;
	Thu, 19 Feb 2026 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771497010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCnEBR/HElLnQF/RVQ4eip1a9Zr6Fi+1OPrCPyHMK3o=;
	b=wpBFf+JOPFjSkPmBiEx/NYw26jl3xuRVvaIkE6Bjqs31sFePP7KFeeo1nsJU5qiUnGW6wZ
	b+DCEk+JNDF3NPxoq3tgZeoFn5vZssn79LYoYnhnQd3SPLCAjytMyMszNEYHwkGs9aC+gs
	Io0FHyHfreRgZA1dJ7gHXnHnoetPWVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771497010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCnEBR/HElLnQF/RVQ4eip1a9Zr6Fi+1OPrCPyHMK3o=;
	b=2JRXD8DMbmEsgJNnxUkc7Jb4xBHF5xOZvInjttvQSYn0lGMIavA/nGZVcHzxlQZZ0RTEDH
	dMPXY26wNvkc+dCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wpBFf+JO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2JRXD8DM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771497010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCnEBR/HElLnQF/RVQ4eip1a9Zr6Fi+1OPrCPyHMK3o=;
	b=wpBFf+JOPFjSkPmBiEx/NYw26jl3xuRVvaIkE6Bjqs31sFePP7KFeeo1nsJU5qiUnGW6wZ
	b+DCEk+JNDF3NPxoq3tgZeoFn5vZssn79LYoYnhnQd3SPLCAjytMyMszNEYHwkGs9aC+gs
	Io0FHyHfreRgZA1dJ7gHXnHnoetPWVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771497010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCnEBR/HElLnQF/RVQ4eip1a9Zr6Fi+1OPrCPyHMK3o=;
	b=2JRXD8DMbmEsgJNnxUkc7Jb4xBHF5xOZvInjttvQSYn0lGMIavA/nGZVcHzxlQZZ0RTEDH
	dMPXY26wNvkc+dCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EBC03EA65;
	Thu, 19 Feb 2026 10:30:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pMlvITLmlmntbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Feb 2026 10:30:10 +0000
Date: Thu, 19 Feb 2026 11:30:10 +0100
Message-ID: <87v7ftqb4d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <2f5d09b7-6cbc-49d0-b1d8-52c48dfadc66@intel.com>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
	<87y0kpqc4z.wl-tiwai@suse.de>
	<87wm09qc2y.wl-tiwai@suse.de>
	<2f5d09b7-6cbc-49d0-b1d8-52c48dfadc66@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: DA0335BCC8
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 19 Feb 2026 11:15:41 +0100,
Cezary Rojewski wrote:
> 
> On 2026-02-19 11:09 AM, Takashi Iwai wrote:
> > On Thu, 19 Feb 2026 11:08:12 +0100,
> > Takashi Iwai wrote:
> >> 
> >> On Thu, 19 Feb 2026 10:46:14 +0100,
> >> Cezary Rojewski wrote:
> >>> --- /dev/null
> >>> +++ b/sound/core/control_trace.h
> >>> @@ -0,0 +1,49 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>> +#undef TRACE_SYSTEM
> >>> +#define TRACE_SYSTEM snd_pcm
> >> 
> >> It doesn't look like a right place?
> > 
> > Also, it'd be more helpful if you put example outputs in the
> > description, too.  Then one can have a clue what to look for.
> 
> Agreed, an example in the commit message would be nice.
> 
> In regard to the "trace system", not a fan of adding a new "system"
> just for the sake of a single event.

Why not?  We may extend the tracing of controls, too, and it'll make
easier to enable all tracepoints relevant either for PCM or control.

> If we are going that route, I'd
> rather reword "snd_pcm" to "snd" or something similar. From sound-core
> perspective, I believe there should be 1 directory for the events
> declared in sound/core. The event-names are prefixed already, further
> division looks redundant.

That'll be messy under /sys/kernel/debug/tracing/events/*; it'll
become snd/applptr, snd/hwptr, etc.  So, if we want to consolidate
into a single directory, we need to put "pcm_" prefix again to each.

Or maybe better to use subdirectories "snd/pcm" and "snd/ctl" instead.


thanks,

Takashi
