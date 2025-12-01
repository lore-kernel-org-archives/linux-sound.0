Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09E327798
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602861; cv=none; b=mWOeet5e0S/lMWa3P/gtWN6A5UncG+R5vByr8SaY7SVhOReqwh8euLIkxsvMzgOKnOLbgjuAXCqQK13mMbQEe8IG2ctoBSau/bJz8Z3/5w6Wb3g79icqWcI6y8qgVodvoVFHI2yGwdHC5DzIONhmUIVC0AIHbxyCDT/vLmmC1bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602861; c=relaxed/simple;
	bh=BiubnQ3m26U2+tuqLw8RolQL3rjFsmlqGg3/mnRcT8A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y5bSFmHWFftjK1q+dSi8qeT+lphATd1et3xEyOUVQu4t+RRNdS4a2H8gWFfpMFWwxi0RUmDhw/fyQJ0J0cSArNPSRcW46byn1hnMLjZiIqUDXzcBh9WOMnak/5CE0katN2sSN1H/4TrX4i1kaNedr/TrQiElE7xek5QoJKe3svU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LFDio4H5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kgFXfolG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LFDio4H5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kgFXfolG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LFDio4H5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kgFXfolG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LFDio4H5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kgFXfolG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7093533695;
	Mon,  1 Dec 2025 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764602858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcnjNzpGRftS/t6sF5X1fX9gl2XsrqpNru0HvESTLnc=;
	b=LFDio4H5fEcTh22tcxil6VU0dlrvtaL6KAde6YbbQsC7qsxrAP4U+8EOKDzleWsxYFqmQd
	tFK6gqn60BMH+IJRLZLpH6opkN9qG6M+VPfwWTzztOVY1D5ZmOL4HPV1RUR4U25+oSDLbQ
	DeYCu9wccm2ZUM8DNvJ4X8YS/nhpvi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764602858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcnjNzpGRftS/t6sF5X1fX9gl2XsrqpNru0HvESTLnc=;
	b=kgFXfolGBTkNjZUq5kFe5qwwkSAEKNOKdCFPtI0Dy/Zoy/UwAg4k/Uuy2d48yzv4M7Lh/9
	SQbiVXm4NFRUXBDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764602858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcnjNzpGRftS/t6sF5X1fX9gl2XsrqpNru0HvESTLnc=;
	b=LFDio4H5fEcTh22tcxil6VU0dlrvtaL6KAde6YbbQsC7qsxrAP4U+8EOKDzleWsxYFqmQd
	tFK6gqn60BMH+IJRLZLpH6opkN9qG6M+VPfwWTzztOVY1D5ZmOL4HPV1RUR4U25+oSDLbQ
	DeYCu9wccm2ZUM8DNvJ4X8YS/nhpvi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764602858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcnjNzpGRftS/t6sF5X1fX9gl2XsrqpNru0HvESTLnc=;
	b=kgFXfolGBTkNjZUq5kFe5qwwkSAEKNOKdCFPtI0Dy/Zoy/UwAg4k/Uuy2d48yzv4M7Lh/9
	SQbiVXm4NFRUXBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29DDF3EA63;
	Mon,  1 Dec 2025 15:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Rz0JCeqzLWnvHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Dec 2025 15:27:38 +0000
Date: Mon, 01 Dec 2025 16:27:37 +0100
Message-ID: <87h5uakys6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: hariconscious@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: rawmidi: Fix inconsistent indenting warning reported by smatch
In-Reply-To: <20251201151137.29536-4-hariconscious@gmail.com>
References: <20251201151137.29536-4-hariconscious@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 01 Dec 2025 16:11:40 +0100,
hariconscious@gmail.com wrote:
> 
> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> Fix smatch reported inconsistent indenting warning in rawmidi.
> sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
> indenting.
> No functional changes were introduced.
> 
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>

Applied now.  Thanks.


Takashi
