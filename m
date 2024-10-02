Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB013CFA6
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897759; cv=none; b=WTfrcEbg3nUD4CkVXFMHnEyS/ywQQb66nVcGlYx3MOCE4xM9/1mnJNdJ0yVOhOg9MZyQ9jMlxKfRF/t4yQYMn/k9FKxwJorzE0Cd/o4TtZOM15ED+F4c7ZzuFwfl1Syh8oB8eS3RE7L15EbCp8iq5NY5oxJ4e/p7cTKjyNQtN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897759; c=relaxed/simple;
	bh=lxubPs3pK4iZsOorsHMHefP7CzUy3ooGj0aU9aZUYZY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZSkbeskSJDOFapi4QTVAzCQPN5GxatwsfbgAgSvlyWO9oByoJvMp1lyppkg9+lKN+8k02OdRD1i2/gfHHvOhbsvn3fKKGSVa4RKS/jnwpwY3KkSSRagewLD04xiUE4sETRP0kWDO//Os+oCdy0tmehrUgTlUtZ2cNoLQf046a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vSLweW9s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ScMkYZnr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z7SRPtEM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ybvfmKz9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vSLweW9s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ScMkYZnr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z7SRPtEM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ybvfmKz9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1EA921CA1;
	Wed,  2 Oct 2024 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727897756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvJyqVnaeuvkctP3eVIMf/XVJJInmuDJ/eur119nCuc=;
	b=vSLweW9sVeB8wA7/pqYhS6wQMlqLiIOQd2+nwH3MgZtJhAGE6Two1ShonmKruwNh1oPtEF
	XaaBzWRkUx6NJNEC5S0cXjOaewBkOLGu9hGX0+VaPqJefP4VvcA/jkbYHyPVnQz5Z25PL6
	WESVDwqQHkUkU5PV7OujmEIRTe7qBCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727897756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvJyqVnaeuvkctP3eVIMf/XVJJInmuDJ/eur119nCuc=;
	b=ScMkYZnrdl3u26WwDZ8KakNTqJIkG5qMNbbDyRmsk3OWJIzUArSa6BZNMd5/la9dwCCNJR
	GYN6ihsPNgWzm1Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727897755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvJyqVnaeuvkctP3eVIMf/XVJJInmuDJ/eur119nCuc=;
	b=z7SRPtEMHHhVm3KVBSyS4Oi8fFLRUAzGpblB2MwepwULHGNDiZIaDmByT4eWt+vjrVHUvH
	x6wb83ck3+gqMWU59nZJ+po8p/LZtfttNYfTMP7998ZYN9s3OX0r3y2hxtao7cTbiCA/Ck
	SUH73aJ3yKuRYhQ+ExQx74iwinetazo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727897755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvJyqVnaeuvkctP3eVIMf/XVJJInmuDJ/eur119nCuc=;
	b=ybvfmKz9pHPkN1Wr/+33ENJNrstUu7r/V2ZL75yEEGtyRYbVxNJWig9AFy7JvqTZSg+uXX
	rZJgDKMGU4uNSFDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC79F13A6E;
	Wed,  2 Oct 2024 19:35:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ReEtMJug/WYMDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Oct 2024 19:35:55 +0000
Date: Wed, 02 Oct 2024 21:36:49 +0200
Message-ID: <874j5ul2jy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: =?ISO-8859-1?Q?Barnab=E1s_?= =?ISO-8859-2?Q?P=F5cze?=
 <pobrn@protonmail.com>,	"linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>,	Takashi Iwai <tiwai@suse.de>
Subject: Re: Incorrect automatic ALSA card ID when unicode is at play
In-Reply-To: <506d56d3-540e-4675-a126-347e176b8a0d@perex.cz>
References: <yk3WTvKkwheOon_LzZlJ43PPInz6byYfBzpKkbasww1yzuiMRqn7n6Y8vZcXB-xwFCu_vb8hoNjv7DTNwH5TWjpEuiVsyn9HPCEXqwF4120=@protonmail.com>
	<506d56d3-540e-4675-a126-347e176b8a0d@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[protonmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,suse.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Oct 2024 20:00:15 +0200,
Jaroslav Kysela wrote:
> 
> On 02. 10. 24 18:54, Barnabás Pőcze wrote:
> > Hi
> > 
> > 
> > When `snd_card::id` is not specified explicitly it is determined automatically
> > in `sound/core/init.c:snd_card_register()` as follows:
> > 
> >    if (*card->id) {
> >      // ...
> >    } else {
> >      /* create an id from either shortname or longname */
> >      const char *src;
> > 
> >      src = *card->shortname ? card->shortname : card->longname;
> >      snd_card_set_id_no_lock(card, src,
> >                                    retrieve_id_from_card_name(src));
> >    }
> > 
> > However, `snd_card_set_id_no_lock()`, or more specifically the `copy_valid_id_string()`
> > function that it calls does not seem to copy very well with utf-8.
> > 
> > For example, based on the report at https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4135
> > where `card->shortname="Redmi 电脑音箱"`, `card->id` will be set to \xE7\xE8\xE9\xE7,
> > which are the first bytes of the symbols in the suffix "电脑音箱" because only those
> > bytes of the string satisfy the `isalnum()` check in `copy_valid_id_string()`.
> > 
> > I am not sure what kind of 8-bit character set `isalnum()` is basing these results on, but
> > it certainly does not mix well with utf-8 in this scenario at least.
> 
> It seems that isalnum() also returns true for characters above 0x80
> (see lib/ctype.c):
> 
> 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                        /* 128-143 */
> 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                        /* 144-159 */
> _S|_SP,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,    /* 160-175 */
> _P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,        /* 176-191 */
> _U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,        /* 192-207 */
> _U,_U,_U,_U,_U,_U,_U,_P,_U,_U,_U,_U,_U,_U,_U,_L,        /* 208-223 */
> _L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,        /* 224-239 */
> _L,_L,_L,_L,_L,_L,_L,_P,_L,_L,_L,_L,_L,_L,_L,_L};       /* 240-255 */
> 
> We should probably add isacii() check like:
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> index b92aa7103589..114fb87de990 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -654,13 +654,19 @@ void snd_card_free(struct snd_card *card)
>  }
>  EXPORT_SYMBOL(snd_card_free);
> 
> +/* check, if the character is in the valid ASCII range */
> +static inline bool safe_ascii_char(char c)
> +{
> +	return isascii(c) && isalnum(c);
> +}
> +
>  /* retrieve the last word of shortname or longname */
>  static const char *retrieve_id_from_card_name(const char *name)
>  {
>  	const char *spos = name;
> 
>  	while (*name) {
> -		if (isspace(*name) && isalnum(name[1]))
> +		if (isspace(*name) && safe_ascii_char(name[1]))
>  			spos = name + 1;
>  		name++;
>  	}
> @@ -687,12 +693,12 @@ static void copy_valid_id_string(struct snd_card
> *card, const char *src,
>  {
>  	char *id = card->id;
> 
> -	while (*nid && !isalnum(*nid))
> +	while (*nid && !safe_ascii_char(*nid))
>  		nid++;
>  	if (isdigit(*nid))
>  		*id++ = isalpha(*src) ? *src : 'D';
>  	while (*nid && (size_t)(id - card->id) < sizeof(card->id) - 1) {
> -		if (isalnum(*nid))
> +		if (safe_ascii_char(*nid))
>  			*id++ = *nid;
>  		nid++;
>  	}
> @@ -787,7 +793,7 @@ static ssize_t id_store(struct device *dev, struct
> device_attribute *attr,
> 
>  	for (idx = 0; idx < copy; idx++) {
>  		c = buf[idx];
> -		if (!isalnum(c) && c != '_' && c != '-')
> +		if (!safe_ascii_char(c) && c != '_' && c != '-')
>  			return -EINVAL;
>  	}
>  	memcpy(buf1, buf, copy);
> 
> 
> Takashi, do you have a better idea?

I believe your change is fine.  Care to submit a proper fix patch?


thanks,

Takashi
