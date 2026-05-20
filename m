Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82D367B9C
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 05:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256448; cv=none; b=Z/r9sHP0/0jEBVP9y3gBN4+SndG7p7KfXcgyaOpaZMSERQNUwjWKIGmgoFxT3FAilR3fomaGW44WX07hqVfysVdmInpTfIxnQew7BOaTvHaCCijcfX2qeJVbCYOLUROhwY0/Vnw8e5mZgrjszPz8ym+kqFhcZBLaYuq4SWORJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256448; c=relaxed/simple;
	bh=jXiYkJ7K/vl9aLZdf8fGPagbMa2ahXk5PglotHKbZfc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBuPb4OCB65Hsog/7L77vpmt8h+AibNhb5pO+wLNXfKk6m/JXTz9CLy9GDMCfvswZuqD5J5Ivoeq2mdXqkj+YzFbgWr4lS8DVyAyumk0d2ll9PuM+gB1bLLfdG3rgi2uSbuf5E7DiaFijN5NY84popezczavHRdG61M9tUMi0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2JBJGsRc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PnIrSfAi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cjT/9Jta; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DnMM2MDL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2JBJGsRc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PnIrSfAi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cjT/9Jta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DnMM2MDL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5DA1671BA;
	Wed, 20 May 2026 05:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779256446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtWaOnItZiy8cS8m2fqlNWdarTknsUtNJRxSO7gF2jo=;
	b=2JBJGsRcdzFVM4K01GI9h1nOZvJyY+iNgcQ5HEva/tFtzm+IDO9Ot99WtTBHlKgBeABS4p
	g7Axrb+Xm4Sx3slU35ioraJQu04tJLosu+oqofuBuoRyjXeFBFR9H0BU6Qiz5xNI/yvBf8
	nFmpjevg6SEEXsURDPP02vb8TWReITk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779256446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtWaOnItZiy8cS8m2fqlNWdarTknsUtNJRxSO7gF2jo=;
	b=PnIrSfAi9i/ZzenFu4UCACP1fxavCSx1lFtNQXjFr6qV7+woRVi5m8+DC6XsTp0+pDQu8q
	+urvS1x5VvHOu6BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779256445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtWaOnItZiy8cS8m2fqlNWdarTknsUtNJRxSO7gF2jo=;
	b=cjT/9JtaT/oVx+7M+agrdv2Hfu01tci5H/xDF1gHoLwhk4Zsbl5x6aZxTRgwOLxjL/xwM1
	xUjdf4drNHJ9Fg0VGfn/dTUnHoBUpdu2mvExlMw9B+tOmPTVKFxQb6tZcIJeZyZS3PmGpX
	p1APHQ1NP6/QUB93aPhzu2BWqns/gS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779256445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtWaOnItZiy8cS8m2fqlNWdarTknsUtNJRxSO7gF2jo=;
	b=DnMM2MDLpRR9c0vHjls8Z0uNBpRc89bL14udkTtv6TPbBSuYKSYTvg9BusRKJ7pQkey1s4
	Z6b/gyaPGAP8PMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB95B593AA;
	Wed, 20 May 2026 05:54:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b1IZLX1MDWrWcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 May 2026 05:54:05 +0000
Date: Wed, 20 May 2026 07:53:57 +0200
Message-ID: <87ecj6lj7u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
In-Reply-To: <20260519155047.106096-1-wse@tuxedocomputers.com>
References: <20260519155047.106096-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 19 May 2026 17:49:48 +0200,
Werner Sembach wrote:
> 
> From: Aaron Erhardt <aer@tuxedocomputers.com>
> 
> Add a PCI quirk to reduce the volume of the internal microphone to prevent
> extremely noisy signal.
> 
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Applied now.  Thanks.


Takashi
