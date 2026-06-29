Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E56382F31
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729015; cv=none; b=OwSCILOpC92mTptrBP7fM81bm7A17HbOT17sEINLsQf3X3KSOBAEOJQ6SHsnEzSCmLo4v1owvgqZP6fNN7rArVee0z6RWa0hbpBEro1UDfodoBL9SaM4hx2ju9odaA6avfyUuSo5JzZIQT5NwhsAFfzy4rbizXn0nA+FN4iCg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729015; c=relaxed/simple;
	bh=tqi5EniToFvEHvBnbiKS3cwpUL4FXlHqGggRuAVHJGw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNRG514Pk0Ihi0qKluA5lmCPMbo9fZf8Ul+1kVP9clwKRWlP2J6woF4OxVvSngqy2ANSamPumEiTY5Bq/3oVM9ANxhC4F2p82zqOhgxxgUnh4DlCsaCeRsMoifMNsycFjWRG3WyvAqLNos3QjBeNUJ482W6dARrbAM64RpNLQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ngNR6czo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sj0fkFX/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ngNR6czo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sj0fkFX/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ngNR6czo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sj0fkFX/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ngNR6czo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sj0fkFX/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3DD8175D81;
	Mon, 29 Jun 2026 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782729011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TpqkXEII5P2mbTBPf+VPf5pOk55FiEfaOD0EiV4Yao=;
	b=ngNR6czoG1yARr4WdAEzjp70XWD/PKqmBiZS2INC5PUtVTmEWxtQektUhFUNOU2tJaQE7f
	h+zDagPewfG7VThHUnvY5Fp+QNfmUyARCPvou0FfY4fCvwg6eSqwZITeUGEH247vRO6lG2
	fgNQZP2hyMUwPZOIWsnVHt7Hl4xak+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782729011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TpqkXEII5P2mbTBPf+VPf5pOk55FiEfaOD0EiV4Yao=;
	b=Sj0fkFX/+Cf52BJ7DJadHdy8Sh26UdMY3EzJ5AouTiGCV8oyvOX28WPHaMznyZOOW1jKOL
	m/Do99hzBRxBcrBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782729011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TpqkXEII5P2mbTBPf+VPf5pOk55FiEfaOD0EiV4Yao=;
	b=ngNR6czoG1yARr4WdAEzjp70XWD/PKqmBiZS2INC5PUtVTmEWxtQektUhFUNOU2tJaQE7f
	h+zDagPewfG7VThHUnvY5Fp+QNfmUyARCPvou0FfY4fCvwg6eSqwZITeUGEH247vRO6lG2
	fgNQZP2hyMUwPZOIWsnVHt7Hl4xak+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782729011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TpqkXEII5P2mbTBPf+VPf5pOk55FiEfaOD0EiV4Yao=;
	b=Sj0fkFX/+Cf52BJ7DJadHdy8Sh26UdMY3EzJ5AouTiGCV8oyvOX28WPHaMznyZOOW1jKOL
	m/Do99hzBRxBcrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A16B3779A8;
	Mon, 29 Jun 2026 10:30:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G+JMJDJJQmrEHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jun 2026 10:30:10 +0000
Date: Mon, 29 Jun 2026 12:30:10 +0200
Message-ID: <87y0fxprkd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Federico Beffa <beffa@fbengineering.ch>
Cc: perex@perex.cz,
	tiwai@suse.com,
	willerz@gmail.com,
	abhi220204@gmail.com,
	jpfuentealbabizama@gmail.com,
	uwe@kuechler.org,
	jean-louis.colaco@orange.fr,
	cassiogabrielcontato@gmail.com,
	cryolitia@uniontech.com,
	yury.norov@gmail.com,
	i@rong.moe,
	tasos@tasossah.com,
	geert+renesas@glider.be,
	simon@mungewell.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Add support for Pioneer DJ DJM-S11
In-Reply-To: <20260625115340.823184-1-beffa@fbengineering.ch>
References: <20260625115340.823184-1-beffa@fbengineering.ch>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[17];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,orange.fr];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kuechler.org,orange.fr,uniontech.com,rong.moe,tasossah.com,glider.be,mungewell.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Thu, 25 Jun 2026 13:46:28 +0200,
Federico Beffa wrote:
> 
> The Pioneer DJ DJM-S11, a professional 2-port DJ mixer, is currently not
> recognized as an audio interface and therefore not usable on Linux. This
> patch enables its full audio functionality.
> 
> Like other mixers in the Pioneer DJ DJM family, the DJM-S11 uses
> vendor-specific USB class descriptors (0xff) and requires custom mixer
> quirks to expose the hardware's input capture routing and volume
> controls.
> 
> Add the USB vendor and product ID (2b73:0037) to quirks-table.h, mapping
> the control interface (Interface 0) to trigger the standard mixer quirks,
> and establishing the audio formats for the playback and capture streams.
> 
> Control interface 3 is likely related to the touchscreen which is
> capable to display waveforms, etc. This functionality is not supported.
> 
> In mixer_quirks.c, add the DSP routing options for the DJM-S11. This
> creates the ALSA kcontrols for selecting the capture sources (Phono,
> Line, Post-fader, etc.) and initializes the default DSP state during
> the device probe.
> 
> Note that the DJM-S11's capture endpoint clock is strictly slaved to
> its playback endpoint. Capturing audio (e.g., timecode vinyl DVS input)
> physically requires an active playback stream on the output channels
> to feed the master word clock back to the capture stage. Userspace
> audio servers (such as PipeWire or JACK) should be configured in
> full-duplex mode or have automatic node suspension disabled to maintain
> the clock line and prevent I/O errors during capture.
> 
> Signed-off-by: Federico Beffa <beffa@fbengineering.ch>

Applied to for-next branch now.  Thanks.


Takashi
