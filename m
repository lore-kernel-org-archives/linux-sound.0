Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A843281532
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455581; cv=none; b=dTBiNGvGnTHsHlPYdRvkwRrNLRCc0aPToYb7jgN1OdKahRbohS7j4VbolY28Xz0i5PY0bm0W+70FwBS8UmBUA0c8n2/V8DzS+Dpd47Jdal9HG8isNoJG/evttzbxLcOKyg/QIgeRyikp6QSh8uzZa2QzStx9I/AbTwwTOFhPtNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455581; c=relaxed/simple;
	bh=kNkoWmsfNh8Pl338wpOtkyZivF+a7R6Irp81ugCXGrE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HcMLTmkTzY63MzUvzABVZv/V/I+i3i4IGr+cdoR990ZA+C7Cyfq0CNQQGSuB93LtD4jnChnpReLeTpLngA87UPIqDMvdtTt/nQbL1kJsjYjRNvnOXLJk18Kj4hsIt7GVRiJ54qXplFMCnw/OJVni2otzprsk8+45eiKAZ7zjiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Oe+NvQkm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9C8K/cG5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Oe+NvQkm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9C8K/cG5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oe+NvQkm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9C8K/cG5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oe+NvQkm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9C8K/cG5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 531DD1F443;
	Mon,  9 Jun 2025 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hjm+cYqk9IyHnMwrATmytfuw780l72JK9XGMflIabE=;
	b=Oe+NvQkmllbADspo/xrT+LOs3WKmbrUY0BLeQ1Ay/aG50jQQmxXvns8vXtR21Els/R9huK
	h+4b8QyVhzIxfU5DzzKHlKluzqbVbSDhCdhUw57zaOQnSpXZV9M9w1oLWT5e0GPm0AlqKs
	TcpfZ9xnLeJkQxCQyhj7bJMn7UrTuuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hjm+cYqk9IyHnMwrATmytfuw780l72JK9XGMflIabE=;
	b=9C8K/cG5R/ttU88wehDqYdLoNgv1NULRMFP38RBKhG6ylGIdCs7SIFYvbpa2XLkAAUhn+b
	fmQmP9979aRUP/Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hjm+cYqk9IyHnMwrATmytfuw780l72JK9XGMflIabE=;
	b=Oe+NvQkmllbADspo/xrT+LOs3WKmbrUY0BLeQ1Ay/aG50jQQmxXvns8vXtR21Els/R9huK
	h+4b8QyVhzIxfU5DzzKHlKluzqbVbSDhCdhUw57zaOQnSpXZV9M9w1oLWT5e0GPm0AlqKs
	TcpfZ9xnLeJkQxCQyhj7bJMn7UrTuuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hjm+cYqk9IyHnMwrATmytfuw780l72JK9XGMflIabE=;
	b=9C8K/cG5R/ttU88wehDqYdLoNgv1NULRMFP38RBKhG6ylGIdCs7SIFYvbpa2XLkAAUhn+b
	fmQmP9979aRUP/Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30D4113A1D;
	Mon,  9 Jun 2025 07:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F36yCtqSRmicfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 07:52:58 +0000
Date: Mon, 09 Jun 2025 09:52:57 +0200
Message-ID: <874iwp8i7a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Li Jun <lijun01@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] sound: isa: combine lines that defining variables and assigning values
In-Reply-To: <20250606102538.95678-1-lijun01@kylinos.cn>
References: <20250606102538.95678-1-lijun01@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 06 Jun 2025 12:25:38 +0200,
Li Jun wrote:
> 
> Because the vars be assigning values immediately after
> defining, so combine them.
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

Thanks for the patch.  But this doesn't improve the readability much,
nor fix any real bugs.  As those are all legacy drivers, I'd rather
leave untouched.


Takashi
