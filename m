Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07538C410
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 06:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997029; cv=none; b=ZbVQGGD+3RCZIkwjPejRD9xj1ciadeQmqe8/qOll+McdKkc0wpaOLof9rt2tw7XSK31kMIjRTW86KvDt1E+zBTABSr46nX2s//iGGjAWEKJDuj4IXwXDpicPbze/7aKCAXD8HPbdk21yC99/31dWClAhdxg2KK/grxOzRaCrUvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997029; c=relaxed/simple;
	bh=7obxONzeZ9aZNOLf0ntfDwkI6VDZBKdoHCYup9pPBgw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6C99UHq4q3LQ7yn/+6oVLVhF8qrxMrwUsjp5VPoixb+7nx0hzBx+pIYmI5FgKrnIxxGeH/XX1KkIht7qVC+t765KBIruKJQ5GpTYRCq0nOM5l0UJ7XmNbIBR0u9B/fClFj98yvdIPzgixjgefVaQjrXhCaftseUe+tIs03kwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yBUTC2OU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2UUTeeZc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KdkD4fZN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DWzBWffA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yBUTC2OU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2UUTeeZc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KdkD4fZN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DWzBWffA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BB0B3DFD;
	Thu,  6 Aug 2026 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785997021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5dG46iXeWFi+7ikjPtKxSwX6fodC4F+S0AtmSIl3/KI=;
	b=yBUTC2OUHgzLS3KeNR4f0ZxD+lxPGxZ6FJZeieUooBvCaogtUxfLwcxLUvQCWoY7MFijut
	+026LsH2FTyCiOiXhSJnKsr5XRC5KucRp7Kynp6OUQ/QOTPORP4SjOPF33rrux+cRIX/LH
	8uC58r/iqGWWonFPiKT5GGUF9XF0RiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785997021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5dG46iXeWFi+7ikjPtKxSwX6fodC4F+S0AtmSIl3/KI=;
	b=2UUTeeZcTrmM6m+a+DxIvTPNsHgf5K85vH3tUvTfLNNB3+KRRFmuNFinqJSD1o/VFatldI
	dZQEt/WwD5YmBxDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KdkD4fZN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DWzBWffA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785997017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5dG46iXeWFi+7ikjPtKxSwX6fodC4F+S0AtmSIl3/KI=;
	b=KdkD4fZNmv5qtRo7LSi4k0IcIqRXdZHgd6gISvvSxX5oKRUhtbc3MfEKeZz4hq9u13vo1P
	olLQVgHk1Lr9psO+zt0aiJjTbf5aPFvUF3Ecae7oMSKIR1zknNsWGwxBiuic3W163dXQUC
	BPLEOG33TkjkUeJvnvMNDApLtKqmuyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785997017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5dG46iXeWFi+7ikjPtKxSwX6fodC4F+S0AtmSIl3/KI=;
	b=DWzBWffA6wYv5AceKL4sRyk+2njgU41B/4lfA2/nLtEVNr1ataLhfPgf3uRmjqMbfC3+cx
	kAz9MRNlVyFKzmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 615BC779B6;
	Thu,  6 Aug 2026 06:16:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c9vlFdkmdGo7agAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 06:16:57 +0000
Date: Thu, 06 Aug 2026 08:16:57 +0200
Message-ID: <8733wrg4di.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/31] ASoC: pcm6240: Use auto-cleanup for firmware loading
In-Reply-To: <20260805184705.78ab8674@bootlin.com>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-12-tiwai@suse.de>
	<20260805184705.78ab8674@bootlin.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 8BB0B3DFD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Wed, 05 Aug 2026 18:47:05 +0200,
Herve Codina wrote:
> 
> Hi Takashi,
> 
> On Wed,  5 Aug 2026 15:52:12 +0200
> Takashi Iwai <tiwai@suse.de> wrote:
> 
> > Simplify the code to manage the firmware loading with __free(firmware)
> > auto-cleanup.
> > 
> > Since the firmware release is cleaned up automatically, we can convert
> > the mutex call with guard() gracefully, too.
> > 
> > Only the code refactoring, no functional changes.
> > 
> > Cc: Herve Codina <herve.codina@bootlin.com>
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/soc/codecs/pcm6240.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> > 
> 
> Hum, I am in Cc but I think it is the wrong commit.
> 
> I would expect to be in Cc of modification related to the peb2466 codec.
> 
> Anyway, for this one, modification looks good to me.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> 
> Also I will retrieve the peb2466 patch (patch 12/31) directly from lore
> and reply.

My bad, it was a mistake due to the manual edit.

(Do we have any automatic mechanism to add corresponding Cc's?)


thanks,

Takashi
