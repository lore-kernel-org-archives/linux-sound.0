Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE91A9F85
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416793; cv=none; b=CCvq5ppXMfKX0Nm2d6VbzINOdPmkoJs/DnBkS++OPhKKiYqD9HJrG+Qr1lD7myKwC+uqyyR/Z0dyB7noIXqhlhXgSil7MzqizXphyqtEbUtEPnaC0mzzpm9T0vUCsCvTro2mfZvyt5AtUOLOhYv5sxBF/ECG+QpQcERl6F1H7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416793; c=relaxed/simple;
	bh=lisRWWzFncbaqiG+EsdEGSBTI+jxC97ljTzxlaZHzWA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQK0KkSskR9XVFDaO4sL/xCsPeLKvkK5uM24mS0dJ2kIgSD1apkVtCJcxeMspRogbTvcYFnh4dBa2bz5HgH5pS+jxDOtjHhmdmFcb/kzoLFnu4f7NkpSmQGYqmfVhiWUV4ZJJLRlAbWP716d4xafbT1avR4ChadcKGgxkroaStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ce2Of952; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k7bsQI41; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ewc3JEQe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hgq5EACP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ce2Of952";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k7bsQI41";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ewc3JEQe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hgq5EACP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA496337DF;
	Mon, 26 Jan 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PjUH8H9kKVpbPvPGWNFITCFDJY0LuSQNcSs8G0ECvaQ=;
	b=Ce2Of952PODhbvxPkpg+scFDOWQB1aVIr59qU4gCVPX2WpQaDmyxo+NKfk0sEuzSfivKqp
	wQqO+vyWrVwS5njTFFtIYYyxcsRMdP0iAl9xgQ7RfzNRpfzuZhiyD5eWvFvkC0bFr1r1Wj
	TTHFXyjBHmXnS/pE51UuC5k9WPbBnFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PjUH8H9kKVpbPvPGWNFITCFDJY0LuSQNcSs8G0ECvaQ=;
	b=k7bsQI41HkR9RfAfphDjbYcNT7YlCR5E/RAnKa/gRD9x2nDhqM/FvoZhK65LEjhiMOxp+P
	rvLblWABfo/FxWBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ewc3JEQe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hgq5EACP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PjUH8H9kKVpbPvPGWNFITCFDJY0LuSQNcSs8G0ECvaQ=;
	b=Ewc3JEQe2NT7uIKgty6WsmjinyvCBtP/qotvmQa7tbWmaLWdyS8t3KahMI950vG1JhbTMO
	Lr9Yp8vL7YAT2DMe4vd8u0tA8MdRW9KZijHEScfVCp3Qax1sH9bDIIwfHQH6JKHT3sYIbI
	k4HJLN8eRr2mHler9H9jIziTC1vqy6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PjUH8H9kKVpbPvPGWNFITCFDJY0LuSQNcSs8G0ECvaQ=;
	b=hgq5EACPTCi4FGz26xTWFXWkE33DXgQ+NGoUNzo9b9uxcaqaRj7TlmXRoz+rwdsvhb3vJq
	DLox6H+0cSIaYoBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E1A5139F0;
	Mon, 26 Jan 2026 08:39:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qr8yJVUod2lIKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Jan 2026 08:39:49 +0000
Date: Mon, 26 Jan 2026 09:39:49 +0100
Message-ID: <87pl6wbwdm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	phasta@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: lx6464es: fix a error handling in lx_hardware_open()
In-Reply-To: <20260126011854.2447350-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260126011854.2447350-1-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,iscas.ac.cn:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DA496337DF
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 26 Jan 2026 02:18:54 +0100,
Haoxiang Li wrote:
> 
> In lx_hardware_open(), if lx_set_granularity() fails,
> call lx_pipe_release() to release the resoueces.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Thanks for the patch.  But beware that this isn't about the kernel
resource allocation or free, but rather the manipulation of the
chip-inside configuration.  So there is no memory leak or such.

And, this doesn't look like the only place that leads to the
unbalanced / unexpected configuration, and we might need to address
all...


Takashi

> ---
>  sound/pci/lx6464es/lx6464es.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
> index 96df00db51d5..af8d614381b5 100644
> --- a/sound/pci/lx6464es/lx6464es.c
> +++ b/sound/pci/lx6464es/lx6464es.c
> @@ -113,6 +113,7 @@ static int lx_hardware_open(struct lx6464es *chip,
>  	if (err < 0) {
>  		dev_err(chip->card->dev, "setting granularity to %ld failed\n",
>  			   period_size);
> +		lx_pipe_release(chip, 0, is_capture);
>  		return err;
>  	}
>  
> -- 
> 2.25.1
> 
