Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA003BADB2
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034171; cv=none; b=nhMNOoUQWEvYQ+ycSrNW80PZiJMaAUkQxSLSc9CTcH7YMerx9P+C1k/IM9zOOyS8fj53H4JoSJZrObLaA108WY/HO9fnNI1vxpxL0dlEWOhdoiZvDeDDObfYmQ3PjIC9McT/3bmXmnGpTrasJJqlw82avzoXqF/QoxE7Pteh8WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034171; c=relaxed/simple;
	bh=WbsYEYphHiuKiEoDMCfFoDIABKEheh7zpT7ON0hGtgw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shyWDGoaagjEamu5SiuJHewHcxtpQb8QGgUDoJ6Z7lNQ08D+8hLVdKDWfGEaerHPFy8ArZkGyBSw3wkNziWOXIvXhfKTt35hGyBL73X2qNGlUeBpjw/zpK8dGreTcl7YbF/AfcLGzY0i8Tm5sUKXgNFGTlKQd7h/IH5zJ8V/gyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1mehRQnq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H2+wLXbD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xx2uERs4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vv5We/r7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1mehRQnq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H2+wLXbD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xx2uERs4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vv5We/r7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 234046C02F;
	Sun, 17 May 2026 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779034163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xx9GDuKcShKjBVisCKXFgbxM73saNCo3b/T1nbrukn8=;
	b=1mehRQnqpcC0uuA01dg0FpFqzIKyLhmfwa06pJcEjUoI02kKf+77EBbpnDBBJTRLLRgly+
	2NykQSzLMKLBkaGosIENPj2gFnhMysBOsSOZytQnlt9vGSfN9BdP5w6GpH0u/xl+gjpXqi
	IKh8hsE6WsHwqefWijhSMVFDEnnJBO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779034163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xx9GDuKcShKjBVisCKXFgbxM73saNCo3b/T1nbrukn8=;
	b=H2+wLXbDHwGEhNnt5HuoVfd4JiCkKi1hajz/8Oo+RclaeJEGgNyQaW7P4IVlnNbsYJ38YZ
	+W1O2zNTrBi7ZaDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xx2uERs4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="vv5We/r7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779034162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xx9GDuKcShKjBVisCKXFgbxM73saNCo3b/T1nbrukn8=;
	b=xx2uERs4/wv3BkDusJjsUVZMqXW7p0UL30qis/DnOdEOuwPgQjT1xR1XES8eFx4t//o1UQ
	FW46ytzpaC7H0o19TtVsF6jL7oY7rKq3vE3eO/t1pRDzDXFqe2XZa7QBYAHGbRzzuzdV6G
	l8XyXaMnXxWqjZWBrlP0Eo9eHFPcLU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779034162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xx9GDuKcShKjBVisCKXFgbxM73saNCo3b/T1nbrukn8=;
	b=vv5We/r7fMxwdw+ajJpjZwaxOsEU0aLxnOTtwmcxbd/1qJiJQiSbW+1tqOWv0D97rZjced
	HLJxn3DBp1NARgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDD39593A8;
	Sun, 17 May 2026 16:09:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BQ7WODHoCWoJGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 May 2026 16:09:21 +0000
Date: Sun, 17 May 2026 18:09:13 +0200
Message-ID: <87pl2udnme.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: tiwai@suse.de,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	o-takashi@sakamocchi.jp,
	perex@perex.cz,
	tiwai@suse.com,
	zzzccc427@gmail.com
Subject: Re: [PATCH] ALSA: pcm: oss: Use snd_pcm_kernel_write() in snd_pcm_oss_sync()
In-Reply-To: <20260517133608.540165-1-xujiakai24@mails.ucas.ac.cn>
References: <87tss9t83c.wl-tiwai@suse.de>
	<20260517133608.540165-1-xujiakai24@mails.ucas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,vger.kernel.org,sakamocchi.jp,perex.cz,suse.com,gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 234046C02F
X-Spam-Level: 

On Sun, 17 May 2026 15:36:08 +0200,
Jiakai Xu wrote:
> 
> Thank you for your review, Takashi.
> 
> > Thanks for the patch.  I believe the problem is rather in
> > do_transfer() setting up a bogus iter for silencing unnecessarily.
> > So it's a bug introduced in the commit cf393babb37a ("ALSA: pcm: Add
> > copy ops with iov_iter").
> 
> I agree with your analysis. The root cause is indeed in
> interleaved_copy() ― it should not pass a NULL data pointer to
> do_transfer(), which then unnecessarily constructs an iov_iter.
> 
> > Could you verify whether the change below works instead?
> > noninterleaved_copy() has already the handling of NULL data.
> 
> Unfortunately, this crash was discovered through fuzzing, and
> the fuzzer did not generate a reproducer. As a result, I am unable to
> test the fix directly. However, the fix looks correct to me.

OK, no problem.  Then I'm going to submit a proper patch later.
Thanks for your checking!


Takashi
