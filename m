Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B57B26AFC
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742829941; cv=none; b=WpXj/cphe/G5D2HySSt8FdPNZRCRFS+3kXIzXwjqxCa9X6003lkbx1B1ziROSGGbVrXDrzyu1IFMubvup0tFGBHv4uARB9v5mqJMz+4Chgd6uZqD3+Jo2D60kTremoEQ27ddujvyKXQGgv5Non/IsFsEGa4tr0rhe6BSrzFnUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742829941; c=relaxed/simple;
	bh=VydK2Q1uS8KH/m/cMHz4kBGLdqllZnmC/XYOZbHre5I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p31r+vGMwIeoNM7jOp6HoMZtsMeosxOEs8IMnnW57pwwj137XXVT9+ZUQdRNoAmMlTEb8k1ABMZ7Gtz+OKTQ5oXKycNXFLH6mqBy51FRv7X61X/dK+M1HcKXccyoSPsVo0k+dJrXn1wc8/ifOLGQq83An1KPMfvG/nZj7Ke+1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AiVRX3TC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wTsJqEgA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AiVRX3TC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wTsJqEgA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AiVRX3TC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wTsJqEgA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AiVRX3TC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wTsJqEgA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39DA421185;
	Mon, 24 Mar 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742829937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=AiVRX3TCybP9zAcqq0UmOHb7Gr2LuFtj7EoGqEOzZhTx9L1hSDBeoUcugdQOQTMTcLo7wJ
	IeUJcXviNbwn3NVq8mXjEn+geXlLfHe48vV/bo5RHzylYD1LJoHPURmCkARc/Na3xE/xUJ
	czV7jbfQ3087cGYQkTt7Xaz1eS4O/V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742829937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=wTsJqEgAhl3IDlHuU8YoOv3g5vy4C8x2Hh08rtsL4hgUi+Wl8/E0Zih27OGgAxSJitwFxs
	u2v1MvS+ACsfFZAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742829937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=AiVRX3TCybP9zAcqq0UmOHb7Gr2LuFtj7EoGqEOzZhTx9L1hSDBeoUcugdQOQTMTcLo7wJ
	IeUJcXviNbwn3NVq8mXjEn+geXlLfHe48vV/bo5RHzylYD1LJoHPURmCkARc/Na3xE/xUJ
	czV7jbfQ3087cGYQkTt7Xaz1eS4O/V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742829937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=wTsJqEgAhl3IDlHuU8YoOv3g5vy4C8x2Hh08rtsL4hgUi+Wl8/E0Zih27OGgAxSJitwFxs
	u2v1MvS+ACsfFZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1434B137AC;
	Mon, 24 Mar 2025 15:25:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id isBrA3F54WeyXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Mar 2025 15:25:37 +0000
Date: Mon, 24 Mar 2025 16:25:36 +0100
Message-ID: <87sen2qwlr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.15
In-Reply-To: <61f20e6e72e40f20422dca4b83d57787.broonie@kernel.org>
References: <61f20e6e72e40f20422dca4b83d57787.broonie@kernel.org>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 24 Mar 2025 15:32:52 +0100,
Mark Brown wrote:
> 
> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:
> 
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.15
> 
> for you to fetch changes up to 9ef52d529bb75071e03cf85078f724d69c4abe89:
> 
>   ASoC: SDCA: Correct handling of selected mode DisCo property (2025-03-21 15:45:25 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.15
> 
> This is a very big release due to a combination of some big new work,
> mainly new drivers and generic SoundWire support, and some wide ranging
> cleanup work that made small changes to a lot of drivers.
> 
>  - Morimoto-san has completed the conversion to use modern terminology
>    for the clocking configuration, and several other cleanups with
>    narrower impact.
>  - All the power management operation configuration was updated to use
>    current idioms by Takashi Iwai.
>  - Clarification of the control operations from Charles Keepax.
>  - Prepartory work for more generic SoundWire SCDA controls from Charles
>    Keepax.
>  - Support for AMD ACP 7.x, AWINC WM88166, Everest ES8388, Intel AVS
>    PEAKVOL and GAIN DSP modules Mediatek MT8188 DMIC, NXP i.MX95, nVidia
>    Tegra interconnects, Rockchip RK3588 S/PDIF, Texas Instruments
>    SN012776 and TAS5770L, and Wolfson WM8904 DMICs,
> 
> Some changes from the tip tree adding APIs needed by the AMD code are
> included, these were unfortunately rebased in the tip tree after being
> pulled in.  There's also some regmap changes supporting the SCDA work
> and some devres refactoring that was pulled in to support other changes.

Pulled now.  Thanks.


Takashi
