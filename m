Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905771;
	b=At+Tsa97ALpXd9ZhaIhvSFzHEVx2Wy0QLK/MFcxqXF9Wv1oZou1afxMOkV1ApmMo1IkE
	 ZVpo9t/MA8eGaJ/HQs42TXQbaDW+sXqwW9cmLZeBfhA9qO8f1m8qUFbv2FHU+iNwJDR8b
	 /f6eoQdnbAqT9NdNI9PgXOie7f0GlZfZU8pO+VrJoiElVRDKhhsaVi/hqedIe9HapUKFt
	 MOMZJ5/qWw8Kh4xnhWiOdLCHkML08jzXZcV1JvZDG4Vjw+tbqKC2Yqeq6PlbQ0MBk4z+u
	 vYK3KVPFjOzqEuzL8c2mzY/WhS2YiRta9Iv7dVbXPxVlu2O9mAXpLhU0PK3AXf7MImw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905771;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=ur32DdfOvs+5Wrm9nLHjNLlSmiMojBpVaTC6KaKH0FU=;
	b=Gq8AWBxex5y6SPMl3aKA72i9/xyGRWnhWvQy7jLzu5AYtlC0O/q04ZruRCXZq9JeJXf6
	 XJ14aeGrTLysxr0H3EBkv6/sIahocolfdxNgtUeDVlEqVVrs3OPqPyR8E9E8CEV0vzUDV
	 XGSLv1z9EgLbPmudPSA2OySZx2v6UCYrDQoyp2/iMiQoOBo0kLvsWmNlfrYy0I2T9fIpl
	 1ZXpkeafkJ1pvKdXjZldNrN5QR9IC9ItnKCDBFLb3K1qVdGF+CNoNPwsgYOaHUhfTDoay
	 daEqFX+3g1fC3bpAyfxomDFnOkm2CH0gpLozYJ7Ka5Hm5y/A4lS9O0Ll9sVm4PJBPow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=baUheQVG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OYXAjad7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=baUheQVG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OYXAjad7;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6131606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 08:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6131606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=baUheQVG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OYXAjad7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=baUheQVG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OYXAjad7
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 21155221ED;
	Tue, 17 Nov 2026 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794905769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ur32DdfOvs+5Wrm9nLHjNLlSmiMojBpVaTC6KaKH0FU=;
	b=baUheQVGdW/UuPntTjI9KV+EOI3gOpqw2chUKQONvlUPoyHonSPMUsV84HJmrfcHtEBqqk
	73JCngEtDzS9M2LjVBA9zfx/u1BCafcPZ8Cwg6q0KAPGwmUF4EdXjbstW2YJMrRjUc9KfS
	EpP0kM61Jqi31bpJBOHw3PiKwuUNPJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794905769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ur32DdfOvs+5Wrm9nLHjNLlSmiMojBpVaTC6KaKH0FU=;
	b=OYXAjad76FtJAbvmYkBfonAoafAKUJU6Xi3n/JjcU71bawBLYcIsLPPaXCG0jN1eWXueHi
	pCPloT7sHsH+GQDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794905769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ur32DdfOvs+5Wrm9nLHjNLlSmiMojBpVaTC6KaKH0FU=;
	b=baUheQVGdW/UuPntTjI9KV+EOI3gOpqw2chUKQONvlUPoyHonSPMUsV84HJmrfcHtEBqqk
	73JCngEtDzS9M2LjVBA9zfx/u1BCafcPZ8Cwg6q0KAPGwmUF4EdXjbstW2YJMrRjUc9KfS
	EpP0kM61Jqi31bpJBOHw3PiKwuUNPJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794905769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ur32DdfOvs+5Wrm9nLHjNLlSmiMojBpVaTC6KaKH0FU=;
	b=OYXAjad76FtJAbvmYkBfonAoafAKUJU6Xi3n/JjcU71bawBLYcIsLPPaXCG0jN1eWXueHi
	pCPloT7sHsH+GQDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D40E71334C;
	Tue, 17 Nov 2026 08:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KCbzK6gW/GonXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 08:56:08 +0000
Date: Tue, 17 Nov 2026 09:56:08 +0100
Message-ID: <87zev7zviv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ptrnt@proton.me
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP ProBook 455 G8 mute LED
In-Reply-To: <7MuWwdxL8P9sa_U2G1ztBAaV6q-vlnX-VE6W_awGFtxOQWXQ12kIoRUqrnlwkQH_gE1Vy6Fg1jutNWO9MuVteVwQq6vf4DKZdVOfa3gB0TQ=@proton.me>
References: <7MuWwdxL8P9sa_U2G1ztBAaV6q-vlnX-VE6W_awGFtxOQWXQ12kIoRUqrnlwkQH_gE1Vy6Fg1jutNWO9MuVteVwQq6vf4DKZdVOfa3gB0TQ=@proton.me>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[proton.me:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Tue, 17 Nov 2026 05:30:44 +0100,
ptrnt@proton.me wrote:
> 
> 
> The F5/F8 mute-LED keycap indicators do not light up on this model
> (SSID 103c:8a91) because it is missing from the
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk table, even though
> sibling ProBook/EliteBook models (G6 through G11) already use it.
> 
> Signed-off-by: Roman Popov <ptrnt@proton.me>

The patch is inapplicable due to the tabs/spaces breakage.
Could you fix your mailer setup and resubmit?


thanks,

Takashi
