Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F3364AA4
	for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142951; cv=none; b=eB2XNtqbPvZmJfNxWknmGwujx4NOQ4THulrD1no65JhxlOV723LUJgc6tqwiJPQY0ohyXSiak6bVRM2wjgNvFZB63ktsf1CDBRq+w+t2av+Cdfc4lDfYcOGe98UbjxURPbw5lzsymleRFD1aC1V7Yn08xL2sZZMoRX5BjPJUd4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142951; c=relaxed/simple;
	bh=qUWTCbwlkxlnfzz9/IL3rX2JW47TPnhU5FVNLDZ74Wk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qmD3J3Z75MM7/sjCrmvhnpRfpaYpUeWM2eH++vJFnLINk5v3v9tNR+/AKqqLmoPmIWOm8QhYB/QINCktT5sYQGg8ithaE5AUC0c9daFRnAwDP/P9mKuBgGavLk5pa2mNYhFlG13ghP/sOk3opzIzICF3ncDvF1B36Jdn5ARkdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=peWf+ynf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+2O75crj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=POuS97S2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=55fHc+my; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="peWf+ynf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+2O75crj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="POuS97S2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="55fHc+my"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FBB46B703;
	Sat, 30 May 2026 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780142948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oW+mMkq3XU90p5N6mE+XfAFbEqnCfZHsOi7os1ACDk=;
	b=peWf+ynfJyTxvfquzaL18yY2kYxHwcp1bFRoLDRnvUmZQIvTJ+0+WQeJveqV9y1YcxMFa7
	3WzjMP0ZyDOrYfmrvgNdDGx0lhdic3YFjLw6BW5gXNx3UmixCUMxzjp1SS06mYBAr46lzz
	Ym3j0ypNgJjPR1oPC7gctgYTR4Ng948=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780142948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oW+mMkq3XU90p5N6mE+XfAFbEqnCfZHsOi7os1ACDk=;
	b=+2O75crjWc+39yqFvJ62eFqEDJxrWxvFrYjcceYt1UcFuOZaiPB7Cqnts7DlwOKgXbzR4F
	yh0U0QwBk1EjH6Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=POuS97S2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=55fHc+my
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780142947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oW+mMkq3XU90p5N6mE+XfAFbEqnCfZHsOi7os1ACDk=;
	b=POuS97S2YP6CiWgLCtxyoyQVLx2+gHE19ewcU7WmoJ91zr0l76O1xhM+b4v9P/2KZ38RZ5
	NyhBZx9AKPGWLC/DdewgIP/OnkJ/x+P+p3jipOf0j7qWXC4z5gDefxiLOsipAsAXTh81ul
	KAbwkf95ZVS7tD2av2HlVEenR8HcUNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780142947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oW+mMkq3XU90p5N6mE+XfAFbEqnCfZHsOi7os1ACDk=;
	b=55fHc+myNXo6/51Y4cREVl68yNGeZAU+pdhfqA+rrWWAweJohfzAic+iBzYA7hxgJoTolw
	uQfjYK2daubL/xCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04DCC779A7;
	Sat, 30 May 2026 12:09:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EUs9O2LTGmrGVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 May 2026 12:09:06 +0000
Date: Sat, 30 May 2026 14:09:06 +0200
Message-ID: <87ldd1p09p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Steve Smith <tarkasteve@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Jaroslav
 Kysela	 <perex@perex.cz>
Subject: Re: [BUG] Audio regression in 7.1-rcX; low volume on Edifier MF200
In-Reply-To: <50261203461f3b56c0bd196c1d9a754f84a4d8bc.camel@rong.moe>
References: <CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com>
	<87wlwmr32n.wl-tiwai@suse.de>
	<b25d12e13bffefb926d92464eda1f66cb26f5dfa.camel@rong.moe>
	<CAHLWS5HrOUGw8KiPsZPV4im3jKLd1YOoRs6szvLjusHQm1dmZQ@mail.gmail.com>
	<50261203461f3b56c0bd196c1d9a754f84a4d8bc.camel@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2FBB46B703
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,vger.kernel.org,perex.cz];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 30 May 2026 13:06:03 +0200,
Rong Zhang wrote:
> 
> Hi Steve,
> 
> On Sat, 2026-05-30 at 12:34 +1000, Steve Smith wrote:
> > On Fri, 29 May 2026 at 22:07, Rong Zhang <i@rong.moe> wrote:
> > > 
> > > Hi Takashi, Steve,
> > > 
> > > Hmm, the dmesg dump is, however, for a good commit. No wonder we
> > > couldn't find the error message... :-/
> > 
> > You are correct, apologies. rc5 (broken) dmesg attached; it does have
> > the following line:
> > 
> >     usb 1-3.2: 9:1: sticky mixer values (-32768/-32513/1 => -32702), disabling
> > 
> > > Steve, could you please attach a dmesg dump for a bad commit? And could
> > > you please test if setting QUIRK_FLAG_MIXER_GET_CUR_BROKEN on your
> > > device helps? See
> > > https://lore.kernel.org/linux-sound/20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe/
> > 
> >  I can confirm this works:
> > 
> > * Applied above patchset to its base commit; volume still low.
> > * Added to MF200 to the quirks list (see below); volume behaves as expected:
> 
> Thanks for testing! I will submit a patch for your device with your
> Tested-by tag.
> 
> While a correct fix for your device is a said quirk table entry, I will
> also submit another patch to improve the error path of sticky mixers as
> I've said in my previous reply, so that future quirky devices can mostly
> work fine before someone submits a quirk table entry. I will add you to
> the CC list when I submit it. Could you kindly test it (without the
> quirk table entry for your device) to see if the soft mixer works better
> when you receive it?

Rong, if you work on the improvement, can you try to have a small fix
that fits with 7.1?  We can merge whatever for 7.2, but 7.1 is already
at a late RC, so I'd like to avoid to drag a big series of fixes
there.


thanks,

Takashi
