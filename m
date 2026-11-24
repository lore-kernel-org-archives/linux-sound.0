Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524662;
	b=uGm+pLECKzV9rIiYLoWXirgtD3j/M6uXw/f3FX5Fb8FYPKrqjZ2eR/7iX9BJEWIhd18h
	 /mfD3Z7g2+/Hf7mfghNjYDMFNwiCrLPQxnX28qBm71dX1epZso+lne4MrADe0LIHxarS9
	 CkmQRvlpkEYW7jC7qYuq8XenRkvbuqHbU2OJZEiU1e3XG6UUKxZuQpZFo3KhVO05aCZry
	 s4FZvF1sxN+pdeBH87biAq0YHd07dblP+qR9PXf2FJrAFF9IHKhjzDnvbWzfJoksWNKCN
	 /fBCOwkj6nfXfxxY2xOUe51vk/aCakBawdRd5FSRQtuy5jcTT60pNtN2O/OXWg873JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524662;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=GH4Z5TfpOrCG6PgWF71D4oZnblDJCt/g2Ov755ApAaA=;
	b=LPkuWaryDN4D3H/Gt6tDs/78o/nrxuKQC3A7IlsaqLf89wyG8LVnK5V50i3DI86AReBd
	 M8JHDOD9CV8teseVUiowLM7Lw9dKMHjM5ZObbHX44n3iiZ3cSs/Fnl5fpBsfpSAssqvlW
	 CNAjLQU1STKSNmBL2Y+EnppHWTD0rcVmwrdu2pLNgQY+PFdqwk4yQvwN7eQ2WbvcwN+4j
	 mRzEbHlavLq/6PTgJCNZ4mpZ8ICHrDyotVWNYioAD34NPhReRTnKaSwY1inPe6cu6NK6S
	 RlY7Iep17RhOP8YR1BiayPcYjna5a9272UQwV1GJOPJ3JX7h1R4DZCBTE3TglDO8eoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AehvZtmV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AMsuUuYY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AehvZtmV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AMsuUuYY;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779E606A31E;
	Tue, 24 Nov 2026 12:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1779E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AehvZtmV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AMsuUuYY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AehvZtmV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AMsuUuYY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 42AA91F7B4;
	Tue, 24 Nov 2026 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GH4Z5TfpOrCG6PgWF71D4oZnblDJCt/g2Ov755ApAaA=;
	b=AehvZtmV5/I8qerjew99ZagseQXU9WCGcwH1rSwp2c97l3pAl/gI+Xkpvch0W1OTM9oL35
	e08G6cQndLDtyv1DO2sPrNkSIChB9vgKiHdjFnZjyQ0/2icTBzUVQyVhyAANzk0jWJ0z/e
	Q652FAc+/Xn56utY2T9OS/97K5QmyB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GH4Z5TfpOrCG6PgWF71D4oZnblDJCt/g2Ov755ApAaA=;
	b=AMsuUuYYl8kTYcwY8Ekq5k1U6Z2taGQ1vhOOGuaw8Gr1KH72RDdFxrQqyO6bUOjF4rqvSY
	G41wmQ6kI/gf/DDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GH4Z5TfpOrCG6PgWF71D4oZnblDJCt/g2Ov755ApAaA=;
	b=AehvZtmV5/I8qerjew99ZagseQXU9WCGcwH1rSwp2c97l3pAl/gI+Xkpvch0W1OTM9oL35
	e08G6cQndLDtyv1DO2sPrNkSIChB9vgKiHdjFnZjyQ0/2icTBzUVQyVhyAANzk0jWJ0z/e
	Q652FAc+/Xn56utY2T9OS/97K5QmyB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GH4Z5TfpOrCG6PgWF71D4oZnblDJCt/g2Ov755ApAaA=;
	b=AMsuUuYYl8kTYcwY8Ekq5k1U6Z2taGQ1vhOOGuaw8Gr1KH72RDdFxrQqyO6bUOjF4rqvSY
	G41wmQ6kI/gf/DDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D1F61339F;
	Tue, 24 Nov 2026 12:51:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dwtiNjOIBWubGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:51:00 +0000
Date: Tue, 24 Nov 2026 13:50:59 +0100
Message-ID: <87se0q9yvg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: reject invalid values in the IEC958 switch put callbacks
In-Reply-To: <20261123170203.243633-1-kapoorarnav43@gmail.com>
References: <20261123170203.243633-1-kapoorarnav43@gmail.com>
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

On Mon, 23 Nov 2026 18:02:01 +0100,
Arnav Kapoor wrote:
> 
> snd_hda_spdif_out_switch_put(), snd_hda_spdif_in_switch_put() and
> spdif_share_sw_put() treat any non-zero value as "on", so writes of
> values outside 0..1, such as 2, -1 or INT_MAX, to these boolean
> controls succeed instead of being rejected. snd_hda_mixer_amp_switch_put()
> in the same file already returns -EINVAL for them.
> 
> Check the value in the same way before taking spdif_mutex.
> 
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
