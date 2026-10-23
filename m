Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762522;
	b=b/gQWx1WgX5vVaASsmeKaf5dglQ8nuKKqlMKNts8bcfUoRbZIinyRT4VXJZEnTY21b5r
	 k06gYZ5vLCjvnbLkd/uP1G2B1WT5XO64OEF5UkU5oYNjbYv6jU0goiBYtR1r63fgBwaWA
	 UpRXnrnnqGMTNDumSlcnXIFgOfDlKIn7NBIzOx/RaVxhUrbrc6I83DwQBIQ/wM/D9hXn0
	 d3ofH1BsEtEWYEo1AmtX8kL39pDujcZSOyzXUtn6YiyUfqXMtD3heQDJfWbaePQYFAGeh
	 OxiYtRbri2Gym1QLgjq5fRG+ETbcDSv6YX2eMr85rLVe7kubE+QfG9WWO5Z4/DIN9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762522;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=Cltn9Ed0Zh7jf5AL4S/SU/r3hpPxlGQaFj2fHrN7BPw=;
	b=L/PWwk/raaNDZgeljHKpARxa7tjI8LlzD/kOD0C8a0a7LxZfSajhhXtrWSElMNQA2Zqj
	 jOTXULVAp12i9ZvCTppQJWhFqAGA2utt+9kLZ4MAezyvRJxukoOrdEZlP5vGI2CX+1J/H
	 0kr84HOJdtn0aFsPCGfWygyEeryXUB8jIMrm94My0jAfnEcctGmgqdcBA5rj2v6vk0oE+
	 IHAHSKzlsGr04OmMPyeDlm75OctdJ40+alfM/CVh6vPTMl9XgCT8f1trX1g8sgQzgnDnB
	 vJpg5G6vWL3CJ1ATHAMwZt3CCm41SHI0Cf4OyiSP2WM3xtmxRmehLEutmFYQay183kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ryBie12;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cO5xoIez;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ryBie12;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cO5xoIez;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C3606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 13:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ryBie12;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cO5xoIez;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ryBie12;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cO5xoIez
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3917422173;
	Fri, 23 Oct 2026 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cltn9Ed0Zh7jf5AL4S/SU/r3hpPxlGQaFj2fHrN7BPw=;
	b=1ryBie12y8rEU/qmc9hFaFQk/wQOcPx6AYaPZ2d+CAQen1U0F6gOPWd6Fg/CEfvLWUf2On
	6cOiXN4PvBPaD6vnnJ3nPuVQ65ua5dfTwbHIjUBQR0vfpiGVHNZ6457E/P9PjNBPC6l8kk
	UptzIcepkQHc637YaOYqjNiN5dwkbJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cltn9Ed0Zh7jf5AL4S/SU/r3hpPxlGQaFj2fHrN7BPw=;
	b=cO5xoIezBBleQLtD9+usVvsHEHml5CvALxXc4ZRc1D1mr2g7v/T3NLc3GKMUEuHM1pDbkG
	hr0e9BNDrh/FcyBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cltn9Ed0Zh7jf5AL4S/SU/r3hpPxlGQaFj2fHrN7BPw=;
	b=1ryBie12y8rEU/qmc9hFaFQk/wQOcPx6AYaPZ2d+CAQen1U0F6gOPWd6Fg/CEfvLWUf2On
	6cOiXN4PvBPaD6vnnJ3nPuVQ65ua5dfTwbHIjUBQR0vfpiGVHNZ6457E/P9PjNBPC6l8kk
	UptzIcepkQHc637YaOYqjNiN5dwkbJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cltn9Ed0Zh7jf5AL4S/SU/r3hpPxlGQaFj2fHrN7BPw=;
	b=cO5xoIezBBleQLtD9+usVvsHEHml5CvALxXc4ZRc1D1mr2g7v/T3NLc3GKMUEuHM1pDbkG
	hr0e9BNDrh/FcyBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC61D133F6;
	Fri, 23 Oct 2026 13:35:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HFwGKJBi22pvUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:35:12 +0000
Date: Fri, 23 Oct 2026 15:35:12 +0200
Message-ID: <87ecdga6b3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests: ALSA: pcmtest: Test error injection and pause
In-Reply-To: <cover.1792660433.git.sammiee5311@gmail.com>
References: <cover.1792660433.git.sammiee5311@gmail.com>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,perex.cz,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80

On Thu, 22 Oct 2026 13:12:41 +0200,
HyeongJun An wrote:
> 
> The pcmtest driver can return errors from its PCM callbacks and
> supports pause, but the selftest covers neither. This series adds tests
> for both.
> 
> Patch 1 moves the capture data check into a helper, so patch 3 can
> reuse it. Patch 2 tests each inject_*_err parameter. Patch 3 tests
> pausing a capture stream.
> 
> Tested on x86_64 with the sound/for-next driver, built for a 6.17 host.
> All 10 tests pass in three runs. To check that the pause test catches
> real bugs, I loaded two broken drivers. One keeps running on PAUSE_PUSH.
> The other restarts the data on PAUSE_RELEASE. Only capture_pause fails
> on each.
> 
> HyeongJun An (3):
>   selftests: ALSA: pcmtest: Move the capture data check into a helper
>   selftests: ALSA: pcmtest: Test errors from the PCM callbacks
>   selftests: ALSA: pcmtest: Test pausing a capture stream

JFYI, I postpone merging this for 7.5, as it doesn't look like a
regression fix.


thanks,

Takashi
