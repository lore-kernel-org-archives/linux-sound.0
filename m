Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA52EC541
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186180; cv=none; b=bee9833jX0ZOqhOKbJazw9QynV9J5YgB7linCFrvlP4oSxxxS3tFQw1sdt3LXX0GqTPAM1vL+YomfqkP1eEqSUK1VS6dn5Veme9Es3dXDXEW5qwCBxjDH+do2p7AZoKyHlWqCp/86jvg3+c2gZmmGNsOw/SJoEUE7gnXdyXIlSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186180; c=relaxed/simple;
	bh=otfJdCQys5HpmER/1LHqR2gn6yEgkfKbV+7fuO+s5r0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRo5GOOT0dGcN7VhUw+Y9HRRjujLNexLyB+gp7Cr5mol9zM/46VksukeAbgnbq1AW2JbdWBQF+WuYdlmxqK28WWXcnBgpKirkc+uFh3QNxWibtxfnPY4HxHXmWbUDoujaCd2cgMsMNaUoWzyS4Y2/xUW1aKgZOtTs+SeLQXVVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=blITVJyc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sgNSKiPr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VamxGyzG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XkjV1orn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="blITVJyc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sgNSKiPr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VamxGyzG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XkjV1orn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6627233842;
	Fri, 23 Jan 2026 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769186177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y0GzhtkM0mcWIFnuf5wGLExFABa6OsMoA3MgKMd/rk=;
	b=blITVJycw+OXp6RcFx2EJDMQFbgbEzLRkNSwf5hUKcX163dvFR8k/Yp5qtFWsS39dwDj4X
	j4EcJkPQpfGDDIvBXAjZjcawiYvspM++9IG7Xn/p05Ss/Xr8+0OAFnBVJak/GaBhnmNBpH
	y2Obr8VXnzAiWipgatP6fzponyhZbrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769186177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y0GzhtkM0mcWIFnuf5wGLExFABa6OsMoA3MgKMd/rk=;
	b=sgNSKiPrQ6vqK7RaDKfgDJj6G5W4AyQaLFicZfcOp5AQqw//zO6ANVOQ2TsLl9sBgvCXiA
	IKs3w+NdSzhQB+AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VamxGyzG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XkjV1orn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769186176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y0GzhtkM0mcWIFnuf5wGLExFABa6OsMoA3MgKMd/rk=;
	b=VamxGyzGdr8k8cT94R9W1zpYTUBbj80/GLG64wauimpGzLejY03WST0vLKg17g952gouHH
	GCfWMDciQiu+CIWKt8A3PnObiXqBsoAvxOGnnJR0yTN1Kqs7MhkDeIz2Pprjnqi6NvSXQx
	oTK7GYBE+21lenYIm35xG6CmY4HdG5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769186176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y0GzhtkM0mcWIFnuf5wGLExFABa6OsMoA3MgKMd/rk=;
	b=XkjV1ornwNTpQ3yJR6rCGesCN6ap0tPwnVXj3xw/ZaDYag9z3XXFkNI8Tb2uhgSVg4YuWZ
	H5fcrhviWV3PE4Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35E161395E;
	Fri, 23 Jan 2026 16:36:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +t/5C4Cjc2mLKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 16:36:16 +0000
Date: Fri, 23 Jan 2026 17:36:15 +0100
Message-ID: <87zf64cmm8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc6
In-Reply-To: <b0b9125c-e5d1-4fed-9092-020cb24652cd@sirena.org.uk>
References: <b9a26fcf7ebc08d3deb132f538a592cb@kernel.org>
	<87343we1n1.wl-tiwai@suse.de>
	<b0b9125c-e5d1-4fed-9092-020cb24652cd@sirena.org.uk>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 6627233842
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Fri, 23 Jan 2026 17:27:22 +0100,
Mark Brown wrote:
> 
> On Fri, Jan 23, 2026 at 05:26:26PM +0100, Takashi Iwai wrote:
> 
> > Pulled now.  But it slipped from the PR I already sent just today, so
> > will be included in the next PR for 6.19 final in the next week.
> 
> Linus said he's doing an -rc8 FWIW.

Thanks, it's good to know, I missed that info.  So we have a more week
for playing around ;)


Takashi
