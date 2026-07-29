Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228D421EFB
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310528; cv=none; b=qSZTZtjkep4qTo3ogSSx+Ex6dHwYh9bH7W+lwP29SiqpA95yihjHdbAcfTWtldmCCUG5wtWHoD7xBJwQ6WGrjH9l5CQYoFDse/iFK3Nlp2XnW5nI8hBNnhVxwmPSW7MKWRNile3FpzhERVVYUQEjDap1tnDNDsMoGFE9idoLNuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310528; c=relaxed/simple;
	bh=m5CvXTt7uHDHPPpGYW14GbmMoMhXlQsB0/awR1SHq4Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBxM1YOog+nZ6hXiz3UzeHy3UA4Cu4TANhunVTTfAmA5l/osod2nKtOysWUyYh+iIK5/i+o401RhpzOHaxebsoY1uUpYBK7uXDiIeHlpVVj35m2ErHzryhMcoaLV5FY4ozNgxo1MWZpsmHVMgqvzhQjToI/C2kNUfsWefhabXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fE4jBpHS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CJ+fqB/T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XsNM1qne; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=touunx/0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fE4jBpHS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CJ+fqB/T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XsNM1qne";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="touunx/0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 05BA73E0F;
	Wed, 29 Jul 2026 07:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785310508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVojf0S2G48H9tZpqr/Xjw6I4yVKJGqREKCcjxgU0Q4=;
	b=fE4jBpHS+hofT9frDY/bh+UCgqiB7fi6boJ3/w3WIMHkrExx9Z0VsxnRpaLzURls5Iy9Pb
	nHGElZSe14l4L0GdTA17vSuL4FnG4kfsIqymUk/h/XhYEqkIZyHqnOf5XznXWN/5H+OYHX
	I3WE9yzyvVCjmLwb4eE1ZI7Z4oDf4Fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785310508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVojf0S2G48H9tZpqr/Xjw6I4yVKJGqREKCcjxgU0Q4=;
	b=CJ+fqB/TGYeQPaQPG59VKcnz4qJizATBuSFnzw8YWVdEU8Mni4gKTkZLJ3pSJ+elKWXQyx
	SZ0LX72FheFm82Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XsNM1qne;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="touunx/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785310504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVojf0S2G48H9tZpqr/Xjw6I4yVKJGqREKCcjxgU0Q4=;
	b=XsNM1qneQxRx6cJRPRB9KkhP8KeHiAT8JHfJTS3oeTWvZi7ciqfZa2KwPsEdzJJE3A21Mq
	8312bVtd88f1snmnR0ydeGBU3t5xUxLswVUAzDwnl7/J+Ov1zV3ro+zv0vl/U/LC8/u9AD
	Kgxg/t5M4ahvNLwsmGCNb0hKDOvVEyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785310504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVojf0S2G48H9tZpqr/Xjw6I4yVKJGqREKCcjxgU0Q4=;
	b=touunx/0fBGSTGLCZU3x8fw4r9+6aLTx3hQ5wtY573VvULydR6EzfoBStO1TaDQco7X5ha
	sgYAhrE18blGudDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFF73779A1;
	Wed, 29 Jul 2026 07:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O6t3MSetaWqQGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:35:03 +0000
Date: Wed, 29 Jul 2026 09:35:03 +0200
Message-ID: <87ecgm5jvc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add missing error checks in alc269 init/shutdown
In-Reply-To: <20260729063803.1453980-1-songxiebing@kylinos.cn>
References: <20260729063803.1453980-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 05BA73E0F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Wed, 29 Jul 2026 08:38:03 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> alc_read_coef_idx() and alc_read_coefex_idx() can return -1 on error
> via snd_hda_codec_read(). Several init and shutdown functions save these
> return values and later write them back to hardware registers without
> checking for errors, potentially corrupting COEF register state on a
> read failure.
> 
> Add error checks in:
> - alc282_init() and alc282_shutup(): check coef78 before write-back
> - alc285_hp_init(): check coef38/coef0d/coef36 before update, check
>   val before write-back, and break polling loop on error
> - alc294_hp_init(): break polling loop on read error
> 
> Also add a missing NULL check for codec->bus->pci in alc269_probe()
> before dereferencing it, consistent with the existing checks in the
> same function.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Could you split the NULL check to another patch?  Basically it's a
completely different sort of fix from others.


thanks,

Takashi
