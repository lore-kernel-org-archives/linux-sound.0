Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5B47668A
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959306; cv=none; b=TFrTaSALBPc8dc7FYOzEEskmnkpZn+BXvt1gJeoOR43mjCw1W1zvrAHrCI/Y3/lvCkSLu1dBglukpPxH+vxXme850gYlDJm8Otdj0IfMghO4XYF+SXJX6NW3TmXVq0A5o5tkOvPrD2kDi1dgoii7h6klahR+Jgb9uV5ScoJ9qe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959306; c=relaxed/simple;
	bh=BiXjIL1UVIKdr8lCb/4GdgkRFnvoHc7s8NwaiyFtjgM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8/PC/ZW6dSV39zSIJStHBtxxyknBiDwh+HGvAd5heDBHrxXwMuey5UUTP/4DoDQhAlfT7NL7x1vyZlcupHJv5nJvAJa66sJvhjQ8ne7703epEVjUy5/Z/9NDftvL5Pe6gTa5ajp3ElC2vSkGazRAPSTI9HUnTSWbe4nNKOzG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DqG7qy7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZQvAQ0WK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qki9IY94; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=byHgTGju; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DqG7qy7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZQvAQ0WK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qki9IY94";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="byHgTGju"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C52721EC6;
	Fri,  2 Oct 2026 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790959298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piPMmGxX66p1rXuF6D3GnRHwbJRjRNF0LuJQ741vqfA=;
	b=DqG7qy7xJuAa6HC30/LbUgyt69dirwysutPznGAb/1B2PCF9QFKPyyL9ssmbKfd2T56jDa
	3G9ld7ayMcs1GG797JdRCdaSSOJmsQjIYBMGKvkubyyFlXkhKHmwNT73j9UPUDDxIVUTBF
	X/6QSVo6jD+W6WJDEkijJO2oDHOmV44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790959298;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piPMmGxX66p1rXuF6D3GnRHwbJRjRNF0LuJQ741vqfA=;
	b=ZQvAQ0WKQGuZ7vMbVc3KYObRLdR0J9mQFFy1P/b2ZiSnNM8tTdCCt7UV6K/G/oG1Z+P4m7
	a6Bu0Su3A9AWMSCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qki9IY94;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=byHgTGju
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790959294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piPMmGxX66p1rXuF6D3GnRHwbJRjRNF0LuJQ741vqfA=;
	b=qki9IY94ZAnnhuo4U03FcTW1qishw8Z81M+Fkz1O3S+CvOOmSIG1KM65TOZ50I3vZECqJ+
	ZOgzyZLPQjgVF6evK0wLvgkxlvqfykzknKTG3SQsyiEHLqG8xs+q4PnjcU2JBjWBs6TJ9m
	RqWLsJsqqHPef3pD5ePe1f1BxENZmAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790959294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piPMmGxX66p1rXuF6D3GnRHwbJRjRNF0LuJQ741vqfA=;
	b=byHgTGju54A9mxfXinjCHQJOYB9w4EZgkmK2ahWpAvpp/CEZhLnX2wV8g4eV/QZygR+nRN
	eL67/veAH0xe1wDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0710139EE;
	Fri,  2 Oct 2026 16:41:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KrtlIb3ev2r3SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 16:41:33 +0000
Date: Fri, 02 Oct 2026 18:41:33 +0200
Message-ID: <8733uoys02.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Arun Raghavan <arun@accosted.net>,
    Mark Brown <broonie@kernel.org>,
    Charles Keepax <ckeepax@opensource.cirrus.com>,
    Srinivas Kandagatla <srini@kernel.org>,
    Jaroslav Kysela <perex@perex.cz>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
In-Reply-To: <87se48lv6z.wl-tiwai@suse.de>
References: <871pbsnce8.wl-tiwai@suse.de>
	<5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
	<87se48lv6z.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -2.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0C52721EC6
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 20 Aug 2026 16:31:48 +0200,
Takashi Iwai wrote:
> 
> On Thu, 20 Aug 2026 16:02:45 +0200,
> Jaroslav Kysela wrote:
> > 
> > On 8/20/26 15:34, Takashi Iwai wrote:
> > > Hi,
> > > 
> > > a few people including Mark and me have talked about holding a small
> > > meeting for the Linux audio stuff (finally again!) during the next
> > > Linux Plumbers Conference (on Oct 5-7 at Prague).
> > > 
> > > Has anyone already planned to attend there and is interested to join?
> > > If we have enough people, we can try an official BoF session.
> > > Otherwise, we can just have an unofficial session at lunch time or
> > > such, too.  Just let us know.
> > 
> > Hi,
> > 
> > I will be attending Linux Plumbers and would be pleased to participate in
> > a BoF session or another type of meeting.
> 
> Awesome, looking forward to seeing you again!

So, the conference will be opening on the next Monday, and we still
haven't planed yet -- business as usual :)

I put people who showed interests in Cc.  If more people are
interested to join, heartedly welcome!

If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
AM/PM), let us know.  Or, since there aren't so many people, we can
just have a lunch or dinner meeting, too.  If you have any preference,
speak up, please.


thanks,

Takashi
