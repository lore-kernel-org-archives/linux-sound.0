Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA4238F957
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827817; cv=none; b=nwj5w5/MU2TtLbLTmJ44JFG6T6pmgJv1q7qRLdCKu0PVv1wYz9C5PE6nsKVDDAzvIEEzqpV8G8n8pd/EaKzHgYuqG7we7MNach8wblUIQ7P1Sgyo8GnDx+ejStYsDzdurl7OCIyu5L3Pe+8FwDQcrrZtypabMIt19dKF0oHNOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827817; c=relaxed/simple;
	bh=FnT49+/Jfpw0/LVqe62cBPyfo7U45n24mwTe4jzuTH4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AV+IHDlNyCKSdx4V9GQRvhJkgTul56M9r6cYeX+X5l1QHz8stPswphD/fI+3QCphYceUjyELwhozXREaxqBtAoCT1WJNs35ju5ueT8PVqtviiXQDKPd4oabF7AYiDfXGvWPEtsFUyWqL67r40yxjxgajR3INsA1vo2rxv3Uthfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MU5fhPL1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QFYiMqJc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qPI67Atk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6pzIhfn2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MU5fhPL1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QFYiMqJc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qPI67Atk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6pzIhfn2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6FB25E7F5;
	Fri, 15 May 2026 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eu7KzAEg/Op3TkK6JsIAzAIWjmw/QCf7AUNcwMqipAg=;
	b=MU5fhPL1y38OGHdVZlYceyXGpgeNknKMK/SOpFNoqk+1DhGt7P1YpwGB8LhIV5HaxIQiEg
	5LEfDsLDnTda82Q2h85VTtwoBcLWr5k7lgcvA7RUecfWyLoy4BeeHRGX0Suc3eLGOwT+5i
	sAnsFcdGGXFvkpi5N3qzPBQg4gjoAJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eu7KzAEg/Op3TkK6JsIAzAIWjmw/QCf7AUNcwMqipAg=;
	b=QFYiMqJct2dsvFF3HBXAouNIHDBsVu8nOfh9P40cLZyJeXs2JehPlcSsNm7jzXkuVLEEml
	xpo9YT+U8DChOjDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qPI67Atk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6pzIhfn2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eu7KzAEg/Op3TkK6JsIAzAIWjmw/QCf7AUNcwMqipAg=;
	b=qPI67Atk25nbTY9bUGfDkwXxSBGLTryW3/K6xrJNsXS/lMAqCnWlxz+AdVKBVwR0/FLA48
	KZnUfH6ED1CZSgGUpTr1wk+u3ply7jsvCpYHZ/nfuGXFvnkZc5U32wyiVD1kIGXuAJOd0C
	EHIhEZ/ClqR4NiIly88s+FnLE+zYPUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eu7KzAEg/Op3TkK6JsIAzAIWjmw/QCf7AUNcwMqipAg=;
	b=6pzIhfn2Z6MYBWxqd/aELbl5F+HuPzhI0nsHEuFKG8Rh+PnzLh9wmFKMlYvgT/qtvVITPz
	AgJ8DLMv14Cha4Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 951DA593A9;
	Fri, 15 May 2026 06:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pwMLIyTCBmqsTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:50:12 +0000
Date: Fri, 15 May 2026 08:50:12 +0200
Message-ID: <87fr3tupy3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm_drm_eld: rate-limit ELD parsing errors
In-Reply-To: <8104462D-BF7C-4C66-9442-0F3874A128E3@gmail.com>
References: <8104462D-BF7C-4C66-9442-0F3874A128E3@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: C6FB25E7F5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sun, 10 May 2026 16:17:47 +0200,
Francesco Saverio Pavone wrote:
> 
> Hi all,
> 
> Sending this via attachment because my Postfix relay setup wasn't usable.
> Patch is straightforward: rate-limit two dev_info() calls in
> snd_parse_eld() that get triggered on every PCM open against an
> HDMI codec with no sink attached.
> 
> Equivalent fix to the one Mark Brown did for hdac_hdmi in June 2025
> (lkml.kernel.org/lkml/2025/6/13/1380), just for the generic helper used
> by ASoC hdmi-codec.
> 
> Tested on Rock 5B+ (RK3588): two HDMI outputs, only one cable plugged
> in. Before: ~30 "HDMI: Unknown ELD version 0" lines per probe burst.
> After: 0.
> 
> Let me know if anything needs adjusting.
> 
> Thanks,
> Sav

Is the patch itself missing?  Please resubmit.


thanks,

Takashi

