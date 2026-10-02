Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEEB1E8826
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943897; cv=none; b=ECiAm7Ek5O2Bx+ALRSmcsaXbILlRlDBoulYPEeUbGo2KLIOxdXpAZcG28SaI6qbeRn0aZsirlC/WDlIRxRbhJh6sjTv9Q0MmQw5qXuTMrvZraQiy3QBCgUzrglBw2kIQuJl4Sra5frNwCWZld+DgSMReqHSpD9Uv4zRJ9L+hdag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943897; c=relaxed/simple;
	bh=B0NG11sYT8qZ/HJph0/POXvfXYNAiewpCaAd+w4ZA7k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1tVac7aK4bDU8itzOuSqML0tY7lME0u1B3pBK7LCcLzfxDV6fS/zk0IX0hpJijW3f/We5Lpz3lCZzltLOlrY8QmtClYhy0IbSKYFFIg/92UROfHiag5RucEQV+vC8K6Yk61U95KnTpaS0EI8xlV2vA1J924MvQ/1U9dDwjqHu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o8bgGmyy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9dDHIROo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QkObJqM3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F+Du8vcR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o8bgGmyy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dDHIROo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QkObJqM3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F+Du8vcR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B51C01FE3A;
	Fri,  2 Oct 2026 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790943889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZODSKMv5b5U6bVzupZFZsEAgoJZwSG9bwV78123WnmQ=;
	b=o8bgGmyyEnfd0p2ItmM8c8C71TMFpyQ2SSrDls3tjZbi250UL/gGLoTA9G1quwBmsWA0W8
	F7Sws1bzPD+lhT+kWFoBxCNWyutfD5C52IOVQaQrdztY3BqsYC6qRh/a54MKEm+Ucuh0uQ
	LddYYSW3kIvMUZAJ5sVPmI+lh754vWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790943889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZODSKMv5b5U6bVzupZFZsEAgoJZwSG9bwV78123WnmQ=;
	b=9dDHIROoPdmIrP+fDQHYDgjoFEpFJnHxwco6WGLNITirS07YPEUfgNC2IUfpfQ8BMI9VIS
	uBUYS7CaU/vowTBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QkObJqM3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=F+Du8vcR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790943885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZODSKMv5b5U6bVzupZFZsEAgoJZwSG9bwV78123WnmQ=;
	b=QkObJqM3o2VTqtbSDxSjCmQCsIpXsQgcJ3x8p5A4msrgYEzR0gSJofk+OJUaeqUIvO1zue
	Jyn/9L0YMRysqWE7cCGXuTiK/f9xgO00ajWTDUYCfCmoUw5MKxyAyLrqGLdfWB4aalYVhl
	C3acHJ3/on4hkx6jUDy63uQi3REpSI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790943885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZODSKMv5b5U6bVzupZFZsEAgoJZwSG9bwV78123WnmQ=;
	b=F+Du8vcRoHk4R3X1hrSix2lHv5sTxLlxx2xyyHfzUcaQSTo6QxSszlEsxlRgPdt/HqnTsj
	8pEGcV2yEo+o0kAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5000D13C73;
	Fri,  2 Oct 2026 12:24:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bZeQCY2iv2oOOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 12:24:45 +0000
Date: Fri, 02 Oct 2026 14:24:44 +0200
Message-ID: <871pa81e9f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc5
In-Reply-To: <874if41eee.wl-tiwai@suse.de>
References: <20261002115438.DD6341AC57CB@finisterre.sirena.org.uk>
	<877bk01fii.wl-tiwai@suse.de>
	<68deab21-b10e-47d5-b0f3-f533c995a87e@sirena.org.uk>
	<874if41eee.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B51C01FE3A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 02 Oct 2026 14:21:45 +0200,
Takashi Iwai wrote:
> 
> On Fri, 02 Oct 2026 14:05:02 +0200,
> Mark Brown wrote:
> > 
> > On Fri, Oct 02, 2026 at 01:57:41PM +0200, Takashi Iwai wrote:
> > > Mark Brown wrote:
> > 
> > > > ASoC: Fixes for v7.4
> > > 
> > > This is meant for a PR for 7.3-rc6?  Or really for 7.4?
> > 
> > v7.3, sorry - I thinkoed when I was typing stuff and fixed up the tag
> > name but not the subject.
> 
> OK, I corrected it at merging :)  Pulled now.

Hmm, wait, those changes look really too much for 7.3-rc.
It contains lots of Morimoto-san's refactoring changes, for example.
So they look really rather for 7.4.


Takashi
