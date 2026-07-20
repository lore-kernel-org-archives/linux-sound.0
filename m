Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044479DA
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529925; cv=none; b=uXPInKIwsIGVWEk2cdxFq4qC9sTdvkxERxx/n30CbEopfi6B1saMS8Q26oAv9uKO6DlvHEGa/QmSmP1QaohtD8wh0UycZmAEM8nVd72NV8oqK1Jm6FvO3nye3a59eN2ScRNXvENKXU14hG4ds9U3OYVGZjABye1e/sicSTkcAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529925; c=relaxed/simple;
	bh=JxPBVjl3h24BACIPGwfAMj/16GqDP/Ki6i7+l2aYPws=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KoaFLf+3Z7fXF3iL1j4IC8A7BizsMZqb90SsdMgmzYO+a7KaEzwmXLDvOYLc8vpMetmEuv7wvujSjgvMNImqFPEsIEB6Y3RoPD/ws2vvTEIajFSanoMpmVQAHY1UlhGssJMxVH9PCqbCF/vqJGrqNBHIdZGF+fkYp6WKb0Fv0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IzIYIMtM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uHFpzIzQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gdibB1sn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ptKk1/I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IzIYIMtM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uHFpzIzQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gdibB1sn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ptKk1/I"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0AA979DE7;
	Mon, 20 Jul 2026 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784529922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VzUzRKvTI+uZx/6VLwJ/xMf3/fFhGXI9QFxPUKR5Kqw=;
	b=IzIYIMtMdGrV1t+aPKgl5mvTyfGc1bckjWJfXhizucxZglK2GDC7VPMcOUslHQ0DMtD1fx
	EcjmQfoOrQPBZvDSIUeQ1J1ERkFD4cVuuHuJXAKTqLqf+MLhNvY+Abf+eyjb9tsjEmvUqC
	0PK0U1s4Nv8CQwvHXFnIy8slTN48ox8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784529922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VzUzRKvTI+uZx/6VLwJ/xMf3/fFhGXI9QFxPUKR5Kqw=;
	b=uHFpzIzQrp/UpDxe149DoerSU+HoTamXLzNCjnTEWBSpXCL3i/zIEuH0qcrvEhEkSIcgFM
	mHZ+90eMYWxy0cDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784529920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VzUzRKvTI+uZx/6VLwJ/xMf3/fFhGXI9QFxPUKR5Kqw=;
	b=gdibB1snCjXSoWJBJUq35sHUYRiuvrHhEWk8Cw8PjFK3jCnM5DqdeXG/nAO60/pxLNCrMO
	/b4DWBt0bANKaKfPb3ExNRjbyyO9HqLQqyDihzVxi8zMrXzlcYPwZAmE2tIJJcGgQ8V3dN
	1WfSvY/OGn91St2c+cY9nLye8W5yogg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784529920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VzUzRKvTI+uZx/6VLwJ/xMf3/fFhGXI9QFxPUKR5Kqw=;
	b=7ptKk1/IJ0Kbh7vQ6lIZJQ3C81AVgpkRVZ8/cw3E5zJfvyhldWGiQ2cvxrReBD4m7fCzn6
	hXqeXVc9zPIzkfDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97201779AA;
	Mon, 20 Jul 2026 06:45:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e8KdIwDEXWpLAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 06:45:20 +0000
Date: Mon, 20 Jul 2026 08:45:20 +0200
Message-ID: <87qzkyqhvj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: sis7019: Use pcim_iomap_region() for MMIO BAR
In-Reply-To: <20260720000929.1432533-1-rosenp@gmail.com>
References: <20260720000929.1432533-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 20 Jul 2026 02:09:29 +0200,
Rosen Penev wrote:
> 
> Replace the open-coded pcim_request_all_regions() +
> devm_ioremap() pair with per-BAR pcim helpers: reserve BAR0 (the
> I/O port region, used via inl/outl) with pcim_request_region(), and
> reserve + iomap BAR1 (MMIO) with a single pcim_iomap_region() call.
> 
> This folds the BAR1 reserve and iomap into one managed call. The
> error check moves from a NULL test to IS_ERR(), since pcim_iomap_region()
> returns an IOMEM_ERR_PTR on failure.
> 
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

The original code had a fixed BAR size, but let's hope that it was
just a lazy code and not a workaround.

Applied now to for-next branch.  Thanks.


Takashi
