Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5484C345757
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066256; cv=none; b=nScBhxpEOrt3Jl8jlOO2bIqZIOfFDi9HFxLwTkSunpBlGVeodoEKMiH7lziKyh+63n0HX+UimNc8lNK0P/ISx2t2rDEocFwjfvW6Oxzt0zxu5hZ7nLHAEI8gSPxbGwstHDoMo7e35WraskM4+eAwInWxpNOANi0GoJfFdTRiK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066256; c=relaxed/simple;
	bh=u98dKmfeTeOlvpCn9ta7gTLyWgCsaW/kYLWrkPAzZtE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgtvDOJdWLwY3nc+NYa08cBpHDQSrrom+Oh3Ls+JNrZoWotOPuSHInGuFB1rOFRCiABi26GWNpln3jkpHFf//LKgIlpvTAzD6XbsWydNxvMjbOGHBPWIuD4lZEYayjaVW2lKr5qJ4/YN01uHibFtXP9hLSp2SAEcC+OH2PtjTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N/fQabtJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UMbUgDY6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N/fQabtJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UMbUgDY6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N/fQabtJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMbUgDY6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N/fQabtJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMbUgDY6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53EB05BE04;
	Mon,  9 Mar 2026 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773066253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6bEvPWB8V5A4n3cfhFJCkLmGg4HCeBrgg7SrqW7rzI=;
	b=N/fQabtJEaYIbpZLw72jpeQ0d92XmQK2UEuAe+F9oSFFFznHX0OABAMz2Q17oSuJSMc2kN
	7+UPRRTl3tavOO22+wsK5IcZW5x3EguF5j1x2GsJlafoIsf/f+QEoR0hUB3ipS1v8UOYI1
	Mo4h0AmzBUsr77l+uLskNnvv2PPLoLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773066253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6bEvPWB8V5A4n3cfhFJCkLmGg4HCeBrgg7SrqW7rzI=;
	b=UMbUgDY6/Dg+BYigRhZ80OeJjej0vCLn0moM26XlNdP38/crHASXiGCXJqf0FGqKy9FGpR
	64GhiwAdmYlj4wBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="N/fQabtJ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UMbUgDY6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773066253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6bEvPWB8V5A4n3cfhFJCkLmGg4HCeBrgg7SrqW7rzI=;
	b=N/fQabtJEaYIbpZLw72jpeQ0d92XmQK2UEuAe+F9oSFFFznHX0OABAMz2Q17oSuJSMc2kN
	7+UPRRTl3tavOO22+wsK5IcZW5x3EguF5j1x2GsJlafoIsf/f+QEoR0hUB3ipS1v8UOYI1
	Mo4h0AmzBUsr77l+uLskNnvv2PPLoLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773066253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6bEvPWB8V5A4n3cfhFJCkLmGg4HCeBrgg7SrqW7rzI=;
	b=UMbUgDY6/Dg+BYigRhZ80OeJjej0vCLn0moM26XlNdP38/crHASXiGCXJqf0FGqKy9FGpR
	64GhiwAdmYlj4wBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 334933EF36;
	Mon,  9 Mar 2026 14:24:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fy07Cw3YrmlhQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 14:24:13 +0000
Date: Mon, 09 Mar 2026 15:24:12 +0100
Message-ID: <87h5qpm67n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
	<87qzq2kxrc.wl-tiwai@suse.de>
	<CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
	<87ldgakvsc.wl-tiwai@suse.de>
	<CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
	<CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
	<CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
	<87h5qxl8tj.wl-tiwai@suse.de>
	<CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
	<87ecm1jii6.wl-tiwai@suse.de>
	<CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
	<CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
	<87y0k6whm8.wl-tiwai@suse.de>
	<CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
	<87jyvlm6w0.wl-tiwai@suse.de>
	<CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 53EB05BE04
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 09 Mar 2026 15:14:47 +0100,
Gilberto Ferreira wrote:
> 
> >> At best, please try git bisect.
> Sorry! I am complete without any acknowledgment on how to proceed in this.
> 
> >> Or if it can't work for you, ask your distro people who can help.
> I have tried 3 different distros! I don't think this is some distro
> related problem.

No, no, I meant you can ask distro people to build a test kernel, etc,
instead of you.  And, it'd better to ask distros whether you are the
only one in the world who hits the problem.  If it can be reproduced
by others, they can help debugging or bisection, too.  Pinging
repeatedly here on the list doesn't help much, as you can't build and
test a patch, unfortunately.


Takashi
