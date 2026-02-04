Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3CD314A7A
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207452; cv=none; b=bfkMwO3tagnejqfJi8Wlokx4EC/iv/a+9dEGVGMSi8zSRrxKVNeEXt80sUQnWyBI7G/kZtAeiaHcb1jD/dBYPoItl9SoUaIq9iyCP5pLrJhAeffWT/u1rZXp4jQJzwlNZ3p3jASX/DRpQuYa4ybEI0jtshImLVdlDNkCKTPOMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207452; c=relaxed/simple;
	bh=qyw1d0ViPNS7NhzW5DnyOKDjIYgOZf2otacTq/rSHUw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WfJYE3MoFrtQXvAV/OfEQajKSxqWA/9urMpKFK4OJoqEC+Rt8O4p8+l43VjgeMycgCc9pCvGcdxbBvHMwTf0641S2kwu6lSwl6aRZIXGnCKBnC6JEDyyd4MJNaGuzFOdPsGpXSnwNo31hTtoXtlCBnl4R5ml6Tenyh/vFyX6jzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tKrH55ih; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bI32b4T/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tKrH55ih; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bI32b4T/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tKrH55ih";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bI32b4T/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tKrH55ih";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bI32b4T/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 084B13E711;
	Wed,  4 Feb 2026 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770207450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKgNubIJm1LHVj5rT8uaolbPw3HH9lOeui3zY29hnwM=;
	b=tKrH55ihV4uGobVnSmOKxZ24BJjMlUyo1Vd5coQVQfKHS997GlUkm9+UiMA+gKHrQ8AZLy
	NsK4fsi+2SPXZwEnkNCw6n+9NkzrmkZKI7OOLgjOZCIPJNSh11uiR+yMUAJJ7RUunPolZV
	yvgSx5BRHLfQk79NYDkU01FuQ3CRt1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770207450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKgNubIJm1LHVj5rT8uaolbPw3HH9lOeui3zY29hnwM=;
	b=bI32b4T/SOOTb7LH24GCfQa68UqB/JYcY886dYjdvPNCIa4hXycJh4TN5UEfCku8TDnlDg
	6iUkASLEiw6dSEBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770207450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKgNubIJm1LHVj5rT8uaolbPw3HH9lOeui3zY29hnwM=;
	b=tKrH55ihV4uGobVnSmOKxZ24BJjMlUyo1Vd5coQVQfKHS997GlUkm9+UiMA+gKHrQ8AZLy
	NsK4fsi+2SPXZwEnkNCw6n+9NkzrmkZKI7OOLgjOZCIPJNSh11uiR+yMUAJJ7RUunPolZV
	yvgSx5BRHLfQk79NYDkU01FuQ3CRt1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770207450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKgNubIJm1LHVj5rT8uaolbPw3HH9lOeui3zY29hnwM=;
	b=bI32b4T/SOOTb7LH24GCfQa68UqB/JYcY886dYjdvPNCIa4hXycJh4TN5UEfCku8TDnlDg
	6iUkASLEiw6dSEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD5903EA63;
	Wed,  4 Feb 2026 12:17:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gVzbLNk4g2mEAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Feb 2026 12:17:29 +0000
Date: Wed, 04 Feb 2026 13:17:29 +0100
Message-ID: <871pj0snxi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	tiwai@suse.com,
	broonie@kernel.org,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <08cf484e-fc2f-4878-ab18-c80798b844e4@perex.cz>
References: <20260204112609.127085-1-cezary.rojewski@intel.com>
	<08cf484e-fc2f-4878-ab18-c80798b844e4@perex.cz>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 04 Feb 2026 12:46:55 +0100,
Jaroslav Kysela wrote:
> On 2/4/26 12:26, Cezary Rojewski wrote:
> > +			sizeof(original.value.bytes.data));
> > +	if (retcmp)
> > +		retcmp = 1;
> > +
> > +	if (retcmp == ret)
> > +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
> > +	else
> > +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
> 
> For volatile controls (SNDRV_CTL_ELEM_ACCESS_VOLATILE), the result may
> be fine. I would downgrade the level to pr_info for those controls
> here with another message.

I believe we can simply skip the validation for controls with
SNDRV_CTL_ELEM_ACCESS_VOLATILE.  As the second read is unreliable, the
check makes little sense.

Also the controls with SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK (which can be
checked via snd_ctl_skip_validation()) should be skipped, too.


thanks,

Takashi
