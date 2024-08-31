Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA044C99
	for <linux-sound@vger.kernel.org>; Sat, 31 Aug 2024 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725101871; cv=none; b=BeYypq56rJfkyo6kPDuQakCiMjx3bh6ANWWnPddSRMYI7OnavMUk7ilcpXcdzlHCdprsWAbyPqUB17Ks3KcYhEgjd1My4V+yY/j6u3jwTBwtmuptwHBJp/WVMUTXZnRaAsChQMwPMkLmDO1JYBcqIJrxeFI5ElNiCaA1kuRkDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725101871; c=relaxed/simple;
	bh=TDTTEdJ45JUbGSW1cnebGliSusHStKaUJb9+y0LMACw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQz+GdL49uwD8rvRqGrccGBNMq/PebIBeVF/JV+q5F8Csh2N7H+V3fb9+iaIPol+pZh6keojJPrwSoCgY++dG9atdZ0aVjg1NdIrM/RXfnouxOK8MNjlEetFsjKvWFj1FdMwbaxvCvyFDfJFjIfmXfJ9FGCCzdPrreY5r/jLwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y1hfM1N/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CIvW6b3d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y1hfM1N/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CIvW6b3d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y1hfM1N/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CIvW6b3d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y1hfM1N/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CIvW6b3d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71E281F838;
	Sat, 31 Aug 2024 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725101860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq6az45vhUW1nDJhj6rt9me3MqqDIbctZDcfHX8taw4=;
	b=y1hfM1N/9aMGruPqVBLOsW5vyvxFdc+ksNymwIXVQh5OU/Mc1SqIWmhJEqizou1rnOhekB
	1es2n5ERPk69q9Xk0RWYtpvIUf3enXyDAY1dOV7KKi1tBV97I5n6NycDb5iRjXgIklCF5X
	ZN55p+VA6ZrCqo2JzJ6QP7ppDUXF34s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725101860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq6az45vhUW1nDJhj6rt9me3MqqDIbctZDcfHX8taw4=;
	b=CIvW6b3dZdiu/tgWLV/WAhJFzB44vRgUHPZW2XzL/pH2SYt8m/6Yi98Wh5eWI41Ej4iE+d
	ZOYKT8sSR3Ep9jCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="y1hfM1N/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CIvW6b3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725101860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq6az45vhUW1nDJhj6rt9me3MqqDIbctZDcfHX8taw4=;
	b=y1hfM1N/9aMGruPqVBLOsW5vyvxFdc+ksNymwIXVQh5OU/Mc1SqIWmhJEqizou1rnOhekB
	1es2n5ERPk69q9Xk0RWYtpvIUf3enXyDAY1dOV7KKi1tBV97I5n6NycDb5iRjXgIklCF5X
	ZN55p+VA6ZrCqo2JzJ6QP7ppDUXF34s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725101860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq6az45vhUW1nDJhj6rt9me3MqqDIbctZDcfHX8taw4=;
	b=CIvW6b3dZdiu/tgWLV/WAhJFzB44vRgUHPZW2XzL/pH2SYt8m/6Yi98Wh5eWI41Ej4iE+d
	ZOYKT8sSR3Ep9jCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44FDA139D3;
	Sat, 31 Aug 2024 10:57:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p1gaDyT30mY/IgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Aug 2024 10:57:40 +0000
Date: Sat, 31 Aug 2024 12:58:25 +0200
Message-ID: <87h6b1j6we.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH -next v2] ALSA: pcm: replace simple_strtoul to kstrtoul
In-Reply-To: <20240831080639.3985143-1-lihongbo22@huawei.com>
References: <20240831080639.3985143-1-lihongbo22@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 71E281F838
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 31 Aug 2024 10:06:39 +0200,
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
> 
> ---
> v2:
>   - Avoid introducing the ret variable, suggested by Takashi.
> 
> v1: https://lore.kernel.org/all/1e4bee4b-023c-40e2-ac4a-f71299fa2efd@huawei.com/T/

Applied now.  Thanks.


Takashi
