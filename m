Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A232EBBA4
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808636; cv=none; b=BrV2m958zYo6UV6qvBG6wwF1rC7oUaApDhngHrDZFdBPZSqJFt3KkD+6X8tRd41zVyaJdgOUMhkgWIzOnqv3PuQ38dHNESJB1jo3j/Ox5kyb1SOCmbHK7+1fBJIb1N6kPbXFB9cQiKH8nF4gCi85995CNI0JCStYY9nxkjrDC+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808636; c=relaxed/simple;
	bh=fV9DbMaF9Yp9JaCIV/PwHqenDiXONk5Bat3U63xifAE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cS9JKHtG9BlgRrpGm0/QxB/N7o3wWIYwAdHpYDP/ETS2txVjIS5jtC8YMRTMVvYcQUIxqc1oUW4WLgG9Yeya1yOwkTPMbdVMYhhtfKsampKIRA255GVWeS0mdBfCEUqOfckNrHNV6/qp80NqpgR7MYoXLUF46lTgtxXiZFLyKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bK4PIw+I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BVolBwjZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bK4PIw+I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BVolBwjZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bK4PIw+I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BVolBwjZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bK4PIw+I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BVolBwjZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1284E6A7E1;
	Fri, 10 Apr 2026 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775808633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1jTR3PUHq73Lywole22S2meYotoFsBvymME4UqCkPY=;
	b=bK4PIw+IEJarcfSNdS0qeFJ/Ex7+p3Allx6v+YI1Y9WG2MJc0h0eS5x3ckRhVwPk3uASKj
	rBrrEsfF6hqZPvPY0qHat+pPTBkMwt/PKi6h+2b9Y+FYAzPzX5d+hM1yVnhxNAEb+g7UcE
	/9PYzTsuoGf2C7mKIMX3f36eC8PWXaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775808633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1jTR3PUHq73Lywole22S2meYotoFsBvymME4UqCkPY=;
	b=BVolBwjZ/4CYFc+VGCf+Lm6RC0UuCV0JPj7XjQgZmp7A5oYRAiwSeKP6StN3niN6TglnEc
	iWjvj2+V8ZNP6QDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775808633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1jTR3PUHq73Lywole22S2meYotoFsBvymME4UqCkPY=;
	b=bK4PIw+IEJarcfSNdS0qeFJ/Ex7+p3Allx6v+YI1Y9WG2MJc0h0eS5x3ckRhVwPk3uASKj
	rBrrEsfF6hqZPvPY0qHat+pPTBkMwt/PKi6h+2b9Y+FYAzPzX5d+hM1yVnhxNAEb+g7UcE
	/9PYzTsuoGf2C7mKIMX3f36eC8PWXaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775808633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1jTR3PUHq73Lywole22S2meYotoFsBvymME4UqCkPY=;
	b=BVolBwjZ/4CYFc+VGCf+Lm6RC0UuCV0JPj7XjQgZmp7A5oYRAiwSeKP6StN3niN6TglnEc
	iWjvj2+V8ZNP6QDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB40B4A0B2;
	Fri, 10 Apr 2026 08:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9CRTMHiw2GlTbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 08:10:32 +0000
Date: Fri, 10 Apr 2026 10:10:32 +0200
Message-ID: <877bqfgrrb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Lei Huang <huanglei814@163.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: fix code style (ERROR: else should follow close brace '}')
In-Reply-To: <6fdc548e-34c5-44ab-8e4e-6d58ea6b07a8@kernel.org>
References: <20260331075405.78148-1-huanglei814@163.com>
	<87wlyss93y.wl-tiwai@suse.de>
	<460e5a49-dd85-41fe-9d35-0c4e7efc0ceb@kernel.org>
	<2475f220-b0ff-4ee6-b897-75de87d68f81@kernel.org>
	<87mrzbgtln.wl-tiwai@suse.de>
	<76ff00e6-07a3-4c0b-8906-baa13c077468@kernel.org>
	<87ik9zgsuy.wl-tiwai@suse.de>
	<6fdc548e-34c5-44ab-8e4e-6d58ea6b07a8@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,163.com,perex.cz,suse.com,vger.kernel.org,kylinos.cn];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 10 Apr 2026 10:03:12 +0200,
Krzysztof Kozlowski wrote:
> 
> On 10/04/2026 09:46, Takashi Iwai wrote:
> > 
> > It actually helps a lot on distro side, judging from my long
> > experience of backporting (literally) million of patches for openSUSE
> > / SUSE kernels.
> > 
> >> BTW, since I was looking at your tree - you have contributions from
> >> songxiebing@kylinos.cn which does not follow requirements for a *known
> >> identity*. IOW, it does not pass DCO requirements and should not be
> >> accepted.
> > 
> > Do you mean the form
> >   Signed-off-by: songxiebing <songxiebing@kylinos.cn>
> > ?
> > 
> > The name spelling without space is pretty normal in Chinese.
> 
> It is a copy of email username.

... and the username shows the real name in this case :)

> I am no expert, but usually Latin
> transliterations have differences from usernames (and Google confirms
> that space is expected for transliteration, although Google is no expert
> either), so this looks like semi-configured Git.

Yeah, it's possible, but also it's a common pattern, too.

Strictly speaking, it's rather a mistake, and I'm no fan of that
style, too.  OTOH, since it's relatively broadly used and can serve
for denoting the known identity, at least, I took as is.


thanks,

Takashi
