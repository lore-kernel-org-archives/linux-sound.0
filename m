Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1733938C
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719571; cv=none; b=SrGv2AwDSqfVuP08N7LGvvzyr5aASh83s2U/qwZknLVbRJx5UjNRVI1HD8mLrqEINAMtgaGwLBrcuJd/LvJvmV/tAyFNdMeiFP9MNLd0HKDMU51svm2K90zIljig/mcvBxAXHobvOzxAxIoqk2E98apU13tXKxWdpWqCJrJY6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719571; c=relaxed/simple;
	bh=FHTqu+rIzc8N4fmptHxqKSjwxkV49bLW1XOU34+tGr4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SQV/GOJcwlVFhO+YeDRpL7B34xuNbMztlw6Fbgn7cu0y786+I4KCgdnuqFsO+LvFnYsEf5Fs5+fV+st9FwPV8a9+InWt4bNMccsCQQipSJ55wEWJrk6ZVE6giDZFLotLHsDarA2ponq8ud8xGUXyOkWEHsTsMrPyIw8nyOEhyAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wy58vipR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LaFyBt64; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wy58vipR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LaFyBt64; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wy58vipR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LaFyBt64";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wy58vipR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LaFyBt64"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79EBF3E09;
	Wed, 22 Jul 2026 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JtdEx8fNzt/6m0nPZVJL6fM/jv4NeuLFfZiWpmPlw2s=;
	b=wy58vipRnbAy9BQx+vCjaup1y/hUXBqR/RusaoP2pGizsnPOg1+SsxpQdi+BYccWa1TvEv
	A34iWkTd9ko0ZNd/8mTCvEBm0YkxaR+nOcZ5HUtVROp8SrVSvjliEnK7tR8tV7IIthqrrA
	ZDZDZFs+AQzznLS7aNwkW4Lt0URsadM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JtdEx8fNzt/6m0nPZVJL6fM/jv4NeuLFfZiWpmPlw2s=;
	b=LaFyBt64y5h2ZLSnD3/WjC4DW1ib7+FjcU+VSS+ElcVlOXboTjzbntSLS2s8mq5MsgsxAt
	ENcHdGItuxo+YhBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JtdEx8fNzt/6m0nPZVJL6fM/jv4NeuLFfZiWpmPlw2s=;
	b=wy58vipRnbAy9BQx+vCjaup1y/hUXBqR/RusaoP2pGizsnPOg1+SsxpQdi+BYccWa1TvEv
	A34iWkTd9ko0ZNd/8mTCvEBm0YkxaR+nOcZ5HUtVROp8SrVSvjliEnK7tR8tV7IIthqrrA
	ZDZDZFs+AQzznLS7aNwkW4Lt0URsadM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JtdEx8fNzt/6m0nPZVJL6fM/jv4NeuLFfZiWpmPlw2s=;
	b=LaFyBt64y5h2ZLSnD3/WjC4DW1ib7+FjcU+VSS+ElcVlOXboTjzbntSLS2s8mq5MsgsxAt
	ENcHdGItuxo+YhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EFCB779B0;
	Wed, 22 Jul 2026 11:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PesLEcuoYGp8MgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jul 2026 11:26:03 +0000
Date: Wed, 22 Jul 2026 13:26:02 +0200
Message-ID: <87a4rjgt9x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: Check snd_hda_power_pm construct error before executing verb
In-Reply-To: <20260717024948.506335-1-songxiebing@kylinos.cn>
References: <20260713020427.300628-1-songxiebing@kylinos.cn>
	<20260717024948.506335-1-songxiebing@kylinos.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 17 Jul 2026 04:49:48 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> When userspace writes 1 to /sys/bus/pci/devices/XX/remove to remove HDA PCI device,
> the HDA hardware control path is shut down and devres unmaps the BAR virtual address
> bus->remap_addr automatically during driver removal.
> 
> If a delayed HDA verb command arrives after the MMIO region is unmapped, the driver
> will access invalid virtual addresses and trigger a page fault splat.
> 
> So add an error check right after constructing snd_hda_power_pm:
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
> Changes in v2:
> - Modify the judgment from pm_runtime_datus_stuspended to bus->core.chip_init

Applied to for-next branch.  Thanks.


Takashi
