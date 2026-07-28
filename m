Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC0266B72
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227841; cv=none; b=aid1D/qUwtwTu5ORmqzqG0ETCKryBIWBT+Tx6TpEuw0PVsQ91oIPD80U9lCQ0dpcwo5itZgUN6tYZQm8kyQsHtoGfqEF0B0Sx34P+YgqlJVKqDaYVOLCtjH/JVCONU39gF9HPnULL6z1vtFopM62OsixBkn8fPi0Y9jca3zSclU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227841; c=relaxed/simple;
	bh=geSQgQTk7Md2Hz3s8SEBCkFnKPiUiCYO9QC/1bGII1s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRIcpI0wTaP6ckJodFGDa9cEckJPOFO9QoUTKKgkQ5GBXg7KIvtt3rR/vyZKqK1gAvei6bqE/in9GSXbnEp21wNbJBXudRaI29DEf7xR0rzclPtPrPXJ3S0G2nV75eX4ZPm6fAqA05Qq/LAgfDv8/7ewVL81qffUIZT5chg1ky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q2bwU21e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=osbMU1qX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OAz6qZeb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YKwjpSPv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q2bwU21e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="osbMU1qX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OAz6qZeb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YKwjpSPv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A22243E14;
	Tue, 28 Jul 2026 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785227832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOwqmQIdvnhW2T4dh3p0pWqmjSkuT7sjLFTY5qUoA3c=;
	b=Q2bwU21eTq4grcKAljmvFn2cI1VwzcPJmnihH7c2ODxMf79hAkBos9AUuUReJewweMfEly
	sejOoo9ylR7T+T03AWtQ0fyInFkRsre7hia+AaM3QY1+k/NlFmEa+L05V/jQFshTzdL5lS
	g9qvsgHX/MS/Q3Nm/rJztya6G/5LLdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785227832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOwqmQIdvnhW2T4dh3p0pWqmjSkuT7sjLFTY5qUoA3c=;
	b=osbMU1qXKZxysdgWfS9Njre9zzTFKNwIDwANKZTR+1LvDsn4jQVLaBnZm1eDmbi2W3TrQT
	Hg+uGJeiHoVWQjBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785227828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOwqmQIdvnhW2T4dh3p0pWqmjSkuT7sjLFTY5qUoA3c=;
	b=OAz6qZebeB0tyW0vu5dgELkV7tOHT7GMcxUXZMTyBntwuNm6T2Rne5dfzJb4nsuk+yVmr7
	Y0SLPf2qe+jTmNd2/2/hbCMpZAfy/yp/cPINd29l6mmPoowEdRyHbUauulTvoJsa7wfwZp
	e225XdOSkZ/pbRTRZtA/1pTJPTd8d+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785227828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOwqmQIdvnhW2T4dh3p0pWqmjSkuT7sjLFTY5qUoA3c=;
	b=YKwjpSPvpGGFrWlwOmLn0zKy7FIFSl8scnfQAi3HMD5VN/41Tp+PUUHP1kRECB2I9T/svW
	0vKKvyuuuysDIhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ED58779B3;
	Tue, 28 Jul 2026 08:37:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rTToETRqaGrdOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 08:37:08 +0000
Date: Tue, 28 Jul 2026 10:37:07 +0200
Message-ID: <87zezb7bnw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: cassiogabrielcontato@gmail.com,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Update snd_card_new() documentation
In-Reply-To: <20260728081251.23783-1-phucduc.bui@gmail.com>
References: <20260728081251.23783-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,kernel.org,perex.cz,intel.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Tue, 28 Jul 2026 10:12:51 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The implementation of snd_card_new() now uses kzalloc_flex() instead
> of kzalloc(). Update the kernel-doc to match the implementation and
> fix the function parameter indentation.

Well, from the API documentation POV, it doesn't matter which function
is used internally.  The main point is that it does
zero-initialization.


thanks,

Takashi


> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/core/init.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> index 56dde5bd73c4..f3fa795ab932 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -162,15 +162,15 @@ static void release_card_device(struct device *dev)
>   *  @extra_size: allocate this extra size after the main soundcard structure
>   *  @card_ret: the pointer to store the created card instance
>   *
> - *  The function allocates snd_card instance via kzalloc with the given
> + *  The function allocates snd_card instance via kzalloc_flex with the given
>   *  space for the driver to use freely.  The allocated struct is stored
>   *  in the given card_ret pointer.
>   *
>   *  Return: Zero if successful or a negative error code.
>   */
>  int snd_card_new(struct device *parent, int idx, const char *xid,
> -		    struct module *module, int extra_size,
> -		    struct snd_card **card_ret)
> +		 struct module *module, int extra_size,
> +		 struct snd_card **card_ret)
>  {
>  	struct snd_card *card;
>  	int err;
> -- 
> 2.43.0
> 
