Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335627;
	b=yWERXeB0M1hPkmBXVhOc4tqJ2A6KMPdFxdn52L3PzIuaN10EitL/fLPkR5KQrDFKBPe7
	 aGFGXeii9bZVX3Hoz+tWbDeLihE8IilNlwFKB61uQSFpZ/pZE2lDB8mp07p+s3843yglv
	 ZEXVjK5vVCh8cM4566sN1cSJ0/bqjaruOY9B6NoHG0VTiCmNtg2wdBCrmyxsISJ/7GITj
	 7RAXqkedm9g1EPgdlICwd5LraIuEvxK+GIB7g8ck2tIt1x4meCKxPYlPIZchcd+v1W+Jw
	 FtY2kGcj4MxHyHpgPDLAbmGmP/LqCIIwOhjfe8xkebvjB8QM5piNntQW/zb0PmRWkSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335627;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=purP1rVPjtx95BUosqOcQrG+9VHKfUZACAz9ASfWXtU=;
	b=DGDYXFG4crCix+9BR5DjaKSWX/mBSyglFFrFViXueLg2nTlu97n5A0PIp6uqnDmRApls
	 b8XHH0fPOOcS314DsAcefoi8nPggJtTe+Xn1W4jpRB2V/c7/bFu2t1m26IoGvG/yksIm5
	 ST32gMyhQkFt5g4nl0FARGm/6v8RS7Fw117Q/hU6tqbI76NLs3oVyVz/s8ZaAVSjsHyUm
	 pnOAySzpwq5DYyR6HoXkYhmLdps8vUdfyzIVGC9VIQHf5ELkiSLSB9Pe5AOEokcC25mzh
	 8Xo/R3lrO/veS+Pq5XAqLrnRnM7Z4S1rBh8imbUdfzX2VxhzvPeN19dFzrAw3/fRTaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GN5S8xny;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WChQdVRQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GN5S8xny;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WChQdVRQ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92563606A32A;
	Sun, 22 Nov 2026 08:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92563606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GN5S8xny;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WChQdVRQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GN5S8xny;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WChQdVRQ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B082B1FAC1;
	Sun, 22 Nov 2026 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=purP1rVPjtx95BUosqOcQrG+9VHKfUZACAz9ASfWXtU=;
	b=GN5S8xnyfNHIFVsYxJ/lNLTJOtGYa6ajL5EWLclDoUGgCg5FcSuPn9IvbJ77AqmyQVK+sF
	Djmd605DmcOpM8mwuEuN8xPwQ6CjrtE1mEGh9OHc5KeK0bwTNgwzLObR86hOp6qbUjycTj
	xN3gM0/fJHkcDhxWwtCTB3zsAXAJU2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=purP1rVPjtx95BUosqOcQrG+9VHKfUZACAz9ASfWXtU=;
	b=WChQdVRQmFF59SeC+YT2qZzEyfOx8VKGSo4Q5rOP0MHPGBSaEjVl807Tppr7agz5juc9tX
	gUxVqd7iPxpg/YBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=purP1rVPjtx95BUosqOcQrG+9VHKfUZACAz9ASfWXtU=;
	b=GN5S8xnyfNHIFVsYxJ/lNLTJOtGYa6ajL5EWLclDoUGgCg5FcSuPn9IvbJ77AqmyQVK+sF
	Djmd605DmcOpM8mwuEuN8xPwQ6CjrtE1mEGh9OHc5KeK0bwTNgwzLObR86hOp6qbUjycTj
	xN3gM0/fJHkcDhxWwtCTB3zsAXAJU2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=purP1rVPjtx95BUosqOcQrG+9VHKfUZACAz9ASfWXtU=;
	b=WChQdVRQmFF59SeC+YT2qZzEyfOx8VKGSo4Q5rOP0MHPGBSaEjVl807Tppr7agz5juc9tX
	gUxVqd7iPxpg/YBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E68F1342D;
	Sun, 22 Nov 2026 08:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QOhvDcilAmu9agAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 08:20:24 +0000
Date: Sun, 22 Nov 2026 09:20:23 +0100
Message-ID: <875wxp6zw8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Parmjot Singh <parmjotsinghrobot@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sbinding@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP Envy x360 15-ew0xxx
In-Reply-To: <20261122061908.130239-1-parmjotsinghrobot@gmail.com>
References: <20261122061908.130239-1-parmjotsinghrobot@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Score: -12.30

On Sun, 22 Nov 2026 07:19:08 +0100,
Parmjot Singh wrote:
> 
> The HP ENVY x360 2-in-1 Laptop 15-ew0xxx (103c:8a2a) has speaker and
> mic mute LEDs that are left unconfigured by the existing two-amplifier
> quirk. On its ALC245 codec the speaker LED uses coefficient 0x0b bits
> 3:2 and the mic LED uses active-low GPIO 2.
> 
> Select the existing combined CS35L41 I2C and x360 mute LED fixup for
> this board. On an equivalent Arch Linux 7.2.14 backport, both physical
> LEDs responded, both native ALSA LED triggers followed the onboard
> mixer switches, and both CS35L41 amps loaded their protection firmware.
> 
> Codex helped trace the ALSA LED controls, prepare the change and
> write the commit message. The LEDs were verified on the laptop.
> 
> Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
> Cc: stable@vger.kernel.org
> Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>

Applied now.  Thanks.


Takashi
