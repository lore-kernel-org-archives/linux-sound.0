Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1E27B325
	for <linux-sound@vger.kernel.org>; Sat, 20 Sep 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758354334; cv=none; b=WQ1nvYdk+3NKLBKM2Klv69MBBai8biXeYTDU6Mdx0Da9bwXYMyo+iHLcoWMPyV8hqAbCLw7QpT/eziqnH86VjuboXHycp3TkEeyeAuOdJ81HMYBH01wmZg2yi0xng+Zk7gK9XG9e779bY4kAVOcF8eLgSNx+dY5G2w0w751LLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758354334; c=relaxed/simple;
	bh=lSe1dl3utKLfzY7222HCDZ29uIDR5Q3OEHERAFJ/ROk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ihqfo++/VU+/M4GoNzmqicDeNo5C4phvwLK5wkquo8qy+09WdITPtPajaUAJS18f8xiNRXeyhDUUya8/mnHdd47/KASSTKiJfp0PSfhSeHn0vXKw6HvqWrioZ8Of5WsAeORS85n2Vr3rhJdqMDSFBCP+MpQYAhgQ2ALXmOGOKo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=el7NIbGC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IxTnVW5O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UY1Ehlkk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ODS56rLn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="el7NIbGC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IxTnVW5O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UY1Ehlkk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ODS56rLn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F09232288B;
	Sat, 20 Sep 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758354325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jHavxcDYgKPPY26Up3Sk+/YpW5EIGYFa4Uk7plTJg8=;
	b=el7NIbGCfSnEuVVw7bvhuhH2czstoZiNBkAKm6jTanZ74U7OAEm0XUWbhCUPG3S46a0N+R
	p+pMS9ue46GHMcRtaQ0Kh8/D/nKCBZT0VaB65FE8AjWu52zCk71MacVCssi3Jn2KWRJ7QN
	3azkaewyorB4e2UHwmLomkyfPkY8JLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758354325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jHavxcDYgKPPY26Up3Sk+/YpW5EIGYFa4Uk7plTJg8=;
	b=IxTnVW5O7pKjB78qrTkFK3oHHbkwTQwnXsDLg0jP22+ZKYuaf8+OQJMHVXpGRCVRKs9Fsg
	Fy1fxOJhbq0Zk6Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UY1Ehlkk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ODS56rLn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758354324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jHavxcDYgKPPY26Up3Sk+/YpW5EIGYFa4Uk7plTJg8=;
	b=UY1Ehlkk+gmRfxQMYc/2AdctTu+Mm+gTaMbz/DXeTjJ1N3ZrdV182EvOwEScdQlKSrMSg2
	eWWQeKuCwojVEPo7KafLiMvB1MlxjUw97DjK50zf3gdOUzPRX7xhhKecihZtmJypC3+d0w
	avv/spnyoLoiImdhaJTl5XLMtZ370fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758354324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jHavxcDYgKPPY26Up3Sk+/YpW5EIGYFa4Uk7plTJg8=;
	b=ODS56rLnx17gRiCPrhYY/SK2ng3XxO/pPqDOzTrKH1wy0npVdG1NT1KGFXje20RDA21+sG
	Qod0eIpmSRj87uCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B72D21368D;
	Sat, 20 Sep 2025 07:45:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eR6aKpNbzmhDQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 20 Sep 2025 07:45:23 +0000
Date: Sat, 20 Sep 2025 09:45:23 +0200
Message-ID: <87tt0x7ejw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.18
In-Reply-To: <361b7c7101944b7f1b159066d9788fe9@kernel.org>
References: <361b7c7101944b7f1b159066d9788fe9@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F09232288B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Fri, 19 Sep 2025 23:18:40 +0200,
Mark Brown wrote:
> 
> The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:
> 
>   Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.18
> 
> for you to fetch changes up to 5998f0d07d2c4bf3d8ecc4e6218e6a324aeb7301:
> 
>   ASoC: fsl: fsl_qmc_audio: Reduce amount of (2025-09-19 21:23:48 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.18
> 
> A relatively quiet release for ASoC, we've had a lot of maintainance
> work going on and several new drivers but really the most remarkable
> thing is that we removed a driver, the WL1273 driver used in some old
> Nokia systems that have had the underlying system support removed from
> the kernel.
> 
>  - Morimoto-san continues his work on cleanups of the core APIs and
>    enforcement of abstraction layers.
>  - Lots of cleanups and conversions of DT bindings.
>  - Substantial maintainance work on the Intel AVS drivers.
>  - Support for Qualcomm Glymur and PM4125, Realtek RT1321, Shanghai
>    FourSemi FS2104/5S, Texas Instruments PCM1754.
>  - Remove support for TI WL1273.

Pulled now.  Thanks.


Takashi
