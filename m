Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCD23A3E68
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898601; cv=none; b=XpXMnEmVXHS+R2dhTO3u2JcDuJSj0ogyb+I3epcOfkUAQyxG09zWj+XA+IVY+9aPMvQlB27cpYZsYcihWLcbrJ8T43R2ws+Nhukd9ckjPztcMnycuS6QiLQ9Uq8S40164E3VNXe9YXMNTQ3jWhCwo0WKffi+JNwxwrozzV6MTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898601; c=relaxed/simple;
	bh=z28YKZb97aTT9sW4UizjIF4MNYY5bkvLBWhjQjivFd0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCzDmHOsTlKQaEM4RDakKOT0suuWx732QS7EyMVn3Pc4YI9ICbnGYhN+JOqZOlLc2/AZVPsNZjc3KawDS7iKEWHOf+S3q67Xh0nEXn9r9ECVaCr9D37MRvpDKia1mywPK8fB1Kh2VNqM8Hs49FJCiCG9v0aHyhveZ6xLd6uMVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v70rq8+F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bxtxvhvI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v70rq8+F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bxtxvhvI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v70rq8+F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bxtxvhvI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v70rq8+F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bxtxvhvI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 368C621F2A;
	Tue, 13 Oct 2026 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791898598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COG0O6TV6JfYI9WqBYFfoDa5tJVguXvNhPtEZQ2CXuc=;
	b=v70rq8+F5YE07X+S2J39YOLCS/Do627ZGBA96FHnGltMOPLocDPRCfUQVBS4kcK66Yd/CK
	txZ8iEDz4y/C2Dfy9kZW/P9ojnlp0XBUKZeyVSpJAR7uC4toRVz7yzO+JWtF1HmN7+6mxJ
	Z0pKpmYKDukl2dO4ACQ2F4kW9yoLVt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791898598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COG0O6TV6JfYI9WqBYFfoDa5tJVguXvNhPtEZQ2CXuc=;
	b=bxtxvhvIeqd5pkK8CgYdAnSoHW0OvRInjgAb1YB96QOmihn0uBXNbG3ovS4n2/W4SOEetV
	nZodyxWC9uD7a+DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v70rq8+F;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bxtxvhvI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791898598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COG0O6TV6JfYI9WqBYFfoDa5tJVguXvNhPtEZQ2CXuc=;
	b=v70rq8+F5YE07X+S2J39YOLCS/Do627ZGBA96FHnGltMOPLocDPRCfUQVBS4kcK66Yd/CK
	txZ8iEDz4y/C2Dfy9kZW/P9ojnlp0XBUKZeyVSpJAR7uC4toRVz7yzO+JWtF1HmN7+6mxJ
	Z0pKpmYKDukl2dO4ACQ2F4kW9yoLVt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791898598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COG0O6TV6JfYI9WqBYFfoDa5tJVguXvNhPtEZQ2CXuc=;
	b=bxtxvhvIeqd5pkK8CgYdAnSoHW0OvRInjgAb1YB96QOmihn0uBXNbG3ovS4n2/W4SOEetV
	nZodyxWC9uD7a+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5CD1134C3;
	Tue, 13 Oct 2026 13:36:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YIhhL+UzzmpgfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 13:36:37 +0000
Date: Tue, 13 Oct 2026 15:36:29 +0200
Message-ID: <87wlrlg1sy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Arun Raghavan <arun@accosted.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
In-Reply-To: <87qzhuxzae.wl-kuninori.morimoto.gx@renesas.com>
References: <871pbsnce8.wl-tiwai@suse.de>
	<5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
	<87se48lv6z.wl-tiwai@suse.de>
	<8733uoys02.wl-tiwai@suse.de>
	<87ik3gs37v.wl-tiwai@suse.de>
	<asOtJzxO9bWQ1VaX@sirena.org.uk>
	<87qzhuxzae.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 368C621F2A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 13 Oct 2026 01:41:13 +0200,
Kuninori Morimoto wrote:
> 
> 
> Hi Mark, all
> 
> > > > > > > a few people including Mark and me have talked about holding a small
> > > > > > > meeting for the Linux audio stuff (finally again!) during the next
> > > > > > > Linux Plumbers Conference (on Oct 5-7 at Prague).
> > 
> > > > > > > Has anyone already planned to attend there and is interested to join?
> > > > > > > If we have enough people, we can try an official BoF session.
> > > > > > > Otherwise, we can just have an unofficial session at lunch time or
> > > > > > > such, too.  Just let us know.
> > 
> > > It seems that a lunch meeting would be fitting at b.
> > 
> > > How about Wednesday's lunch?  Does anyone have a conflict?
> > 
> > Adding Mormimoto-san who's also here.
> 
> Sorry, I didn't have office mail access in Prague.
> I didn't notice about this...
> 
> Thank you for your help !!
> 
> Best regards

One topic we discussed was about the regular remote meeting.
So hopefully, we can meet virtually there in near future!

(No concrete plan yet, but possibly one or a few times per year.
 I think 3 or 6-month cadence would fit for many people and demands.)


thanks,

Takashi
