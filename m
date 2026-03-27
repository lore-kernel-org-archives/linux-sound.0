Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E632D452
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614062; cv=none; b=p7xYh4rXbBXvpPKVJPpw0g65MPbEhRpADVgi9aeF8MDkokDP+AJPuaYT9i86YdQR1L+edpwasESUwPYVTT/m2vMZj5x5eRZh/T+37LUPb+ZpPpR+3+d6VCu87OT1zGSEtKfWPFALmfFB+JbqmBdmi92lSxdqszKwyPQliRIRAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614062; c=relaxed/simple;
	bh=KrhtfZRolUehp+0dQu9wMWGQ0osdu/RxNF8hv3zCll4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H15ZdqEYTJTR2bgMwq7v4M8kcftByssyLtuo+EwBqKsIfY04ok+EqBwoG1jCumlqd+PyBdZgLx+RAu4aG9zM/buOQ7EDv5BkAwrZfomgU9uCgOJf8hbuK3juel9/HJWAoiEzt2atLYWrKsisazn5Zi9o838uBNqob+DEN/h8anQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTcDe2V3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bn80eWDl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTcDe2V3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bn80eWDl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTcDe2V3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bn80eWDl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTcDe2V3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bn80eWDl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C340E4D339;
	Fri, 27 Mar 2026 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774614059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3/0GOGjjYwxPOYQU/vTYlfUqD5n1DOSCRE7amR+ZgE=;
	b=oTcDe2V3yhaKkE4MFHgP9LvDiLgriktLZ2Kcq5Gu2GWNmwFehyDLboOKmerYBzHiAbGG2z
	nAlTrjgF75Fa+RZ11Aj8g7BH2GHKzTufh1/ZrkNRjiq1z0ZK6HSSjGjn/XEH01znqhKtP/
	dIU7tq7VgfdfGZmNvbAJjqR/q+W51OY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774614059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3/0GOGjjYwxPOYQU/vTYlfUqD5n1DOSCRE7amR+ZgE=;
	b=bn80eWDlt8ig7ZaNf1j3qa1lbfMMJLX3tfTBi1R/dS5g9DizRA11CfwP5tmlNjvhNQACs/
	JkfCw8jMNeCbphBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774614059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3/0GOGjjYwxPOYQU/vTYlfUqD5n1DOSCRE7amR+ZgE=;
	b=oTcDe2V3yhaKkE4MFHgP9LvDiLgriktLZ2Kcq5Gu2GWNmwFehyDLboOKmerYBzHiAbGG2z
	nAlTrjgF75Fa+RZ11Aj8g7BH2GHKzTufh1/ZrkNRjiq1z0ZK6HSSjGjn/XEH01znqhKtP/
	dIU7tq7VgfdfGZmNvbAJjqR/q+W51OY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774614059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3/0GOGjjYwxPOYQU/vTYlfUqD5n1DOSCRE7amR+ZgE=;
	b=bn80eWDlt8ig7ZaNf1j3qa1lbfMMJLX3tfTBi1R/dS5g9DizRA11CfwP5tmlNjvhNQACs/
	JkfCw8jMNeCbphBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9CB84A0A2;
	Fri, 27 Mar 2026 12:20:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id glciKCt2xmkmTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 12:20:59 +0000
Date: Fri, 27 Mar 2026 13:20:59 +0100
Message-ID: <87fr5lqx90.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA:usb-audio: Disable Arturia Audiofuse 16Rig
In-Reply-To: <20260319143212.149090-2-willerz@gmail.com>
References: <20260319143212.149090-1-willerz@gmail.com>
	<20260319143212.149090-2-willerz@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 19 Mar 2026 15:32:12 +0100,
Phil Willoughby wrote:
> 
> There's an out of tree driver which works for some use-cases here:
> 
> Link: https://github.com/WillerZ/arturia-af16rig-driver
> 
> Signed-off-by: Phil Willoughby <willerz@gmail.com>
> Tested-by: Phil Willoughby <willerz@gmail.com>

In general, we don't care much about the out-of-tree driver.
If it's upstreamed, of course we'd love to help.  But this kind of
change is no-go.


thanks,

Takashi

> ---
>  sound/usb/quirks-table.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index eafc0d73cca1..728a2a4b5566 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -3541,6 +3541,13 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  		}
>  	}
>  },
> +{
> +	/* Arturia AudioFuse 16Rig has an out-of-tree driver */
> +	USB_DEVICE(0x1c75, 0xaf20),
> +	QUIRK_DRIVER_INFO {
> +		.ifnum = QUIRK_NODEV_INTERFACE
> +	},
> +},
>  {
>  	/*
>  	 * Fiero SC-01 (firmware v1.0.0 @ 48 kHz)
> -- 
> 2.53.0
> 
> 
