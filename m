Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1639936D
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310412; cv=none; b=I9MGYIl+Z8Zs/vWJc7PbRqt8B1dZi6UtsxlCwHHp6VH1WRcxBUfZPeiw9fbbSV6glWXgQ0BLRNcQhmckJ0+Tv0BcWnw01eQCSj/qUI3aLdwNV1aO7et7XEi3tYjPCY8wPBpz2lgrU0HctOzpMgsU3n6tc6xoZIcvvhuXl2jXvoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310412; c=relaxed/simple;
	bh=P5EtY51NkCmtxT58F6Jn9YyaikmEnjrwNzvVHHzI3QU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8L8eMlwsf8+UhIXvNIzuAqaxyoglUMLlY9MUhG5TASjKX9JiQT+AzTmLJ5jAk0UlueuLnEvEBqfvajTtMNez9qHX4e2/qQoCTUvsbRvFBkV3xsdssmRX3k82Vo7rGPIiiARr2SZPWGkVM3Qcan1aw6Dqt3ykB9MO8orOX8kglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NYxRFHB3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uAXPkzV+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DrPq38FF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JrFsJYYR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NYxRFHB3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uAXPkzV+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DrPq38FF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JrFsJYYR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78B613E10;
	Wed, 29 Jul 2026 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785310394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zk35HyKicj56O5mo0Tb82wlJPzGLaoxW2DL0TxFyIGM=;
	b=NYxRFHB3qDtuVPajs+63sFT/FmoCxy+hGCMi63r7buFVc2xs1elYkvaFvvvgBGdyVfoa2l
	c13mLuhIzvA+QHmqdYr8L5fjnjSP+Lusvk7sL0YV2WjOr5ClL+RGw9eUnkjBg/F0zm3aUQ
	h0mGRljsK2agl8Pu4VJvq+3pmg2buN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785310394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zk35HyKicj56O5mo0Tb82wlJPzGLaoxW2DL0TxFyIGM=;
	b=uAXPkzV+z3wIds7fETze24+2++9CV89MaVcJ6MgvTMF2mfIpWxOwX6nqFBhzSW+ib4LnkY
	buTp+/BFHfu4lKDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785310390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zk35HyKicj56O5mo0Tb82wlJPzGLaoxW2DL0TxFyIGM=;
	b=DrPq38FFwZMBTsZ02dTQczOGVdYuOed3Kqggegp2a9Vcm0in0GphAfaM2MUjdBhYVBSGDv
	KIgzqLiIgIAv9yYxKblO4myfxj8Diw27pYwGxuACzAvsmndmj1tPdLfXT41VJ22F6OtjC+
	ZfFUnECkWId7HvFjykP8p220ONyQ+JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785310390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zk35HyKicj56O5mo0Tb82wlJPzGLaoxW2DL0TxFyIGM=;
	b=JrFsJYYRqH3Vy0gtRIppqtMKJtfkkMShPIjSw2PqGJKXhZAZ+V3CYLCTi+pZLgvxjYDfYD
	7h0iT2u6ayBHxWBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B9AF779A1;
	Wed, 29 Jul 2026 07:33:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M8QtEbasaWqZGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:33:10 +0000
Date: Wed, 29 Jul 2026 09:33:09 +0200
Message-ID: <87fr125jyi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: Re: [PATCH 1/2] ALSA: hda/conexant: Fix EAPD pin array overflow
In-Reply-To: <20260729070935.548050-1-wangdich9700@163.com>
References: <20260729070935.548050-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]

On Wed, 29 Jul 2026 09:09:34 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The bounds check in cx_auto_parse_eapd() happens after the write,
> so when a codec has more than 4 EAPD pins the 5th one gets written
> to eapds[4] which is past the end of the array and clobbers the
> adjacent dynamic_eapd field.


No, it checks right after the increment, then aborts the loop.  So any
overwrite won't happen.


Takashi

> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/conexant.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 40da2832ba66..e7a2a073d22c 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -100,9 +100,9 @@ static void cx_auto_parse_eapd(struct hda_codec *codec)
>  			continue;
>  		if (!(snd_hda_query_pin_caps(codec, nid) & AC_PINCAP_EAPD))
>  			continue;
> -		spec->eapds[spec->num_eapds++] = nid;
>  		if (spec->num_eapds >= ARRAY_SIZE(spec->eapds))
>  			break;
> +		spec->eapds[spec->num_eapds++] = nid;
>  	}
>  
>  	/* NOTE: below is a wild guess; if we have more than two EAPDs,
> -- 
> 2.25.1
> 
