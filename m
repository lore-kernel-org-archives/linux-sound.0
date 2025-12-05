Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB3932F767
	for <linux-sound@vger.kernel.org>; Fri,  5 Dec 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764945017; cv=none; b=FP+BvzYZSP49wnWRaCJcmBqA10/Ti+wuRcf6+Qh5Y0EReaFSanKwvbT/3ysFiW0mCitzJuNcf8RXPBFkC4J51fjCCoFWc1p5/dK5fuG7wIdUR56gsgioP/nBYeBAX0CdGyvqHEOQBbOw1Fjrabt1Il0FjkB6pPpfMosNAURmeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764945017; c=relaxed/simple;
	bh=WLu8aHLj67frTcC1JuZMoLwhjW+5Rb3WGfEAe8xwj4U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTDmVe9uotJCSZfk05lPh7a4kaxVCKdG/mJpMMcr5q9FJyZ8KzasW3S9TiPAgUHu5xNY8FNhHuXinZazAD80Hei1aX16mEbey2uh+tXp65ZC69wlF5kI1MF8cWOYA+MlnpqGOl9M89DzK2rfTUFRG1hExWyNuy7K3rhhXf2C5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QyAI1mT5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XRBxKcAd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NEtgfcdE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u8ko77i6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QyAI1mT5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XRBxKcAd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NEtgfcdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u8ko77i6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A45A336EE;
	Fri,  5 Dec 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764945006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kIMGm7W1pFpTNSSNGJ7DEEHJGepKahZAM6R04sU85Zw=;
	b=QyAI1mT58V1cT5RWxzErYqCKuWTN7sMxiUSkHbi3rgGguOriu8X4cALVdlomaj63QJPm6h
	GSlQKkGHnNvetIBk/6O6AvkEoQ9pTOfS9VP13RXjS4hhFFP3qsUWBYkk8MCdimTXAYvjhz
	3VO9FaXNGqkMH4fbSm/EeuBwPPbkHoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764945006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kIMGm7W1pFpTNSSNGJ7DEEHJGepKahZAM6R04sU85Zw=;
	b=XRBxKcAdh/d2K4WM2g3Mi2nKaGatwEMkLENOmz23Rl3AY/8ElKgDGmMaibtKbDckDgUxK0
	Ui1FLmKpoJADpGAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NEtgfcdE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u8ko77i6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764945004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kIMGm7W1pFpTNSSNGJ7DEEHJGepKahZAM6R04sU85Zw=;
	b=NEtgfcdEjOPL5kv/0LIyTby1c4NxJpiSEpvUh4r6aep/a9uox+g0l+98Z2zZ0TJ9S1BVUK
	Y+P0nJUhl2nh9l0vcQ8+kn6JwtejQUg1HmN9yp9o9A/fkJzF1k3XjS5jYH4DKq+WMVCMSj
	DT2QkYF5UHiYsyQBKg8SNPKjGqN8EHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764945004;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kIMGm7W1pFpTNSSNGJ7DEEHJGepKahZAM6R04sU85Zw=;
	b=u8ko77i6P/L1pKfN+s8ewKUWna14sUOMxHTGHpsFH940CQapDr0KACzGwxfuG5DOpW1ORn
	rCu73ild5NHYXKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 239013EA63;
	Fri,  5 Dec 2025 14:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MapkB2zsMmlSBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Dec 2025 14:30:04 +0000
Date: Fri, 05 Dec 2025 15:30:03 +0100
Message-ID: <87o6odvw5w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
In-Reply-To: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
References: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 7A45A336EE
X-Spam-Flag: NO
X-Spam-Score: -3.01

On Fri, 05 Dec 2025 12:16:31 +0100,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add CIX IPBLOQ HDA controller support.
> 
> ---
> ChangeLogs:
> v1->v2:
>   - fix dt-binding issues
>   - remove delayed work for probing
>   - refine dma address traslation
> v2->v3:
>   - update dt-binding commit title and message
>     - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
>     - use full sentences for commit message
>   - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
>   - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
>   - "cix,model" to generic "model"
>   - change the addr_host_to_hdac bus callback to addr_offset field
> v3->v4:
>   - describe more for both dt-binding and driver commit message
>   - remove __maybe_unused for pm ops
>   - fix robot compile warning for 32bit system
>     - Forced type conversion for CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET
> v4->v5:
>   - rename "clock-names", "sysclk" "clk48m" -> "ipg" "per"
>   - remove "reset-names" property
>   - remove "model" property
>   - additionalProperties: false -> unevaluatedProperties: false
>   - update the dirver since "reset-names" removed
>     - mostly is devm_reset_control_bulk_get_exclusive to devm_reset_control_get
>  
> Joakim Zhang (3):
>   ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
>   ALSA: hda/core: add addr_offset field for bus address translation
>   ALSA: hda: add CIX IPBLOQ HDA controller support

Applied all three patches now.  Thanks.


Takashi
