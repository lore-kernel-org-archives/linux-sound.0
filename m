Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C417E015
	for <linux-sound@vger.kernel.org>; Mon, 20 Jan 2025 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358783; cv=none; b=GqLdolHHR5kMet1tR9RIwkAeUWTU/l9juUq927RiUl6Cb0Vr7R4/H+Mm7JqcL7UnE5StiWX2MT1ednIsZ3+jsKgJNAirSl9hGSQDMXqC/s1mizTBlBnDkQ3/ZsOykwXABJYWxLr39rAtZEt44xVoqE6tVrQ0QTsyU+JB5PFaox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358783; c=relaxed/simple;
	bh=wNQ+LLGpX7jBzvcWNjRhgARn2jOMcJTxTVMz2Q7KwbM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7QBpgkIFRWN9cms6GBQr6i/t+BqV9nLoUtLoxIvVCx/TTRr8rfn9f4MkJcU64RTrFvj+x6T3Mq8pfthdT1aFGE23jnFhgkx7rejzMJjMZQ8q3v0D3UebOdecWVq/W+P8gB/kA4vS/n8wGdWT0DQ6n/WfpQBXLLm7QdLC1QWlZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uwWWdDLY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K3CM3Gto; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uwWWdDLY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K3CM3Gto; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uwWWdDLY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K3CM3Gto";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uwWWdDLY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K3CM3Gto"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8565F1F79F;
	Mon, 20 Jan 2025 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737358773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUA5/WrRHwzq5omt6Uk4juFJLnDIzIxXyDfdPSEbv0Q=;
	b=uwWWdDLYpk40/pIKaG9N/Cbi0xJT7B3u9OvWXu+iLH8gtEbecFxAV+LvH49sbHrvqm2zsZ
	/Eu9p1bqyGgGy+woKRvcNG2AYvv8ayMpDIM1vibckduWjn5IUiBeANYB63GBOan4LVyQxO
	9P7hkesstAgAL4v3YE1BubBTNjOdAOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737358773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUA5/WrRHwzq5omt6Uk4juFJLnDIzIxXyDfdPSEbv0Q=;
	b=K3CM3GtoOn38ANYvF6mFIuoaTlUWqrnEmPZfq30kvsYUr1S/YBQERqIoB6yrR0uVSRvC7H
	eh/p3XBuY5IkQhDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737358773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUA5/WrRHwzq5omt6Uk4juFJLnDIzIxXyDfdPSEbv0Q=;
	b=uwWWdDLYpk40/pIKaG9N/Cbi0xJT7B3u9OvWXu+iLH8gtEbecFxAV+LvH49sbHrvqm2zsZ
	/Eu9p1bqyGgGy+woKRvcNG2AYvv8ayMpDIM1vibckduWjn5IUiBeANYB63GBOan4LVyQxO
	9P7hkesstAgAL4v3YE1BubBTNjOdAOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737358773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUA5/WrRHwzq5omt6Uk4juFJLnDIzIxXyDfdPSEbv0Q=;
	b=K3CM3GtoOn38ANYvF6mFIuoaTlUWqrnEmPZfq30kvsYUr1S/YBQERqIoB6yrR0uVSRvC7H
	eh/p3XBuY5IkQhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F3381393E;
	Mon, 20 Jan 2025 07:39:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id psK2FbX9jWd+MgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 07:39:33 +0000
Date: Mon, 20 Jan 2025 08:39:32 +0100
Message-ID: <87wmeqorwr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: Re: [PATCH] ALSA: usb: fcp: Fix hwdep read ops argument
In-Reply-To: <20250119085357.17735-1-tiwai@suse.de>
References: <20250119085357.17735-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 19 Jan 2025 09:53:28 +0100,
Takashi Iwai wrote:
> 
> The hwdep read ops argument is long instead of ssize_t due to
> historical reason.  Fix the build error.
> 
> Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501190536.A2CiOP0a-lkp@intel.com/
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/fcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
> index 655e4f7338ed..eb6a5c1f9b21 100644
> --- a/sound/usb/fcp.c
> +++ b/sound/usb/fcp.c
> @@ -816,7 +816,7 @@ static int fcp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
>  }
>  
>  static ssize_t fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
> -			      ssize_t count, loff_t *offset)
> +			      long count, loff_t *offset)
>  {
>  	struct usb_mixer_interface *mixer = hw->private_data;
>  	struct fcp_data *private = mixer->private_data;

Gah, that wasn't enough, a few other ssize_t had to be replaced with
long.  Stephen already submitted the fix patch for linux-next, and
I'll take it instead.


Takashi
