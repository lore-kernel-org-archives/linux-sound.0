Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F116242D9D
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234796; cv=none; b=LnCnJLoQP2mdbG364qEkNsFeGtqGLaM8wUSCM6LQpKA08osfuJ91C6xnXhL2srD4rZgJWpOIHfhSwZNjHjWriEq35TEKw/3LFCE1YQYab4HDo19Eftkqk9FbZx2svx+CAL/yw3ZiSMHDEUfyqY856jhhsElztnrVc2jBawmnrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234796; c=relaxed/simple;
	bh=bo0/V7RHERzJoYhkb3CUSGs+G9RcuCDE8noSfKiz25I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTUtRn9ZCq5J+VSwbD6lbhTvMYNtYm+DCC92k1EDsSQl15uwx8qj7aW0UhVt7dacdX36guMyN+yz8a5ONJtWgf7up+XqL6lmNKy98eaY9DnTFmLxi4xoWBCTPEEza/Q9cghMCa87OxKguFxbv9+bo3RlgT22fzAH+U9CWVZQfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zZYt2RZx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lzHiwmGg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zZYt2RZx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lzHiwmGg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zZYt2RZx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzHiwmGg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zZYt2RZx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzHiwmGg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C8A66B054;
	Sun, 31 May 2026 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780234793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dz8L+sxfdjn/i3TPgyHt6MJxFV5coo2k4QX5X+k+Bro=;
	b=zZYt2RZx4KHDhhLSliZ98DycPTeL2RfDJhhQ+pEW4JY085QwG9UcYvV8a5asjQpQ3OR6xW
	2xqpmJg7ApAF1flvLMzL0mYDFONQgiswLEa2OEkY+L/Z82IofjaNuQzGYzFgCjFtNSh7TA
	CcNVFUIyNvitBYzhgb/0Cw49tOq6HqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780234793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dz8L+sxfdjn/i3TPgyHt6MJxFV5coo2k4QX5X+k+Bro=;
	b=lzHiwmGgSiWw/inm2+9vhJydQCNg3U6wIBjibJfkAyhHW+HFAxQm7brm6kHa6uVK8HyjTJ
	KzxgfmczB0BMdxCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zZYt2RZx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lzHiwmGg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780234793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dz8L+sxfdjn/i3TPgyHt6MJxFV5coo2k4QX5X+k+Bro=;
	b=zZYt2RZx4KHDhhLSliZ98DycPTeL2RfDJhhQ+pEW4JY085QwG9UcYvV8a5asjQpQ3OR6xW
	2xqpmJg7ApAF1flvLMzL0mYDFONQgiswLEa2OEkY+L/Z82IofjaNuQzGYzFgCjFtNSh7TA
	CcNVFUIyNvitBYzhgb/0Cw49tOq6HqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780234793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dz8L+sxfdjn/i3TPgyHt6MJxFV5coo2k4QX5X+k+Bro=;
	b=lzHiwmGgSiWw/inm2+9vhJydQCNg3U6wIBjibJfkAyhHW+HFAxQm7brm6kHa6uVK8HyjTJ
	KzxgfmczB0BMdxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE729779A7;
	Sun, 31 May 2026 13:39:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b2ULNCg6HGpXaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 May 2026 13:39:52 +0000
Date: Sun, 31 May 2026 15:39:52 +0200
Message-ID: <871perpujb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: seq: Use flexible array for device arguments
In-Reply-To: <20260529-alsa-seq-flex-args-v1-1-bb3ff5c62d49@gmail.com>
References: <20260529-alsa-seq-flex-args-v1-1-bb3ff5c62d49@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1C8A66B054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 29 May 2026 15:12:39 +0200,
Cássio Gabriel wrote:
> 
> snd_seq_device_new() allocates struct snd_seq_device together with a
> caller-specific argument area. SNDRV_SEQ_DEVICE_ARGPTR() reaches that
> area by adding sizeof(struct snd_seq_device) to the object pointer.
> 
> Make the trailing storage explicit with a flexible array and allocate it
> with struct_size(). This makes the object layout self-describing and
> avoids open-coded size arithmetic in the allocation and accessor.
> 
> Reject negative argsize values before calculating the allocation size.
> Current in-tree callers pass either zero or sizeof() values, but the
> function takes an int size argument and should not let a negative value
> flow into unsigned allocation arithmetic.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  include/sound/seq_device.h | 3 ++-
>  sound/core/seq_device.c    | 5 ++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/seq_device.h b/include/sound/seq_device.h
> index a72380c202e9..3137d4c5f5a8 100644
> --- a/include/sound/seq_device.h
> +++ b/include/sound/seq_device.h
> @@ -22,6 +22,7 @@ struct snd_seq_device {
>  	void *private_data;	/* private data for the caller */
>  	void (*private_free)(struct snd_seq_device *device);
>  	struct device dev;
> +	unsigned char args[];	/* driver-specific argument */
>  };
>  
>  #define to_seq_dev(_dev) \
> @@ -64,7 +65,7 @@ void snd_seq_device_load_drivers(void);
>  int snd_seq_device_new(struct snd_card *card, int device, const char *id,
>  		       int argsize, struct snd_seq_device **result);
>  
> -#define SNDRV_SEQ_DEVICE_ARGPTR(dev) (void *)((char *)(dev) + sizeof(struct snd_seq_device))
> +#define SNDRV_SEQ_DEVICE_ARGPTR(dev) ((void *)(dev)->args)
>  
>  int __must_check __snd_seq_driver_register(struct snd_seq_driver *drv,
>  					   struct module *mod);
> diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
> index 1b062d6b17ea..a7b69ff07261 100644
> --- a/sound/core/seq_device.c
> +++ b/sound/core/seq_device.c
> @@ -234,7 +234,10 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
>  	if (snd_BUG_ON(!id))
>  		return -EINVAL;
>  
> -	dev = kzalloc(sizeof(*dev) + argsize, GFP_KERNEL);
> +	if (argsize < 0)
> +		return -EINVAL;
> +
> +	dev = kzalloc(struct_size(dev, args, argsize), GFP_KERNEL);
>  	if (!dev)
>  		return -ENOMEM;

IIRC, we can use kzalloc_flex() for this kind, too:

	dev = kzalloc_flex(*dev, args, argsize);


thanks,

Takashi
