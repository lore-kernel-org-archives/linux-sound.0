Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB351A5B82
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941420; cv=none; b=CbjMXDsmuSUgbJCv/5f+MJvNsdPGyGzCNMB4XP+S7Qtr/XBevw5NqGPrwfbxzmGPRwJthePqJlWyS8DvxAl0/OsVK9usC4FnSLPzlQQPfcyIXj01EkgaAO/AyVX1wlnOWfzgqC7B1b1LNo7PO+zwRCqiFGUJW/YjKFdphPrp9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941420; c=relaxed/simple;
	bh=iuykNtH3i6/+r0K3LBMugvLzupK6L+1tS0EgkkwopUs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q9Ph24dnH1j7PoaqGeZami/DnYD4EYEt4TD6iGvK5MqEA9vBPtvWwqIx5/AoCXbAhihelv8odQj0jvbs3m0nChrgepG/dybPQ/BfmdL+96LU8KYIWKODm8aiyLb2TZyT5fO4i2t12XLlqwuJ2uVpGWp5e84SDeejpE6Xfr95C+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2AdjdnjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RftyBG0s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2AdjdnjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RftyBG0s; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2AdjdnjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RftyBG0s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2AdjdnjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RftyBG0s"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2B81C1F388;
	Fri, 14 Mar 2025 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741941417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0J23cbaWrfq9To2wulJ8tRHUbJNzjbNOTBQk/rLCOAI=;
	b=2AdjdnjMbiM+PyQ/AEP+qODjAs84JCAY5gJVrdV6+RytXhNoErTVDybL7OEN3/jerFiipN
	Jv7eVPCSUvX6olOfHD4FzKXUUGZwL7j+uWj1jf9afBezEdiDuc88afORCxIcKKBNqL7bzB
	wh8oe0yaqNyVNBUrCeA+x5FnUJBx1EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741941417;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0J23cbaWrfq9To2wulJ8tRHUbJNzjbNOTBQk/rLCOAI=;
	b=RftyBG0srEM6h++NePM2IAlgBirZ3IP4NqOCe9vsNR40SyP65U5dEOY69MhOfq0rH24pqN
	qC0TwQW9nPFMaFBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741941417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0J23cbaWrfq9To2wulJ8tRHUbJNzjbNOTBQk/rLCOAI=;
	b=2AdjdnjMbiM+PyQ/AEP+qODjAs84JCAY5gJVrdV6+RytXhNoErTVDybL7OEN3/jerFiipN
	Jv7eVPCSUvX6olOfHD4FzKXUUGZwL7j+uWj1jf9afBezEdiDuc88afORCxIcKKBNqL7bzB
	wh8oe0yaqNyVNBUrCeA+x5FnUJBx1EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741941417;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0J23cbaWrfq9To2wulJ8tRHUbJNzjbNOTBQk/rLCOAI=;
	b=RftyBG0srEM6h++NePM2IAlgBirZ3IP4NqOCe9vsNR40SyP65U5dEOY69MhOfq0rH24pqN
	qC0TwQW9nPFMaFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05B7E132DD;
	Fri, 14 Mar 2025 08:36:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1CkWAKnq02eUQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Mar 2025 08:36:57 +0000
Date: Fri, 14 Mar 2025 09:36:56 +0100
Message-ID: <877c4s9ffb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/89] ASoC: Convert to modern PM macros
In-Reply-To: <Z9PUmk5vJvu3FRdm@geday>
References: <20250313174139.29942-1-tiwai@suse.de>
	<Z9PUmk5vJvu3FRdm@geday>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

aOn Fri, 14 Mar 2025 08:02:50 +0100,
Geraldo Nascimento wrote:
> 
> On Thu, Mar 13, 2025 at 06:40:05PM +0100, Takashi Iwai wrote:
> > This is a series of small and trivial patches to convert to the newer
> > PM macros, e.g. from SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS().
> > 
> > The conversions are systematic, and we could reduce messy
> > __maybe_unused and ifdefs with those changes.
> > 
> > Merely code refactoring, and shouldn't change the actual driver
> > behavior.
> > 
> > 
> > Takashi
> 
> Hi Takashi,
> 
> some of the patches for RUNTIME_PM_OPS() have typos in them stating
> RUNTIE_PM_OPS() (note the missing M) in the commit message.
> At a quick glance all of the commit titles are correctly
> stated as is, it's just some of the commit messages that
> got wrongly copypasted.
> 
> Since this will go through your own sound.git tree, presumably,
> and the change is strictly cosmetic do you think you could
> correct it later on when merging this? It's quite a bunch of
> individual patches you have to "s/ RUNTIE_PM_OPS()/ RUNTIME_PM_OPS()"
> by the way.
> 
> Any decision is up to you and since the commit titles are
> right anyway it shouldn't be a major problem for e.g.
> naive grepping of the git log. But it definitely looks funny.

I can resubmit with typo fixes if needed.  Otherwise, as ASoC patches
are merged via Mark's tree (then through mine), Mark would have to
correct at applying, instead.


thanks,

Takashi
