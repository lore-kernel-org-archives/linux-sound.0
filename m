Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F1F3446DD
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761910090; cv=none; b=SRzWjrzLlFzQwXtLQ+XeHpX9KMUynnQTtZouy+TrdmRk62brtLPEZY1za8pRx7HBHrffayvsWzU+htqqp6v81YAI9ZlHpKI5VcMToKR2M+E8AQhTh6yxcJ1EzK3oXIvoUxuXYjV8a1YDySGKFUxJDhnhZJ42RUA0tUHQehgNHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761910090; c=relaxed/simple;
	bh=2h/2gmGGNrZOBFIeJKnPnvriszhl+VX/sFgtFT8T57Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cI0QrYDcgAfGgXNDeTVIwhZ41TSYtKzraa07oQOFLPOH9uXphSs4V+rqVcTNih/Xgijh2eCtizwxPJXofMUroqnPhZioB6lNDdrVyxtXuWXJWUDyk7qdeOdf2IRR8Ckc8Z4PAULA5HzQvyfVyMdYY1RGtxr4IFHxyZkdaslolTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPOYesMS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4aqtPf/f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPOYesMS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4aqtPf/f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPOYesMS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4aqtPf/f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPOYesMS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4aqtPf/f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D06A1F79A;
	Fri, 31 Oct 2025 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761910087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1tW+WNA5ATprsP8oCiVckcDyzpM1eUIX38rqMb49zAc=;
	b=bPOYesMSn4HNbGbdu/Q7y5UdMTxGxzhfzpRik1G5amw8f+/1ipYzenBjJAkdD8N83WQHiE
	yrBa6dX4Gtxm/5Buw87K8vFnpL8ONsIr578WuE5eK2x8tgoOnM87fBXwCEdgpuizgWxx+J
	gtpexaqDKJgg7Ys5SlV/381JMaK8NCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761910087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1tW+WNA5ATprsP8oCiVckcDyzpM1eUIX38rqMb49zAc=;
	b=4aqtPf/fJs733dtA5NTwZVpA64LxECG/M4p129nHQtYgvvkh/nGv9AKlyfKH0yUJ2Js1Dn
	G8SRAbL1ixz2C2Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761910087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1tW+WNA5ATprsP8oCiVckcDyzpM1eUIX38rqMb49zAc=;
	b=bPOYesMSn4HNbGbdu/Q7y5UdMTxGxzhfzpRik1G5amw8f+/1ipYzenBjJAkdD8N83WQHiE
	yrBa6dX4Gtxm/5Buw87K8vFnpL8ONsIr578WuE5eK2x8tgoOnM87fBXwCEdgpuizgWxx+J
	gtpexaqDKJgg7Ys5SlV/381JMaK8NCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761910087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1tW+WNA5ATprsP8oCiVckcDyzpM1eUIX38rqMb49zAc=;
	b=4aqtPf/fJs733dtA5NTwZVpA64LxECG/M4p129nHQtYgvvkh/nGv9AKlyfKH0yUJ2Js1Dn
	G8SRAbL1ixz2C2Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CACF113393;
	Fri, 31 Oct 2025 11:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V1FAMEadBGn3UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 Oct 2025 11:28:06 +0000
Date: Fri, 31 Oct 2025 12:28:06 +0100
Message-ID: <87pla3joop.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 2/3] ALSA: hda: add bus callback for address translation
In-Reply-To: <20251030110928.1572703-3-joakim.zhang@cixtech.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Thu, 30 Oct 2025 12:09:27 +0100,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This patch adds bus callback for address translation, for some
> SoCs such as CIX SKY1 which is ARM64, HOST and HDAC has different
> memory view, so need to do address translation between HOST and HDAC.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  include/sound/hdaudio.h     |  3 +++
>  sound/hda/core/controller.c | 25 +++++++++++++++++++------
>  sound/hda/core/stream.c     | 17 ++++++++++++++---
>  3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index 4e0c1d8af09f..61b41a014f4a 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -293,6 +293,9 @@ struct hdac_bus {
>  	const struct hdac_bus_ops *ops;
>  	const struct hdac_ext_bus_ops *ext_ops;
>  
> +	/* address translation from host to hdac */
> +	dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus, dma_addr_t addr);

This should be rather added to hdac_bus_ops instead.

Or, we can just add addr_offset field in hdac_bus instead of yet
another callback.  Then the change would be simpler.


thanks,

Takashi
