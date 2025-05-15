Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6F297B88
	for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306249; cv=none; b=e3jq9ZWkCBM/AKE2pwUsLrU5GlCqy4QZMDRR4bvy5bgwHhkMeTAF/6FH9rHC79MXnFg6KSZuPVnf4iDNWtM0mmhtQq3hiadkZBlF33rYUUAAr92Y6nunqMB28qk4Ux1w47OW4VXCGvHe4iIJv3r+rjUcYoGeDpVHP16lq32yLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306249; c=relaxed/simple;
	bh=Ucxu4roeutSA0yn22Vvw5gZIeAHdcuzgwzSl89qvaRM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJ5UujNC3v7BoLWT6A4V1xLzNjvuN5wNZc+VJEvUAnx0XGmfVdmW52oCMddoB9DOVrHlZIvdWdmM2ikBJ2fXpmsFLul9alFsaCOPGk+lEw6opEZ785f9hSh95BiHu7bt6wE0Rmm3ok97559cJJdGZ9T9ve7eR03cuh5U3CuebgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pxir6h4x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/I4HLFs6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pxir6h4x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/I4HLFs6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pxir6h4x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/I4HLFs6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pxir6h4x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/I4HLFs6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B00A91F391;
	Thu, 15 May 2025 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747306244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/qNpTQzW1ix+mWdll1CtoN0CpW/oAw/IKtBbs+PhAc=;
	b=pxir6h4xlX+fZq0zJPvcEU/HogrXwYzZ+MrtlZL7ZjNrg9T3St4EA6CZeV5TLVri6cNne6
	PVGxWdK03/cy2rwSvlXiI10/LTNLAwmJJjgTmIADDy/4MJWYccL7mHCQtt3Ym6CMcZsi3M
	qFPT5RR/V+5KPOPy2xk9uBLuqoNDEic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747306244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/qNpTQzW1ix+mWdll1CtoN0CpW/oAw/IKtBbs+PhAc=;
	b=/I4HLFs6G/gRVlU9qJeGsQe9QeQ/3Go7SLIqg5IWKNWe4vRgwW0hFSxM3QzS4ap5ZNF3Oo
	VAWpmtmDrPXtJtBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pxir6h4x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/I4HLFs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747306244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/qNpTQzW1ix+mWdll1CtoN0CpW/oAw/IKtBbs+PhAc=;
	b=pxir6h4xlX+fZq0zJPvcEU/HogrXwYzZ+MrtlZL7ZjNrg9T3St4EA6CZeV5TLVri6cNne6
	PVGxWdK03/cy2rwSvlXiI10/LTNLAwmJJjgTmIADDy/4MJWYccL7mHCQtt3Ym6CMcZsi3M
	qFPT5RR/V+5KPOPy2xk9uBLuqoNDEic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747306244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/qNpTQzW1ix+mWdll1CtoN0CpW/oAw/IKtBbs+PhAc=;
	b=/I4HLFs6G/gRVlU9qJeGsQe9QeQ/3Go7SLIqg5IWKNWe4vRgwW0hFSxM3QzS4ap5ZNF3Oo
	VAWpmtmDrPXtJtBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85C35137E8;
	Thu, 15 May 2025 10:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3w9WHwTHJWibaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 May 2025 10:50:44 +0000
Date: Thu, 15 May 2025 12:50:44 +0200
Message-ID: <87jz6irvuj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Franti=B9ek_Ku=E8era?= <franta-linux@frantovo.cz>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Rename Pioneer mixer channel controls
In-Reply-To: <20250515011825.3932-1-franta-linux@frantovo.cz>
References: <20250515011825.3932-1-franta-linux@frantovo.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B00A91F391
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.51

On Thu, 15 May 2025 03:18:25 +0200,
Franti¹ek Kuèera wrote:
> 
> so alsamixer can show the controls in correct categories: capture/playback
> 
> Signed-off-by: Franti¹ek Kuèera <franta-linux@frantovo.cz>
> ---
>  Documentation/sound/designs/control-names.rst |   2 +
>  sound/usb/mixer_quirks.c                      | 104 +++++++++---------
>  2 files changed, 54 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/sound/designs/control-names.rst b/Documentation/sound/designs/control-names.rst
> index 765ff9b5b7d9..e139aa8ab523 100644
> --- a/Documentation/sound/designs/control-names.rst
> +++ b/Documentation/sound/designs/control-names.rst
> @@ -92,6 +92,8 @@ SPDIF			output only
>  SPDIF In
>  Digital In
>  HDMI/DP			either HDMI or DisplayPort
> +Input 1			generic mixer inputs - capture (1,2,3...n)
> +Output 1		generic mixer outputs - playback (1,2,3...n)
>  ===================	=================================================
>  
>  Exceptions (deprecated)

I'd rather leave this document untouched.  If any, it should be a
separate patch.

Also, please give Fixes tag as it's a correction of the existing
code.


thanks,

Takashi
