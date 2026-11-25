Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592493;
	b=O5/RdMe1wDSO71CIYwI1ALTtc52vupNqy5Vy8eD/3Za1q9fMvIdvJQOKi3lpkx6aZJGY
	 EgKgkrc70QPkHtYGlwb5LcPAk2lWes5irJ936sQXhA7E1oR/WrMEWQbnEhTsuYeZkojTR
	 OtpYFC4sMUW6v3TdQ59pX70819NGeyuR42k3nxcP1O1dhwcyHCoATwSYNeQAUw6COE0A1
	 X/T2FUPHaqHRpmQzYHBTnmo5CeQIGvG2pOTrlTPbA0A/8gD6cyTaIYWHCzNzi2oTFrSdw
	 DHjB1DAN9p5SBMuPGR5PYSvspx2HF4Cfz+kweb4Vzu5PMiNs5PrUXfGSFFF1wbN6zKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592493;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=+lUcpFlGuUz+DdVv4pqT76KVLhw/q/JWGXJGWIwC35Y=;
	b=RFvErFB0MAjNfA4A2YdnOugRtOUb9fzUJiOkMwBqJW63mtos4glzhuwNu/hiCMlu3Zk4
	 IIWM31oKwxretTQDsoz31MU2M+vfAM7FGarMJFKlP+X1ZXm1qxeppyOiOLJhWGnDsAU09
	 zXlPrERKGhmrF56IPHbaKFM5xqtGZ906Fk+8OxyNQonM2kM5raw1isk6wBdFEEK5+1K08
	 osdQT3h4aSkz52wOXBjTExW9xiVlL5ylJFnSvbnnDfaoro6wyDISnifylZszjmCoMT/mh
	 jU+YdTBmRDlaYhEmgCtsQbnxtTp0Hwh9y2SzAb6Eb8rDK7ceZHnGV/YCsbZe3xT9QYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tVAOOtUc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=klKuX37F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vebySQ6V;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=znYfsPIn;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2EF606A31E;
	Wed, 25 Nov 2026 07:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tVAOOtUc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=klKuX37F;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vebySQ6V;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=znYfsPIn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C1D81F399;
	Wed, 25 Nov 2026 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795592490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lUcpFlGuUz+DdVv4pqT76KVLhw/q/JWGXJGWIwC35Y=;
	b=tVAOOtUcaHlOrFTRKQ7TNz513WHyumArwhOuqNa/SQsmOakix7kBEoHjFcZJmA6KmOUICt
	3fDJdaBK2FL1Ggc2d5cdN7A5QaUD6r2WWfmg/qBy2aSp9R48ut/Q3hRJjLPByDEn1Wox0B
	dEwJ744qVuqZXUXoaC98cW0Pv7EYQVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795592490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lUcpFlGuUz+DdVv4pqT76KVLhw/q/JWGXJGWIwC35Y=;
	b=klKuX37FqFvW/jlylDcxn5AD7ayMTCzMNEh2v7OABOm9KSZfB26BjAkEE8vZIL4WmLGvs1
	fXoc0PHEmsP2JOCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vebySQ6V;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=znYfsPIn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795592489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lUcpFlGuUz+DdVv4pqT76KVLhw/q/JWGXJGWIwC35Y=;
	b=vebySQ6VTibJIqEUTUDubeIn/rjd9/B9gM82ffxavKlFy4HREwHL1nyUXmu80F6Xxg+WgC
	FUaAf0ziEWrHc+hlgCgcQJGjeDad+2oA1vcmce1FjjRpLGFNCzS4TB/1P7ds2je/K/SIbf
	A9pxodrvdzYKuL6Ejh7QhI06I8TxHSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795592489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lUcpFlGuUz+DdVv4pqT76KVLhw/q/JWGXJGWIwC35Y=;
	b=znYfsPInSyD8QmoQR5m7hL2WvM3v4fioMU8BpYtolJS2K3Pvk4tmE2+0igIYyOv7tUCkDE
	lxBWucUfS/Uw6xAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EF8E1339F;
	Wed, 25 Nov 2026 07:41:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LhPyBymRBmsjOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 07:41:29 +0000
Date: Wed, 25 Nov 2026 08:41:28 +0100
Message-ID: <87o6bd8ijb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: Fix dynamic major number assignment
In-Reply-To: <20261125073009.3091-1-sreekuttan2156239@gmail.com>
References: <20261125073009.3091-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 9C1D81F399

On Wed, 25 Nov 2026 08:30:09 +0100,
Sreeraj S Kurup wrote:
> 
> When major is set to 0, register_chrdev() allocates
> a major number and returns it.
> 
> Store the allocated major number and update snd_major
> after successful registration.
> 
> This ensures ALSA uses the correct major number for
> device registration and unregistration.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

We never thought of the dynamic major assignment there.
So major=0 should be treated simply as an error before passing to
register_chrdev().

Moreover, the current code was written before module_param_named() is
used widely, and that's why it has unnecessary assignments.
That is, we can drop major and cards_limit variables, and directly use
snd_major and snd_ecards_limit with initialization and
module_param_named().


thanks,

Takashi
