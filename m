Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B607E38F93B
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745515; cv=none; b=t6Unxd97FgshMQVojUyrYSLetfyLX9V3qUg/fplrlSW8vIuZek+cQhoshJGaSoG2bZ3E57Y/3d7O9U9DGdXd34oFyHwIbDIymU53+6FhxkG5iBtoa/lTMAqeiRLFfsIBd0o/uDg3mCNaF5hKZhYTaIwXzJhsATKvxfS1ew0t/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745515; c=relaxed/simple;
	bh=ADFm7heaWuNpKE1PB759IFTAuDQuMpGBHkKk1GTHXiY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXdiefx/8ihKfxoLjTy1w3RnHO6rZJVIKaPQris9uaL6OoZbE4Z3e/qEMlwDkdKG9YPp5QHQCt0YSwejks9F8UOSS2wz+CJunuzHcOidq1qJEUnGfbQfC3xzg1YTVxaJnDTIFkOWotsDBUS6HqywCzZuEDGlz2BHpi2ojfsESpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qvSEdfR/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f9VdHVF8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qaqalhBu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WO+B7B++; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qvSEdfR/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f9VdHVF8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qaqalhBu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WO+B7B++"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE1E25BD8B;
	Thu,  9 Apr 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47C6RMEklpe8QFEj8IeDpnHCbN7nqORDw1fGslShl7o=;
	b=qvSEdfR/O7dRxhyFUg2ZKh5tTn90cJzb00FN5gLoMxVN2v0tPh1vKSQ8dp5l2RmaYLXGRE
	Lzfo1BUUgmigC1bKE6fdxRvBf1cFQpojHnKRmdci7xra45ehzlhV+FDH2HFlgtW34vPzT1
	Q2rs8Tb5XgL3j1jsh2C26we1Sxl1Byw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47C6RMEklpe8QFEj8IeDpnHCbN7nqORDw1fGslShl7o=;
	b=f9VdHVF8hWM91TbF/pHRyj56l6f5AkkeXBYoXoxVJHSDDNG4nltCeqdoQM/PBZs5NYBKXj
	HeB7wkVsoam266Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qaqalhBu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WO+B7B++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47C6RMEklpe8QFEj8IeDpnHCbN7nqORDw1fGslShl7o=;
	b=qaqalhBuHDinfEy8Kq2/1LYv87edZU/JTQK9IhJvf4wlWa1UI5TShxocFl3iBNGuYrloaL
	Hla3H8KtsmgIizlCqk1epA0jk6TYU9YgEFkPx+8CEWK0YeJ9Ycw6iZx7p/XScytAoDS0wL
	m1LcBeE0BrN1YVM+SFhEArNF33OYDDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47C6RMEklpe8QFEj8IeDpnHCbN7nqORDw1fGslShl7o=;
	b=WO+B7B++QTvBmHyYpDpZOPQehuTwaptygsX9xidELoMXEcpepNI59f35qdft+O12knIPBX
	5BLb1blHT/AVOKBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F7434A0B4;
	Thu,  9 Apr 2026 14:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QYSoJee512kRCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 14:38:31 +0000
Date: Thu, 09 Apr 2026 16:38:31 +0200
Message-ID: <87jyugi4go.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Add quirk flags for Feaulle Rainbow
In-Reply-To: <20260409-feaulle-rainbow-v1-1-09179e09000d@rong.moe>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
	<20260409-feaulle-rainbow-v1-1-09179e09000d@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CE1E25BD8B

On Wed, 08 Apr 2026 20:33:05 +0200,
Rong Zhang wrote:
> 
> Feaulle Rainbow is a wired USB-C dynamic in-ear monitor (IEM) featuring
> active noise cancellation (ANC).
> 
> The supported sample rates are 48000Hz and 96000Hz at 16bit or 24bit,
> but it does not support reading the current sample rate and results in
> an error message printed to kmsg. Set QUIRK_FLAG_GET_SAMPLE_RATE to skip
> the sample rate check.
> 
> Its playback mixer reports val = -15360/0/128. Setting -15360 (-60dB)
> mutes the playback, so QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE is needed.
> 
> Add a quirk table entry matching VID/PID=0x0e0b/0xfa01 and applying
> the mentioned quirk flags, so that it can work properly.
> 
> Quirky device sample:
> 
>   usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
>   usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 7-1: Product: Feaulle Rainbow
>   usb 7-1: Manufacturer: Generic
>   usb 7-1: SerialNumber: 20210726905926
> 
> Signed-off-by: Rong Zhang <i@rong.moe>

Now applied only this one to for-next branch.


thanks,

Takashi
