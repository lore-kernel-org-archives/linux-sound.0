Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925A257D
	for <linux-sound@vger.kernel.org>; Sun, 19 Jan 2025 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737276926; cv=none; b=YDBeVioF9tsAYlkt7lPScTWmH/sVc4btQhRAFSmWkof0QCKdYYao1QQLmJvPWd1w4h7zoDzU6/NmRXmAVc3071ioDQVvYasUVRlxYWC21UbEn05vblWMGDprDaV5rwCSceEUdrbYBmlXkL+156fl7Ct3fk6N+LCVGTdw3ugIA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737276926; c=relaxed/simple;
	bh=f2QsfMpHh/OV2iMsP8F9fg0RcGxQiYeMLSQSFecoDD4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CPr/x9aGXNJNQSCqmywdU3dnpDFdMiEHSILNWg4Q5Q4E+RO6+A2hTcwuRJrdoaD0v/dZZu8Uahqke/7qpONggWgL05k1T15zpGa04NJYc7MXMDCaJidpPIPAUtqo6pXMyQZJBri7U3zVFbpi+xI4Fa5GMAn8aXjp/8uo6qTO+eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0AKN5QJv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dTZVpxqL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0AKN5QJv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dTZVpxqL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0AKN5QJv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dTZVpxqL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0AKN5QJv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dTZVpxqL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 771C82119D;
	Sun, 19 Jan 2025 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737276922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKxFDGloYai+3Wd0t+dllGouk+wdBGfF7BZv7iniMS8=;
	b=0AKN5QJvlP+NtdBnweRi9DQY6aRwPBRALM8LB7q9qcnah99a70LqDnpSdnGE145mXFppUB
	i8Fns4pN45HJpT949KKvaKxUmCLI1ywidCB/VxX6SaDQm8GxxNbsnoMRzYsA6UV/X87nQM
	ldz7ppLPP+jhbes1MY2Cbq6k+RFs0zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737276922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKxFDGloYai+3Wd0t+dllGouk+wdBGfF7BZv7iniMS8=;
	b=dTZVpxqLmnV07I5w3rajcdRXFYjQAe7L3ScY5/Yd0xXreesV88vkor69K40tozlY9JM/I6
	nCn48DEeN0+rbDBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737276922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKxFDGloYai+3Wd0t+dllGouk+wdBGfF7BZv7iniMS8=;
	b=0AKN5QJvlP+NtdBnweRi9DQY6aRwPBRALM8LB7q9qcnah99a70LqDnpSdnGE145mXFppUB
	i8Fns4pN45HJpT949KKvaKxUmCLI1ywidCB/VxX6SaDQm8GxxNbsnoMRzYsA6UV/X87nQM
	ldz7ppLPP+jhbes1MY2Cbq6k+RFs0zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737276922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKxFDGloYai+3Wd0t+dllGouk+wdBGfF7BZv7iniMS8=;
	b=dTZVpxqLmnV07I5w3rajcdRXFYjQAe7L3ScY5/Yd0xXreesV88vkor69K40tozlY9JM/I6
	nCn48DEeN0+rbDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E165139CB;
	Sun, 19 Jan 2025 08:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3r6UEfq9jGeTZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jan 2025 08:55:22 +0000
Date: Sun, 19 Jan 2025 09:55:21 +0100
Message-ID: <8734hfqj2e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v8 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
In-Reply-To: <Z4v1c8rjaRdXLWuQ@m.b4.vu>
References: <cover.1737048528.git.g@b4.vu>
	<87ed10qt1u.wl-tiwai@suse.de>
	<Z4v1c8rjaRdXLWuQ@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sat, 18 Jan 2025 19:39:47 +0100,
Geoffrey D. Bennett wrote:
> 
> On Sat, Jan 18, 2025 at 12:07:25PM +0100, Takashi Iwai wrote:
> > On Thu, 16 Jan 2025 18:47:07 +0100,
> > Geoffrey D. Bennett wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > Thanks again! All changes from your feedback on v7 incorporated in v8.
> > 
> > Now applied to for-next branch.
> 
> Hi Takashi,
> 
> Thank you for all your time and patience in reviewing the patches
> through eight versions!
> 
> For the pull request notes, would you consider mentioning the specific
> new hardware support? Something like "Add support for Focusrite
> Scarlett 4th Gen 16i16, 18i16, and 18i20 interfaces via new FCP
> driver" would help users discover this functionality.

Yes, will put something like that.


thanks,

Takashi
