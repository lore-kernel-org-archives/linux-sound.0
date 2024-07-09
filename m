Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC83A1DB
	for <linux-sound@vger.kernel.org>; Tue,  9 Jul 2024 07:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720509376; cv=none; b=p079YkZuf2WhRrNvAFeEo3AHaXOVhVxWb3XAp7V9KdPCWXTQtx4an2DnPqJxAAGnSuljsW1sRn+FpLLLCl/wJ3Fhp0pjrNDOCR6uYLOTv4rxhub/m00ezkFkGwm2vJdH4CL3xlkSZ2Fv+wboP+J2BVNXogPKNKxuRqGU40tKHjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720509376; c=relaxed/simple;
	bh=NCTVZmOheqhnKxDkDQ0GihYpV3LGrUPOoqcHJTrNtvs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzg38KYqJXn262Xb65xi1visP//2MKVWXYk5uvaWSRdnV2CVCHT/WgX2PLQP2U9FEORJxvn1a38p/KWgkR/ShBvU7Mi9gTdONqn7U1XoN+Zke74Gc1js/V6/526PPtWyFo7+9+m3XuJeZC6gHn7UOUhPaY5DBhLu9iUYxTWF8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zfnf+Fr/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tbjL9tAY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zfnf+Fr/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tbjL9tAY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zfnf+Fr/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbjL9tAY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zfnf+Fr/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbjL9tAY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8417C21B93;
	Tue,  9 Jul 2024 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720509372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfeqBGBua7GhObnZbTdkG14adNc+6QdBaPRO88efiBE=;
	b=Zfnf+Fr/89gAnSD+8Zal2JnNfnZ5agu2UhwVl81pxrTbBA3yE4NTAwpgFGFWwYNWRRU0ik
	VWBltjdSTLZJgN2+OpI7iJ5/A5hui8QcXxI605syYFtxeB2YHHfqrqbHIM4xePp93zCdHS
	efKKjfHT9JUTaK52vrKYm6tGavbPxJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720509372;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfeqBGBua7GhObnZbTdkG14adNc+6QdBaPRO88efiBE=;
	b=tbjL9tAYzIQhA4MtzwtsYbLsr3IrvSeGogAT84+K8YgfAJaKf0zwtXlFsZ8VLsEI48KzkA
	zsuGAg8Glqy4lPBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Zfnf+Fr/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tbjL9tAY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720509372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfeqBGBua7GhObnZbTdkG14adNc+6QdBaPRO88efiBE=;
	b=Zfnf+Fr/89gAnSD+8Zal2JnNfnZ5agu2UhwVl81pxrTbBA3yE4NTAwpgFGFWwYNWRRU0ik
	VWBltjdSTLZJgN2+OpI7iJ5/A5hui8QcXxI605syYFtxeB2YHHfqrqbHIM4xePp93zCdHS
	efKKjfHT9JUTaK52vrKYm6tGavbPxJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720509372;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfeqBGBua7GhObnZbTdkG14adNc+6QdBaPRO88efiBE=;
	b=tbjL9tAYzIQhA4MtzwtsYbLsr3IrvSeGogAT84+K8YgfAJaKf0zwtXlFsZ8VLsEI48KzkA
	zsuGAg8Glqy4lPBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FDE11396E;
	Tue,  9 Jul 2024 07:16:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CLY1FrzjjGbCEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jul 2024 07:16:12 +0000
Date: Tue, 09 Jul 2024 09:16:43 +0200
Message-ID: <87jzhvc9wk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: ppc: keywest: Drop explicit initialization of struct i2c_device_id::driver_data to 0
In-Reply-To: <20240708130254.9631-2-u.kleine-koenig@baylibre.com>
References: <20240708130254.9631-2-u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8417C21B93
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,baylibre.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 08 Jul 2024 15:02:53 +0200,
Uwe Kleine-König wrote:
> 
> The driver doesn't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Thanks, applied now.


Takashi
