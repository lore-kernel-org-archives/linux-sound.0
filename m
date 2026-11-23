Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424411;
	b=jlfVtGLkfz4ZLXfKxSwlGyr3TH4XkUjXggA9/UBD7ljm8GdfVOzdymCv+flXMAjOUyvH
	 wj5JwcqfX1iR2CxuhkXsrtHZvxGYQ9BjXe69DVgttMK66Pv7vf6zwufybSmJ75eCEmt1c
	 qnrUvvtEXu7bcAvGhAsU5k5UYp2Kv0jsWYnWb9d7Rlq2ZfHm4IN4PuPq0J5z8yNoOiWBU
	 a9lLhHAxacgpD1yIAmFoTAI7Row3oOBVPTKnzRuXnFl13sqElVmDkE/Uu/GMoHPEA9yX9
	 hIrUSqhp7uWiw2v+wJE4bVdHNTJy/w8oodLJ/MfBfo1YLDUIgsDTj1yyhKM5mCm/7mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424411;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=hSDU2ETZOpMWI8JG14QMd7t9fQXc8qdSNxDUHUS44YI=;
	b=n1XUEgIMyFtGar79Kkh4vdENjPZ9p3N+ku8YRfJO4WtYZFdhYcogZZflbtybQ6mBbH12
	 UpkBnzVL3bmJSj8XfLGODKn2HjaTIxyX9Dv/C5ZjtriJukA/mV1XPuMDv6xvoIUUqaQSj
	 fT6VqzO14C2QrZ8IjEz6fFqnftMJIz3PEZWmBXs0xJQagB454m0GGQbVla1uVNYirwUBK
	 30Fn4cXtVpYNFcc2gA5qo2lBzqEypQr2b7ZsEBorVUItXTp3aodJ3Oq3sYeyxLcWS+c4T
	 lQjPOyMf9uGeMY8ILG30nyDD6TS2d8m3lnyBPm6NqWILmfrmfd3CckReXSr62chZ2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g5ttDieu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/N9vsCNj";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Qo3N0+px;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H7OEEz4W;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBB606A31F;
	Mon, 23 Nov 2026 09:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FBB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g5ttDieu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/N9vsCNj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Qo3N0+px;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H7OEEz4W
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5282521BD0;
	Mon, 23 Nov 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSDU2ETZOpMWI8JG14QMd7t9fQXc8qdSNxDUHUS44YI=;
	b=g5ttDieu8ge/s+5eZhKDvuJM74ZuWcHoD0AwLxtRGlg3eqYz07QvEotH0O6ABIB2wXibR7
	RY4in0OzfuyaI0FWKmMzV5nktILZz3F6FgXIxhiRzDTX0E0KFS344kHjHAtECtavF2v5jb
	JhH7G7TuWUPRgzpS2Njt4OzxcTpZQ50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSDU2ETZOpMWI8JG14QMd7t9fQXc8qdSNxDUHUS44YI=;
	b=/N9vsCNjmvHLOHKid0jVaJp39fI7oCL3MtYQBXs9dRGysZZpO/ItIteNm+YeCo9eVy1vtq
	2rzGAi1sq3aFReBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSDU2ETZOpMWI8JG14QMd7t9fQXc8qdSNxDUHUS44YI=;
	b=Qo3N0+pxy9OBzFrF9TsF4nE+CZKtUH8vRGM6DcuIEPzNFxtI+Mpww3lI9lhSJCUMXKgyVN
	wZQsriFN4LeXeGoXHXagBRb9CfJG9bU9o4SIDgCRs4pi/7m4uYykH/YhLB+dyPyRsP2cP1
	vye5AtoCXyzik7wn2FU09hp5YGqpgQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSDU2ETZOpMWI8JG14QMd7t9fQXc8qdSNxDUHUS44YI=;
	b=H7OEEz4W/5WQmZw3D8ZS9whjRuwfaAA99zAF3HJVIwOW9EupDbqt3DUqnN9hKgv8X4oXVo
	CGPhU3DdfJVLCvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07A751352B;
	Mon, 23 Nov 2026 09:00:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mN1HNJcABGt8BQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:00:08 +0000
Date: Mon, 23 Nov 2026 10:00:07 +0100
Message-ID: <871p8bexd4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: shyckless@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: sis7019: Don't shift the voice IRQ status by 32
In-Reply-To: <20261122-sis7019-voice-irq-v1-1-fa5d0cbecf62@gmail.com>
References: <20261122-sis7019-voice-irq-v1-1-fa5d0cbecf62@gmail.com>
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
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:email,imap1.dmz-prg2.suse.org:helo,ntu.edu.sg:email]
X-Spam-Score: -12.30

On Sun, 22 Nov 2026 11:08:16 +0100,
Suyuan Wang via B4 Relay wrote:
> 
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> sis_voice_irq() walks the set bits of a PISR_A or PISR_B status word:
> 
> 	bit = __ffs(status);
> 	status >>= bit + 1;
> 
> When voice 31 or 63 interrupts, bit is 31 and status is shifted by 32,
> which is undefined for a u32. On x86 the shift count is masked to 0, so
> status does not change, the loop never ends, and voice keeps moving 32
> entries forward on every pass, past the end of sis->voices[], with
> sis_update_voice() called on whatever is there. All of this runs in the
> hard IRQ handler. Voices are handed out from 0 up, so voice 31 is in use
> once enough playback streams are open.
> 
> Walk the bits with for_each_set_bit() and index the voice by bit number
> instead. The voices are still updated in the same order.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 175859bf1602 ("[ALSA] sis7019: support the SiS 7019 Audio Accelerator")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

As this doesn't look like an urgent issue (for a legacy old code), I
applied to for-next branch.  Thanks.


Takashi
