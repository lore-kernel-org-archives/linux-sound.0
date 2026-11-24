Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530971;
	b=uwwtNl1Gsl8Z6BXw3gfYV04yiY5lhs6kmX0zEKseDjX1/lgf9IqSgqXLGJeIuRX1uwju
	 DE1MFdIUpUB9anQifqErVbxhODtJJSaH7ewbVHv5AiLbemviWazCHvTELUsppD8TsVcGf
	 W0q0zspGLYHX7g5bX+of/JnKLdTZmQZ25ZMtp8hobRlF00ucEYkvE+9u+ImKWs8KQf2aa
	 e9AEAa2UC5wWw59V0aV2mcc4yV8pmRRzROwKuHm+NRp+bUIIBhdyloN2fH6KZlQjWHOm6
	 tOuTZPF2gGhxwSVcSB4nYHK2zf9z64Y2Cy3/0pxEbYMbK+oS8x2kBECzsmMPebk4CXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530971;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=57eTNsZDW/7k/bwZuzvAmxZsNYiBE4Yawt/DYwIupcY=;
	b=tw8ZpFS/w1+1s5bv2fRcSH75lIovCmjUtsddLrWbtNOKAZfYzSsVbBwOcDWkbIgjxJ8R
	 ZXeF0zEo58Ls6pN11EaGZ3mI77YbCnMHw5FxH4/12uhUxZUCnss1ab92Dhdd8NnHXxYbo
	 TkDiAoeBPfRwGvrYIQvBq9ObIV3xvaX6V3ceC3PG/x7ta9E4o94C1/GvzGmmdgXrbxQ4m
	 3pYcG80vGwc1/R80laszJGNWnWfnQGosqCZIOn57jSnLyx7zD1K1AJllOR+QJ3iDGH84w
	 RsWI17BtEDTwOEI1oE3d4p8EUm8RR06cqle91zKxO+oB0/QzfzYKFs69KpK/PRKVGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Wsg1Z158;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SptLZuKU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Wsg1Z158;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SptLZuKU;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55110606A327
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 14:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55110606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Wsg1Z158;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SptLZuKU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Wsg1Z158;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SptLZuKU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E0EA1F7D2;
	Tue, 24 Nov 2026 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795530969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57eTNsZDW/7k/bwZuzvAmxZsNYiBE4Yawt/DYwIupcY=;
	b=Wsg1Z158pdsmNMIMupvG/emY4mGh0ydofcDbUs3XP5gTwEGjAeea3hs3u4aTNDr8IP7Bo5
	xYG4JZvYVVLJhrykOckUzKflbY6LwRWsH6DKJFz7/22g54lDkCGp78xL9atkue5f8BtPY2
	CEst5Qk2P6OxP3tVIz40ekahLWdp2Ic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795530969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57eTNsZDW/7k/bwZuzvAmxZsNYiBE4Yawt/DYwIupcY=;
	b=SptLZuKUipOOHrF9PGb218XtmKmbcEJKVr5a+aeZpiL7EJIq8qgPwPQWp3qLgjjN309ok1
	FbWS4R/+d1sOpvBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795530969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57eTNsZDW/7k/bwZuzvAmxZsNYiBE4Yawt/DYwIupcY=;
	b=Wsg1Z158pdsmNMIMupvG/emY4mGh0ydofcDbUs3XP5gTwEGjAeea3hs3u4aTNDr8IP7Bo5
	xYG4JZvYVVLJhrykOckUzKflbY6LwRWsH6DKJFz7/22g54lDkCGp78xL9atkue5f8BtPY2
	CEst5Qk2P6OxP3tVIz40ekahLWdp2Ic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795530969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57eTNsZDW/7k/bwZuzvAmxZsNYiBE4Yawt/DYwIupcY=;
	b=SptLZuKUipOOHrF9PGb218XtmKmbcEJKVr5a+aeZpiL7EJIq8qgPwPQWp3qLgjjN309ok1
	FbWS4R/+d1sOpvBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 432201339F;
	Tue, 24 Nov 2026 14:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kxyVBtmgBWtvOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 14:36:09 +0000
Date: Tue, 24 Nov 2026 15:36:04 +0100
Message-ID: <87h5h69u0b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lord <mlord@pobox.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <480cc2f7-999a-4458-bc53-7badede872df@pobox.com>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
	<b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
	<c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
	<87ik1ndgkp.wl-tiwai@suse.de>
	<0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
	<874id7d336.wl-tiwai@suse.de>
	<64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
	<874id6bdsx.wl-tiwai@suse.de>
	<E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
	<87mrqy9yfk.wl-tiwai@suse.de>
	<d406700a-4a14-4f47-95e0-72704544dce5@pobox.com>
	<87jym29v9q.wl-tiwai@suse.de>
	<480cc2f7-999a-4458-bc53-7badede872df@pobox.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 24 Nov 2026 15:20:57 +0100,
Mark Lord wrote:
> 
> On 2026-11-24 09:08, Takashi Iwai wrote:
> > ..
> > Those are about user-space stuff, and rather questions to distros.
> > For further investigations, you should ask distro people.
> 
> This is a kernel bug, demonstrated by git bisect, traced to exactly one update.
> I am using HEAD detached at d1e57f8fb7a6 for the point of this patch.

Mark, you told by yourself that it could be a timing issue -- which
may lead to no kernel bug in the end, too; the git bisect result could
just be a coincidence triggering such a problem.  That is, you can't
see the difference between the result and the cause at this point.
So, don't jump into a conclusion easily before finding out the real
culprit.

> What I am doing now, is rebuilding the kernel to the exact point of that commit.
> Then I will collect kernel driver information about the sound cards as best as I can.
> Next I will repeat that process with that single update reverted.
> 
> The commands I will use are these:
> 
>    pactl list cards
>    cat /proc/asound/cards
> 
> And any others you need output from.
> 
> I can also patch the kernel with additional diagnostic information
> to help you figure out what got broken.
> 
> You will have to provide any such patches here, as only you
> know what exactly to look at there.  I am unfamiliar with the innards of ALSA.
> 
> I'll reply again shortly, after rebooting into the kernel at d1e57f8fb7a6,
> and then reverting the patch and rebooting again to collect info.

OK thanks.  You can run alsa-info.sh and get the information for the
details.


Takashi
