Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86F2E7BB6
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531521; cv=none; b=Mntw177ImqgV9COnPW/q69lIPOp0/U4cdwMQX27m6PuPD5FvRcXmOUZ6BZPucWnSXw4clqA0Qwr3s9vagLX7IXEPop4ykAhCp7QBNlaug3u8FCv8OEpWmj/lo4TgNmhZ7DpgEwGBKB+OBWtHRcth6/2bbR7P0nySkpKl7TLNfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531521; c=relaxed/simple;
	bh=K2m1SeBOQJe1rOkcFz4ssIUrdhLfWVdtUAMYK20hk3M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltXmHPieVHKJTNKuHsdZ7H04iWK8AaL49L4jukcSXRwj2kJwUBBaH5T6+X52RdAnZBcxskk7bNLXI2ybDg+4/5Bg8XLRE69ySVbR6uHfRdvPWmbauCXA10bH66/mCi3AW31dT1BeOgpXoXIGs/e4rh4Crkdt99QlrwF3QmPt/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vpWYdYuG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QFbB8yrl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vpWYdYuG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QFbB8yrl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vpWYdYuG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QFbB8yrl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vpWYdYuG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QFbB8yrl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 458AD6C12A;
	Mon, 15 Jun 2026 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781531517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV8PrxgchSsr3Bdhhy6Zenr1K67PPD4Prshywa+V0aY=;
	b=vpWYdYuGVCmOf//t3/TGO586CA1J86WxWqzGsk7cvf85Zf0mlEcDUT5AYS/Fg7St3uNCVe
	kguT5sB76TvGeMBrF5MF0Wu/ncC8eGNxImcsj6N1KrxDPNWpfnixobSv2YCOsHGQmWqxJ2
	v762H08vVJjRokrj9R+4UxQ7DjcAOHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781531517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV8PrxgchSsr3Bdhhy6Zenr1K67PPD4Prshywa+V0aY=;
	b=QFbB8yrlfFiAQahq/SMzy/yUkBXoJcucx4GG0fDjdnWnEfRivwjv2TVlX2HZWWqb5kZlHV
	9fUVDh/v42QIx3AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vpWYdYuG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QFbB8yrl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781531517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV8PrxgchSsr3Bdhhy6Zenr1K67PPD4Prshywa+V0aY=;
	b=vpWYdYuGVCmOf//t3/TGO586CA1J86WxWqzGsk7cvf85Zf0mlEcDUT5AYS/Fg7St3uNCVe
	kguT5sB76TvGeMBrF5MF0Wu/ncC8eGNxImcsj6N1KrxDPNWpfnixobSv2YCOsHGQmWqxJ2
	v762H08vVJjRokrj9R+4UxQ7DjcAOHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781531517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV8PrxgchSsr3Bdhhy6Zenr1K67PPD4Prshywa+V0aY=;
	b=QFbB8yrlfFiAQahq/SMzy/yUkBXoJcucx4GG0fDjdnWnEfRivwjv2TVlX2HZWWqb5kZlHV
	9fUVDh/v42QIx3AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17C7C779A7;
	Mon, 15 Jun 2026 13:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l1NjBH0DMGo5SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jun 2026 13:51:57 +0000
Date: Mon, 15 Jun 2026 15:51:56 +0200
Message-ID: <87o6hbsygz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
In-Reply-To: <20260615132657.2097213-1-aichao@kylinos.cn>
References: <20260615132657.2097213-1-aichao@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 458AD6C12A
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 15 Jun 2026 15:26:57 +0200,
Ai Chao wrote:
> 
> Show "closed" for DISCONNECTED state allow audio service
> to detect USB reset/disconnect and reinitialize the device.

Hmm, why it must be that?  The state is shown as "DISCONNECTED".

IOW, does this matter for which application and how do we have to
imitate as if the file got closed?


thanks,

Takashi

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/core/pcm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index bfedf571e021..6ce35492ea56 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -450,6 +450,14 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
>  		snd_iprintf(buffer, "error %d\n", err);
>  		return;
>  	}
> +	/*
> +	 * Show "closed" for DISCONNECTED state allow audio service
> +	 * to detect USB reset/disconnect and reinitialize the device.
> +	 */
> +	if (status.state == SNDRV_PCM_STATE_DISCONNECTED) {
> +		snd_iprintf(buffer, "closed\n");
> +		return;
> +	}
>  	snd_iprintf(buffer, "state: %s\n", snd_pcm_state_name(status.state));
>  	snd_iprintf(buffer, "owner_pid   : %d\n", pid_vnr(substream->pid));
>  	snd_iprintf(buffer, "trigger_time: %lld.%09lld\n",
> -- 
> 2.25.1
> 
