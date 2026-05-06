Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C93E0258
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054910; cv=none; b=c6I4pCpP6OAT69s1B/3D7WqXgPG1XJLHBjbEoJF8qXNUPMbFp0VRad9vb9aezXk3ue7omBPsnjAUBYcQGefn+h5Re+GmkU6wehh8zIWhUNTwRUnjReSKCiZxUsSjebOFeMBOfL9EJaqz96oofkwN5cYhFv4u93T3rgcKpKZu4co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054910; c=relaxed/simple;
	bh=gEyl16hqhesixVMeiTp2nVanfUrdm9vp/WQiRvupmhQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rt6msc+4zxtsUlWVaaCQiYDunKq/ap7n6waGwyp+UsCssf4BfTn33NZTW68SMQbXXtxizW4lUPRZG3NXY2Y8PNsquLZ0mJz5YJvXbZfOiLiw1VW2BN6X8jGFw5WkaXjEMFUKw0dvNipsCi1/iIFFFUYSWjrOEYTSCiirDDMtVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fwJ+FicX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NZD28I9f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fwJ+FicX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NZD28I9f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fwJ+FicX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NZD28I9f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fwJ+FicX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NZD28I9f"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F20D6B560;
	Wed,  6 May 2026 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtqtT4XAXixsAQa9Vr7kmaosTNtgESlEmzfhfzCcoEI=;
	b=fwJ+FicXV2y6Aq5ZNlAA1Qp9ykBrDEWRG/RU7FSXIX2VkrVFXXrl8YSXftPFsEnZM/9BWC
	9t7pRdckRPexFnnnayyt4sMJ4NEr1pzYD1vfYPbvpWyyxy4kvxWQU/l3pDjDYOe++hIAu7
	tYXpz5BQ9ZoPBrPZnEYcnISDUtSTazQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtqtT4XAXixsAQa9Vr7kmaosTNtgESlEmzfhfzCcoEI=;
	b=NZD28I9firy0+8QOFSC9+FUapdCTQV/U+vosenRnJfG6CC/Rd5Zy03XMUqu7FLM7RrqYSu
	xMLapiDRIrRZh/Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fwJ+FicX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NZD28I9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtqtT4XAXixsAQa9Vr7kmaosTNtgESlEmzfhfzCcoEI=;
	b=fwJ+FicXV2y6Aq5ZNlAA1Qp9ykBrDEWRG/RU7FSXIX2VkrVFXXrl8YSXftPFsEnZM/9BWC
	9t7pRdckRPexFnnnayyt4sMJ4NEr1pzYD1vfYPbvpWyyxy4kvxWQU/l3pDjDYOe++hIAu7
	tYXpz5BQ9ZoPBrPZnEYcnISDUtSTazQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtqtT4XAXixsAQa9Vr7kmaosTNtgESlEmzfhfzCcoEI=;
	b=NZD28I9firy0+8QOFSC9+FUapdCTQV/U+vosenRnJfG6CC/Rd5Zy03XMUqu7FLM7RrqYSu
	xMLapiDRIrRZh/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E7CE593A3;
	Wed,  6 May 2026 08:08:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uUbvEfv2+mmbLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 08:08:27 +0000
Date: Wed, 06 May 2026 10:08:26 +0200
Message-ID: <873405t0xx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Serialize deferred fasync state checks
In-Reply-To: <20260506-alsa-core-fasync-on-lock-v1-1-ea48c77d6ca4@gmail.com>
References: <20260506-alsa-core-fasync-on-lock-v1-1-ea48c77d6ca4@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F20D6B560
X-Spam-Level: 

On Wed, 06 May 2026 05:34:47 +0200,
Cássio Gabriel wrote:
> 
> snd_fasync_helper() updates fasync->on under snd_fasync_lock, and
> snd_fasync_work_fn() now also evaluates fasync->on under the same
> lock. snd_kill_fasync() still tests the flag before taking the lock,
> leaving an unsynchronized read against FASYNC enable/disable updates.
> 
> Move the enabled-state check into the locked section.
> 
> Also clear fasync->on under snd_fasync_lock in snd_fasync_free()
> before unlinking the pending entry. Together with the locked sender-side
> check, this publishes teardown before flushing the deferred work and
> prevents a racing sender from requeueing the entry after free has
> started.
> 
> Fixes: ef34a0ae7a26 ("ALSA: core: Add async signal helpers")
> Fixes: 8146cd333d23 ("ALSA: core: Fix potential data race at fasync handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied now.


Takashi
