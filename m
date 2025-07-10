Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8828B7FF
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135041; cv=none; b=O/5Gp1LnshmDwQJY1fuTDmXT6URzgiF7VJZbPsbkEk3RKx7pqpXJEEI7x4ZJ/A7HNk78xcRgtmwDOiZM5W1FEjfenyDsHL+RnbBQuedq4XJf8G+yFKSpGONZJr2HtqZBnbRxIjsXhu/nfRfYSO2sRRHxu+Z4qxz4JpwARjbzwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135041; c=relaxed/simple;
	bh=wL/fTTC62hIuMOiuvtrITNVGdqQWG18qkH1zS29wh/A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y5f2e2NmTBLLwiO4I9ixcgueMqoTh7g7ayMbSkmz1Lc7hxAjiIns5qE1XSBAwwlLQa024ngebArIWdl7zDT9QBBuiEFQ3fYd1zZwyarpcZvXh606ASF4PKvI2K+EzGLl4PmdZkkKzRdZB3HR389mFvEknRREibryYqObKzznNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xtnLyIrb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pDcB4pF+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xtnLyIrb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pDcB4pF+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xtnLyIrb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pDcB4pF+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xtnLyIrb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pDcB4pF+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1557421164;
	Thu, 10 Jul 2025 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752135032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zip6Hzfq5HRcDJLw/79GuoZPCQk7rGMP5UumgQ0x1FI=;
	b=xtnLyIrbCkpGUxZWh4MmWseH5civhMnBv/w+zEog9bQaTutcO2nvj9+IHcwfXra/i5yCwQ
	h8NAyBl5InAdbI+A08dDIe2ycYsgorVEwbh/Yx2tSNQdYAlPsoKX1bhgTD/xhZ1YIcZ1eR
	5wIbR+Ql5Wp3vm3oqckNd2T2ZlEVnpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752135032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zip6Hzfq5HRcDJLw/79GuoZPCQk7rGMP5UumgQ0x1FI=;
	b=pDcB4pF+nkVUkBPlUXhpOO1Rc7xy426wcD3JFqYEQmxZq/6w2i9ORhY3FtRPquVb5Y8G0e
	DkCMzLEIYczXoPDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752135032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zip6Hzfq5HRcDJLw/79GuoZPCQk7rGMP5UumgQ0x1FI=;
	b=xtnLyIrbCkpGUxZWh4MmWseH5civhMnBv/w+zEog9bQaTutcO2nvj9+IHcwfXra/i5yCwQ
	h8NAyBl5InAdbI+A08dDIe2ycYsgorVEwbh/Yx2tSNQdYAlPsoKX1bhgTD/xhZ1YIcZ1eR
	5wIbR+Ql5Wp3vm3oqckNd2T2ZlEVnpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752135032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zip6Hzfq5HRcDJLw/79GuoZPCQk7rGMP5UumgQ0x1FI=;
	b=pDcB4pF+nkVUkBPlUXhpOO1Rc7xy426wcD3JFqYEQmxZq/6w2i9ORhY3FtRPquVb5Y8G0e
	DkCMzLEIYczXoPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B60A4136CB;
	Thu, 10 Jul 2025 08:10:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nB5KK3d1b2iyMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 08:10:31 +0000
Date: Thu, 10 Jul 2025 10:10:31 +0200
Message-ID: <87ikk0xy88.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: compress_offload: tighten ioctl command number checks
In-Reply-To: <20250710063059.2683476-1-arnd@kernel.org>
References: <20250710063059.2683476-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,linux.dev,arndb.de,gmail.com,vivo.com,linux.intel.com,zeniv.linux.org.uk,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,arndb.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.80

On Thu, 10 Jul 2025 08:30:49 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The snd_compr_ioctl() ignores the upper 24 bits of the ioctl command
> number and only compares the number of the ioctl command, which can
> cause unintended behavior if an application tries to use an unsupprted
> command that happens to have the same _IOC_NR() value.
> 
> Remove the truncation to the low bits and compare the entire ioctl
> command code like every other driver does.
> 
> Fixes: b21c60a4edd2 ("ALSA: core: add support for compress_offload")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I could not find any indication on why this driver did this in
> the first place, it already was this way in the original commit
> back in 2011.

Applied with Vinod's ack now.  Thanks.


Takashi
