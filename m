Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424495;
	b=xlatluFbXTY5oXjoMZy3VjuO2RfX5K7wUv0XlfebWrcj1e8RbP91dHXaOPJYA5ffGuSO
	 WTRQ0JVtyGAo5mIEss2LceryQAuairyuJ5B5L36YfJ17d1A/WMXgJki4RngQ7gmJg8tg6
	 dXu/0mVxljOLCCJ0458CAImzXwEqyr2kXXoOUHr+eKhQH0HyBekZF5j0g5zPKVdmZti9n
	 HC3N8idtovf9HuD4udMcVGHRHsWzNNNknzm8wWMAjxYC4kdoRXHBgafoiFhuJHhRbdw4R
	 2GmMxRr2ZI7T77YSIVZBqJwB7YumFrdon6S5XuZtIswjBZ8tuOUuHj89vqWltYMQtuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424495;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=8IaUYIQEtbwaKxpNvH1tQqcdy0I8wU+cHele+MHmUG8=;
	b=lRliI7/5sLWSMvTfCSNqTBx327aC+4eN6g+xCG7TRYwOrotOMSb7ocPMRG3PGnxP+zeo
	 WFdEvQp5ZHLMQjIRwLz8sLjh9lBgr1Zsl6WKO35PEhlAwyLxvFBrGZzroviXi0GG6x4k4
	 SDoK5F2jXos49t9Bc1jKteNzoTDYh8JshB/MfbT6o/cZcNqby0exJZFKiQ/F2xrtui41p
	 GmDbmMdXw/qOpgE1M8EpKxE7ESUVIBY+fJfxH1JN+N9kakcT/hYlzogPkH1yxjzNFM+gG
	 pfdUezJlwYeo2IT7WB/WWgx6h+qYbcEEgDYDi+WNimSefVDVSJ3fSi1j5vRt+0v/wzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rQSslSAF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/oeXy7Af";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rQSslSAF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/oeXy7Af";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661A606A31A;
	Mon, 23 Nov 2026 09:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C661A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rQSslSAF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/oeXy7Af;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rQSslSAF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/oeXy7Af
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FE9B2202C;
	Mon, 23 Nov 2026 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IaUYIQEtbwaKxpNvH1tQqcdy0I8wU+cHele+MHmUG8=;
	b=rQSslSAFrHraMwSrYavXTOWRU6br7ne0hV3AkkTcX59SS/iVb9ZjNnHVgDVLnH6joiLaxT
	SMljyxdMb4b+gbTCGep6XMhs+AxYGX1uNH0ALlwkZVhtEFtfP+Qiwd6Xh23p1fvkDyZGFm
	alHcK/4K83iQ7VoR22T7TJFl0AI58fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IaUYIQEtbwaKxpNvH1tQqcdy0I8wU+cHele+MHmUG8=;
	b=/oeXy7AfvsoCis5PSfrwuih2EeRu/aAAcVbSBrCJTKZ0toVqCA+kGbUo7NR/fDhGg3irvO
	t/ZO38UH836b/RCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IaUYIQEtbwaKxpNvH1tQqcdy0I8wU+cHele+MHmUG8=;
	b=rQSslSAFrHraMwSrYavXTOWRU6br7ne0hV3AkkTcX59SS/iVb9ZjNnHVgDVLnH6joiLaxT
	SMljyxdMb4b+gbTCGep6XMhs+AxYGX1uNH0ALlwkZVhtEFtfP+Qiwd6Xh23p1fvkDyZGFm
	alHcK/4K83iQ7VoR22T7TJFl0AI58fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IaUYIQEtbwaKxpNvH1tQqcdy0I8wU+cHele+MHmUG8=;
	b=/oeXy7AfvsoCis5PSfrwuih2EeRu/aAAcVbSBrCJTKZ0toVqCA+kGbUo7NR/fDhGg3irvO
	t/ZO38UH836b/RCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAC001352B;
	Mon, 23 Nov 2026 09:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H09qJOwABGs8BwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:01:32 +0000
Date: Mon, 23 Nov 2026 10:01:32 +0100
Message-ID: <87wlq3diqb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Enable native DSD for Fosi Audio DS2
In-Reply-To: <20261123011401.1545242-1-morf3089@gmail.com>
References: <20261123011401.1545242-1-morf3089@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 23 Nov 2026 02:14:01 +0100,
Gianluca Boiano wrote:
> 
> The Fosi Audio DS2 (USB ID 262a:0001, Savitech controller with a
> Cirrus Logic CS43131 DAC) exposes a UAC2 RAW_DATA playback altsetting
> (altset 4, bmFormats 0x80000000, 32-bit subslot), but ALSA reports it
> as SPECIAL without the DSD_RAW quirk, preventing native DSD playback.
> 
> Add the device to the quirk flags table with QUIRK_FLAG_DSD_RAW, as
> already done for the ddHiFi TC44C (262a:9302) using the same vendor's
> controller. With the quirk enabled, altset 4 is exposed as DSD_U32_BE
> and stereo DSD64, DSD128 and DSD256 streams (88200, 176400 and 352800
> frames/s) play through it.
> 
> Tested using snd-usb-audio quirk_flags=262a:0001:DSD_RAW on
> Linux 7.3.5.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>

Applied now.  Thanks.


Takashi
