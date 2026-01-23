Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32482DCBEC
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168847; cv=none; b=sbUmTd72VUM7pDqGVQ3iTtmEEZzaUbZorWYKUWwQKfFyCECQcxgqK1c7Y8s5ErrdLvnYCvI7DHSz3FEHcxaMpU8JduEW6Jv0+XTWkTw/mIUJZ1ZkNB7IkTxwmk+PuTmZKNBLheI6pbtqpikQuXMfREIzyxFt48rYuhtwmpk4fbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168847; c=relaxed/simple;
	bh=ZMK/V2JVvn7rtr7nA8gzmAA1uGvYqxQIGQ742fQ5g1A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DusLftCHd16AZBz6qJq6D11zu7ttpRRvix9/12NuQtUFY59aoUjA4bqleI/vh3uf3hHG9FQKM1NVWNopj1mEzYMHiCw/C4ZvOzLJyoHdqxQHyDWlvzqvrNNy6e5C0gPCnhO5Diw42rkahR09qOoVlTRbrDqlIHXXH6UJXqPZygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hRMtD8IA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UT6j7gE5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hRMtD8IA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UT6j7gE5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hRMtD8IA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UT6j7gE5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hRMtD8IA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UT6j7gE5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1AF50337C7;
	Fri, 23 Jan 2026 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ksu6PHNYZhElEdY5vP2m5d/RZZoJfS80p+lRVlqxgYw=;
	b=hRMtD8IAxXS/hCmv4JFfsJEeNCyGCQfhHqvdYz5c4Kbva0zUucLbHv19Re0N6vF4lBda6v
	pRkCP6KVg7uUikuDEnKtr1XimFUjeVzlxYvhyxu6cWi4cmFh6NdWVIUZMd333oMqkn6bZK
	LdGIp4iRVFkfAoluwq9iXRdjk5RXCZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ksu6PHNYZhElEdY5vP2m5d/RZZoJfS80p+lRVlqxgYw=;
	b=UT6j7gE5rsQ1NK+pSYqeVQyz0PtAbuHvV1e3Qu9HdabOb8hrPpyfoOcnHoBIcWBJ/kO7zc
	YbRfyFD9MseF9QCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ksu6PHNYZhElEdY5vP2m5d/RZZoJfS80p+lRVlqxgYw=;
	b=hRMtD8IAxXS/hCmv4JFfsJEeNCyGCQfhHqvdYz5c4Kbva0zUucLbHv19Re0N6vF4lBda6v
	pRkCP6KVg7uUikuDEnKtr1XimFUjeVzlxYvhyxu6cWi4cmFh6NdWVIUZMd333oMqkn6bZK
	LdGIp4iRVFkfAoluwq9iXRdjk5RXCZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ksu6PHNYZhElEdY5vP2m5d/RZZoJfS80p+lRVlqxgYw=;
	b=UT6j7gE5rsQ1NK+pSYqeVQyz0PtAbuHvV1e3Qu9HdabOb8hrPpyfoOcnHoBIcWBJ/kO7zc
	YbRfyFD9MseF9QCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6EB0136AA;
	Fri, 23 Jan 2026 11:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5joVM8tfc2kpBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 11:47:23 +0000
Date: Fri, 23 Jan 2026 12:47:23 +0100
Message-ID: <87bjikft4k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jegor van Opdorp <derusproductions@gmail.com>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add mixer support for Focusrite Forte
In-Reply-To: <CA+Uo-nRZn7fQGWghC4nHVbEtyi4Wf0-z1okZX6hdWnYN2q_qag@mail.gmail.com>
References: <CA+Uo-nRZn7fQGWghC4nHVbEtyi4Wf0-z1okZX6hdWnYN2q_qag@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 22 Jan 2026 19:42:16 +0100,
Jegor van Opdorp wrote:
> 
> 
> Hi,
> 
> Please find attached a patch adding mixer support for the Focusrite Forte (USB
> ID 1235:8010).
> 
> This adds Forte-specific controls (source select, HPF, phantom, phase, pad,
> gain) in the Scarlett mixer driver and hooks the device up in the USB mixer
> quirk table.
> 
> Credit: this work builds on prior reverse-engineering / device work from:
> 
> https://github.com/alastair-dm/forte-mixer
> 
> Current development work/reference:
> 
> https://github.com/jopdorp/forte-mixer
> (Links are also included via Link: tags in the commit message.)
> 
> Related project PR for gui:
> https://github.com/geoffreybennett/alsa-scarlett-gui/pull/213

Could you rather put those useful info in the patch description?

About the code changes, it looks almost fine, just some minor
nitpicks:

> @@ -172,6 +178,8 @@ struct scarlett_device_info {
>  	int input_len;
>  	int output_len;
>  
> +	int has_output_source_routing;  /* 1 if device has L/R source routing */

Better to be bool?

> +static int forte_ctl_switch_info(struct snd_kcontrol *kctl,
> +				 struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = 1;
> +	return 0;
> +}

You can use snd_ctl_boolean_mono_info() instead.


thanks,

Takashi
