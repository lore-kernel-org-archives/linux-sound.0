Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450533E5EDC
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937630; cv=none; b=UE3kJgzUXpsf6uKPdTQ7xctglXbJ09bofZcuCzWynOA0emw50jAqmBH/J29OyqfXz3RyCTYX2c9Oy/8obKAHOwv+Th7w5t9dDl5qC1edZprJJ/tBnLIwkbdNQXArsEPWLRkpgDzOQQTtBrDelEXmaz/FPQBnpMF421DAuMF/IFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937630; c=relaxed/simple;
	bh=wR7M586CDyIBu2vrspcrR4S3N80BNVad/cj4nMWf5WY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBcS30HkilzhMbVm37P5uz5kqCA/Z1XV0LCHy4Ptt013oBvMPreaKREFgr74IfUAq0ddGKXM5knbH4kKCIGrHP8ZXhZclQUvWUeAH2eNJyi6U/ynx0QOlGwimQi52tjLnYYii9K9OFqCxerbdgByLrLnP0Zgmn5hI9hl7V3SCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rw7FtGw6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vMHDYcDa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rw7FtGw6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vMHDYcDa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rw7FtGw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vMHDYcDa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rw7FtGw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vMHDYcDa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41322777F8;
	Mon, 13 Jul 2026 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGqtqL+awBTMWoY2AVxLLkMDropu+N1Z9SjPp3EaCqA=;
	b=rw7FtGw64k8jDweDn66KTGqhefkURD40RUCDPP68p0yjMwjtvA/Rm+z+55y0ECrAsN3seJ
	q/c+xK86Do3huSxUkV0TQ8xRKfbwok3T9nRwEya6yvAcXZEgT6R63LkZ+W64OzuDWztsR6
	Kw06BVzJx71rI/+ABtjykEXQApxeiak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGqtqL+awBTMWoY2AVxLLkMDropu+N1Z9SjPp3EaCqA=;
	b=vMHDYcDaBHEbgUa0kjjkFOFj5txVJuL+hkh/yyeg+0dpF1B7hFKqk1X99XqqxaMl5aQdA/
	pY5vn4L7L9bPKKAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGqtqL+awBTMWoY2AVxLLkMDropu+N1Z9SjPp3EaCqA=;
	b=rw7FtGw64k8jDweDn66KTGqhefkURD40RUCDPP68p0yjMwjtvA/Rm+z+55y0ECrAsN3seJ
	q/c+xK86Do3huSxUkV0TQ8xRKfbwok3T9nRwEya6yvAcXZEgT6R63LkZ+W64OzuDWztsR6
	Kw06BVzJx71rI/+ABtjykEXQApxeiak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGqtqL+awBTMWoY2AVxLLkMDropu+N1Z9SjPp3EaCqA=;
	b=vMHDYcDaBHEbgUa0kjjkFOFj5txVJuL+hkh/yyeg+0dpF1B7hFKqk1X99XqqxaMl5aQdA/
	pY5vn4L7L9bPKKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C366779AE;
	Mon, 13 Jul 2026 10:13:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oUOnAVu6VGqHJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 10:13:47 +0000
Date: Mon, 13 Jul 2026 12:13:46 +0200
Message-ID: <87pl0ryz6t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Check snd_hda_power_pm construct error before executing verb
In-Reply-To: <20260713020427.300628-1-songxiebing@kylinos.cn>
References: <20260713020427.300628-1-songxiebing@kylinos.cn>
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
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,kylinos.cn:email,suse.de:mid]
X-Spam-Level: 

On Mon, 13 Jul 2026 04:04:27 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> When userspace writes 1 to /sys/bus/pci/devices/XX/remove to remove HDA PCI device,
> the codec device enters runtime suspended state early. The snd_hda_power_pm RAII
> constructor fails to wake up codec, but the original code ignores pm.err and continues
> to execute hda verb commands. After pci driver remove callback completes, devres
> automatically iounmap the BAR virtual address bus->remap_addr, resulting in access
> to invalid unmapped MMIO address and triggering page fault BUG.
> 
> Add error check for snd_hda_power_pm constructor result:
> 1. Detect pm construction failure when HDA core device is suspended;
> 2. Print warning log with command and error code for debug;
> 3. Return early to skip subsequent hardware register access, avoid page fault crash.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
