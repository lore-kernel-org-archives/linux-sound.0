Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAC3659FD
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495301; cv=none; b=U8dQMM7G5CalCxbBZ+IiLkVCvLrrvB+LQtnBa8tt9ADg025ZOhoY/inxJW4NrLk8H2UrBKlhh+s1lpcUQWYz76dwNypJznRJpxvAGCxB4LF9QngqcqK4AwPT6/Iv2/BNWvcuz7ZAICpX6fyJMIFgQtQkJyxc3OqLaCHWz+fJuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495301; c=relaxed/simple;
	bh=/Qid3hkUBpASpuLf29wSkgrdvJStJoAAH5tTwsjosZo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfoy0GPTYcEG1q8Rlgf+BwIZWOU0bZlK7JKieq+QPPICPLhmCSeVwXeaqmCp5aaKuLHfRDjldQP/BgF+9XRn8mQLrbX3lVyFd79MTp1ozA+BphB1qf5ZmGOATxzMOzgxcNVIFarD/BEJPVPcNycgYz/Upu4+1UMaQwCEW+k9ULk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+KsUw8e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LXdeMflM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+KsUw8e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LXdeMflM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W+KsUw8e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LXdeMflM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W+KsUw8e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LXdeMflM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AF974D2C4;
	Sat, 14 Mar 2026 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=W+KsUw8estAzwHfs7c1yunKEkL0AhP65tvzHcohon+J5Bpdh1vCC05Xk6uOk8fg15E3DJL
	qivxSgoBnZr71SbnMYu22FHkUPjuZOlRcMFkVbCKTqp25sOSR2J1+6xAJbrkLQxreoRxZl
	ZIKuCdEjFrpHd7jbTyWSP/0COQA9hhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=LXdeMflMnq4JtEguRhPtm1JGXtCNnCE/6P6ow35SCL54s0SWEPakygULh7wnB+fAVZNad4
	KBwT/rIrpD2N/RBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W+KsUw8e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LXdeMflM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=W+KsUw8estAzwHfs7c1yunKEkL0AhP65tvzHcohon+J5Bpdh1vCC05Xk6uOk8fg15E3DJL
	qivxSgoBnZr71SbnMYu22FHkUPjuZOlRcMFkVbCKTqp25sOSR2J1+6xAJbrkLQxreoRxZl
	ZIKuCdEjFrpHd7jbTyWSP/0COQA9hhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=LXdeMflMnq4JtEguRhPtm1JGXtCNnCE/6P6ow35SCL54s0SWEPakygULh7wnB+fAVZNad4
	KBwT/rIrpD2N/RBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4265C42724;
	Sat, 14 Mar 2026 13:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7K6hDgFktWmaDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:34:57 +0000
Date: Sat, 14 Mar 2026 14:34:56 +0100
Message-ID: <87tsuia60v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Myroslav Demchenko <myro@myromyro.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mirademche@gmail.com
Subject: Re: [PATCH] docs: sound: clarify PulseAudio and PipeWire configuration description
In-Reply-To: <20260313120140.45022-1-myro@myromyro.com>
References: <20260313120140.45022-1-myro@myromyro.com>
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
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8AF974D2C4

On Fri, 13 Mar 2026 13:01:40 +0100,
Myroslav Demchenko wrote:
> 
> Modern sound servers such as PulseAudio and PipeWire support dynamic
> configuration, so this feature is rarely needed today. However, it
> was useful in the past when audio setups relied on static configuration.

Hmm, I don't see much difference in the information you changed.
Is it just a rephrase of the same context?  The new text also doesn't
improve so significantly, honestly speaking.

Also the patch description is just a copy of the documentation, which
also doesn't help for understanding about your change.  It should
clarify what changed for which reason.


thanks,

Takashi


> 
> Signed-off-by: Myroslav Demchenko <myro@myromyro.com>
> ---
>  Documentation/sound/alsa-configuration.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
> index 55b845d38236..a3d8da5a3f6c 100644
> --- a/Documentation/sound/alsa-configuration.rst
> +++ b/Documentation/sound/alsa-configuration.rst
> @@ -142,9 +142,9 @@ in primary usage, and people would like to assign it as the first
>  appearing card. They can do it by specifying "index=1,0" module
>  parameter, which will swap the assignment slots.
>  
> -Today, with the sound backend like PulseAudio and PipeWire which
> -supports dynamic configuration, it's of little use, but that was a
> -help for static configuration in the past.
> +Today, sound servers such as PulseAudio and PipeWire support dynamic
> +configuration, so this feature is rarely needed. However, it was
> +useful in the past when audio setups relied on static configuration.
>  
>  Module snd-adlib
>  ----------------
> -- 
> 2.53.0
> 
