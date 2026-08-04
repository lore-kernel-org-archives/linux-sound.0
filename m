Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E713643E07F
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842488; cv=none; b=hBm3/3w4y/kL4qHoGi5XNvXGythKQiFxs1z4RcsUT/UaoJ5MYWzSxADeWz72AdADAIIeYE51zgOEPVz5bPKbgCwycqeAxTywVZJsAOtLtdd1aLPkEXiErfSMmmyC1Bo51CBLMBZ/vetdPvGFy1iDdXzWXfsX/k7IJltXh4X/FNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842488; c=relaxed/simple;
	bh=wVUGRAVYmaxCVsHyA6nD53KFJHYDU+QXfzKvWz8uSso=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEQPzkJR5bCPj3YS5NzCR6C4dvToMzIJVm+7eblfJN6zVkmJfn6PfCL2M49OX2m81eV2lBsrn0xL36/I6+hu9VvgKV0acUl776XwbLwXoDB4y3ISRnXnBzyetA5JRSRLZMeVjsjenFBq2YNSBAi8FrrEEbauudRq82lH+Gmafv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xqZ104IZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=51LWxpcq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q/cWJZCM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YhpbHjVO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xqZ104IZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="51LWxpcq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q/cWJZCM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YhpbHjVO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0E3B7F7AA;
	Tue,  4 Aug 2026 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785842478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yxtI2kBxPILpJHg/6Yyrfjm5vGMVm42k8Rv2a76YW9A=;
	b=xqZ104IZO2OKVV0yNNwQImIgSJ9dO61ILAPRnnk68TPWqdbqnADjMUaIH7pV6KRlmwjbkD
	XsI8B79r97Mr/PuqYGTz1L36CCJB20j6wYK0/KcIOJTuK4DZqnCGuRo+5or7RsHEKBNeSk
	e/8Q8gfKp6/5Klgm/zWnebNzdp99Dn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785842478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yxtI2kBxPILpJHg/6Yyrfjm5vGMVm42k8Rv2a76YW9A=;
	b=51LWxpcqD3+d9LXs2rliJ8WBaZ1lzYJrHMLQNG6Oz6fCS6H2t57CofvmdojS3Ux17ZSK4a
	dqBbkwbSywlxdkBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Q/cWJZCM";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YhpbHjVO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785842474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yxtI2kBxPILpJHg/6Yyrfjm5vGMVm42k8Rv2a76YW9A=;
	b=Q/cWJZCMHMeMLHyO2Sz8X95ozm/dGyH2Yoo2SPUKal1aqq5Lf9ZN8dtrEFYIviDV03y1FW
	wKh3UP0L6pmbYTfNY8FbEW3vUJVhQB3xExPMbTBHQQtEh5XnQ64l4Vn7OVdiZjd//yROeP
	RzMRI6q7FM6ytVz8IqhcuMqVvLXDyFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785842474;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yxtI2kBxPILpJHg/6Yyrfjm5vGMVm42k8Rv2a76YW9A=;
	b=YhpbHjVOwhGsvcfhnnVYS8bihAIweSpcYIhgxDeLL5N2fXGbg/TDv95VkFZ0o0j2xDfGHW
	SkvUJYAy5pvHbUAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 649E3779C4;
	Tue,  4 Aug 2026 11:21:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OqBmFyrLcWq8BwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 04 Aug 2026 11:21:14 +0000
Date: Tue, 04 Aug 2026 13:21:14 +0200
Message-ID: <87tspai11y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arun Raghavan <arunr@valvesoftware.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	Arun Raghavan <arun@arunraghavan.net>
Subject: Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
In-Reply-To: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
References: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A0E3B7F7AA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 04 Aug 2026 00:07:52 +0200,
Arun Raghavan wrote:
> 
> The stream descriptor status register reports FIFO and descriptor
> errors, but these are currently cleared silently along with the rest
> of the interrupt status. Log them, rate-limited, so DMA problems are
> visible instead of only manifesting as audible glitches.
> 
> Observed on some AMD GPU HDMI audio controllers under specific low power
> circumstances.
> 
> Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
> Cc: Arun Raghavan <arun@arunraghavan.net>

Applied now to for-next branch.

It's interesting at which situation you get the error bit and which
one.  If it can be used *reliably* for catching a streaming error, the
driver could notify XRUN or error appropriately, too.


thanks,

Takashi
