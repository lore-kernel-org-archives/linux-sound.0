Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3E22D781
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718492; cv=none; b=XJHXot2BT6Zy02kZFhKAvfBAjRfZxl0KEKxAF0wJPXkiERSijQiMUC1BfwDlAe7IVJTv03UnoclvTixdzBtaMJRaWRS3tXeMs2zpHZuImxD0jtLem78lngQ9j/n9z7Y0LZ3Y5db7AcdNqq4GwHmY/E9XCIM7bZy/ModpDPhF0E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718492; c=relaxed/simple;
	bh=q+xS3fBCrHxdi1eoU8AxCtPxkpim8olcnh5NgRpTnDA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sf55Lm+bkfDzUWlgDuVncASZpetkhZrv8HjRwuGQ4puEDH1Rid9NjtRPLIhcgtHkiJGXh2wbNJJmvLvO6G6e9MGYBraKS8BWnGSdgb0+JanYka3bExaaqzs/HDkL4zgthCS97eBqaeiVmVgaZT707+FaLp8SJp9vTuPJXQMXM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zR9wkRSt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+z+CCWgA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zR9wkRSt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+z+CCWgA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zR9wkRSt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+z+CCWgA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zR9wkRSt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+z+CCWgA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 408525BCEB;
	Thu,  9 Apr 2026 07:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775718488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YifOLBLZIBvZGhrcQrooCxtZtNqIGWwBMqxai614XmY=;
	b=zR9wkRStWNMHdDo7wtJP5bnOF1GzQseGsQe/H8rJUFD9bALwYWvvnxtw6tp/zdD9gSXm+k
	6gtv9ZgtyoNfjGrbRtt6lDcCWN/AmZCcyy104l5zKSOckSQAb79zup4v8pz2ls0oucvEbT
	hmQDbLyTpvkbYHO6xnvhPgBT4Etn30A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775718488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YifOLBLZIBvZGhrcQrooCxtZtNqIGWwBMqxai614XmY=;
	b=+z+CCWgAoJZNLSWmRjHM7eO3fPzvCeeTLLprZU5kgiWqCojU+jkkO3156GeETNduU1vYjJ
	xpupSbvW73ELUbBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775718488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YifOLBLZIBvZGhrcQrooCxtZtNqIGWwBMqxai614XmY=;
	b=zR9wkRStWNMHdDo7wtJP5bnOF1GzQseGsQe/H8rJUFD9bALwYWvvnxtw6tp/zdD9gSXm+k
	6gtv9ZgtyoNfjGrbRtt6lDcCWN/AmZCcyy104l5zKSOckSQAb79zup4v8pz2ls0oucvEbT
	hmQDbLyTpvkbYHO6xnvhPgBT4Etn30A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775718488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YifOLBLZIBvZGhrcQrooCxtZtNqIGWwBMqxai614XmY=;
	b=+z+CCWgAoJZNLSWmRjHM7eO3fPzvCeeTLLprZU5kgiWqCojU+jkkO3156GeETNduU1vYjJ
	xpupSbvW73ELUbBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A9BA4A0B3;
	Thu,  9 Apr 2026 07:08:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zM7JAFhQ12lhPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 07:08:08 +0000
Date: Thu, 09 Apr 2026 09:08:07 +0200
Message-ID: <87o6jsk3vs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Do not expose sticky volume control mixers
In-Reply-To: <20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
	<20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 08 Apr 2026 20:33:06 +0200,
Rong Zhang wrote:
> 
> Some devices expose sticky mixers that accept SET_CUR but do absolutely
> nothing. Registering mixers for them confuses userspace and results in
> ineffective volume control.
> 
> Check if the volume control is sticky by setting the volume to the
> maximum or minimum value, and prevent the mixer from being registered
> accordingly.
> 
> Quirky device sample:
> 
>   usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
>   usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 7-1: Product: Feaulle Rainbow
>   usb 7-1: Manufacturer: Generic
>   usb 7-1: SerialNumber: 20210726905926
>   (Mic Capture Volume)
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  sound/usb/mixer.c | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index a25e8145af67..9f0aed36e27d 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -27,6 +27,7 @@
>   *  	- parse available sample rates again when clock sources changed
>   */
>  
> +#include <linux/array_size.h>

It's only for ARRAY_SIZE()?  Then no need for extra inclusion.  It's
already included by others.

>  #include <linux/bitops.h>
>  #include <linux/init.h>
>  #include <linux/list.h>
> @@ -1287,17 +1288,49 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
>  		if (cval->res == 0)
>  			cval->res = 1;
>  
> -		/* Additional checks for the proper resolution
> +		/* Additional checks
> +		 *
> +		 * Some devices expose sticky mixers that accept SET_CUR
> +		 * but do absolutely nothing.
>  		 *
>  		 * Some devices report smaller resolutions than actually
>  		 * reacting.  They don't return errors but simply clip
>  		 * to the lower aligned value.
>  		 */
> -		if (cval->min + cval->res < cval->max) {
> +		if (cval->min < cval->max) {
> +			int sticky_test_values[] = { cval->min, cval->max };
>  			int last_valid_res = cval->res;
>  			int saved, test, check;
> +			bool effective = false;
> +
>  			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
>  				goto no_res_check;
> +
> +			for (i = 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> +				test = sticky_test_values[i];
> +				if (test == saved)
> +					continue;
> +				/* Assume non-sticky on failure. */
> +				if (snd_usb_set_cur_mix_value(cval, minchn, 0, test) ||
> +				    get_cur_mix_raw(cval, minchn, &check) ||
> +				    check != saved) { /* SET_CUR effective, non-sticky. */
> +					effective = true;
> +					break;
> +				}
> +			}
> +			if (!effective) {
> +				usb_audio_warn(cval->head.mixer->chip,
> +					"%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
> +					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> +					cval->min, cval->max, cval->res, saved);
> +
> +				cval->initialized = 1;
> +				cval->min = cval->max = cval->res = 0;
> +				return -ENODEV;
> +			}
> +
> +			if (cval->min + cval->res >= cval->max)
> +				goto no_res_check;

Hm, it's quite lots of changes, and I'd like this to be factored out
as a function instead.  Maybe the resolution check code could be moved
into a function, too; get_min_max_with_quirks() is too lengthy.

Also, note that currently there is no error check for get_min_max*().
Your code works just because you set cval->min = cval->max, and there
is an additional check at a later point of this.

Ideally speaking, we should have an error check to explicitly handle a
case like this.  But the current code allows the error at init, at
least, we tolerate the errors at reading UAC_GET_MIN and _MAX.  So, if
any, the error check would need to evaluate the error number and
ignore -EINVAL or such...


thanks,

Takashi
