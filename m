Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6B345CBC;
	Tue, 11 Aug 2026 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429254; cv=none; b=N5dpctsKQ6cYHrs4nKqn2aVuuECqH1Pl9xPY8WVFykMm36tfzr34fFGPTIA/HyeKd2gBeC38zQ7N7IC4mN/Teq1EeFovSWnt+GhpJGiLbbNPW+R45LeIq8PUUdER/LKivXJ1TMfA+FZvx6QvDL7G5jyfGlHIQnY3NmivuaCGS3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429254; c=relaxed/simple;
	bh=Gz4vXSrfRxzX6TiJekFCRrhaI1IF3mubKJ/RcXMRazc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEAuq/RJc87pE4ekjSLtOKWaauCq6nLNEzLZa0fBNJfByNrDNhCyTii71JG0O6T8pHNJ2mX2SWiJLgRitfSabe4Ve6PM2bgkSgSJZruDE6ohBxgexuKuu2aA5hkqKnINvGSfgyY1Ql0IQd4zNiOJOqU8Na6cyrlob2erX3H0ts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDsz4XxR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LuGwtKtb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LCYcZTeZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pef8VDdk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDsz4XxR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LuGwtKtb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LCYcZTeZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pef8VDdk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29CB83DF5;
	Tue, 11 Aug 2026 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786429236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6wZQbivkQJxzCBkIVMQdGx05f2NFWyLSqqe9OYr9MI=;
	b=fDsz4XxRTq40TgQgXwATeG9BYw10xCiRGuyR5+MW48J5RNtrSgL5jFMqODyvmAtlhpjk6D
	4S/vta8TG9oIN0bqyZAVchGR2Gauu2gCOZEepOeT/dNbZCc7CUvM8TEWREaz6R+jXuLWQj
	lj7MzYQ60yWCrtUcw6V3cc6nSQgvQR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786429236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6wZQbivkQJxzCBkIVMQdGx05f2NFWyLSqqe9OYr9MI=;
	b=LuGwtKtbAkbleANPB+U8VCwNEOZamweO/lmvHGT7ZX5jtEd2hfVtVJBynpDC+A7rF1SDza
	Cu4rvPtBdsKAUoDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786429232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6wZQbivkQJxzCBkIVMQdGx05f2NFWyLSqqe9OYr9MI=;
	b=LCYcZTeZQqsOS/a49/SEck6O1rDx89/utWgnRy4JU/EWlTYxTKHozdlhB9JAJxZnrPLW1u
	9ti7RUK2hAz7hKzYhxqByk2vdPeXWOWgXRpTE2Iio8gAymjQQd+dJMZgv8BVdakV2xqcF3
	zgz55dCYdOPw0LD8FDKVdjRyTbM7/v8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786429232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6wZQbivkQJxzCBkIVMQdGx05f2NFWyLSqqe9OYr9MI=;
	b=pef8VDdkMykPeJz7GW6hgDS91OmOA2F5bl2EpuvoPEMu5AA8jtUmien4ce69TCEY+WhZQG
	VEF7DnPbRVZb68AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01332779B2;
	Tue, 11 Aug 2026 06:20:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H7FsOi+/emrCRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:20:31 +0000
Date: Tue, 11 Aug 2026 08:20:31 +0200
Message-ID: <877blxb2kw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] sound: pci: asihpi: use pcim_iomap for managed PCI memory mapping
In-Reply-To: <20260811042122.44923-1-rosenp@gmail.com>
References: <20260811042122.44923-1-rosenp@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 11 Aug 2026 06:21:22 +0200,
Rosen Penev wrote:
> 
> Replace manual ioremap() calls with pcim_iomap() which uses devres
> for automatic cleanup. This eliminates the need for manual iounmap()
> in both the error path of asihpi_adapter_probe() and the
> asihpi_adapter_remove() function.
> 
> The pcim_iomap() helper is cleaner and less error-prone since it
> handles unmapping automatically when the PCI device is released.
> 
> Assisted-by: opencode/big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
