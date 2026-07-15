Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9AA31717D
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101657; cv=none; b=jiWLcF3sZ6wKrz4SuULGPLPhA00D7Js+B6TnXjexJinkiqOcgC63vevSjpKzl45dgeZMPnNlyxGNTYx45VW1YCJFZWa4HmY5BYaivFva60AL73u+3qBoJpMEScNG7Y43FfntMV1GCiromrDtDDnrMTzHIPbT0Y88jpGMmq8WbbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101657; c=relaxed/simple;
	bh=Trb3D/6dytoP2bUuL26pMieKFhiNQwDy4ruscUnwIn4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plc0WcPdWNO/uLewT/7sCEDb8UkOY4Ura0IAcc7TpWjmubIGVrl6iyD+KUfkS5NlKz1Ka3Kqh3SYtfmbsa7L/noBp16djpPDYGLKhNbtarepfMIXeygTiLVRZW1zXlX5KPjzk4WsoqA1zY5YuY2XjteoNR+AF6yJHN59+23d0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aiMHd1FM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LgQjn1En; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aiMHd1FM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LgQjn1En; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aiMHd1FM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LgQjn1En";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aiMHd1FM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LgQjn1En"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2D4F3DFA;
	Wed, 15 Jul 2026 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784101653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnoPAb7D5aQ2UwHozW5kG+96ZF5JKVJOHotJ937xC34=;
	b=aiMHd1FMT0z/YAAsaw9IiWypfOHJWjC3b/7j+JJB4kFR08W5nXTm0jVZYc6k7y1g27v6Zq
	kjH13JX12syKZGQVY2KU7BuZKpgRXgm6PyQuWOdwYhce6Nlpmc5pIr5nkSlSsAhfeg2lHH
	hL615D3RPlMvOKl7sZPwaaw1WUYQxm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784101653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnoPAb7D5aQ2UwHozW5kG+96ZF5JKVJOHotJ937xC34=;
	b=LgQjn1En86GfhsZ62/ydHRQCNh98m5wWJYM9NGpR+cfrIX70s20hcu4gkAC118MvtZQNSL
	uFSu8D0/iZlmgCCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aiMHd1FM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LgQjn1En
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784101653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnoPAb7D5aQ2UwHozW5kG+96ZF5JKVJOHotJ937xC34=;
	b=aiMHd1FMT0z/YAAsaw9IiWypfOHJWjC3b/7j+JJB4kFR08W5nXTm0jVZYc6k7y1g27v6Zq
	kjH13JX12syKZGQVY2KU7BuZKpgRXgm6PyQuWOdwYhce6Nlpmc5pIr5nkSlSsAhfeg2lHH
	hL615D3RPlMvOKl7sZPwaaw1WUYQxm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784101653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnoPAb7D5aQ2UwHozW5kG+96ZF5JKVJOHotJ937xC34=;
	b=LgQjn1En86GfhsZ62/ydHRQCNh98m5wWJYM9NGpR+cfrIX70s20hcu4gkAC118MvtZQNSL
	uFSu8D0/iZlmgCCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A53A6779AD;
	Wed, 15 Jul 2026 07:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGYWJxU7V2o7NAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 07:47:33 +0000
Date: Wed, 15 Jul 2026 09:47:33 +0200
Message-ID: <87se5ky9re.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven Kendall <skend@chromium.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <CAB1bpFCNC1NWYpBRzzuxQMFN2wugSYUq2G6tkeoiT=ThUE094A@mail.gmail.com>
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
	<87qzl6jf1o.wl-tiwai@suse.de>
	<CAB1bpFCNC1NWYpBRzzuxQMFN2wugSYUq2G6tkeoiT=ThUE094A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D2D4F3DFA
X-Spam-Score: -3.51

On Tue, 14 Jul 2026 21:51:21 +0200,
Steven Kendall wrote:
> 
> > This makes the remaining text not taken by git-am.
> > And, I guess the text above should have been combined with the below?
> 
> Sorry about that! I'm using b4 and that was the result of having a
> cover letter in addition to the commit.

If you want to give additional comments that shouldn't be included in
the commit log, put it under '---' line, instead.  Then it'll be cut
off.

> > The jack polling is really the last resort, and I'd like to know why
> > the normal jack detection doesn't work at first.  Is it the missing
> > unsol event?  Or the jack detection itself doesn't work?
> > If it's a missing unsol event, this drop happens always?  Or on
> > certain runtime PM state?
> 
> In my debugging output I could never get the unsol event to trigger.
> I'm not sure if that's the same as jack detection not working. I tried
> a few timing changes and pin changes but to no effect. From the user's
> perspective, audio plays both from the headphones and the speakers
> when headphones are plugged in. According to my notes, I also observed
> this on Ubuntu 22.04  LTS on its initial image, but applying its
> latest update resolved the issue. One notable clue is that currently
> on Chrome OS (with no patch), sleeping and resuming the machine does
> fix jack detection, but I've been unable to fix initial boot behavior
> thus far besides an approach like the patch here.

Have you tried to turn off the runtime PM for HD-audio?
The question is whether the unsol event doesn't work *at all*, or it
just stops when the codec (or the controller) is powered down.
Also, CS8409 driver enables the per-node power-save feature, and this
might influence, too.


Takashi
