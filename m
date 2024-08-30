Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D5516DEC7
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006127; cv=none; b=evbtb5zEswa4S6icSqRnde4Ao2Hw2M6YStcvkTGacHJs3WzcVytPrCWigvkM1vCmv4EI6i8T/Ax1njA0S/VBoMF6kdTK/KksnjJz+o0qyWCfCeZ+9Wl97UowSme/mlIo5yNRfkKKUozlFMc/1aH3fbYxg9cc4XL193ST2ArpD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006127; c=relaxed/simple;
	bh=tUIVZgUPMB3fdqimp2PXJLvTHDkQ0tc/hiCzBfUkhYs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flxMyu422n11VuELn9ctQC4YogZMSwUGcgiYTncFM2v6XM35bQqRBVNWG1jKMzCzJ5b5dn8pwaVE5vy3w4QbaLwTwFlFre4hILOjpiqYU/nLeGVKAttfJk9a6/YB5tpFzuE3hH3Lcdg7vRDsmB5kyN5TWpltDr5y76fSTc2UIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uA2xA7Cz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bUzeBYOo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uA2xA7Cz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bUzeBYOo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uA2xA7Cz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bUzeBYOo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uA2xA7Cz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bUzeBYOo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2860D21A0A;
	Fri, 30 Aug 2024 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725006124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMdSHchXyHmb0oqpRFDeoMblMBPI/kECQ2rB1XsXkE8=;
	b=uA2xA7CzaUPjiURJV3xBC2pQocRRVwc20ek3gaSfDRTT3Rhyp9GAVvGV+EuDVowAcbcBNe
	zjKAjMsFXJfXbAuJGbKBARhNbhTKK1yTBLM2IFEtOCMlscR2ZiETXQ+4UB7cV5Cah27/Gz
	2RPO+KAVjB2U5GG4A+2WefZpVWBbX0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725006124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMdSHchXyHmb0oqpRFDeoMblMBPI/kECQ2rB1XsXkE8=;
	b=bUzeBYOo8IW7Fe7V17tcOUjQA81tz7/D7+GpxbdI47h8+BjhJ/YQecvP63Fth1D90EVg2B
	OKu7MTi4yqD1w1DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725006124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMdSHchXyHmb0oqpRFDeoMblMBPI/kECQ2rB1XsXkE8=;
	b=uA2xA7CzaUPjiURJV3xBC2pQocRRVwc20ek3gaSfDRTT3Rhyp9GAVvGV+EuDVowAcbcBNe
	zjKAjMsFXJfXbAuJGbKBARhNbhTKK1yTBLM2IFEtOCMlscR2ZiETXQ+4UB7cV5Cah27/Gz
	2RPO+KAVjB2U5GG4A+2WefZpVWBbX0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725006124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMdSHchXyHmb0oqpRFDeoMblMBPI/kECQ2rB1XsXkE8=;
	b=bUzeBYOo8IW7Fe7V17tcOUjQA81tz7/D7+GpxbdI47h8+BjhJ/YQecvP63Fth1D90EVg2B
	OKu7MTi4yqD1w1DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03B4413ADE;
	Fri, 30 Aug 2024 08:22:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aWdLOyuB0WZXcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 30 Aug 2024 08:22:03 +0000
Date: Fri, 30 Aug 2024 10:22:48 +0200
Message-ID: <87frqml8rr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH -next] ALSA: pcm: replace simple_strtoul to kstrtoul
In-Reply-To: <20240830080135.3544948-1-lihongbo22@huawei.com>
References: <20240830080135.3544948-1-lihongbo22@huawei.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 30 Aug 2024 10:01:35 +0200,
Hongbo Li wrote:
> 
> As mentioned in [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly
> ignore overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
> 
> This patch replace the use of the simple_strtoul with the safer
> alternatives kstrtoul.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  sound/core/pcm_memory.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
> index 8e4c68e3bbd0..fea8bed02604 100644
> --- a/sound/core/pcm_memory.c
> +++ b/sound/core/pcm_memory.c
> @@ -185,6 +185,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
>  	char line[64], str[64];
>  	size_t size;
>  	struct snd_dma_buffer new_dmab;
> +	int ret;
>  
>  	guard(mutex)(&substream->pcm->open_mutex);
>  	if (substream->runtime) {
> @@ -193,8 +194,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
>  	}
>  	if (!snd_info_get_line(buffer, line, sizeof(line))) {
>  		snd_info_get_str(str, line, sizeof(str));
> -		size = simple_strtoul(str, NULL, 10) * 1024;
> -		if ((size != 0 && size < 8192) || size > substream->dma_max) {
> +		ret = kstrtoul(str, 10, &size);
> +		size *= 1024;
> +		if ((ret != 0) || (size != 0 && size < 8192) ||

The parentheses around "ret != 0" is superfluous.
And you can set the value to buffer->error, too.

That said, it's better not to put the ret value check in that if
block, but put another check right after kstrtoul() call.


thanks,

Takashi
