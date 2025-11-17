Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4549273D75
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396680; cv=none; b=EcHqBlNcJXG0b7uCOzYz1+1zDzWOkms4LgJu8BTG7Y1alOlAABY4ErNQuHy52jqkzPpliQ7wWAwHo91/hFBkV4/9JNpGk0EHTADKykl/L4Uo74w/hgn+Lbg3i80+Ch94kGhvnVv/AcqQcy9pC8LzU+K0jAmZtNZgoGY/trh/PI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396680; c=relaxed/simple;
	bh=6+s0N3gkzikZM5UdQ9bm0Mx3vJfKsrfXTNgVHeiuc5o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ks77i39HJ82AZTJwWdsfCWiBy045I5l2XaHIkArJnpp+61IC4lPDWOLkARVpsvOMFB/9OQl0Lc8YBsbPwRe81zhCE8tmUs0tHQB1scuRTAaKBdrlam+qvTQFwKfMuRfNALo6Ow4KWbxb5tqWEAJASi32JQUN03gBg5u9AAKtYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ut2lK8L+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D8+omjgs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ut2lK8L+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D8+omjgs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ut2lK8L+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D8+omjgs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ut2lK8L+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D8+omjgs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1401C1F445;
	Mon, 17 Nov 2025 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EYz5KmATx4Hr9fghoASBQogIACIZloKhnZPGzzFpff0=;
	b=ut2lK8L+PH2qiNezLphD74UQFtoaP1/pLfqT+89z6QR7GIH2s3ELN0ecpXKMJGVuspQ2C3
	/37tNDLMStttq7eCs4mQolrBPy7919DxiGxg82nF+b238wQjSUwujHjRSCwtJeV6ahVR9J
	msEaoHEp3nq1WArGPQGSG2xA5cgz8BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EYz5KmATx4Hr9fghoASBQogIACIZloKhnZPGzzFpff0=;
	b=D8+omjgsAQufiGuSUwfn0KmJOFN+m4bYIzoYvicrAtp6dW6YUNhkNIXiwGEY6AOppdS/po
	RzRYbZYa/cpEpvDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ut2lK8L+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D8+omjgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EYz5KmATx4Hr9fghoASBQogIACIZloKhnZPGzzFpff0=;
	b=ut2lK8L+PH2qiNezLphD74UQFtoaP1/pLfqT+89z6QR7GIH2s3ELN0ecpXKMJGVuspQ2C3
	/37tNDLMStttq7eCs4mQolrBPy7919DxiGxg82nF+b238wQjSUwujHjRSCwtJeV6ahVR9J
	msEaoHEp3nq1WArGPQGSG2xA5cgz8BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EYz5KmATx4Hr9fghoASBQogIACIZloKhnZPGzzFpff0=;
	b=D8+omjgsAQufiGuSUwfn0KmJOFN+m4bYIzoYvicrAtp6dW6YUNhkNIXiwGEY6AOppdS/po
	RzRYbZYa/cpEpvDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBD1A3EA61;
	Mon, 17 Nov 2025 16:24:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ho+GNERMG2mlIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Nov 2025 16:24:36 +0000
Date: Mon, 17 Nov 2025 17:24:36 +0100
Message-ID: <87fracfwzf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: au88x0: Fix incorrect error handling for PCI config reads
In-Reply-To: <20251117065559.1138-1-vulab@iscas.ac.cn>
References: <20251117065559.1138-1-vulab@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1401C1F445
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 17 Nov 2025 07:55:59 +0100,
Haotian Zhang wrote:
> 
> __snd_vortex_probe() uses pci_read_config_word() that returns PCIBIOS_*
> codes (positive values on error). However, the function checks 'err < 0'
> which can never be true for PCIBIOS_* codes, causing errors to be silently
> ignored.
> 
> Check for non-zero return value and convert PCIBIOS_* codes using
> pcibios_err_to_errno() into normal errno before returning them.
> 
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Applied now.  Thanks.


Takashi
