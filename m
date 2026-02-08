Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F1A346770
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770539182; cv=none; b=DDR4JYHnbgUhRHk9pTFGCu2whaia/rZIOrozxdFjUZsoqN2mFa4FQdwuIQ5YPhtaZVX+eAKHBbvn67dygm+pw8iQn03WjeFNYjNcTrRnGmttQscHjSt1zEaY2CDtTV+PrPeAC00o/g8+4cgW6OrcYWO4tYInrN+Q4Ry3wNdZhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770539182; c=relaxed/simple;
	bh=YChBGQRKROV4OWRahnD9WIzYg0EkHpKgtJcRTwt1sEg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxpaGYOGVTIzE1orR9atuqwypPMq0ZcJyVf4XjizdN3f/h7LQ05CResOT+3Ul32ZfT/rc00GHhZyE5dUOTcBV46s/dl/WNPNZ49YWP23dGcwDHsMgiQXLSVjarUpZC22ut+M+5oM8sA0DSsqhZsfolRuQiMNSY7kXdu6e+t0SbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ETFwtVDz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aqrKgh7v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ETFwtVDz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aqrKgh7v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ETFwtVDz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aqrKgh7v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ETFwtVDz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aqrKgh7v"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73C903E6FA;
	Sun,  8 Feb 2026 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770539180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqriwoK/ajm44hA11ZD1Pcld7pzIZO+QFMMoXi5ZHIM=;
	b=ETFwtVDzisLMpDPZql2kFRiFLjkGve/lLRxNnjU62HZiDkzgBnUeGvZjcWPo1a4XXvFadw
	3cLX0o3QmUVMd4SVur74uSKb60NNKxhGtLNGD+dtoCHGIvZP2ChSPi3y0o2Rs9zu+zIqsY
	YckjuLEX4MUbqOb0mRLj4c3AV8SMkKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770539180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqriwoK/ajm44hA11ZD1Pcld7pzIZO+QFMMoXi5ZHIM=;
	b=aqrKgh7vHax/ZSwNRwuBF7T4z2w0Af7tXqj9bJgQmN72jZFiolrL8WLqvWP9GS1b5IlMVY
	DjZZPgTK2sRryhBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770539180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqriwoK/ajm44hA11ZD1Pcld7pzIZO+QFMMoXi5ZHIM=;
	b=ETFwtVDzisLMpDPZql2kFRiFLjkGve/lLRxNnjU62HZiDkzgBnUeGvZjcWPo1a4XXvFadw
	3cLX0o3QmUVMd4SVur74uSKb60NNKxhGtLNGD+dtoCHGIvZP2ChSPi3y0o2Rs9zu+zIqsY
	YckjuLEX4MUbqOb0mRLj4c3AV8SMkKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770539180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqriwoK/ajm44hA11ZD1Pcld7pzIZO+QFMMoXi5ZHIM=;
	b=aqrKgh7vHax/ZSwNRwuBF7T4z2w0Af7tXqj9bJgQmN72jZFiolrL8WLqvWP9GS1b5IlMVY
	DjZZPgTK2sRryhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 317E93EA63;
	Sun,  8 Feb 2026 08:26:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 07U7CqxIiGnUPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Feb 2026 08:26:20 +0000
Date: Sun, 08 Feb 2026 09:26:19 +0100
Message-ID: <87zf5j7iac.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pedro Amarante <ppedrolia@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/generic: fix typos in comments
In-Reply-To: <20260208052439.11498-1-ppedrolia@gmail.com>
References: <20260208052439.11498-1-ppedrolia@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 08 Feb 2026 06:24:39 +0100,
Pedro Amarante wrote:
> 
> Fix 'ony' -> 'only' and 'evalute' -> 'evaluate' in code comments.
> 
> Signed-off-by: Pedro Amarante <ppedrolia@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
