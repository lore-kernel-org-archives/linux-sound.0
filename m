Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194257;
	b=V7E+ySofhBMKhaWwJUr1GhVW/NVchmPcu7x1kjor6tJSHEaW+JxsRNDxOTZ39RU5nLoz
	 mWNHpFTq5Bs+90IUqHtqiISTQAJu8Eba0LOhD1Flaiacfvm2gLBJo8y3/+tW0R9RBGNZO
	 bHBpo/vNHtYRKKy/xKRGbYKUkN3GMf69SdHijzfONi7qFHijUS6K1I0rbWhvb/Og/qgek
	 iaZG9Li0Q5JMjtjcQ/8HhmVoN62OpHqrvtho5w7/iMZNOGG+av9HuCffVz21D61F+pWQV
	 1WXEtvdLW5OOdcPg1hiJcEKpDv0267Wy1VVEVlX49m9XlkCLmdJVR1uZCxG6iMy3Eng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194257;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=CmpWKJbfubzGGzDkzlinMkViU1fXFJNyi9QfcSY/CvY=;
	b=lWZJmQQQ6NBcSL7Lh2MvuURIwh338lwYfTJ8jLrib14YtpS5lGBRO9d8BhFGx80T++E6
	 lJqBA3yPDtgoHEZOx3O7GQWWyA3uTVBd4RI2MkFpqGw2L4rzKsIsNi6raXAzns4UWqoTc
	 Jko19Pkv7Nki/iOfxx3YOXyetaeVjkGSB3U7REiTjbrJR2X/mj6TCbc8Yzn5zbIks4TSu
	 m1+qxCurGHiCm74JNNlsMFe92dM2HcvJgVmYfpFcVDgNWjCPWNA/QfS+fCLQBvPLahXC9
	 jx1dcvLflrlMHJHRz9FFxaF4DxefCwrWPDs4x7FRsgfDA5lLVxPT9iGWWtM/S6pZ2Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xV59xmCD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="3Mf+nx/h";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xV59xmCD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="3Mf+nx/h";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53AB606A32C;
	Fri, 20 Nov 2026 17:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53AB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xV59xmCD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Mf+nx/h;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xV59xmCD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Mf+nx/h
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB97A2207F;
	Fri, 20 Nov 2026 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmpWKJbfubzGGzDkzlinMkViU1fXFJNyi9QfcSY/CvY=;
	b=xV59xmCD5qCJbKsO1mTSnJWlnnXltuR5FySDa1DCTjYP0AyVOsCYcvGmOXYNBcR24czRE+
	OYygriTnGUVY+vZTOX9ThU7aQxN1VEynn1US8Ah+hq7Sy37dbic7zy/j5dUUA/k61/Fum2
	jx6KCxSTHzn/g/24yR1aFKN8trEKkuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmpWKJbfubzGGzDkzlinMkViU1fXFJNyi9QfcSY/CvY=;
	b=3Mf+nx/hy3OQPbKYCpu5B/qYyew6Lxt3vMF5qjlAF9bk13s/yjcS+j91Xi/QtkZ0JDT+mn
	/0Ul8QUDIaWl3JDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmpWKJbfubzGGzDkzlinMkViU1fXFJNyi9QfcSY/CvY=;
	b=xV59xmCD5qCJbKsO1mTSnJWlnnXltuR5FySDa1DCTjYP0AyVOsCYcvGmOXYNBcR24czRE+
	OYygriTnGUVY+vZTOX9ThU7aQxN1VEynn1US8Ah+hq7Sy37dbic7zy/j5dUUA/k61/Fum2
	jx6KCxSTHzn/g/24yR1aFKN8trEKkuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmpWKJbfubzGGzDkzlinMkViU1fXFJNyi9QfcSY/CvY=;
	b=3Mf+nx/hy3OQPbKYCpu5B/qYyew6Lxt3vMF5qjlAF9bk13s/yjcS+j91Xi/QtkZ0JDT+mn
	/0Ul8QUDIaWl3JDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 968361342D;
	Fri, 20 Nov 2026 17:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h5icG459AGt5SwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 17:04:14 +0000
Date: Fri, 20 Nov 2026 18:04:13 +0100
Message-ID: <87a4n3wi2a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix incorrect numerator selection in snd_interval_ratden()
In-Reply-To: <20261120113632.2761-1-sreekuttan2156239@gmail.com>
References: <20261120113632.2761-1-sreekuttan2156239@gmail.com>
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

On Fri, 20 Nov 2026 12:36:32 +0100,
Sreeraj S Kurup wrote:
> 
> When the calculated numerator is smaller than num_min, the
> function incorrectly sets it to num_max instead of num_min.
> 
> This can produce an invalid interval by making the calculated
> minimum numerator larger than the maximum numerator, even when
> a valid range exists.
> 
> Set the numerator to num_min when it falls below the minimum
> allowed value. This allows the function to calculate the correct
> lower bound and prevents valid intervals from being rejected.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
