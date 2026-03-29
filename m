Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C392874E6
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775543; cv=none; b=IQLVDRrj1Cwe4uGkjmXAqE08xUlI/vx+D3y6V6d3KcUSLUq3fep5IJeMWV9sNH9UyXoP63jfY1Ms48DySbzd+r6MGJ3lZfcsAEyudxs497sbg0/0ZnsCueirOKTuHYSj+L3x6lq+bQBzyrcuzpWTrAaDzwHX9Tbm71Az4JPVVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775543; c=relaxed/simple;
	bh=wy/Ts3detKhC8bNfGzZ+KZfAbfUjLxfY03+E0E9Zmwc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMc15mu3oRVUUQNhUKpqiJRgPjipgk9bX7IJogh2QnqT9xntve5G8lX4teST0ia3S3bWoEKLXE47eMf6SfXhPPqXNmY+8nmGnOjqtGlBFChQvJIYvurE2p77c5Pm/C43pRdzIvHh4YTdFhBr64rcmUSQlIh+nQqULu2HFspzdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcWO4vX0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9nHsnyg3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcWO4vX0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9nHsnyg3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcWO4vX0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9nHsnyg3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcWO4vX0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9nHsnyg3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F8DA4D4ED;
	Sun, 29 Mar 2026 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ww8vPTyrqNG+1lDSI9Z3OGocXY3XBf2Qr4zgb4vHDsU=;
	b=RcWO4vX0YiasBWU5dCEY8ytjCDPRhBYGoIvphgGrTdATU1pK98WXC8qIDCGAEbREX2QA1r
	2uoSmcUY1qR4dMgj2nBOOCorvzxOmFmZ0nb9qC8VBbvnNYgo8MHbgJbzPToK3/z1LmNWS+
	Qrxe4GTvKz+RKexB/xV5vXaf2PhKKr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ww8vPTyrqNG+1lDSI9Z3OGocXY3XBf2Qr4zgb4vHDsU=;
	b=9nHsnyg3Dpx6mrET0rUKLlhFGY04o3rKDUJv4OhxGWNASEKv9RP9M741FahIs6miGtGScx
	8riOdVXi6NeY23CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ww8vPTyrqNG+1lDSI9Z3OGocXY3XBf2Qr4zgb4vHDsU=;
	b=RcWO4vX0YiasBWU5dCEY8ytjCDPRhBYGoIvphgGrTdATU1pK98WXC8qIDCGAEbREX2QA1r
	2uoSmcUY1qR4dMgj2nBOOCorvzxOmFmZ0nb9qC8VBbvnNYgo8MHbgJbzPToK3/z1LmNWS+
	Qrxe4GTvKz+RKexB/xV5vXaf2PhKKr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ww8vPTyrqNG+1lDSI9Z3OGocXY3XBf2Qr4zgb4vHDsU=;
	b=9nHsnyg3Dpx6mrET0rUKLlhFGY04o3rKDUJv4OhxGWNASEKv9RP9M741FahIs6miGtGScx
	8riOdVXi6NeY23CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 067D14A0A2;
	Sun, 29 Mar 2026 09:12:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hso3APTsyGnmEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Mar 2026 09:12:20 +0000
Date: Sun, 29 Mar 2026 11:12:19 +0200
Message-ID: <875x6fuhho.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karsten Hohmeier <linux@hohmatik.de>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: UBSAN: shift-out-of-bounds in sound/pci/ctxfi/cthw20k2.c:956:31
In-Reply-To: <20260328192417.17980-1-linux@hohmatik.de>
References: <87cy149n6k.wl-tiwai@suse.de>
	<20260328192417.17980-1-linux@hohmatik.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 28 Mar 2026 20:24:17 +0100,
Karsten Hohmeier wrote:
> 
> Hello Takashi,
> 
> I applied your one-liner with the previous patch still in place.
> The module loads and kernel boots without messages.
> Since the one-liner seemed SPDIF related I also tested the optical in and out and it all works.
> 
> Idk if it is the hardware or just a quirky implementation, but the SPDIF-in is grouped together with the analog inputs and without enabling those AND turning up SPDIF-in in alsamixer I don't get anything.
> But I think it has always been like this.
> 
> Thumbs up from me if you want to turn this into a proper patch again.

Thanks for verification!  I'm going to submit the proper fix patches.


Takashi
