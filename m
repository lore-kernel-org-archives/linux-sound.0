Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653784087C
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449226; cv=none; b=BF72PJjk0EhWg1GW9Lx1iVnPJmmBRWyzM3Wr0/j1CD0nXFrKHjuRR04/W30eB8fXY6bYybOoa14prCz3OXQ3a/guy8xBqKrbaco8jdRc0tseGyIetDH5IS40dkqDuk2Cm7Ft7bfLmcZJqYbYLJALYMuh2KfqmuF5Sb7/5+cOyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449226; c=relaxed/simple;
	bh=MNy+VtQjNoOk079jXCXLWxNEoUxfksNMB+aPLvkXcdA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHWTPLY+XTydjLT0NcS4s59itUiSNWauFArQTmgYgtRzvSf5Xl0pw2Y1YieNS1sDVaxykUesU7RTedKB5OPhk3hn+SZUlVp/3kRNsehRnmcasrIPikTbbj+kC1+NmlPKesxgTK9B2+nRC0KElSOdGoZS2N3L/eNm8/tUvvkIrbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcoA6eAR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5edSckQi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcoA6eAR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5edSckQi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcoA6eAR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5edSckQi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcoA6eAR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5edSckQi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91DA821CC4;
	Fri,  1 Nov 2024 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730449222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CruuOnvmMU3XMvxi8ettf59rJQ5MO02YiPpev+7Vn7s=;
	b=pcoA6eARBhuQQHpLTNnyBm44rySXg1Ie3j/QmoC4hZqSg02VZVON4Lz+dRlx5fycL5Qt9T
	0rn4eqGYS6DaJnii/CcE0xetTRMFHEH4RcjQnutm1//L/OM6BEOjiTcEppGIXiOZAO7oUH
	4SURGALyv+eGurTV96IBtnAuh7hO9IE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730449222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CruuOnvmMU3XMvxi8ettf59rJQ5MO02YiPpev+7Vn7s=;
	b=5edSckQiB9B29WakNMX0VXzS3JIp/zdfLlqADA4m+7EGPDxdHkgJZGPci/PADdLNe+w3OS
	0+H5Yzf3s07KMoBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pcoA6eAR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5edSckQi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730449222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CruuOnvmMU3XMvxi8ettf59rJQ5MO02YiPpev+7Vn7s=;
	b=pcoA6eARBhuQQHpLTNnyBm44rySXg1Ie3j/QmoC4hZqSg02VZVON4Lz+dRlx5fycL5Qt9T
	0rn4eqGYS6DaJnii/CcE0xetTRMFHEH4RcjQnutm1//L/OM6BEOjiTcEppGIXiOZAO7oUH
	4SURGALyv+eGurTV96IBtnAuh7hO9IE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730449222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CruuOnvmMU3XMvxi8ettf59rJQ5MO02YiPpev+7Vn7s=;
	b=5edSckQiB9B29WakNMX0VXzS3JIp/zdfLlqADA4m+7EGPDxdHkgJZGPci/PADdLNe+w3OS
	0+H5Yzf3s07KMoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C3AD13722;
	Fri,  1 Nov 2024 08:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X+A1GUaPJGfoKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Nov 2024 08:20:22 +0000
Date: Fri, 01 Nov 2024 09:21:26 +0100
Message-ID: <87h68ruzy1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: Don't free interrupt when suspending
In-Reply-To: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
References: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 91DA821CC4
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 31 Oct 2024 20:32:52 +0100,
Heiner Kallweit wrote:
> 
> There's no need to free/re-request the interrupt on system suspend.
> PCI core takes care, using functions like pci_restore_msi_state().

Well, it wasn't always true for hibernation in the past,
e.g. snd-intel8x0 driver had to deal with it.  I guess it's no longer
needed for modern platforms for HD-audio, so I'm going to take this
for 6.13.


thanks,

Takashi

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  sound/pci/hda/hda_intel.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index b4540c5cd..9fc5e6c5d 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1040,14 +1040,6 @@ static int azx_suspend(struct device *dev)
>  	chip = card->private_data;
>  	bus = azx_bus(chip);
>  	azx_shutdown_chip(chip);
> -	if (bus->irq >= 0) {
> -		free_irq(bus->irq, chip);
> -		bus->irq = -1;
> -		chip->card->sync_irq = -1;
> -	}
> -
> -	if (chip->msi)
> -		pci_disable_msi(chip->pci);
>  
>  	trace_azx_suspend(chip);
>  	return 0;
> @@ -1062,11 +1054,6 @@ static int __maybe_unused azx_resume(struct device *dev)
>  		return 0;
>  
>  	chip = card->private_data;
> -	if (chip->msi)
> -		if (pci_enable_msi(chip->pci) < 0)
> -			chip->msi = 0;
> -	if (azx_acquire_irq(chip, 1) < 0)
> -		return -EIO;
>  
>  	__azx_runtime_resume(chip);
>  
> -- 
> 2.47.0
> 
