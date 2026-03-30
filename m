Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33998377EC3
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887986; cv=none; b=AL8GL6WbyK10Grzm8V1KqdLTnsN2D/E9F3q3uHgNR2dnneG27rh3PJvDrkuf1jCJkFa+ODkQSXJWYW251mlKAQFyzm9l89mzg9dp4LhkoLbyxTnx009BoJpkjzCK1tBwFaSCqc28Qv53Ob4FPh5zdEUcGrhcovj6xhtPXlQj3kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887986; c=relaxed/simple;
	bh=4CjS8yzHv+gSRgHZPBfJNiWu8Hf4xTc9HKLnFSI5irw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhQhL/il0/lFP0RhGA8rkjkGlpsg71n+zijPlaVjXFYIvGbD5d/Pq8t3hLaeS0noeihZ6dWryw6RTnBXopQeOUtBvoGN6m2Mps4Glx37QskZGxH1bch6rrbRZUj9o8C+OZDItZNd3XIGv9MwExQoo2tPvvvPeSp8IKk2eRC+YTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kFCcD2Ww; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rRZ44Y4Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kFCcD2Ww; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rRZ44Y4Q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kFCcD2Ww";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rRZ44Y4Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kFCcD2Ww";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rRZ44Y4Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 907584D2C1;
	Mon, 30 Mar 2026 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774887983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9z+Xh6q+hkbPYYijpp3vCbytiZlIYzLGnPUGOvxCtXE=;
	b=kFCcD2WwJD5Z9+6upET/jlePK6xbLWJACcApiWB8rtJCS6BXNvTxk8MED30PsvHf4i563Z
	ZmAX8jKNkYC7QIDyoXDUewMP/x0Sf6fLpL0NrNHeSUNGVLwwHR2R6aO9vBlaaCXwhUTtJA
	qZ+MldSFswHTrBf76nGDcHvgM2BLMDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774887983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9z+Xh6q+hkbPYYijpp3vCbytiZlIYzLGnPUGOvxCtXE=;
	b=rRZ44Y4QdzN80SSLvoZ3/TJQaayRd9XCKDWaf2QjHgLfegkSEXIaJivPpMpCfE6EiR8jcd
	VseZKOlOJgUyQLCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774887983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9z+Xh6q+hkbPYYijpp3vCbytiZlIYzLGnPUGOvxCtXE=;
	b=kFCcD2WwJD5Z9+6upET/jlePK6xbLWJACcApiWB8rtJCS6BXNvTxk8MED30PsvHf4i563Z
	ZmAX8jKNkYC7QIDyoXDUewMP/x0Sf6fLpL0NrNHeSUNGVLwwHR2R6aO9vBlaaCXwhUTtJA
	qZ+MldSFswHTrBf76nGDcHvgM2BLMDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774887983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9z+Xh6q+hkbPYYijpp3vCbytiZlIYzLGnPUGOvxCtXE=;
	b=rRZ44Y4QdzN80SSLvoZ3/TJQaayRd9XCKDWaf2QjHgLfegkSEXIaJivPpMpCfE6EiR8jcd
	VseZKOlOJgUyQLCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 649C74A0A2;
	Mon, 30 Mar 2026 16:26:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b1RlFy+kymmWVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 16:26:23 +0000
Date: Mon, 30 Mar 2026 18:26:23 +0200
Message-ID: <87jyutthao.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] Add support for various HP and ASUS laptops using CS35L41 HDA
In-Reply-To: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
References: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 30 Mar 2026 15:46:16 +0200,
Stefan Binding wrote:
> 
> Add support for several HP and ASUS laptops using CS35L41 HDA.
> These laptops use Internal boost, with SPI or I2C.
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add support for HP Laptops
>   ALSA: hda/realtek: Add support for ASUS 2026 Commercial laptops using
>     CS35L41 HDA

Applied both to for-next branch now.  Thanks.


Takashi
