Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4EF2AD22
	for <linux-sound@vger.kernel.org>; Sun, 14 Dec 2025 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765707119; cv=none; b=GI8NyzbwWwWBzqMYXFJskKP4z5nOU3V4Ccihpw9a6Bi6/VD2isjHd3z1BYqdI8pePg0VjGDZ/E4sJQXSHno/FaDkFx2BQi//5TCgyRsRPd2BGM6ItmYT4ITZq0OfmLRfOH9uN3Ow4HCkyyVTgN30MIrgGOrTclL1xtiwbUsitfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765707119; c=relaxed/simple;
	bh=EwWRVHqTEd5dpCUoRnAFpP5x7nkcMWEG1kZyV8o6f5M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0/Jkjs7mo58tVqsPDyQqzKdfQnnjmnPWx6Tprdq/g7YtTEAKc/n4+0sGuj+g2MMb5NFdyI1yjtW0207c/MeMQ6DNscQPALQ/jUkzQwjtmwfzUWe4/DzJ4Yaeicx+qL5Ho+NDN0CbbN5P+cCT2I0ObYGkJ4jCWXvopbwTf0f/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PvKIhEc6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dm7WoEsp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PvKIhEc6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dm7WoEsp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PvKIhEc6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dm7WoEsp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PvKIhEc6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dm7WoEsp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92EEA5BFA7;
	Sun, 14 Dec 2025 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765707109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVmU9lZdy9uNicTXCtoPmizAmdJP7sItCGPJRCIM9Tw=;
	b=PvKIhEc60lUEeHvUI7zlfltywuubuvBEx2zddZceOBjp5eEt4FlXM0ibjwTn94yhbYdhlF
	KjyFS/r8FiT86YwaOsMuuLfGKuZgjru5MHCM8cIyOzHLcoxqe6kPtH8c41h75Bh1vgal1m
	RdHk5ZtnW1E9L97graGUMMosXoxU2Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765707109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVmU9lZdy9uNicTXCtoPmizAmdJP7sItCGPJRCIM9Tw=;
	b=Dm7WoEsp2A0gCufthYXzfhyJkbABxhIOGaNpmAGpslf8r022imZGKTboSTzykhcSr1u/jn
	DGr7FRrqwR/AmIDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765707109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVmU9lZdy9uNicTXCtoPmizAmdJP7sItCGPJRCIM9Tw=;
	b=PvKIhEc60lUEeHvUI7zlfltywuubuvBEx2zddZceOBjp5eEt4FlXM0ibjwTn94yhbYdhlF
	KjyFS/r8FiT86YwaOsMuuLfGKuZgjru5MHCM8cIyOzHLcoxqe6kPtH8c41h75Bh1vgal1m
	RdHk5ZtnW1E9L97graGUMMosXoxU2Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765707109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVmU9lZdy9uNicTXCtoPmizAmdJP7sItCGPJRCIM9Tw=;
	b=Dm7WoEsp2A0gCufthYXzfhyJkbABxhIOGaNpmAGpslf8r022imZGKTboSTzykhcSr1u/jn
	DGr7FRrqwR/AmIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C5E83EA63;
	Sun, 14 Dec 2025 10:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bGJwEGWNPmlbHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Dec 2025 10:11:49 +0000
Date: Sun, 14 Dec 2025 11:11:48 +0100
Message-ID: <875xa98ja3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH v2 0/9] ALSA: seq: Use bus specific probe and remove
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.960];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 09 Dec 2025 13:38:42 +0100,
Uwe Kleine-König wrote:
> 
> Hello,
> 
> here comes a v2 for my series previously posted at
> https://lore.kernel.org/all/cover.1764677854.git.u.kleine-koenig@baylibre.com
> .
> 
> The only change is fixing a build problem I introduced in the opl4
> driver (and that I didn't notice because I usually compile test for
> ARCH=arm64 where this driver isn't built).
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (9):
>   ALSA: seq: Use bus specific probe and remove
>   ALSA: seq: midi: Convert to snd_seq bus probe mechanism
>   ALSA: seq: ump: Convert to snd_seq bus probe mechanism
>   ALSA: opl3: Convert to snd_seq bus probe mechanism
>   ALSA: opl4: Convert to snd_seq bus probe mechanism
>   ALSA: sb: Convert to snd_seq bus probe mechanism
>   ALSA: emu10k1: Convert to snd_seq bus probe mechanism
>   ALSA: seq: oss: Convert to snd_seq bus probe mechanism
>   ALSA: seq: Refuse to probe seq drivers with non-bus probe or remove

Applied all patches to for-next branch now.


thanks,

Takashi
