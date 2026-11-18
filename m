Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006441;
	b=PdDtzUIuXbTjVM58AsiV01PFudLxeAyDL9SnLT6SUtPSEBfxD/jRM/w/v78aRQwS6sW/
	 OhiEZ0iWF6c+WUM2EXnkgDuvUYku0kPd7+pF8ZAuHazxref6jCd/0uu9Pdw90zzGkMIMs
	 G2PHjV+1cIYINR3oG3l+24bkAfL/aP4qbN82pxccGGtNIgFJxaF9E/bcY5oIaraEv6rUN
	 wLjWKV9zMg3jdShDgaIEDOptzpFqVcEtRfdwXoSlueBEFTpsT2dED2HDXgEzq0JlBmE0J
	 7iHHO39vIAf7NaRocniso5GN/AIxz6PubJZlfP1ryfuxOho4o6SSRUuM7NRxljxspJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006441;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=YQHm613dZ0k+lbRNclh6Sw9+w0Jf3uUAIK5J+7Wjpn0=;
	b=eU+3EameO9WirYGyXOzte6HUyskhO2EasBMxb7tKF3HYIMDksGLKUOxZpnKMMsIf36SQ
	 gZAwPXq5ewNFYDD/hZ6WoJfxxWb6GsS4xurYKG66XKSzm4GZYaYABI4rK1HFM3Ocs/n2S
	 BmzhLmiyEtkgs/60lGiSX7cvwpPWOlAeng7Zz6uhIxF6VNPeAcVfRShVq6UcN9ZX0veRn
	 j6r9LBmNfXI7vlcMwnE5yg1j8gGpaWdYARic6awkp8l2FTuwURhoJWwubyhCAJ8UaPqWO
	 fEdmPQEqVNFLBbT2VxTWB2KkK2Z3sSD96a08GukJxWEA0CimfLEqI5fxDYjQgttoZVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cLqaVsa0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3kCtdv28;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=15tENDMp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WOWzT+Ye;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258BB606A31C;
	Wed, 18 Nov 2026 12:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 258BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cLqaVsa0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3kCtdv28;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=15tENDMp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WOWzT+Ye
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF5FC221B7;
	Wed, 18 Nov 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQHm613dZ0k+lbRNclh6Sw9+w0Jf3uUAIK5J+7Wjpn0=;
	b=cLqaVsa0asLTWeN48033hwZHzccmPfR9CzM8/dzSsliXDJTKnf3CBeRz8k2LXvjF1vhLAo
	MPza7742xOsShJqvyYJgr2KqtSvE/Zh+Jj1V1dOf1mjwGdnm2xSrjzxo3E2QPmRO+/ZwIb
	eN4u0Tk0k5gGpb94Dr/fH5xVB03YTRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQHm613dZ0k+lbRNclh6Sw9+w0Jf3uUAIK5J+7Wjpn0=;
	b=3kCtdv28I0GZRvMF9Hh8e65hg9V27igIQ1GxiXSTBOIGStnvEtxQUjXelGvB3dhb6AmSXc
	3yUOXyOFA5tgZfBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=15tENDMp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WOWzT+Ye
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQHm613dZ0k+lbRNclh6Sw9+w0Jf3uUAIK5J+7Wjpn0=;
	b=15tENDMpydBnQ/KwpI8foGvFRPnlpHWpkCUzNe4u6RnzRmYyW+j44bpX+9lava7euQzluc
	RmaRcUXaBNXoQRUSLj4ybr1PzZKk+5KUkO51Elj4CTMx03wt/G9n99i+OG4FxI1nXWKKnw
	k5H9T2zAS08w8MHzYDdQMNXsvxziA+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQHm613dZ0k+lbRNclh6Sw9+w0Jf3uUAIK5J+7Wjpn0=;
	b=WOWzT+YeVc9TVo0SqdSNrYqP2L8YMAv/ZxaqbK4JxXbHONvyyQk6c2lJVWPHSZ57IqSq8z
	i/+jmNN59lro8yCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8522E134E9;
	Wed, 18 Nov 2026 12:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +c6+FuWf/WoRWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:53:57 +0000
Date: Wed, 18 Nov 2026 13:53:57 +0100
Message-ID: <87v75uwba2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for the virtual PCM test driver
In-Reply-To: <20261118012830.3117724-1-sammiee5311@gmail.com>
References: <20261118012830.3117724-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: DF5FC221B7
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,perex.cz,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Wed, 18 Nov 2026 02:28:30 +0100,
HyeongJun An wrote:
> 
> I added the control fault injection to pcmtest and several checks to
> its selftest. Add myself as a reviewer so that I see changes to the
> driver and the test.
> 
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied now.  Thanks.


Takashi
