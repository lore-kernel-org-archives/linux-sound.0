Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777B1F0991
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807208; cv=none; b=HPeabGbOtb7f1kRvGGrTUg45UTPtvyWAkDGGQv4Tw8NQDyggbdcZcBf5HIS5ku8bmhVobX0NRyq/LBxDdQguzrQddNz17aQHtqMDvZhba++VhWyjpmQsJLq4o59HoV4lfAY0wHhlhMYPpv9u4UFxXWJLVB38AdVyWlzUPYvGw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807208; c=relaxed/simple;
	bh=ppdyeO+iTtNjM6ksvWlGPQw7OvYp6vn67m87sIYjXkY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvhyybPgG2acixCC2pv/rVPCtclhaaMwEAdzPv4N/kPkgSYoINm6du4FkNnleGA0Qydzw1rXLaJZyNAg7AZomKtOxrdlb6WjhsmURoKF9o7TCqPUswS+cZNPqhRbZCYJZ9CNq5RaWW0C2L0AEpEZXP3AyLIIAwn+OytxMwd9MIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0NoBZoeG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1fVvD/Ti; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0NoBZoeG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1fVvD/Ti; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0NoBZoeG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1fVvD/Ti";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0NoBZoeG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1fVvD/Ti"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A46116A7CE;
	Fri, 10 Apr 2026 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775807205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4pXppsShvubYsR+4LBV6EXyhEPO7Ip6d/3V69GXfr4E=;
	b=0NoBZoeGmGsY2fHtNeBLkk8LgAoCr7l2Mw1pB+mtKHPa+WwlnAF3WrnBvbFzZqbDuahv+b
	KaPUXWEQFVqp8N1C2zh38+ngCLycVmO0FiOlOlbizXJZ2gLXtS2ytqGwSYr1mzofqx0tkn
	jgVcSzmqt/JeOHdWeW60AZsDRWKo7dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775807205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4pXppsShvubYsR+4LBV6EXyhEPO7Ip6d/3V69GXfr4E=;
	b=1fVvD/TivqABjhSWRCcmWecR20X5j3PLTqDY55MQa3eV3E/j4UG7T10U+5/rRA8aGl23y2
	tn9bJ+C96ieCsjDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775807205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4pXppsShvubYsR+4LBV6EXyhEPO7Ip6d/3V69GXfr4E=;
	b=0NoBZoeGmGsY2fHtNeBLkk8LgAoCr7l2Mw1pB+mtKHPa+WwlnAF3WrnBvbFzZqbDuahv+b
	KaPUXWEQFVqp8N1C2zh38+ngCLycVmO0FiOlOlbizXJZ2gLXtS2ytqGwSYr1mzofqx0tkn
	jgVcSzmqt/JeOHdWeW60AZsDRWKo7dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775807205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4pXppsShvubYsR+4LBV6EXyhEPO7Ip6d/3V69GXfr4E=;
	b=1fVvD/TivqABjhSWRCcmWecR20X5j3PLTqDY55MQa3eV3E/j4UG7T10U+5/rRA8aGl23y2
	tn9bJ+C96ieCsjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65A2A4A0B2;
	Fri, 10 Apr 2026 07:46:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7WgpF+Wq2GlEWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 07:46:45 +0000
Date: Fri, 10 Apr 2026 09:46:45 +0200
Message-ID: <87ik9zgsuy.wl-tiwai@suse.de>
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
In-Reply-To: <76ff00e6-07a3-4c0b-8906-baa13c077468@kernel.org>
References: <20260331075405.78148-1-huanglei814@163.com>
	<87wlyss93y.wl-tiwai@suse.de>
	<460e5a49-dd85-41fe-9d35-0c4e7efc0ceb@kernel.org>
	<2475f220-b0ff-4ee6-b897-75de87d68f81@kernel.org>
	<87mrzbgtln.wl-tiwai@suse.de>
	<76ff00e6-07a3-4c0b-8906-baa13c077468@kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 10 Apr 2026 09:41:33 +0200,
Krzysztof Kozlowski wrote:
> 
> On 10/04/2026 09:30, Takashi Iwai wrote:
> > On Fri, 10 Apr 2026 09:11:39 +0200,
> > Krzysztof Kozlowski wrote:
> >>
> >> On 01/04/2026 12:43, Krzysztof Kozlowski wrote:
> >>> On 31/03/2026 10:20, Takashi Iwai wrote:
> >>>> On Tue, 31 Mar 2026 09:54:05 +0200,
> >>>> Lei Huang wrote:
> >>>>>
> >>>>> From: Lei Huang <huanglei@kylinos.cn>
> >>>>>
> >>>>> Fix checkpatch code style errors:
> >>>>>
> >>>>>   ERROR: else should follow close brace '}'
> >>>>>   #2300: FILE: sound/hda/codecs/realtek/alc269.c:2300:
> >>>>>   +       }
> >>>>>   +       else
> >>>>>
> >>>>> Fixes: 31278997add6 ("ALSA: hda/realtek - Add headset quirk for Dell DT")
> >>>>> Signed-off-by: Lei Huang <huanglei@kylinos.cn>
> >>>>
> >>>> Thanks, applied to for-next branch.
> >>>
> >>> I hope you dropped the fake Fixes tag. Or at least give people chance to
> >>> review it.
> >>
> >> I see you entirely ignored all the comments about fake bug being fixed here.
> > 
> > I saw your comments, but I have a different opinion.
> > In the case of HD-audio code where the code change happens very
> > actively and quite often backported to stable trees, a change like
> > this would block the further backports if missing.  With a hint of
> 
> No, it would not. Commits marked for backports can even mention
> dependencies.
> 
> > Fixes tag, the change of the code change can be tracked more easily,
> > hence it's still worth to have.
> 
> Fake fixes tag is not the solution for that. It adds effort on stable
> team for no gain, it adds work on people evaluating backported commits
> for no gain.

It actually helps a lot on distro side, judging from my long
experience of backporting (literally) million of patches for openSUSE
/ SUSE kernels.

> BTW, since I was looking at your tree - you have contributions from
> songxiebing@kylinos.cn which does not follow requirements for a *known
> identity*. IOW, it does not pass DCO requirements and should not be
> accepted.

Do you mean the form
  Signed-off-by: songxiebing <songxiebing@kylinos.cn>
?

The name spelling without space is pretty normal in Chinese.


thanks,

Takashi
