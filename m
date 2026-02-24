Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC438E13A
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934976; cv=none; b=Rjez+hGZmEvd8Ifh6O3CnIbJjstrJdk99hIm5vyJexkS/RQMzCCxFbJwfjBWbsxT/vw+awxcYJc8uvR754rvyinYH2CD1vb+rjz/lUvThtoyjiHuGCpoaNGrkuqHdZwfv3SiOGZsibt41OspX2sJKf7iuX5FhiFLktVRQyRA+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934976; c=relaxed/simple;
	bh=8T6p76aE+HDIIIbsrtU6VYRjrqH7uJanzf0WXV3eT74=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFAwvgTLDTfR43vmC96n9l99vbMoiLQveUCM8n0lTDx/jo3yKtubXqzzvyvTms3tmb5RcwLxhhIl2SKqpG/KZpq5FDDlCW71fBifr/pOu+lKOa2hQd2zRH9dMsLVKKkCI5HtTS+Un1csbR9SEeJzURYIWX8K+AGL92W3+CiQ4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zbdmQBCd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cHxAUTs0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zbdmQBCd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cHxAUTs0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zbdmQBCd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cHxAUTs0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zbdmQBCd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cHxAUTs0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 949AE5BCD5;
	Tue, 24 Feb 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771934971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A+2hwzuw04yEKgofwF+12ORbqxmK44hILHRAgwH3P8o=;
	b=zbdmQBCdYD2hHmTbtWO0ycligBW+kz+eEKdmiuQ2wrbJ1inlyBhlGMUi1t6X3rnN6zdaMh
	HXM+xUvF0KlThVmp5BHIpcv4yFESbZqD4Uqq9v7qcLgkS/z9xJvx/5luD5PTBgC2dHwHxk
	2GS0ulKbh07dWo6Y0tLm4alHOH0aTis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771934971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A+2hwzuw04yEKgofwF+12ORbqxmK44hILHRAgwH3P8o=;
	b=cHxAUTs0WYErR48w6G3leKlXd3z6kJT1qkqrboG5+LM/xGNORekFfnzunwnRPjoyX72rd1
	5ZQ2hFka3zYk6QBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zbdmQBCd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cHxAUTs0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771934971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A+2hwzuw04yEKgofwF+12ORbqxmK44hILHRAgwH3P8o=;
	b=zbdmQBCdYD2hHmTbtWO0ycligBW+kz+eEKdmiuQ2wrbJ1inlyBhlGMUi1t6X3rnN6zdaMh
	HXM+xUvF0KlThVmp5BHIpcv4yFESbZqD4Uqq9v7qcLgkS/z9xJvx/5luD5PTBgC2dHwHxk
	2GS0ulKbh07dWo6Y0tLm4alHOH0aTis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771934971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A+2hwzuw04yEKgofwF+12ORbqxmK44hILHRAgwH3P8o=;
	b=cHxAUTs0WYErR48w6G3leKlXd3z6kJT1qkqrboG5+LM/xGNORekFfnzunwnRPjoyX72rd1
	5ZQ2hFka3zYk6QBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C7833EA68;
	Tue, 24 Feb 2026 12:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id janGGfuUnWldNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Feb 2026 12:09:31 +0000
Date: Tue, 24 Feb 2026 13:09:27 +0100
Message-ID: <87o6lexs08.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v6] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <20260223144937.524019-1-cezary.rojewski@intel.com>
References: <20260223144937.524019-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 949AE5BCD5
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 23 Feb 2026 15:49:37 +0100,
Cezary Rojewski wrote:
> 
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
> 
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.
> 
> Due to large size of struct snd_ctl_elem_value, 'value_buf' is provided
> as a reusable buffer for kctl->put() verification. This prevents
> exhausting the stack when verifying the operation.
> 
> From user perspective, patch introduces a new trace/events category
> 'snd_ctl' containing a single 'snd_ctl_put' event type. Log sample:
> 
>   amixer-1107    [002] .....   9.553687: snd_ctl_put: success: expected=0, actual=0 for ctl numid=1, iface=MIXER, name='Master Playback Volume', card id=0
>   amixer-1108    [003] .....   9.498897: snd_ctl_put: success: expected=1, actual=1 for ctl numid=1, iface=MIXER, name='Master Playback Volume', card id=0
>   amixer-1111    [001] .....   9.882768: snd_ctl_put: success: expected=1, actual=1 for ctl numid=5, iface=MIXER, name='Loopback Mute', card id=0
>   amixer-1114    [002] .....   9.212184: snd_ctl_put: fail: expected=1, actual=0 for ctl numid=5, iface=MIXER, name='Loopback Mute', card id=0
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Looks almost good, just a minor nitpicking:

> --- a/sound/core/init.c
> +++ b/sound/core/init.c
(snip)
> @@ -537,6 +542,9 @@ void snd_card_disconnect(struct snd_card *card)
>  		synchronize_irq(card->sync_irq);
>  
>  	snd_info_card_disconnect(card);
> +#ifdef CONFIG_SND_CTL_DEBUG
> +	kfree(card->value_buf);
> +#endif
>  #ifdef CONFIG_SND_DEBUG
>  	debugfs_remove(card->debugfs_root);
>  	card->debugfs_root = NULL;

IMO, it's better to be put in snd_card_do_free() which is the place to
release the actual resources.


thanks,

Takashi
