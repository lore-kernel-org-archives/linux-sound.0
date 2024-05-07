Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF11DA3A
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 12:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085514; cv=none; b=RAIKpw3t0psjMG/iad/GhtzFXapqnr1lMkds7zZ9SvlmrWwdgXmAuQK0h29rDDaHAq4GFLlXVM+170Dt1BUDliz9FAHD2tiSxmx5rIkJcDXYC/VHVXuQrvp+6jpmgyOKXTK72vPadMUOxkBEl2Ai+adlGEZrVBVmQxrbD2BoD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085514; c=relaxed/simple;
	bh=Hvp9uTP7nREfzJa+vwJ9wFfL6U61819LVjd4/bArrQE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0DW+BA+DqCYIfxhcWvimcXh0n+FXk2wUjXVRKqAynp5r8zNyPCW0wNGQY67rLWmJLj1jJJtSnjINNyh8yPQyEhLKpx9aQiJtq55CIhTXQfnyc/V7Vg60X4Z9f5/UEx/fyxyRUwDnkCawLSro1l9BifVlkERwEXvaFK6ue0YbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tqXd8Kf+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xAQdMute; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CzpGOS95; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V20EY1PR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tqXd8Kf+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xAQdMute";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CzpGOS95";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V20EY1PR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EEA2C33E9F;
	Tue,  7 May 2024 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715085511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QPH6dBds5K+X+mIhXqRQSHos2zFSl9ToOAuP/Vxh4Y=;
	b=tqXd8Kf+N8ooN1gGwVFfkkC6iOM/dHxufMD2kZVzVMf1gMWB38tYZwodl9mG3NYShQ4ePP
	GptlGS6oErujvnrZwSh3arHuMHmmZYe9YWDhMJNlw0pd/0IqmtbAaG1obV3N1OEXtkLVD+
	kIXSfA1qcwo/N7s57OqCey/YlfKUC6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715085511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QPH6dBds5K+X+mIhXqRQSHos2zFSl9ToOAuP/Vxh4Y=;
	b=xAQdMuteIwcb/Xak+RFB9gZLapIhl5v5XrEHg99abKYGzT2epPFGdT58TACJ+/KZiko5fF
	bi5ESSVACdx4zkCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CzpGOS95;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V20EY1PR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715085510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QPH6dBds5K+X+mIhXqRQSHos2zFSl9ToOAuP/Vxh4Y=;
	b=CzpGOS956TSOLsOS+VO+6215yhwkEmOV5xuZULXttZw38WNfILAXmjJqmxePfZ/mQ1jkzd
	2eaALFH0vF7SWeq8P03UUQbbzaORDpL1CXKPLh5XyxJr1eEX6ST3ptD2l12c7XzcDkkmvK
	aCcHsJVxDDrGnMNqwXAzxj6TmOSbWrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715085510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QPH6dBds5K+X+mIhXqRQSHos2zFSl9ToOAuP/Vxh4Y=;
	b=V20EY1PR/VB3KQY0pHTLs5IIiizrTFOUzoNfhdJgwx4XrjVQ4QkKoV2P7oc6n4vpkMfWAA
	kyX+Y7DySIVvl+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBAA613A2D;
	Tue,  7 May 2024 12:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TWEiNcYgOmZkFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 12:38:30 +0000
Date: Tue, 07 May 2024 14:38:45 +0200
Message-ID: <87le4leqzu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 2/2] ALSA: pcm: optimize and clarify stream sychronization ID API
In-Reply-To: <20240507083142.557299-3-perex@perex.cz>
References: <20240507083142.557299-1-perex@perex.cz>
	<20240507083142.557299-3-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EEA2C33E9F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Tue, 07 May 2024 10:26:19 +0200,
Jaroslav Kysela wrote:
> 
> +static inline void snd_pcm_set_sync(struct snd_pcm_substream *substream)
> +{
> +	substream->runtime->sync_flag = true;
> +}

This function deserves for a proper comment.  The kerndoc comment is
lost by this patch.

> @@ -1811,10 +1829,12 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
>  static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
>  				     void *arg)
>  {
> -	struct snd_pcm_hw_params *params = arg;
> +	static unsigned char id[12] = { 0xff, 0xff, 0xff, 0xff,
> +					0xff, 0xff, 0xff, 0xff,
> +					0xff, 0xff, 0xff, 0xff };

This can be const.


thanks,

Takashi
