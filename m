Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB6377559
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937091; cv=none; b=ZZqbeeo7V6GRU1sVq+YpAKJxRbnKL3OYrKaQRjWLH6IE0EA/8rLP0LFNmY7PiGAs8ktHAzsFprmkXGz5Lh/ORX6uxECQWUca4DJEh9ObjXD5ts0WgeaJ9bDBPwrPif3cUaAn4uojZlTFAb3utQpL5ePZm0c+Ehlpq2AG0Lr3g34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937091; c=relaxed/simple;
	bh=AV20aqyMMjFevr+UI+JinVaPJF+RHxzrNGzA2OCW77w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LinD5s0Zj8VfLxTe03RHu8nF9I90z0VWa3DL9dKuSAdLwbC+uYMjGsJrkWUc8N71P61qCvvzJc1G762M2pYNyp3KNwzrSQwBLqDyioNJj913TdHm76vKWiL4RkWjIJQ59kP6fv/fJhYG/SO6+thBMG9g2rnnMp8BwlZUp+SPZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=znv3I9G0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HfUoQQdk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=znv3I9G0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HfUoQQdk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="znv3I9G0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HfUoQQdk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="znv3I9G0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HfUoQQdk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93E8F774C0;
	Mon, 13 Jul 2026 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwzH9GwSohsCuCwOcJ34Y1BlAwMoaSwBFJFASp5gnRA=;
	b=znv3I9G0l/tv9V9eW9bDnqIFYajGZrOnvtplZiI2MvZCyemDCcRXGbRIoM55QJtrvGpWNg
	NAncsy9GGFzt8B9vazlsHqccoSU2KSjC4iIqBBV6wLjECX0ZbnAvxpE84uHv7o4LcBwTwc
	9bi4RPqVUoAT2KG8Hwbg+pUiXjn97i8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwzH9GwSohsCuCwOcJ34Y1BlAwMoaSwBFJFASp5gnRA=;
	b=HfUoQQdkXqPGjiLDQOaSs7Ke0zBdquYBRXPSy9hrOPRSX74bcvXbQgDYUKcmpvnYbcEawO
	/Zsu8LK/UYEkHSDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwzH9GwSohsCuCwOcJ34Y1BlAwMoaSwBFJFASp5gnRA=;
	b=znv3I9G0l/tv9V9eW9bDnqIFYajGZrOnvtplZiI2MvZCyemDCcRXGbRIoM55QJtrvGpWNg
	NAncsy9GGFzt8B9vazlsHqccoSU2KSjC4iIqBBV6wLjECX0ZbnAvxpE84uHv7o4LcBwTwc
	9bi4RPqVUoAT2KG8Hwbg+pUiXjn97i8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwzH9GwSohsCuCwOcJ34Y1BlAwMoaSwBFJFASp5gnRA=;
	b=HfUoQQdkXqPGjiLDQOaSs7Ke0zBdquYBRXPSy9hrOPRSX74bcvXbQgDYUKcmpvnYbcEawO
	/Zsu8LK/UYEkHSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 611DF779AE;
	Mon, 13 Jul 2026 10:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JAZNFUC4VGrUHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 10:04:48 +0000
Date: Mon, 13 Jul 2026 12:04:47 +0200
Message-ID: <87tsq3yzls.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen Bowen <hicbowen@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speakers on MECHREVO WUJIE Series
In-Reply-To: <20260710133409.16641-1-hicbowen@gmail.com>
References: <20260710133409.16641-1-hicbowen@gmail.com>
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 10 Jul 2026 15:34:09 +0200,
Chen Bowen wrote:
> 
> The internal speakers on the MECHREVO WUJIE Series are silent,
> while the headphone output works correctly.
> 
> The BIOS reports NID 0x1b on the Realtek ALC233 codec as
> unconnected with pin configuration 0x411111f0. However, the pin
> is connected to an internal speaker.
> 
> Overriding NID 0x1b with 0x90170150 makes the HDA generic parser
> detect both 0x14 and 0x1b as speaker outputs and restores internal
> speaker playback.
> 
> Add a pin configuration fixup for the affected PCI SSID c011:1d05.
> 
> Tested on a MECHREVO WUJIE Series laptop with board
> WUJIE Series-Lark4-LNL and firmware EM_LNL326_V1.0.23.
> 
> Signed-off-by: Chen Bowen <hicbowen@gmail.com>

Applied now.  Thanks.


Takashi
