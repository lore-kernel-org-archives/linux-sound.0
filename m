Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095838758D
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030261; cv=none; b=YKX0VgGLG4YmtRsVZ0xFgx7HSFwzK+KR1xa6M0dxNyly6WZlFtbQJKpvpclHduAdZqJkkjrcfJP/FoWoMLoXvoq0WZs7s6HNf0M5nPbo7/DSv9vbDBtwRyT00A1XLDUQ7hdGA4wNHoxY9R3RGcB7tvxmunb4aaueN5bLjbzjfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030261; c=relaxed/simple;
	bh=hqmXyjPlnrnMVueqyq7ltER2mOXz+O4nELPzYgzT1FY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iv7GtVJpYodngqYJqQ4dMNAbwo3XWHY2M5loiD1rHXrPq+gwjLXOEsOLzrxz9gl6V03y2pA83tzxI37JuE0Aaou6+Sm2yLbdIU3O/H2D71E5CM0Awlj5Uoh6eOZMpOvfAJyYTPAtT+9n22z/rKx+GFahuJVYNqAVdUBr7CS+Sek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rOSJ5ENk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oO/luJlu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rOSJ5ENk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oO/luJlu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rOSJ5ENk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oO/luJlu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rOSJ5ENk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oO/luJlu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5C7464D2F6;
	Wed,  1 Apr 2026 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775030258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BykBHrzjvCm2eA1LU0mxvv6EqbnAiA6zXo97PSO9cs=;
	b=rOSJ5ENkn76dfCZZTLJtf24xIWNU5fB4WPPj5d2byE6CZIdOJfc1zRX0k21EecpD/QsmiA
	ekDuMifg53XdLlYLu8i+Xfp5inSa9q0SSsMG1PYJV46AFp9I8vRcH4gsDK7Hv6Mz7l13e4
	Q27PFyA1xoktM0L6Um0vWTjldBQ/xcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775030258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BykBHrzjvCm2eA1LU0mxvv6EqbnAiA6zXo97PSO9cs=;
	b=oO/luJluVm4k44AM7jDIikWrckpMAIuuUeSgn029ilaVyEsmx+rRhuferFhUiMDeUl4Dgj
	4x+MS/C+hAX7rOBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rOSJ5ENk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="oO/luJlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775030258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BykBHrzjvCm2eA1LU0mxvv6EqbnAiA6zXo97PSO9cs=;
	b=rOSJ5ENkn76dfCZZTLJtf24xIWNU5fB4WPPj5d2byE6CZIdOJfc1zRX0k21EecpD/QsmiA
	ekDuMifg53XdLlYLu8i+Xfp5inSa9q0SSsMG1PYJV46AFp9I8vRcH4gsDK7Hv6Mz7l13e4
	Q27PFyA1xoktM0L6Um0vWTjldBQ/xcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775030258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BykBHrzjvCm2eA1LU0mxvv6EqbnAiA6zXo97PSO9cs=;
	b=oO/luJluVm4k44AM7jDIikWrckpMAIuuUeSgn029ilaVyEsmx+rRhuferFhUiMDeUl4Dgj
	4x+MS/C+hAX7rOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 335FB4A0B0;
	Wed,  1 Apr 2026 07:57:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9FJPC/LPzGllZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Apr 2026 07:57:38 +0000
Date: Wed, 01 Apr 2026 09:57:37 +0200
Message-ID: <87wlyrqfim.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ALSA: ctxfi: Use matching DAIO type for da_desc
In-Reply-To: <20260331153507.2934795-3-me@harin.net>
References: <20260331153507.2934795-1-me@harin.net>
	<20260331153507.2934795-3-me@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5C7464D2F6

On Tue, 31 Mar 2026 17:35:06 +0200,
Harin Lee wrote:
> @@ -1121,7 +1121,8 @@ static int atc_spdif_out_unmute(struct ct_atc *atc, unsigned char state)
>  
>  static int atc_spdif_in_unmute(struct ct_atc *atc, unsigned char state)
>  {
> -	return atc_daio_unmute(atc, state, SPDIFIO);
> +	return atc_daio_unmute(atc, state, (atc->model == CTSB073X) ?
> +		SPDIFI_BAY : SPDIFIO);

It's error-prone to use ternary operators as open code in many places.
Better to define a function instead.

>  }
>  
>  static int atc_spdif_out_get_status(struct ct_atc *atc, unsigned int *status)
> @@ -1429,12 +1430,9 @@ static int atc_get_resources(struct ct_atc *atc)
>  	for (i = 0; i < NUM_DAIOTYP; i++) {
>  		if (((i == MIC) && !cap.dedicated_mic) ||
>  		    ((i == RCA) && !cap.dedicated_rca) ||
> -		    i == SPDIFI_BAY)
> +		    (i == ((atc->model == CTSB073X) ? SPDIFIO : SPDIFI_BAY)))

... and this is even reversed value assignment which is rather
confusing.  Rather write with a simple if/else, such as:

		 if ((i == SPDFIO && atc->model == CTSB073X) ||
		     (i == SPDIFI_BAY && atc->model != CTSB073X))
			continue;

>  	atc_connect_dai(atc->rsc_mgrs[SRC], dai,
> -			(struct src **)&atc->srcs[0],
> -			(struct srcimp **)&atc->srcimps[0]);
> +		(struct src **)&atc->srcs[0],
> +		(struct srcimp **)&atc->srcimps[0]);

Avoid unnecessary spacing changes.  The previous code is fine about
indentation.


thanks,

Takashi
