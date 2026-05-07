Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF92E7F25
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151343; cv=none; b=Irs5w+Ue1xYDiIff92AXz4JAdZ0ZRr4PvbjjN33rjOeVByvB6ur6lyNJdURKksTsml46iMBWvcDpVtTrLiWitkke9/nlW4V6x5ePxQ3oXpqOOLBc7oESu5PtCUYVBDlvNcXtA5+dc950bSeA7y2w3YpxgmWe/h80bVGxw0kmqpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151343; c=relaxed/simple;
	bh=bEgHXm4K1F/ylxEpUBxeogQKt/ST4wcLfVZHsbFkWmM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvdKRmxZeLSTeQItMtqO55YrcCcDyDDlMPIPJFqaMkrsN4KgD2vUb74i8Jclx3/lESAL9yG2ilRHVJHu7+RIg1taEZUaDvyt+t9odfkShkoTw2N4pkD1iLj7gJFLVJ6wd6WrXxQr52j/bTD+fI+7beIfKCmqk5o6V6JYhoyETmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U1lnjAba; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LqG3XzTN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U1lnjAba; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LqG3XzTN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U1lnjAba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LqG3XzTN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U1lnjAba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LqG3XzTN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 561995D691;
	Thu,  7 May 2026 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778151334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjV6rSJbPozIZczaWp3YAmNgw4NNBIntE+XCIuQopqg=;
	b=U1lnjAbalAxPm6spxbXdXmcitsjglQ3P1FPuCmSzm6KIwI7VXBl4IPpDzZxExT7jz2MKVf
	bXwQteTXeoV+cJ6PX7BySKhGnRNe5tD5xYethlfdOHbhrBZwV12yE5U3kkilIyMZDkpyHb
	Zpm7W39BPcAIsQPdrQv2leWQkfVjk8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778151334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjV6rSJbPozIZczaWp3YAmNgw4NNBIntE+XCIuQopqg=;
	b=LqG3XzTNQ3kZvsSx278H/FdeXQeU+iQvu2g/yIo0P/0BBxHm+pUCoiiy7xCvkF4kC+KbH6
	sJZLNlUVahP0VDBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778151334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjV6rSJbPozIZczaWp3YAmNgw4NNBIntE+XCIuQopqg=;
	b=U1lnjAbalAxPm6spxbXdXmcitsjglQ3P1FPuCmSzm6KIwI7VXBl4IPpDzZxExT7jz2MKVf
	bXwQteTXeoV+cJ6PX7BySKhGnRNe5tD5xYethlfdOHbhrBZwV12yE5U3kkilIyMZDkpyHb
	Zpm7W39BPcAIsQPdrQv2leWQkfVjk8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778151334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjV6rSJbPozIZczaWp3YAmNgw4NNBIntE+XCIuQopqg=;
	b=LqG3XzTNQ3kZvsSx278H/FdeXQeU+iQvu2g/yIo0P/0BBxHm+pUCoiiy7xCvkF4kC+KbH6
	sJZLNlUVahP0VDBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD899593A7;
	Thu,  7 May 2026 10:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k8N7M6Vv/Gk6WwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 10:55:33 +0000
Date: Thu, 07 May 2026 12:55:33 +0200
Message-ID: <875x4zqyje.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	gregkh@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH] ALSA: pcm: use snd_pcm_get_state() in remaining ioctl checks
In-Reply-To: <20260507011944.2897240-1-zzzccc427@gmail.com>
References: <20260507011944.2897240-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linuxfoundation.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Thu, 07 May 2026 03:19:44 +0200,
Cen Zhang wrote:
> 
> The recent OSS runtime->state locking cleanup converted the OSS I/O
> paths to use snd_pcm_get_state(), but a few ioctl-side checks in
> pcm_native.c still sample runtime->state directly: the prepare
> pre-checks, the early drain open-state check, and the common
> snd_pcm_kernel_ioctl() disconnected check.
> 
> Use snd_pcm_get_state() for those remaining samples. In
> snd_pcm_pre_prepare(), keep a single state snapshot and reuse it for
> both the OPEN/DISCONNECTED check and the running-state test.
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
