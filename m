Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424737;
	b=QfgEqhpDoZ/+pHnQ6Sl/eIeUTIUIiHMNvB+tRyK/SqFQViYJ5LjvZFk51dhb0k8nBwer
	 9wD9tUlqIsRLyVxULMHpZE2M6A/elUCQkR1GEcs7qAbxNYJarlKr6ZXbAhwrYVGQ3hClK
	 3ik4DkN4R6pA/fxWId+tSA+FyL2bd5PG/y5n2DyDvgaLIV+lHH3N/ZGlcyXmuaWuj6DNH
	 aNfVpHJwK+29hnuSDqoAeif2WaXxbOsbt4ZzFtpzNKoGzd+OON86vAGTkY51h+ZYc8cJ9
	 snJcp4h2wUtAT4SRdGSCy6/7bDTIeiXBUzHnvOe9ojWvfnkR5HAI9/SVTYygROfe22Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424737;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=JuTnYMVy7K7gz8a7hQGh72S+A+o8EMceIj6KlWzynk8=;
	b=fZ715CHCUZKXFrKV2OyMpTsB2DvczxuiEmqblVpSXARYY6dziS4zxYPx2ZYpzxroX3Ye
	 kOCSOutauANP2zZLbGkobjkYXUnnLIeBYGgXw8wLPDk2l7yyxbscx/W+BsDLQJuSGQ/9o
	 39bu2zvXb7AWYWCm1s3PcTMcfaVKv/NBTwP+k1csUtMpFQvgteQ5Tlod+5S8WjGuHHbIa
	 Gv2Nn822tDCg/LErHhLjRiPCYDd2LIQRhE/7nhYdi2zgJMEdieeCu+jqtv2gD/APem0OM
	 lyu7zjagxg7niOZAoDhygWzNFAFRHXgnO9hM/5AnvmgqDzO2k1MMNzBB9VIRooqkOtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="fro/+voB";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H3i2JASh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="fro/+voB";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H3i2JASh;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F395606A31F;
	Mon, 23 Nov 2026 09:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F395606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fro/+voB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H3i2JASh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fro/+voB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H3i2JASh
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 743411F7F9;
	Mon, 23 Nov 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JuTnYMVy7K7gz8a7hQGh72S+A+o8EMceIj6KlWzynk8=;
	b=fro/+voBBoj8xFqBWXUoPAVkFtnn6UMiBApW7Go1ZIQlMVhvOuLqv7H1slV+L8AA8Aqod+
	IYN1qEb2S2oIG0tXNUs6HRRPBDjI+hsucM5uKpOy9it0TOAfvJTOu4k96/g/2V02qCcUNz
	8K7Js+nAB1tFNWU4WTx+Xw5goAmml3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JuTnYMVy7K7gz8a7hQGh72S+A+o8EMceIj6KlWzynk8=;
	b=H3i2JASh39J0wNDvW+DW1gzuFO+qFjCFGyl0w4F+BTHuSQyVXHddS2wLscS+nRCKgfPKzO
	B0B+jPBgd57TSQDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="fro/+voB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H3i2JASh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JuTnYMVy7K7gz8a7hQGh72S+A+o8EMceIj6KlWzynk8=;
	b=fro/+voBBoj8xFqBWXUoPAVkFtnn6UMiBApW7Go1ZIQlMVhvOuLqv7H1slV+L8AA8Aqod+
	IYN1qEb2S2oIG0tXNUs6HRRPBDjI+hsucM5uKpOy9it0TOAfvJTOu4k96/g/2V02qCcUNz
	8K7Js+nAB1tFNWU4WTx+Xw5goAmml3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JuTnYMVy7K7gz8a7hQGh72S+A+o8EMceIj6KlWzynk8=;
	b=H3i2JASh39J0wNDvW+DW1gzuFO+qFjCFGyl0w4F+BTHuSQyVXHddS2wLscS+nRCKgfPKzO
	B0B+jPBgd57TSQDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0ECCD1352B;
	Mon, 23 Nov 2026 09:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4kU7NN4BBGs9CwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:05:35 +0000
Date: Mon, 23 Nov 2026 10:05:34 +0100
Message-ID: <87o6bfdijl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: oleg.b.antonyan@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix headset mic on ASUS Zenbook S 13 UX5304MA
In-Reply-To: <20261122-ux5304ma-headset-mic-v1-1-80589ae749a8@gmail.com>
References: <20261122-ux5304ma-headset-mic-v1-1-80589ae749a8@gmail.com>
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
X-Rspamd-Queue-Id: 743411F7F9
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -11.01

On Sun, 22 Nov 2026 14:18:37 +0100,
Oleg Antonyan via B4 Relay wrote:
> 
> From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
> 
> The ASUS Zenbook S 13 UX5304MA (1043:1c33) uses an ALC294 codec with
> CS35L41 amplifiers over SPI. Its BIOS leaves pin 0x19 unconfigured, so
> the headset mic on the combo jack does not work.
> 
> Use ALC294_FIXUP_ASUS_SPI_HEADSET_MIC like the UX3405MA and UX3402VA.
> It configures the headset mic pin and chains to
> ALC245_FIXUP_CS35L41_SPI_2 to keep the speakers working.
> 
> Tested on a UX5304MA: headset mic, internal mic and speakers work.
> 
> Fixes: 61cbc08fdb04 ("ALSA: hda/realtek: Add quirks for ASUS 2024 Zenbooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Oleg Antonyan <oleg.b.antonyan@gmail.com>

Applied now.  Thanks.


Takashi
