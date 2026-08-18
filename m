Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BED25B0BB
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 06:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035068; cv=none; b=Do2PGw+zxpZ8A20ic218bl488/NI7kWMK0czeqn5wx6ZyA+d30CYBuiu5nPEsI+Vbbjemh97amNJOzPrTdA/7oPdIRQ2MBaJrT3V5xbUrWrz9oP4IMkqrtowU9QOWTGNOIgPdBtVphRK2CzPg9CbrLp5TMtaVrVI1p+qAgbv4CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035068; c=relaxed/simple;
	bh=1jX2VIHiJA9hLWEyijv4zXx0lBKYE+xYihqoZYGdHzc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mt6L9aNYNyvjZhxrauPdYiIP5Mo1EZR7eDvroQRgOo/ek2NPvjWsOkaYyjdXztsYERPprjy7YTrfC1PcTwqozaOVWbeeevV2AM/DiLdc+Z4v6Gz35SXSA5itfQFMabnCVAQWhB+VzKW/6oqYjDk+Bs215Z8Hi2eDcPZVG+edz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ot8BdM2Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z7rNvmWV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mag/5isp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FC5EBCq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ot8BdM2Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z7rNvmWV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mag/5isp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FC5EBCq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6ACFE3E16;
	Tue, 18 Aug 2026 06:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787035060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnQpjpZf8I5E5MkOkP51kBtoAkJqyz70IowLt8TLp2Y=;
	b=ot8BdM2QVG54p7O1mt0BW7t7Mfx4mOTICjpF/y7L49IBluq5BnAOtzYoOLAzMytMOsYSKO
	B8VVlWvkpW0RJuVfoRq34ejCSyOd6sj2U8SJbhd0KA6MVRIG3yOYlC+qG9YGa1Gy2K15Y2
	IaWjfEt8vkD2gb3EdfJIYhfYUcPT+aw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787035060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnQpjpZf8I5E5MkOkP51kBtoAkJqyz70IowLt8TLp2Y=;
	b=Z7rNvmWVQRIFFfsd1dJ5OoypUuh/MsyP1JljhhM6Hk5+2JCAyIJzWeLA0Pf+J+TetJnKsb
	P+m/BLVT9GPh/ZCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787035056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnQpjpZf8I5E5MkOkP51kBtoAkJqyz70IowLt8TLp2Y=;
	b=Mag/5isplyGTITyWODy9wdXvU6/eAUREnvhn2FZ7uPQXn6xt52/ruVw+pPMr6kdyiWWKCp
	bKMLka2Jk3GB3ZKay8vZ4yb04x2T7CRwDSnDGmY4+hH+ZjDXujSO3r+7P2i2kHITvK2Hhe
	DMxFGKS2ho82FI3Rl/2bJswXTlCY9nQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787035056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnQpjpZf8I5E5MkOkP51kBtoAkJqyz70IowLt8TLp2Y=;
	b=6FC5EBCqVwUvxgSIsx1ZiWkjlYpw0WpxjcKnLiGk0IrilpciVi2mK1PAm8kpGs3+s7pKvg
	i48GrCv+ITIQfsAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4600622BA;
	Tue, 18 Aug 2026 06:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f+heD7D9g2omKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Aug 2026 06:37:36 +0000
Date: Tue, 18 Aug 2026 08:37:35 +0200
Message-ID: <87lda4q6hc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v7.3
In-Reply-To: <c95b9b429426c579bc4230e8b2ae489c@kernel.org>
References: <c95b9b429426c579bc4230e8b2ae489c@kernel.org>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 17 Aug 2026 18:52:14 +0200,
Mark Brown wrote:
> 
> The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:
> 
>   Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v7.3
> 
> for you to fetch changes up to 0c7aeb0f5eceb95b5887bd8e83fef865e5a49a13:
> 
>   ASoC: tas2783-sdw: do not treat read-only Controls as writable (2026-08-14 16:20:47 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v7.3
> 
> A very busy release, a combination of a lot of new device work and more
> people than usual doing various subsystem wide improvements in the code.
> The main subsystem level change is the work Morimoto-san has been doing
> to get automatic DAI format selection more widely deployed, and even
> that is largely changes in the drivers to enable use of the feature
> rather than framework work.
> 
>  - Conversions of a lot of drivers to use the automatic DAI format
>    selection code from Morimoto-san.
>  - Many fixes and code improvements from bui duc phuc and Morimoto-san.
>  - Fixes for ordering problems in register default tables from Peter
>    Ujfalusi.
>  - Changes to use auto-cleanup for firmware to improve robustness from
>    Takashi Iwai.
>  - Support for firmware on more Awinc devices.
>  - Many changes in the Qualcomm driver stack, mostly around new platform
>    support.
>  - Support for AMD ACP7.B/F, Cirrus Logic CS35L62, Loongson 2K0300,
>    Meson GX formatter and interface, Qualcomm LPI MI2S, SM8475 and
>    WSA855 and Realtek RT1321 VA1/2 and RT766/7.

Pulled now.  Thanks.


Takashi
