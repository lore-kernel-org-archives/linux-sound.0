Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB779244660
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489767; cv=none; b=CzGYW4Op/MAq4Q68Wy7gDymoUOT6qLrduQY1U2jJL4WG7mohLPYCfRaKCTzk1zWknjYPWe+DwuW8CnZsKzMMVdxPkZBFe6/Wd6cftkrYWnhSAhMUw1w6cBpo12XYoSDvptHWj2fAmc1O/h0XCvid0bR0lgVcEfsbT/iFGzuujbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489767; c=relaxed/simple;
	bh=y7LQ+RcKRrckIRhoPRjhx0RHCEoPwJTY13ckG/d9Dfc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOa01ZBkukxRYcnlOMMoKFhiVttkKd583lR133tTm/vQyEUeWjiUTHJnxfw3PBWWS7qIpa9RQ/B7zTaXsrY5UzT7QaFz9GVuqe8IjFj5uGFT4wzn8xginpi3Yb74b4rMip67zXEwwQ9pb65WD2VHRY0OijFjIp+we9CegxTJg9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AOIFIKdU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7IXpsjif; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AOIFIKdU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7IXpsjif; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AOIFIKdU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7IXpsjif";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AOIFIKdU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7IXpsjif"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B97F211D2;
	Mon, 14 Jul 2025 10:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752489763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BL8NrWSCMmbBzbiRlti2vMpo5naJ9ehy6kfPGtGhR+s=;
	b=AOIFIKdUJt3kKsEqjyfkG51/0mw//xL9xfNVYrlSXTEYAvCycJmIrZI9HwOVexxj5beqe6
	yU1tSk+fEEBwlYOWQm3uvJBLCq0xCgPoa43E1QBThHUkR2JvcNfeYvvzOqDO5wcJFPRe+4
	2HwLJfELx1YSIzruQuuwThIqB8hBla0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752489763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BL8NrWSCMmbBzbiRlti2vMpo5naJ9ehy6kfPGtGhR+s=;
	b=7IXpsjifO+Wcv2fwzUqfeZu3pJHdCu8thFw5Jqcz8KlT97qZe+Nf0FxA/Z2VM6uOZgQDgY
	JP8aRZEll1L6wFAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752489763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BL8NrWSCMmbBzbiRlti2vMpo5naJ9ehy6kfPGtGhR+s=;
	b=AOIFIKdUJt3kKsEqjyfkG51/0mw//xL9xfNVYrlSXTEYAvCycJmIrZI9HwOVexxj5beqe6
	yU1tSk+fEEBwlYOWQm3uvJBLCq0xCgPoa43E1QBThHUkR2JvcNfeYvvzOqDO5wcJFPRe+4
	2HwLJfELx1YSIzruQuuwThIqB8hBla0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752489763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BL8NrWSCMmbBzbiRlti2vMpo5naJ9ehy6kfPGtGhR+s=;
	b=7IXpsjifO+Wcv2fwzUqfeZu3pJHdCu8thFw5Jqcz8KlT97qZe+Nf0FxA/Z2VM6uOZgQDgY
	JP8aRZEll1L6wFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B72DA13306;
	Mon, 14 Jul 2025 10:42:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6npzKyLfdGgLWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Jul 2025 10:42:42 +0000
Date: Mon, 14 Jul 2025 12:42:42 +0200
Message-ID: <878qkr834t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dongeg1@lenovo.com
Subject: Re: [PATCH] patch_realtek: Support mute LED for Yoga with ALC287
In-Reply-To: <20250714094655.4657-1-xy-jackie@139.com>
References: <20250714094655.4657-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.20 / 50.00];
	SEM_URIBL(3.50)[139.com:email];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[139.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: 0.20

On Mon, 14 Jul 2025 11:46:55 +0200,
Jackie Dong wrote:
> 
> Support mute LED on keyboard for Lenovo Yoga series products with 
> Realtek ALC287 chipset.
> 
> Tested on Lenovo Slim Pro 7 14APH8.
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>

Applied now, thanks.


Takashi
