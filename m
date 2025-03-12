Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C682566DD
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793855; cv=none; b=u5w74aUzZXpmjTlMqxxSmbr9Htz4KnWCvpaQVcxqmbvk1cEpgcudPBs3RyYmDhOaoNdhculWNSxtQMDBM1eXBcglDsjBIGVhomsg3pA/AGNNqLssCLOCAbYQcHisJ61wBIZ07VWb8z9BaVIo9b7LUOl7bLRaDu6kB/sQtzM7xiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793855; c=relaxed/simple;
	bh=9tRPU0DjYHJuCwhSbbwLx4fRSRGQc1Ux5/s5jEbUiHo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqEXz24r3zsVFC54QQz7zrA/E+aj45mKU4ZGICrw0PlTtcCRbnaRiwKiCsTR9wIGrb6tt7s8wLaeZTc0ZksZ4+Gkv5EnEhcRtE/6airDh/RJZq4HJF5+ofTTbBR4LJGyQQ9h6vdomyaCqTevDWxRYpS7kjxpRTtrjkHQx1H4u5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X3SEImAW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SdPaf6nS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X3SEImAW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SdPaf6nS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3SEImAW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SdPaf6nS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3SEImAW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SdPaf6nS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35FF6211A6;
	Wed, 12 Mar 2025 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741793852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5rURUQAlCUM/+Mn/XrYX/8aTtORpr3W3CQTwx4B+sAg=;
	b=X3SEImAWaGDXdV6bd9aodNgp/eOpruJhhyOD9ypn3chSvihVEpNvTz2CK1+ZHdLSqjMvow
	/wCcxRjgkpuEBU8npKSb087b1z/OW4QYaoSTGZRnbLDiLrkwRemkVduD0U6Zk5y+Ng9lpD
	boUPdg6sAkcEN7kJEqqa5BJr0SwdFgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741793852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5rURUQAlCUM/+Mn/XrYX/8aTtORpr3W3CQTwx4B+sAg=;
	b=SdPaf6nSu9OUS1aMD7Uf6LDlgWSKqwUYqv2a7UU8e/EU6dMmdLWIvT0WPgrfFOeQeXgVeA
	/iqoc3J4V1grjWCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741793852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5rURUQAlCUM/+Mn/XrYX/8aTtORpr3W3CQTwx4B+sAg=;
	b=X3SEImAWaGDXdV6bd9aodNgp/eOpruJhhyOD9ypn3chSvihVEpNvTz2CK1+ZHdLSqjMvow
	/wCcxRjgkpuEBU8npKSb087b1z/OW4QYaoSTGZRnbLDiLrkwRemkVduD0U6Zk5y+Ng9lpD
	boUPdg6sAkcEN7kJEqqa5BJr0SwdFgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741793852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5rURUQAlCUM/+Mn/XrYX/8aTtORpr3W3CQTwx4B+sAg=;
	b=SdPaf6nSu9OUS1aMD7Uf6LDlgWSKqwUYqv2a7UU8e/EU6dMmdLWIvT0WPgrfFOeQeXgVeA
	/iqoc3J4V1grjWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08774132CB;
	Wed, 12 Mar 2025 15:37:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K7vqADyq0WfoDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 15:37:32 +0000
Date: Wed, 12 Mar 2025 16:37:31 +0100
Message-ID: <871pv2z2dg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
In-Reply-To: <a5cd97fd-dbb0-4438-adf2-e2f9283d771a@sirena.org.uk>
References: <20250312145642.26646-1-tiwai@suse.de>
	<a5cd97fd-dbb0-4438-adf2-e2f9283d771a@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 12 Mar 2025 16:34:04 +0100,
Mark Brown wrote:
> 
> On Wed, Mar 12, 2025 at 03:56:39PM +0100, Takashi Iwai wrote:
> > Put __maybe_unused to work around the build error without CONFIG_PM
> > or CONFIG_PM_SLEEP for the newly defined system suspend callback.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> I'm kind of surprised none of the build bot people noticed this...

Would you just apply and send a new PR later?
I didn't merge your previous PR yet.


thanks,

Takashi
