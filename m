Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE431B830
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466690; cv=none; b=l197tIKocnAnAuLo53kdkPZFD1OKzghJQUY1Hjh9thSBniMN0VkF0e5KWGsoV5V61cQ9wSsyssC9GBmX1R/8IGIPu48W5/2IbyFYK08A3v6LL4mDBfgoRC1kEJdLKAEmw7xmjBdBL1iqlzhBG3vFI8dzvp8eHVYJAcq9m9jd6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466690; c=relaxed/simple;
	bh=E5if7zft0b8icjmX54rmuSyc/ICsEq73hq2JDETjsYY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/1/p78+FKPd+lDtRsccpIADbHy5PBLanWZVoa5xckiKDMslc+i6b5gGZVMCypGNQJpb3ggc9ghj95KZoHuEAa0/Tbv8iMz/FWhXpVsfYslY3Nuq3guOEGGtSSSIVXn1Q0fM4D2Gr/+ljw/Zhsayd1XQTzsxG/txwm+dfUZPDhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OWYIdVty; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=52EQpDj7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OWYIdVty; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=52EQpDj7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OWYIdVty";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="52EQpDj7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OWYIdVty";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="52EQpDj7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 90BF75BCDD;
	Mon,  6 Apr 2026 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775466687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVLM2Qs4z2zovO9WOhKhKz80hgiBpZjOYwIpXCiC9Cc=;
	b=OWYIdVtyyCvi4MtBpD1BYESXAVMQwrY8YacNruJYuHGwpLAnlm68GPUpG/+ihsw5RgTZMt
	0CwUz/BmYCuR0bv6riZex4KLBQJ+/hUL1xT/QNXin8KooJPzZ1CRIT56mmbP6nhK/yEz+A
	lkKanX+rQlZc3/9PuN6rk53Q+EAO3z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775466687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVLM2Qs4z2zovO9WOhKhKz80hgiBpZjOYwIpXCiC9Cc=;
	b=52EQpDj7FrqPbmAmCHHkDEKQvFUrWSSmadIsfCNzNI1KHnVl7/8FsFdATDUyRpzmCCUE8b
	wND3GUj4kJLNw6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775466687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVLM2Qs4z2zovO9WOhKhKz80hgiBpZjOYwIpXCiC9Cc=;
	b=OWYIdVtyyCvi4MtBpD1BYESXAVMQwrY8YacNruJYuHGwpLAnlm68GPUpG/+ihsw5RgTZMt
	0CwUz/BmYCuR0bv6riZex4KLBQJ+/hUL1xT/QNXin8KooJPzZ1CRIT56mmbP6nhK/yEz+A
	lkKanX+rQlZc3/9PuN6rk53Q+EAO3z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775466687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVLM2Qs4z2zovO9WOhKhKz80hgiBpZjOYwIpXCiC9Cc=;
	b=52EQpDj7FrqPbmAmCHHkDEKQvFUrWSSmadIsfCNzNI1KHnVl7/8FsFdATDUyRpzmCCUE8b
	wND3GUj4kJLNw6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64F3C4A0B0;
	Mon,  6 Apr 2026 09:11:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P1ozF79402nJQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Apr 2026 09:11:27 +0000
Date: Mon, 06 Apr 2026 11:11:27 +0200
Message-ID: <87v7e4lagw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: isa/gus: add ISA PM support for GUS Classic, GUS Extreme and GUS MAX
In-Reply-To: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Mon, 06 Apr 2026 05:20:02 +0200,
Cássio Gabriel wrote:
> 
> gusclassic, gusextreme and gusmax still leave their ISA PM callbacks
> disabled, so a suspend/resume cycle does not restore usable GF1 operation
> on these cards.
> 
> A simple wrapper around the existing GF1 start/stop paths is not enough.
> Those helpers are probe and shutdown paths: they reset software handlers
> and tear down runtime state such as the DRAM allocator, timer state, DMA
> queues, PCM state and UART setup. Resume instead needs a narrower recovery
> path that rebuilds the GF1 hardware state without rerunning probe-only
> detection or discarding the bookkeeping kept by the card instance.
> 
> gusextreme and gusmax also need board-specific resume glue around that
> shared GF1 recovery path. GUS Extreme has to restore the ES1688-side GF1
> routing before the GF1 is touched again. GUS MAX has to rewrite the MAX
> control register and restore the attached WSS codec state before the full
> card is brought back.
> 
> This series does that in four steps:
> 
> - add shared GF1 suspend/resume helpers that quiesce PCM, DMA and UART
>   activity and restart the GF1 hardware without rerunning memory detection
>   or allocator initialization
> - wire gusclassic up to the shared helpers
> - wire gusextreme up as well, restoring the ES1688-side GF1 routing
>   before the shared resume path runs
> - wire gusmax up too, restoring the MAX control register and the WSS codec
>   state around the shared GF1 resume path
> 
> The scope is limited to restoring post-resume usability for these ISA
> cards. It does not attempt transparent continuation of active GF1 PCM or
> synth state across suspend, and userspace may still need to reprepare
> streams or reload onboard sample data after resume. Open rawmidi
> substreams are restored only to a usable post-resume state.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied all four patches to for-next branch.


thanks,

Takashi
