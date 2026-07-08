Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90E431E65
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507754; cv=none; b=V4y5mOxQ5bc4RAK3Lt2JODa2T6uZ1LKkcMCJJMzpZU6/MjU9gHSZkZfZlrYkP96/cvsbqLvP2T7c0mHmrN2J/7+oraBqVIBGenuMV5aBEQmtncPbnYKipiHX2RPqqGJ7OboiOEP6nbsuJ2ZwvT6cTIpTecCOjvq5MMDUIyOfzkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507754; c=relaxed/simple;
	bh=bXkdvt/HRngIIH7vlJ2lkFK4D/7xl8ztJnEXx4r5ATo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jv8/Yzul6FA2queV7qcOpqM7KaQGH81QdfZQxQsTsgJqJ2RtD/i6sQ3fQSX79IfVBYcQ1/TDZn3cKlWugEpSmCnELgZ3MrN1jxwjG11v5m0CkNOqHG3qWkrEEan2kepqds+Z8eY0u+2QaVTRFC7Ch6od+aeVq9QQ0S+fD9grzEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y1L9664k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=53rcw7LL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y1L9664k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=53rcw7LL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y1L9664k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="53rcw7LL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y1L9664k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="53rcw7LL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D74475BCB;
	Wed,  8 Jul 2026 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+yHzLlpHvP+ntrmizXdncuGDTKkFfDb76Rh+nZTlsw=;
	b=y1L9664kkecPjbe7EVl73P2v1cagNHSELhdNz1VnoHbYl8cA9XD8koHDdf55ccmcBGZgFd
	WQyvXYXPZoYlR/4vyeqF3zvHFaEfyRcnKLsC21qSNYKMQc1Dohj58CO6Q30pt4GlBOPHcb
	ft2+3DD6plhDs9SWg8Cgdx+3RgzFgXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+yHzLlpHvP+ntrmizXdncuGDTKkFfDb76Rh+nZTlsw=;
	b=53rcw7LLrmrCifXbfpbpZ69pFJBds3Jv0zoMX5CF+y0sd4ZPtfbHyu+ej6NyhmanZNzWVN
	Z+iirMDx5pfGWWDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+yHzLlpHvP+ntrmizXdncuGDTKkFfDb76Rh+nZTlsw=;
	b=y1L9664kkecPjbe7EVl73P2v1cagNHSELhdNz1VnoHbYl8cA9XD8koHDdf55ccmcBGZgFd
	WQyvXYXPZoYlR/4vyeqF3zvHFaEfyRcnKLsC21qSNYKMQc1Dohj58CO6Q30pt4GlBOPHcb
	ft2+3DD6plhDs9SWg8Cgdx+3RgzFgXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+yHzLlpHvP+ntrmizXdncuGDTKkFfDb76Rh+nZTlsw=;
	b=53rcw7LLrmrCifXbfpbpZ69pFJBds3Jv0zoMX5CF+y0sd4ZPtfbHyu+ej6NyhmanZNzWVN
	Z+iirMDx5pfGWWDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EDC1779AF;
	Wed,  8 Jul 2026 10:49:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5dSfECErTmppJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:49:05 +0000
Date: Wed, 08 Jul 2026 12:49:04 +0200
Message-ID: <87wlv54uzj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: control: preserve snd_card_file_add() error code in snd_ctl_open()
In-Reply-To: <20260708023540.6962-1-phucduc.bui@gmail.com>
References: <20260708023540.6962-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -1.80

On Wed, 08 Jul 2026 04:35:40 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_ctl_open() unconditionally overwrites the return value of
> snd_card_file_add() with -ENODEV on failure, discarding the actual
> error code.
> 
> Fix this by directly returning the original error code returned by
> snd_card_file_add() (e.g. -ENOMEM or -ENODEV). This behavior is
> consistent with the error handling used in other functions such as
> snd_mixer_oss_open(), snd_hwdep_open(), snd_pcm_oss_open(), and others.
> 
> There is no functional change other than the returned error code in this
> failure path.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied now to for-next branch.  Thanks.


Takashi
