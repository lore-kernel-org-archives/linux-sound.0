Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A6638BF88
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307088; cv=none; b=KmJNLvtJVQ4qnfB5F4LxsUk4TNZuZXeCJK3P8ibspCbDsf/j2RLXe2+EHfYzKOVX5yyt5jmgIBDB5XRgIqLfvtb4wqlcIjVF8Bi6IPxjZbUCfa9EEAuOuXpaFoqZAagReGGYzYmdPGufL97eZ8InIIegwEaugceelafuR6mkWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307088; c=relaxed/simple;
	bh=I9ikO501BRHQHnfF7H1f2oUnwLHyP/T+0BYeuER4hQc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnD/qy7LiVk8VeEQcz3LylKR4q/MeDl5yCFx+1G0XpZdC/mOrzYOOk/hegK9oi93H2iJeEDfuRmzDex6NRon2rR3UHMZquXx5IEcdwhKuoK/4/HmUJFYu+UgrS/q9xHOEiUvV6Nz16GajuySbbaBb8D9ObyyVoaokaa+kNnEFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TfQUMBUc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8s5BGoJR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TfQUMBUc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8s5BGoJR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TfQUMBUc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8s5BGoJR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TfQUMBUc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8s5BGoJR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FA125BCCA;
	Tue, 13 Jan 2026 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768307083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdy6TSBk2CngkOsMSmODZsSgAsbsCgnkEwqdeuELts=;
	b=TfQUMBUcRNNFIK+Pjg86ggmbkiVoATN9QBDO4uDyHtx30SE3skHff3VJplozm4jYt7AFkh
	DEU7VJjzQsw55CWFr4eVm7kE8p6xhxAyl84raK5ug9JavUyLquHD6dnfSOkYDcV227TKeU
	ltFsacFKR60YccGXPESAL4wXa7t5ZGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768307083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdy6TSBk2CngkOsMSmODZsSgAsbsCgnkEwqdeuELts=;
	b=8s5BGoJRH7loH/bQk6pze1Re9s8mlx1Qm+6+5bOzhx4/ibVmJEeNXSIwB3Tyd0vBhRmcDi
	trhFZyb2HJIpNlDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TfQUMBUc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8s5BGoJR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768307083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdy6TSBk2CngkOsMSmODZsSgAsbsCgnkEwqdeuELts=;
	b=TfQUMBUcRNNFIK+Pjg86ggmbkiVoATN9QBDO4uDyHtx30SE3skHff3VJplozm4jYt7AFkh
	DEU7VJjzQsw55CWFr4eVm7kE8p6xhxAyl84raK5ug9JavUyLquHD6dnfSOkYDcV227TKeU
	ltFsacFKR60YccGXPESAL4wXa7t5ZGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768307083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdy6TSBk2CngkOsMSmODZsSgAsbsCgnkEwqdeuELts=;
	b=8s5BGoJRH7loH/bQk6pze1Re9s8mlx1Qm+6+5bOzhx4/ibVmJEeNXSIwB3Tyd0vBhRmcDi
	trhFZyb2HJIpNlDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 880A33EA63;
	Tue, 13 Jan 2026 12:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A2J3IIs5Zml0UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 12:24:43 +0000
Date: Tue, 13 Jan 2026 13:24:39 +0100
Message-ID: <87cy3dr988.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Asus Zephyrus G14 2025 using CS35L56, fix speakers
In-Reply-To: <20260112-asus-rog-audio-v1-1-513957b4704e@vinarskis.com>
References: <20260112-asus-rog-audio-v1-1-513957b4704e@vinarskis.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9FA125BCCA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 12 Jan 2026 01:06:37 +0100,
Aleksandrs Vinarskis wrote:
> 
> Just like GA403U, this GA403W needs to remap woofers to DAC1. Similarly to
> other Asus devices, headphones/headset MIC is not working, however the pin
> config alone is not enough to fix it.
> 
> From Windows dump of GA403W:
>   0x12, 0x90a60140 # Correctly set by codec out of the box
>   0x13, 0x90a60550
>   0x14, 0x90170510
>   0x17, 0x90170120 # Correctly set by codec out of the box
>   0x19, 0x03a11050 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
>   0x1a, 0x411115F0
>   0x1b, 0x03a11c30 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
>   0x1d, 0x40663A45 # Correctly set by codec out of the box
>   0x21, 0x03211430
> 
> Even with all the values set, MIC of the jack is not detected. Until a
> complete solution is found, set ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> for GA403W which fixes audio volume control for woofers. No need to
> create new quirk with missing pin config just yet, since its not
> making the situation better.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
> As per commit description, enable quirk to fix woofers.

Thanks, applied now.


Takashi
