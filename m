Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726712C86A
	for <linux-sound@vger.kernel.org>; Thu, 18 Apr 2024 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422815; cv=none; b=hEd0eEPpO8bMmE0iwvdmyD/Lz4HzozpJoBqbzW2wecPy7M+2HQyricyKgycGx+9Ch1WM9g1XKI1mcYzStBgmm8MXtU9Dlyz9DA9zaM0RYl8F2s+O6A3++kSbnf903Avx4LexcF7urFq+I1ibXj58dT7XOK9qEH1xzHYDlqPOdFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422815; c=relaxed/simple;
	bh=Odm63TFqCqP6awJ6CH/UeasZjMz2Gmva6/Aa9itojB0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jnGTOKEhTY2qBXUkBORnqdlSkB9gcwGFowrpk6cq7IoGRnDUPxjM0cJDPGP/+QoZoca/zI3eb/t1DyJvbwKTSAPEQbUUmKTamGtZsDYhIrnBru6RPTqnRl79aBVZNWu+uYkW7GFryykJ8+oUjt0iNLqGt67kts4mSQKw7m0tzJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pzDF4X8g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SEN94Zyj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pzDF4X8g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SEN94Zyj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pzDF4X8g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SEN94Zyj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pzDF4X8g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SEN94Zyj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 988FE5C536;
	Thu, 18 Apr 2024 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713422812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wRveC6pfmEL5/F/c5UI4wvJTKSz1oZ0/qKs8Gg37gMQ=;
	b=pzDF4X8gI1aoq3tAj5hkjWr/LZUFrSu7Obi0aWEIiNd2GmneoqvHUA8VwWQB8IXx9tAPQt
	fivxCEZqHZ/R1kgXWJQV0Dp2VNivaa8K5HGn/3K7r7rprA76IsMMiRt3L2fdBvXygiT0L8
	Wb4A7Xhmf4d2pCfTNMHaMOMcqHWEni8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wRveC6pfmEL5/F/c5UI4wvJTKSz1oZ0/qKs8Gg37gMQ=;
	b=SEN94Zyje1jQPKYlYGNEA9SHchW+RgLm6PBa95GWxpZP/HzoSnL1RcCnl5G+LPfMx4uQkm
	MkF+1+rnDXhRnWBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pzDF4X8g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SEN94Zyj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713422812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wRveC6pfmEL5/F/c5UI4wvJTKSz1oZ0/qKs8Gg37gMQ=;
	b=pzDF4X8gI1aoq3tAj5hkjWr/LZUFrSu7Obi0aWEIiNd2GmneoqvHUA8VwWQB8IXx9tAPQt
	fivxCEZqHZ/R1kgXWJQV0Dp2VNivaa8K5HGn/3K7r7rprA76IsMMiRt3L2fdBvXygiT0L8
	Wb4A7Xhmf4d2pCfTNMHaMOMcqHWEni8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wRveC6pfmEL5/F/c5UI4wvJTKSz1oZ0/qKs8Gg37gMQ=;
	b=SEN94Zyje1jQPKYlYGNEA9SHchW+RgLm6PBa95GWxpZP/HzoSnL1RcCnl5G+LPfMx4uQkm
	MkF+1+rnDXhRnWBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75A391384C;
	Thu, 18 Apr 2024 06:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bU5sG9zBIGZMeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:46:52 +0000
Date: Thu, 18 Apr 2024 08:47:01 +0200
Message-ID: <87frvjxj4q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vitalii Torshyn <vitaly.torshyn@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	luke@ljones.dev
Subject: Re: [PATCH] sound, hda/realtek: Fixes for Asus GU605M and GA403U sound
In-Reply-To: <20240411125803.18539-1-vitaly.torshyn@gmail.com>
References: <20240411125803.18539-1-vitaly.torshyn@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.69
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 988FE5C536
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.69 / 50.00];
	BAYES_HAM(-2.68)[98.58%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]

On Thu, 11 Apr 2024 14:58:03 +0200,
Vitalii Torshyn wrote:
> 
> Added the correct pin table for Asus GU605M and GA403U, enabling all
> speakers to be controlled with the master.
> Updated quirks for GU605M and GA403U by including the pin table patch
> in the chain.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>

Applied now to for-linus branch.  Thanks.


Takashi
