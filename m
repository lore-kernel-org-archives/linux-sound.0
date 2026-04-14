Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E853DDDB1
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167479; cv=none; b=gb7+pLWWwH5kx32QzOlIxyuyjHGW9LRl2zI5/24DfYSvZ37qX0fdSYNp2Bj52dfCVohT5NSbxWm1GCUCJcF+9uH8oTSEXh3vVrdK/vouNlypoXZ/S7yQwh7jF9Rw5Osc/CHlUUtqyNUoQltv4TrAJU7sSo/gDzYTrbBE9cftuoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167479; c=relaxed/simple;
	bh=wNYRKnkSvOd1HlKedRX3ixB7BxSaWh2I6Et2LInBTs8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNxQ6rkRXhpo+ZRW80HtucLrSps2yolYQUYWMMjLqhcsz/VKrA2cUjtRk+reC05HDzOTdlzy5nUhH7Bo0J9a2VA1NZ15Y+3d7Q86tdiB/1gNP6K+P/qmVnAo4/bgXd5UOZzuvcG60/2oxoFprdminD1Oo2VfDi2CtxiW723p/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jaKTi8ci; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JKbcZzQT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fPT+5l7C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1T9HPybP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jaKTi8ci";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKbcZzQT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fPT+5l7C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1T9HPybP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E50F16A8C1;
	Tue, 14 Apr 2026 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776167477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW+IE7r44Hk7ER594BFkao8MysZ0j96s0ItiV9VLx0Y=;
	b=jaKTi8ci9VwD+6vDRQV8UFWZNuvICxAzM51wXKoD/6oDZl9R0bvaFznBDmC0NTwDD5wMSF
	1EatbuV4XQbS3gq8VG72t+CJnc4Qdb1oWJ8xGN+JeJbG9j0Y3aInsIAIB3/9Ehelp5kNMX
	PlzpINQ6UkYH2WpB4D1bCxle4SgYXAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776167477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW+IE7r44Hk7ER594BFkao8MysZ0j96s0ItiV9VLx0Y=;
	b=JKbcZzQTcC75SQAGaccSQKhpdV/50NmJ1uvD4ke3lpg5A3s6du1Da+WvlYkD259/SLNLsH
	z9xKu7YsoI8TcoBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776167476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW+IE7r44Hk7ER594BFkao8MysZ0j96s0ItiV9VLx0Y=;
	b=fPT+5l7CnrZAIdN9U9XYqS2LPmFvbGGqx/wA2UoCQvJdI0Nxq4onnWe/w+31Uv4igBXJ6w
	lJl/Pz6OLNeK4P6xPBfsZdERMHTB7xsT71E3RkzGOSY+p6jCo0gohw8M9m9Jj73VKQ2Ig4
	KBFXZJ/s2wtt52I4yzqSxi/DZzEuLAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776167476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW+IE7r44Hk7ER594BFkao8MysZ0j96s0ItiV9VLx0Y=;
	b=1T9HPybP0Hg2aAN7PYQQz18Z8dnapz8EGpl3XH2UK6snB4rclWOQizHR4HSn9ls1Czrn9r
	QhGhEmv6rKJORaAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B89754B41D;
	Tue, 14 Apr 2026 11:51:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nkrPKzQq3mlvXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 11:51:16 +0000
Date: Tue, 14 Apr 2026 13:51:16 +0200
Message-ID: <87bjflsqtn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel Monteiro Pires
 <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: opti9xx: restore snd-miro state after resume
In-Reply-To: <9fe289a2-b548-4680-9070-7558c516d09f@gmail.com>
References: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
	<877bqat3y9.wl-tiwai@suse.de>
	<9fe289a2-b548-4680-9070-7558c516d09f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, 14 Apr 2026 13:14:11 +0200,
Cássio Gabriel Monteiro Pires wrote:
> 
> On 4/14/26 04:07, Takashi Iwai wrote:
> > On Mon, 13 Apr 2026 21:45:34 +0200,
> > Cássio Gabriel wrote:
> >>
> >> snd-miro has no PM callbacks, so system resume leaves the OPTi
> >> master-control registers and the board-specific ACI mixer state
> >> unrestored.
> >>
> >> Like snd-opti9xx, the driver needs to reprogram the OPTi routing
> >> registers before bringing the codec back. snd-miro also keeps mixer
> >> state in the ACI block, so the codec resume callback alone is not
> >> enough here. Save the ACI mixer state on suspend, reinitialize the
> >> OPTi and ACI state on resume, replay the saved ACI values, and then
> >> resume the WSS codec. Hook the PM handlers into both the ISA and PnP
> >> paths.
> >>
> >> Also initialize miro->card on the ISA path for the existing dev_*()
> >> logging and keep the cached solo-mode value aligned with the value
> >> written to hardware.
> >>
> >> PCM20 radio tuner state remains outside this driver's PM scope.
> >>
> >> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > 
> > As it's no trivial change and we are already in the merge window, I'd
> > postpone this for 7.2.  Or, if this is the very last piece of your
> > whole changes, I can try to put.  Let me know.
> 
> This is not my last ALSA outstanding piece but this is not urgent either,
> so postponing it to 7.2 is fine with me.
> Please defer it to the next cycle if its proper to you.

OK, I expected that ;)  Will review it later.


thanks,

Takashi
