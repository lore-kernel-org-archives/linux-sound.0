Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01038A73B
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262768; cv=none; b=FhHpwpoTLgwDw5CLP2fPjA2gpWd5Sg/RTM4IVYxg2ZACOw/U05T0qyT3N0b9eNcnyek+yF65QyTFqe7xOKjOMPyFxfrslpYHby9HarkPEP5FKVFUJTcI/RW9DDor75AaF+RjaUydZdFlLMdI7s6hikRZUsWJpQp1i+uHMbZ3wP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262768; c=relaxed/simple;
	bh=G4fGSPI3pt0FHxMf3UGpspbTXHRogrrwQYQ/0XxO+aI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbOMKs8AchLjfDLCFGebLntAHJiB4S/5cvCqz6x0rIjSqc4GMfAEY7kcUMD4AnX6g4kdchJicUAistoOcBecwbEFWumYfhbjVoJcEShzuyD2j1yTd0Fw6VuDhxcyKP15RlV/AMBFaoI44svanWfEBB6uPa5cAqAxFOJ3bSvsXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NiY08w1k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pqtQAGRJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ACwd5EKQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iYbVjGJo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NiY08w1k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pqtQAGRJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ACwd5EKQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iYbVjGJo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D82C01F82C;
	Tue,  1 Sep 2026 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788262761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKM3j4zYBwi9OS8xzj2MIGIJosd4EwBneCmo5B2uJfY=;
	b=NiY08w1kHnXhRnDUPRCodyA9x0r0jngofq5MGaVt7y9Bc/yhSLmGi/I/g6CgnQa+APGs6t
	mZWIAPrkwHg4aIfwLg3eu5O7hze/XEPj4sMb4UpXfdNzyQudfZVbfvpscWeylPdt2AlQIa
	13krOOQNNoK+vRGIA47CNIKAqE7T5G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788262761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKM3j4zYBwi9OS8xzj2MIGIJosd4EwBneCmo5B2uJfY=;
	b=pqtQAGRJzxH6bD3lzlhpCcgGl8/IW3Uun91BJ6bLOlQaKiCIsWtHgbFfaQIYE729obvOj8
	LcZBO43nAaJQW5AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788262756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKM3j4zYBwi9OS8xzj2MIGIJosd4EwBneCmo5B2uJfY=;
	b=ACwd5EKQOJpqqFQKFekxVsf9IGCYTSfiHxTf+n08PNAfvNLDOYDTzEI0tkYeQuNpQlPi57
	TU9OUVAjSlroUuFNNZmvmajDYg/d/YuW4tXhKBEaQkJ0GHHoEDTNny+UBcLhPstCu7wxDS
	2pypGnX70HUx+60GcHmd6iG0Ts3UhKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788262756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKM3j4zYBwi9OS8xzj2MIGIJosd4EwBneCmo5B2uJfY=;
	b=iYbVjGJoyywP9xegr0wh+J2D1kDB7TUgurE6QDBlRFuOZ3Hw9UYfI5foji0jZ5fJDYDGtX
	EDnEAuZwD6pYVsDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7C71136A2;
	Tue,  1 Sep 2026 11:39:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ySRYKGS5lmojRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 11:39:16 +0000
Date: Tue, 01 Sep 2026 13:39:16 +0200
Message-ID: <87tso9ciaj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/10] ALSA: hda: ext: Clean up links if their initialization fails
In-Reply-To: <20260831164233.1487766-2-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
	<20260831164233.1487766-2-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,intel.com:email]

On Mon, 31 Aug 2026 18:42:24 +0200,
Cezary Rojewski wrote:
> 
> snd_hdac_ext_bus_get_ml_capabilities() allocates the hlink nodes
> one-by-one but the procedure may fails due to -ENOMEM in the middle of
> it. Clean up the list before returning the error code to simply the
> function usage.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/hda/core/ext/controller.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/hda/core/ext/controller.c b/sound/hda/core/ext/controller.c
> index b1f1eff1d181..f75d3dcc6cb2 100644
> --- a/sound/hda/core/ext/controller.c
> +++ b/sound/hda/core/ext/controller.c
> @@ -81,7 +81,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
>  {
>  	int idx;
>  	u32 link_count;
> -	struct hdac_ext_link *hlink;
> +	struct hdac_ext_link *hlink, *save;
>  	u32 leptr;
>  
>  	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
> @@ -91,7 +91,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
>  	for (idx = 0; idx < link_count; idx++) {
>  		hlink = kzalloc_obj(*hlink);
>  		if (!hlink)
> -			return -ENOMEM;
> +			goto err_nomem;
>  		hlink->index = idx;
>  		hlink->bus = bus;
>  		hlink->ml_addr = bus->mlcap + AZX_ML_BASE +
> @@ -112,6 +112,13 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
>  	}
>  
>  	return 0;
> +
> +err_nomem:
> +	list_for_each_entry_safe(hlink, save, &bus->hlink_list, list) {
> +		list_del(&hlink->list);
> +		kfree(hlink);
> +	}

You can simply call snd_hdac_ext_link_free_all() instead?


thanks,

Takashi
