Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCE39B970
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779520; cv=none; b=EMyLL4/v24XTLW3dvoI8icv8cfiaBUqXAdfx3mG4Em6KSeJ468itsxsrvx7K+zBb/+ErLEn0EL0e1SaOAssxGksC2efRB7tGqXHu9gF2EHrDliXWCujyKx2BDI46m8AOO6lOLBr2iHZtyXSe7mJspt80NwtNnQ36gZiDiQry3qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779520; c=relaxed/simple;
	bh=97Yj5RS2HefemiXfKC4CqbftrjkGqeEtCKTrB+FOdig=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hc8irtyka/ybwXK/+BrIl/2rnGUF7RajZQIZ9OtLDWX7NqI1L9Pgr0NIGPmP0ZyzgPOPbOvvOLiKsoLu5ArjvHeZ1ntsHEv5v1fkGwK9v9sLAbV7JOGniLlvne3Brbi0QX2pCbV3Pmthlyp0yROKMY407+rdzHFLhHPkl18bZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TcDrTL3q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sF1aWj0t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EiJ0c1Yc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=REJvWWtO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TcDrTL3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sF1aWj0t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EiJ0c1Yc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="REJvWWtO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D7DC475B80;
	Thu, 18 Jun 2026 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781779517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9/Jz40H0TDb1QxpCV9Q1f5WCQW7jNJg3VqvR3K9WQE=;
	b=TcDrTL3qNfA3R7D90spO0gqQ8oTMcCtODCZdXQsdlHpVMpB2cRv7FOlfQCy6WB4w9M4j7T
	Bb/8EN3dgKlTg/n6R4pCqlMX7xm8PBY8ZsVdaZJyB5+sSlFoRRFC6xrdKbsRLu3fA9LkJ3
	Uu5PRt6Hr47+ZJxZyxOeMptiAXFoAI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781779517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9/Jz40H0TDb1QxpCV9Q1f5WCQW7jNJg3VqvR3K9WQE=;
	b=sF1aWj0t/+bb6UUIl80kufEreFeMh4CVCeCly7R/RyG2eYJU6uQpmpw1wME8v9BxEUSnLV
	MgLdlG5S2RygsgAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EiJ0c1Yc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=REJvWWtO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781779516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9/Jz40H0TDb1QxpCV9Q1f5WCQW7jNJg3VqvR3K9WQE=;
	b=EiJ0c1YcK4cjMujQc8L8kVmRtdLaOBffx7eN1HOOOWcN8cOMkPoT2TbrcoC5AscW+vQ6TK
	VDGkhb9X9gJfiUDW0Dcd7O5LhzISWibCzIOJmtBV172qv5Zlacn2lzGWgyWTwsd+e+eYOB
	ep48QxZqFVc0MJqQck16oNnmZ52ddEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781779516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9/Jz40H0TDb1QxpCV9Q1f5WCQW7jNJg3VqvR3K9WQE=;
	b=REJvWWtO75qY2rI07cHprPBDWIZgelSLe1DJLwiry7+13CnqPMaemgdJJztOeIWN8RF6HI
	gEvNL2Gy2pcRtJBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9707779AB;
	Thu, 18 Jun 2026 10:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9uQvKDzMM2qqOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 10:45:16 +0000
Date: Thu, 18 Jun 2026 12:45:16 +0200
Message-ID: <878q8cnn43.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio: qcom: fix QMI stream-request handling
In-Reply-To: <20260618025126.1862954-1-michael.bommarito@gmail.com>
References: <20260618025126.1862954-1-michael.bommarito@gmail.com>
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
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D7DC475B80
X-Spam-Score: -2.01

On Thu, 18 Jun 2026 04:51:24 +0200,
Michael Bommarito wrote:
> 
> Two fixes in handle_uaudio_stream_req(), the QMI handler for the Qualcomm
> USB audio offload stream enable/disable requests (reachable from
> unprivileged local userspace over AF_QIPCRTR):
> 
> Patch 1: the disable path dereferences uadev[card].info[info_idx] without
> the info_idx >= 0 guard the enable path and the cleanup label have.
> info_idx is -EINVAL on a non-match and .info is allocated only on enable,
> so this is not only a NULL deref: when .info is allocated (card enabled
> once) and the disable names a non-matching interface, &info[-EINVAL]
> points before the allocation and the pipe fields are an out-of-bounds slab
> read plus a conditional out-of-bounds 4-byte zero-write. A never-enabled
> card instead faults on a wild pointer (oops).
> 
> Patch 2: on enable, subs->opened is set before the service_interval is
> validated; an invalid interval jumps out without clearing it, wedging the
> substream at -EBUSY until disable/disconnect.
> 
> Impact: on an affected Qualcomm platform, a local unprivileged process that
> can drive the QMI disable path for a card with no active interface would
> oops the kernel (patch 1); patch 2 leaves a substream wedged at -EBUSY.
> See the
> confidence note below: this is a static finding, not yet reproduced.
> 
> Confidence and testing: this series is from static analysis of current
> mainline; I have NOT reproduced it. CONFIG_SND_USB_AUDIO_QMI builds only on
> Qualcomm SoCs with an audio DSP (no x86 build and no Qualcomm hardware
> here), so there is no splat to show. What I did verify by reading current
> torvalds/master (the offload driver was mainlined in 6.16):
> 
>  * Patch 1: in handle_uaudio_stream_req() the enable branch checks
>    "info_idx < 0" before use and the response: cleanup label checks
>    "info_idx >= 0", but the disable branch between them dereferences
>    uadev[pcm_card_num].info[info_idx] with no such check. info_idx is the
>    negative return of info_idx_from_ifnum() when no interface matches, and
>    .info is a pointer allocated only on enable, so for a
>    connected-but-never-enabled card the disable branch forms and then
>    dereferences a wild pointer.
> 
>  * Patch 2: subs->opened is set in the enable branch before the
>    service_interval validation; that validation can "goto response" without
>    clearing it, and the response label only clears opened on the disable
>    side, so the substream stays wedged.
> 
> What I am NOT certain of, and would ask you to confirm on a Qualcomm build:
> whether the QMI flow actually lets a disable request reach the disable
> branch with info_idx < 0 (a disable for a card with no matching interface).
> If the userspace client cannot produce that ordering, patch 1 is hardening
> rather than a live oops; patch 2 stands either way. Both patches only add
> guards that already exist elsewhere in the same function, so they are low
> risk to apply. Please also confirm the Fixes: tag against your tree.
> 
> Michael Bommarito (2):
>   ALSA: usb-audio: qcom: reject stream disable with no active interface
>   ALSA: usb-audio: qcom: clear opened when stream enable fails

Applied both patches now.  Thanks.


Takashi
