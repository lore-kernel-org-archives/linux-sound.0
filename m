Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705D40EB8E
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228993; cv=none; b=DAHWnnysUmFNUXAUZ0Dfb9Alh7p7eLHslsmojxO+1T109yaKVdDlqU8yR8mMRNPFos2OXjOOesPF8iCIVIhcv0ntoawko8Y578JMdrG2JGio1E9wCg8cuY2U/YoS0iUJgusKnRQz6IUgWQb1nCRc5K1nJOnjzVO+pwehMSGG1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228993; c=relaxed/simple;
	bh=+kPaNeSDZNjw6rUNB2Ju8If+GP1F5c3KuHl+lwNz068=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nwzLIzT6SNS7U+kDDoAlsw8QEz4NnckI5HdVh+vZT4d0xh/2EiDx9VxP5oZbIjd/48L7reZcjuKvJP4IymVNAVe3ZoLxN92rDUn+1b3uXxIe+bHyz8eqHVCNPAd9puFEyTSNk/pp5vCsnnZtoWmAkb/ipqFEO5x/nCzSjJiTY8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dmUcg6UH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=66hQ61sc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Op1HH0U6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=attd7qks; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dmUcg6UH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="66hQ61sc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Op1HH0U6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="attd7qks"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 563AD7C101;
	Tue, 28 Jul 2026 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785228986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqVZolgkOj9/0qWu/P/svnnXkGc8K8C9Cip2wucbx+g=;
	b=dmUcg6UH5VtgLleaXkX20oz8B3JK3tN1Psp0jH/x2Vze7XWgbtJB7rFp5HHD500ro4o/5K
	jYc7/BfPntQDJVh34dyR9lCR3WQzanUCblezebTDqOXPmteyRNoXz5aIDuyliuiXNhKxNc
	dQzaXdwiceEcchn0rP/9atimJ0mW0fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785228986;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqVZolgkOj9/0qWu/P/svnnXkGc8K8C9Cip2wucbx+g=;
	b=66hQ61scBr6wfzviUEY6Ah/zOND1mnJ4M3OjMzVCZa0VSrlmC+slr9j6XaYyQeyrdmj2Zg
	W1jmbeuOCM2JdICw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Op1HH0U6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=attd7qks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785228982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqVZolgkOj9/0qWu/P/svnnXkGc8K8C9Cip2wucbx+g=;
	b=Op1HH0U6XfS7S1tXx68BEuagvJRB6O01bj65gar5s/oM0eo/LXDXQAFH+fKuD+8lkHA8cW
	1tKRDWA4bHFR28SGme+h+rZqoa4Ltmk64cixTZPdhnIs0zds/tqgAeuoMfkXLtJkVaccwb
	mkxY+OBLUObMjPqYCrj7whm+y7S5WH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785228982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqVZolgkOj9/0qWu/P/svnnXkGc8K8C9Cip2wucbx+g=;
	b=attd7qksDNbPJ9N49o0nvVcP+rPYO11q0+SHC5F/YD+1a3DN9pEC3On76EQnBcs+qO8MeR
	sSuHDQ8IRQqFdADw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0880B779B1;
	Tue, 28 Jul 2026 08:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /9bjALZuaGoiTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 08:56:22 +0000
Date: Tue, 28 Jul 2026 10:56:21 +0200
Message-ID: <87wluf7aru.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	cassiogabrielcontato@gmail.com,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Update snd_card_new() documentation
In-Reply-To: <CAABR9nGfs65V76G8w4jEdMKtE5o37YqOe1XUqh=o1TLwKJk-Lw@mail.gmail.com>
References: <20260728081251.23783-1-phucduc.bui@gmail.com>
	<87zezb7bnw.wl-tiwai@suse.de>
	<CAABR9nGfs65V76G8w4jEdMKtE5o37YqOe1XUqh=o1TLwKJk-Lw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FREEMAIL_CC(0.00)[suse.de,gmail.com,suse.com,kernel.org,perex.cz,intel.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 563AD7C101
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 28 Jul 2026 10:47:26 +0200,
Bui Duc Phuc wrote:
> 
> Hi Takashi-san,
> 
> Thank you for your review.
> 
> >
> > Well, from the API documentation POV, it doesn't matter which function
> > is used internally.  The main point is that it does
> > zero-initialization.
> >
> 
> I understand now.
> Should I keep the function parameter indentation fix?

Honestly speaking, I don't care much about it :)

If any, you can resubmit a patch to rephrase the comment from
kzalloc() to zero-initialization, together with the indent fix.


thanks,

Takashi
