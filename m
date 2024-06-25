Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9380F1509A5
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324274; cv=none; b=XxgUNh5sUoydeZ1FkMkAgpThLnNLfvkJ3DYU+X/gYe/VGRN3mRJlyusAu0iIHibMRiDGA812UcgUVqKVOTObU1Ftva5LY+REUS8yAmMx+vRgU2ztW9F74ZhIGyRl4UdnBSnweEkOToJSpo5VydR5Lx8AoVaKsnircC0k3pUg5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324274; c=relaxed/simple;
	bh=4S7oWYI9qhhfoP2WCNRICqL3jK1bnNADs9+Pf6hbQMk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7A8ycSP3oTaGFNJZPQLKqRNI2g68dKH1BVvDN6XC3bUUC5vzK+rFETEWvDZAn+rcdfBpxU7P9u+zAxWKrLQWz79YTqjifnJsFHFRvXiSN3l+32sDhrGkf8EO442pFmOSsCBusldxuM2aHa7WNHiUpc+Frj+qUcnlicKRP+i6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+9qUVEA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k/0FJ8c0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+9qUVEA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k/0FJ8c0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+9qUVEA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k/0FJ8c0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+9qUVEA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k/0FJ8c0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D510D1F889;
	Tue, 25 Jun 2024 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719324269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oDnHl3nJGxtSpnz0KQlatq3vHiBiBHuW3YAwArTHvs0=;
	b=S+9qUVEAYNVmLkPz1L0qL2EB5qivSXpRdZWisxQ/M+zqQXt9Gdz/yEqejHMyTa8ncQjo9u
	/HQv9gL/E/Yrbjdt0qNt5y6bbEuTsinJWZAhXED4z+NIJfECg1iaXYWlJyRyfAfTUtBOOY
	tYKmoy69DIEIHZDb1eSRi1S9Pnp/Zlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719324269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oDnHl3nJGxtSpnz0KQlatq3vHiBiBHuW3YAwArTHvs0=;
	b=k/0FJ8c01NxktSjP1dBYdJU1b8jxcmkJDbzKVd6aLxFUoWVph+7ZMN6oSkx8LdeVRzvz/F
	/lL7Ul+uojk412AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719324269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oDnHl3nJGxtSpnz0KQlatq3vHiBiBHuW3YAwArTHvs0=;
	b=S+9qUVEAYNVmLkPz1L0qL2EB5qivSXpRdZWisxQ/M+zqQXt9Gdz/yEqejHMyTa8ncQjo9u
	/HQv9gL/E/Yrbjdt0qNt5y6bbEuTsinJWZAhXED4z+NIJfECg1iaXYWlJyRyfAfTUtBOOY
	tYKmoy69DIEIHZDb1eSRi1S9Pnp/Zlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719324269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oDnHl3nJGxtSpnz0KQlatq3vHiBiBHuW3YAwArTHvs0=;
	b=k/0FJ8c01NxktSjP1dBYdJU1b8jxcmkJDbzKVd6aLxFUoWVph+7ZMN6oSkx8LdeVRzvz/F
	/lL7Ul+uojk412AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C070A13A9A;
	Tue, 25 Jun 2024 14:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 995QLm3OemZWJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 14:04:29 +0000
Date: Tue, 25 Jun 2024 16:04:57 +0200
Message-ID: <87v81xktiu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH v6 2/2] ALSA: pcm: optimize and clarify stream synchronization ID API
In-Reply-To: <20240625135535.586233-3-perex@perex.cz>
References: <20240625135535.586233-1-perex@perex.cz>
	<20240625135535.586233-3-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, 25 Jun 2024 15:53:47 +0200,
Jaroslav Kysela wrote:
> 
> -	unsigned char sync[16];		/* hardware synchronization ID */
> +	bool sync_flag;			/* hardware synchronization - standard per card ID */

sync_flag sounds too ambiguous to me.  Can we name it more explicitly?


thanks,

Takashi
