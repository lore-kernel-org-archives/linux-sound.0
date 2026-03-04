Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E14330D50
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637478; cv=none; b=LXg7fCHf3pk8AmDU6lhgbmnDlGbq571R7ZlrA/sPHWESRfvgWC1vHiB64NibcwfGet++DDX/BPy9JqSzNdVXRGPXChVH0BCgrzkTG5Xw0PcnoWKqb6Yfp/vNMfapQDO7+TguNtpS53t2EY3Fm98LSwBKUqV1eOHtuB9zpiQfqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637478; c=relaxed/simple;
	bh=RGnKwqND6TgUGHP6jCJ25LRnIYHDRiFdp/6Q+Ogipug=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCAiWydZ6b4kaI4sL90ug5tceQDMr6VvGPYSVapnZlZKzmqE+u2modVnWKiR28YoiD62wJdB2eWvt1hHYV491bq6Plt6UKN84jphIqTluLQT4lfxD1i2JEHBYiQPPx51GGvHGjPIHGBUehvjEyx4wJeSyf8f0uvC13m4p1xGmPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mqgsbAv/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMo8/1PE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mqgsbAv/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMo8/1PE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mqgsbAv/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMo8/1PE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mqgsbAv/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMo8/1PE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 698033F8F3;
	Wed,  4 Mar 2026 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772637475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNh5kPVf/yUqnUeWbQD9jQrAdH9zWu6yDJF96uIJTU8=;
	b=mqgsbAv/sLYpHzRMfmQdoBRoXa0cmTbxZLFRitCPGlHoQp4WWxfMRyIoSnk4nVbW39977J
	g0N8rNQytsbmyGPD7eXgrV0cE08SMaghgdmlt2kq/LY3DLca8SO7rt0M79jjydcwVB+oK7
	v+u5ynmNxM75ui4gx7QEr7qYDkzYcps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772637475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNh5kPVf/yUqnUeWbQD9jQrAdH9zWu6yDJF96uIJTU8=;
	b=GMo8/1PE402dSaZuXOI/isgDU5pCLB84tYXRgK8HVXgo3I7b0SBntuwGFrersNQsHMNws7
	EaCdwn/lcAxxGFDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772637475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNh5kPVf/yUqnUeWbQD9jQrAdH9zWu6yDJF96uIJTU8=;
	b=mqgsbAv/sLYpHzRMfmQdoBRoXa0cmTbxZLFRitCPGlHoQp4WWxfMRyIoSnk4nVbW39977J
	g0N8rNQytsbmyGPD7eXgrV0cE08SMaghgdmlt2kq/LY3DLca8SO7rt0M79jjydcwVB+oK7
	v+u5ynmNxM75ui4gx7QEr7qYDkzYcps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772637475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNh5kPVf/yUqnUeWbQD9jQrAdH9zWu6yDJF96uIJTU8=;
	b=GMo8/1PE402dSaZuXOI/isgDU5pCLB84tYXRgK8HVXgo3I7b0SBntuwGFrersNQsHMNws7
	EaCdwn/lcAxxGFDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D0743EA69;
	Wed,  4 Mar 2026 15:17:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3eqYDSNNqGlERgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Mar 2026 15:17:55 +0000
Date: Wed, 04 Mar 2026 16:17:54 +0100
Message-ID: <87fr6fvd25.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] firmware: cs_dsp: Fix fragmentation regression in firmware download
In-Reply-To: <20260304141250.1578597-1-rf@opensource.cirrus.com>
References: <20260304141250.1578597-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 04 Mar 2026 15:12:50 +0100,
Richard Fitzgerald wrote:
> 
> Use vmalloc() instead of kmalloc(..., GFP_DMA) to alloc the temporary
> buffer for firmware download blobs. This avoids the problem that a
> heavily fragmented system cannot allocate enough physically-contiguous
> memory for a large blob.
> 
> The redundant alloc buffer mechanism was removed in commit 900baa6e7bb0
> ("firmware: cs_dsp: Remove redundant download buffer allocator").
> While doing that I was overly focused on the possibility of the
> underlying bus requiring DMA-safe memory. So I used GFP_DMA kmalloc()s.
> I failed to notice that the code I was removing used vmalloc().
> This creates a regression.
> 
> Way back in 2014 the problem of fragmentation with kmalloc()s was fixed
> by commit cdcd7f728753 ("ASoC: wm_adsp: Use vmalloc to allocate firmware
> download buffer").
> 
> Although we don't need physically-contiguous memory, we don't know if the
> bus needs some particular alignment of the buffers. Since the change in
> 2014, the firmware download has always used whatever alignment vmalloc()
> returns. To avoid introducing a new problem, the temporary buffer is still
> used, to keep the same alignment of pointers passed to regmap_raw_write().
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 900baa6e7bb0 ("firmware: cs_dsp: Remove redundant download buffer allocator")

FYI, if the data isn't always large, kvmalloc() could be a better
alternative, which is a hybrid for both speed and size, too.


Takashi
