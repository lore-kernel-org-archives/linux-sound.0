Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504639B963
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910093; cv=none; b=ZIKgtroYf6NrakIuDT6MOv5O0jptSMh2XF8aT9eCbGQYy1EzuZZ5l1I2857EaxRldMsGz8t751db+g4DFGeeJKSWX2LqUUBtgVxJyg9UHoJdK1Ie+AddiqTpG+sRSOVsuwQ4OT7fUUSKYDVz3+I+SCL6lPlMj92YLDf+rO0arGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910093; c=relaxed/simple;
	bh=FMjrHNFmUqjlBGQY5RY0utAd+6ahWkQZyi88DbQ+xPk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+3w46vxvpci6sbO1kB1VTB4nJKCiIRGWXlmR3n0eXIwy53ZgnZMGD28svOlEWQh1HClQlXZk4l9D7k1ixMCYUfWtXWOWrZThZXJ4317JAHC+gVgWoxt+sxqo9dsN8iSDNjTSnN/9FnnwJsRtAdxwb9UGf+rryWOSJcBsXT0co4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxsjRs5c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0Sk+wPPK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxsjRs5c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0Sk+wPPK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxsjRs5c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Sk+wPPK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxsjRs5c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Sk+wPPK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2DFA26B3B4;
	Mon,  4 May 2026 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777910090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SONQIkEDjZkB+vWAp4p6rZseLlEQc9CP/gntqZYUMWU=;
	b=JxsjRs5cXuedbH85Rwvb+zkDIRMIXNKDP4K/0yxpHeEWPu8DHy6PQahp9KINXCkGM4tDyJ
	WQjju1Cn9d3/AHZed+6QYWoRWevrv34i/cE9kQrExtztvIl69W1oWksHil2E/I2ji5GE9h
	QFCeSUZTBfVZsztEB/t1GUFE0LAo5VI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777910090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SONQIkEDjZkB+vWAp4p6rZseLlEQc9CP/gntqZYUMWU=;
	b=0Sk+wPPKqrfZZepwQjZc42u4/hao2W5BIj7ATwQkgwxVwlj+ZVqY7ZMxCM8YGeG3wEyzSG
	ASym+UJn+en4iBDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777910090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SONQIkEDjZkB+vWAp4p6rZseLlEQc9CP/gntqZYUMWU=;
	b=JxsjRs5cXuedbH85Rwvb+zkDIRMIXNKDP4K/0yxpHeEWPu8DHy6PQahp9KINXCkGM4tDyJ
	WQjju1Cn9d3/AHZed+6QYWoRWevrv34i/cE9kQrExtztvIl69W1oWksHil2E/I2ji5GE9h
	QFCeSUZTBfVZsztEB/t1GUFE0LAo5VI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777910090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SONQIkEDjZkB+vWAp4p6rZseLlEQc9CP/gntqZYUMWU=;
	b=0Sk+wPPKqrfZZepwQjZc42u4/hao2W5BIj7ATwQkgwxVwlj+ZVqY7ZMxCM8YGeG3wEyzSG
	ASym+UJn+en4iBDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01F1C593A3;
	Mon,  4 May 2026 15:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hb6vOknB+GkVMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 15:54:49 +0000
Date: Mon, 04 May 2026 17:54:49 +0200
Message-ID: <87qznrw4om.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rodrigo Faria <rodrigofilipefaria@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
In-Reply-To: <20260504145337.8740-1-rodrigofilipefaria@gmail.com>
References: <20260504145337.8740-1-rodrigofilipefaria@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, 04 May 2026 16:53:37 +0200,
Rodrigo Faria wrote:
> 
> Add a new fixup for the mute LED on the HP Pavilion 15-cs series
> using the VREF on NID 0x1b. These models will no longer fall back
> to the generic 103c:0000.

So your model has a PCI SSID *:0000?  Or what does this mean exactly?

> Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index a9cd03bb7..1db72bf28 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1669,6 +1669,20 @@ static void alc295_fixup_hp_mute_led_coefbit11(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
> +						 const struct hda_fixup *fix,
> +						 int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc269_fixup_hp_mute_led(codec, fix, action);
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->mute_led_nid = 0x1b;
> +		spec->mute_led_polarity = 0;
> +	}

Hm, the BIOS gives a wrong pin number via DMI?
This bug pattern is new.

I can take the patch, but I'd like to understand better what's going
on.


thanks,

Takashi
