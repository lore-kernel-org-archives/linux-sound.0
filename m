Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2BA256C73
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805807; cv=none; b=HA5S8YGuanMgSSU7K5fGCunsskWqbTAJEkvjRjAqdFjNZcqO+aHmrZMeFs34dhYB1Dq7fSaW3NrQ8apg3gN2nj+MAJFZ+kxh/S6Tz+VbaWYN9S2LQ7KbBxM47E+gLVv8qy20rQK9zCnZyQW9yB6Y0BihZWIIf7I/tTgsW5YKaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805807; c=relaxed/simple;
	bh=MuGJpj2Qnf2g6ipZgPHKVzOuNrghvSDBj7k7WQnTBTE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScAQu68jmYAwa9c+FZ4hfr3U7Z7ISmBW65GGmKYr/TEFavp2+Ftq8z6PfK3dgVt4HRtRcqlIXKyjZieMh8QkDVt1AIK1vvA4O7JkqvtobHit1/JBy+v+yUi+6zxfN2dXg1A0zmP7WdmhD2v13GW89BRxOc8uwWpRYmUcFHcFCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M2cIYY2b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L8cvCIsU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M2cIYY2b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L8cvCIsU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M2cIYY2b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L8cvCIsU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M2cIYY2b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L8cvCIsU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 977B42116C;
	Fri, 13 Jun 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntBvV81QWuCqZkSb0W5UPQYi2OXq6oNuUU7NsQ10lEA=;
	b=M2cIYY2byCF98aOJUypxC4xoomguGZda9n+btAfdbwHWxgo1sWLlQH5nNf/BRYbYiKiU7f
	pcuSRYJ9hoYACEfXa9F/X4AgY1EPU59v1OKE8zDa04pFvT9P9GKa83cID33w/tqySuQN9A
	w48oNQ0+uh8G+lhNagCd9nqvHkel73k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntBvV81QWuCqZkSb0W5UPQYi2OXq6oNuUU7NsQ10lEA=;
	b=L8cvCIsU+7s8EfJ3vYzQ3TIjQDSQEzf6BkEOyw1R51ZmBL1ShRS7ttgm6POA0OJlq8PhmQ
	0Me7tjqs1KuVfOBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M2cIYY2b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L8cvCIsU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntBvV81QWuCqZkSb0W5UPQYi2OXq6oNuUU7NsQ10lEA=;
	b=M2cIYY2byCF98aOJUypxC4xoomguGZda9n+btAfdbwHWxgo1sWLlQH5nNf/BRYbYiKiU7f
	pcuSRYJ9hoYACEfXa9F/X4AgY1EPU59v1OKE8zDa04pFvT9P9GKa83cID33w/tqySuQN9A
	w48oNQ0+uh8G+lhNagCd9nqvHkel73k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntBvV81QWuCqZkSb0W5UPQYi2OXq6oNuUU7NsQ10lEA=;
	b=L8cvCIsU+7s8EfJ3vYzQ3TIjQDSQEzf6BkEOyw1R51ZmBL1ShRS7ttgm6POA0OJlq8PhmQ
	0Me7tjqs1KuVfOBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FCD9137FE;
	Fri, 13 Jun 2025 09:10:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BVyuGevqS2giNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 09:10:03 +0000
Date: Fri, 13 Jun 2025 11:10:03 +0200
Message-ID: <87cyb8ror8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Add resume function
In-Reply-To: <20250613083044.125916-1-zhangyongzhen@kylinos.cn>
References: <20250613083044.125916-1-zhangyongzhen@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 977B42116C
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 13 Jun 2025 10:30:44 +0200,
Yongzhen Zhang wrote:
> 
> During S3 sleep state, if headphones are unplugged, we need to re-report
> their status during the wake phase to ensure proper headphone presence
> detection after system resume.
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>  sound/pci/hda/patch_conexant.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> index 34874039ad45..c77629378879 100644
> --- a/sound/pci/hda/patch_conexant.c
> +++ b/sound/pci/hda/patch_conexant.c
> @@ -264,6 +264,13 @@ static int cx_auto_suspend(struct hda_codec *codec)
>  	return 0;
>  }
>  
> +static int cx_auto_resume(struct hda_codec *codec)
> +{
> +	cx_auto_init(codec);
> +	snd_hda_jack_report_sync(codec);
> +	return 0;
> +}

Hm, this shouldn't be needed.  When no resume callback is set, the
hda-codec core calls:
	codec->patch_ops.init(codec);
	snd_hda_regmap_sync(codec);
and right afterwards
	snd_hda_jack_report_sync(codec);

See hda_call_codec_resume().


thanks,

Takashi
