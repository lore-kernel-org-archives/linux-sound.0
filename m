Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F21DA5F
	for <linux-sound@vger.kernel.org>; Mon, 28 Jul 2025 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753706569; cv=none; b=HY5exg6tj3VBYtmX5Mfsdqa95bbu4MQxt08qo/dmoRr7tIaVpslKUIXp4aj5dzd0Pf1xXGWjdYRUqUpxyVCsmmiqxXAwQx+RAsr5txF2uzCeU6nBJdDRhp9P5hnJR1t+CG6a1KOAt1qah4gXxiV2A0lFxCrwNVLV3QWg1imf+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753706569; c=relaxed/simple;
	bh=BZgc/IHlo2zBoVwU9wA20AuDYm24mliBIkpJ81w6vOA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YLZRtYal99aEKgCwtyy0v6L8ZsmJ8LX1rS+DnK8DMAbxSstaGgX0ZxnjZtlxt4OaPswT6ChWt9ekEoxxzaK1DUsjdtDeksvM4YpEQmOWDiaxoO7y0nZNC9dYwOaNUJ+4GRYbsOJVh0vy11Yg7g+y3kzd0SX0XUTrLbQtERt6EVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Xde3VB2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cOuWRV2V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Xde3VB2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cOuWRV2V; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Xde3VB2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOuWRV2V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Xde3VB2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOuWRV2V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D5451F855;
	Mon, 28 Jul 2025 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753706565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaPRIrcCqaekp+57wn6KkLUYOq1nk5+Qn2t8b/v5KFU=;
	b=0Xde3VB2k369sci4g+OYnYGqXutSiBk3CeeVlrFzvJNjj4K24WYAXgXoG3damG+dq5VkVN
	jxQxn+B2AOLE4ZUwsjFn37DZfDtAPH0mMuhvzMybtZr+bOj1JiPHwOfPrL1uslix5KrCsi
	6ni0HouhZ2HeEjmmb9JscpfKRDdSkbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753706565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaPRIrcCqaekp+57wn6KkLUYOq1nk5+Qn2t8b/v5KFU=;
	b=cOuWRV2Vu1V9FcwOVr3RDtrn6oRm1oZBkdw41vr1AsVUJjMHbDNCLgLVswBkfgwScNvC9Y
	XF5V5LcS/Dp0DxBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753706565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaPRIrcCqaekp+57wn6KkLUYOq1nk5+Qn2t8b/v5KFU=;
	b=0Xde3VB2k369sci4g+OYnYGqXutSiBk3CeeVlrFzvJNjj4K24WYAXgXoG3damG+dq5VkVN
	jxQxn+B2AOLE4ZUwsjFn37DZfDtAPH0mMuhvzMybtZr+bOj1JiPHwOfPrL1uslix5KrCsi
	6ni0HouhZ2HeEjmmb9JscpfKRDdSkbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753706565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaPRIrcCqaekp+57wn6KkLUYOq1nk5+Qn2t8b/v5KFU=;
	b=cOuWRV2Vu1V9FcwOVr3RDtrn6oRm1oZBkdw41vr1AsVUJjMHbDNCLgLVswBkfgwScNvC9Y
	XF5V5LcS/Dp0DxBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39D4A138A5;
	Mon, 28 Jul 2025 12:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ipf2DEVwh2h4bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Jul 2025 12:42:45 +0000
Date: Mon, 28 Jul 2025 14:42:44 +0200
Message-ID: <87y0s8trjv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.17-2
In-Reply-To: <70f6b7120f5f18eaeae8294cd55b5412.broonie@kernel.org>
References: <70f6b7120f5f18eaeae8294cd55b5412.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 28 Jul 2025 14:23:56 +0200,
Mark Brown wrote:
> 
> The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:
> 
>   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.17-2
> 
> for you to fetch changes up to e95122a32e777309412e30dc638dbc88b9036811:
> 
>   ASoC: codecs: Add acpi_match_table for aw88399 driver (2025-07-25 13:44:29 +0100)
> 
> ----------------------------------------------------------------
> ASoC: More updates for v6.17
> 
> A few more updates, mostly fixes and device IDs plus some small
> enhancements for the FSL xcvr driver.

Pulled now.  Thanks.


Takashi
