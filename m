Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C493E410E
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625809; cv=none; b=t0VXwIi/wy2WKqCgs+qWlrzryp2w8036L+GeUNUTxqnLNvXHyS0FP9qqByWh6IACcQhAWVULb8Q/wEkOzUiuGxJ/68B09ho0CzCBzAdjI9Yq9SDTJdT5MkOBl4C4QglL+eUUR87aXkQinFXs8p9DcTNEDIxuaYejjhACmJsJ6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625809; c=relaxed/simple;
	bh=+SaYIkjszGm680I8xtpkzFNCXZBAGF+XLOF92Oz7f+I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgER2P0KVRPzVycrJ/QZ6hMrzjAcaGOdBVBZ9wS4h+c4fwv+Vk2dgMSd+hQqIaKGMw6PACIgrMSn6lXWGvlVqmHPRDmahgOZjmz0jbhW0XxpSTYAsKkR2GQTmYo0IHUX3ZM0Ev4OMb7BJKr11SP7k+B621WoyLDPJpD3AhqCkxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qc+3eHCS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hyuPSHQ7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vxmsiTf8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=flxFWrKX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qc+3eHCS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hyuPSHQ7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vxmsiTf8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="flxFWrKX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84FBE21D7E;
	Thu, 17 Sep 2026 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789625801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmUo4B2eX5MRFWLUX9iQypCTcGBjjs6+bctWrUEKews=;
	b=Qc+3eHCSw5Ijfbb02nYkNgYueMvo/b0/83SENguqgU1Rt8jIS6BzDJV5pF+l1cDrM/68ti
	PcuV0GxNDk9SrnAmCi+OcWWsGuU+maZP13n3X4s873dvWt09ANmoEEENzfNTW7KVUohS/1
	NgpeQFLNjQWTxR8JXN1XOsO/AGN1ZDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789625801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmUo4B2eX5MRFWLUX9iQypCTcGBjjs6+bctWrUEKews=;
	b=hyuPSHQ7CC28jF3EO2oveMo4RyemlhX3Pyp6foNRRSGgu+BBmA/0O8kNMDEJgNfl1BGBQ0
	FwcRmGL62LYL2WAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789625797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmUo4B2eX5MRFWLUX9iQypCTcGBjjs6+bctWrUEKews=;
	b=vxmsiTf85XBdaQ5Mr0K0Pypc862DgKeNWIo984JSIA98DmYqyx+iWH99VWAqO1YJ6xRR75
	QtjxHiOSRBOHgS+bRRDhwkvMNtM5t/Os9gYHvos7TQhV+tYPYvi7AIgkpHRgDD2+rs1m0l
	Zp6yo1u7+o9mK9B2dv/zJZ9ytws52yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789625797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmUo4B2eX5MRFWLUX9iQypCTcGBjjs6+bctWrUEKews=;
	b=flxFWrKXyOIaX/Eo+kr+na2ld58QfxKlrKLdOHB7la72FuIiYNx3zBIY6tS92wpzF1nbVn
	XTxMSeCceNaESzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4452C13786;
	Thu, 17 Sep 2026 06:16:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 925HB8WFq2rWSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 06:16:37 +0000
Date: Thu, 17 Sep 2026 08:16:36 +0200
Message-ID: <87v784ierf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc3
In-Reply-To: <3413f10580c07752cd34ce5a1557e8c3@kernel.org>
References: <3413f10580c07752cd34ce5a1557e8c3@kernel.org>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 16 Sep 2026 23:23:52 +0200,
Mark Brown wrote:
> 
> The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:
> 
>   Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc3
> 
> for you to fetch changes up to 940e8fe8535d22ce67dd2fb9588e6c55a31d7d03:
> 
>   ASoC: adau1977: small fixes to make the driver more usable (2026-09-16 20:09:57 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.3
> 
> A relatively large pile of fixes here, a lot of driver specific stuff
> that's broadly unremarkable plus a few core fixes from Richard that fix
> issues where SoundWire systems with multiple CODECs on the same link
> would configure the CODECs to use the same bus slots leading to broken
> audio.

Pulled now.  Thanks.


Takashi
