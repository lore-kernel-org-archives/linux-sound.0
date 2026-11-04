Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811484;
	b=r9+yz4MpxYH4W/m2ukhxIgIA/tzh0U14ziGBNv2UC1HQi8PGeN4PyYGIxBItZjkSstQJ
	 uirmfp/eUVtW9tIRG4pwZADSHR1j3S0DJ+smMLFC+tg+EMUoXMjtbmPT2zBAiFGxX3jrt
	 4VGMiycZJ+17mKcWFMiR5GLrih+vkNU2awcN5H5dZLRe/5XnMjGPZin+nCjZZMjh7QAkc
	 3xK3k6alk0yClzD1A7hi2GkfnaodRcgC7C1kd0ha/RczwRTjyC0+ypI8Y+oxHCFwvyqda
	 jd0d5rHb6u9UN5o8O9V+I0g59cMjWqoopNlWKhbhf76Bk5C63IGDp1RvjSgJ3Xb2mPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811484;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=2+n5bLbosw6g7iyh04VS6fDcJztpzKAaF8rPF6V03jc=;
	b=okcV8O5mQvXIsOfstk6KHLaK4A+xBupghEsL96E/v+e7g+qU65vaGcUZwmCur1edi3rY
	 pwbopzJ4ORra6+VfxmNEkrqGSzu5gOgN+N8xiY2ZGKadJR6xLvcAF8e2OjyOnTQBz0r5x
	 XnEvYR+jPQ4QmmDQ0D4a1pnHnrI5vygWzVfdvFTUaLgDQ1IzqzhvjLNWK/iLcKxWkxwV5
	 hA+I5bxuBoRIA9DdW4Q6ySbQ4yRDrupA28Dg+Sj1nsQwAaaHZbj2drMnISNPD3kzWGZj/
	 lhi1GPflrCr7Ay6gL1sv7bEgX8RmcGBvorP2RRwg+SCaSl5SfI9/NPwDMTuetxoe4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FX47tUCQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4r0zwneG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FX47tUCQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4r0zwneG;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986D606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 16:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D986D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FX47tUCQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4r0zwneG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FX47tUCQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4r0zwneG
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19AEE21BD3;
	Wed,  4 Nov 2026 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793811482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+n5bLbosw6g7iyh04VS6fDcJztpzKAaF8rPF6V03jc=;
	b=FX47tUCQLHvlA0eF+LmpTozwRJJypjGMcFV1QFd4G7NqK//eK9QG4vlU/7JdkM2HRdNo8I
	J9TOjP5irhHEtIqhLhXrJbRi956Y9i6+I70j5uGOT3l1HP/SSrbNqSmd0B+ABJcMjhRGY0
	CqtUBg+TiUgd5GRrf3vaZQ90hqnIW/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793811482;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+n5bLbosw6g7iyh04VS6fDcJztpzKAaF8rPF6V03jc=;
	b=4r0zwneGPenxfytMN4fwWgZQPNZdYd1Evrh+a/N2C/3IK++70p7ZZd58WHnOaLZ66nzgFQ
	vsD2rRVvfXWUTvAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793811482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+n5bLbosw6g7iyh04VS6fDcJztpzKAaF8rPF6V03jc=;
	b=FX47tUCQLHvlA0eF+LmpTozwRJJypjGMcFV1QFd4G7NqK//eK9QG4vlU/7JdkM2HRdNo8I
	J9TOjP5irhHEtIqhLhXrJbRi956Y9i6+I70j5uGOT3l1HP/SSrbNqSmd0B+ABJcMjhRGY0
	CqtUBg+TiUgd5GRrf3vaZQ90hqnIW/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793811482;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+n5bLbosw6g7iyh04VS6fDcJztpzKAaF8rPF6V03jc=;
	b=4r0zwneGPenxfytMN4fwWgZQPNZdYd1Evrh+a/N2C/3IK++70p7ZZd58WHnOaLZ66nzgFQ
	vsD2rRVvfXWUTvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 246E81350A;
	Wed,  4 Nov 2026 16:57:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tt3zABRk62oNDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 16:57:56 +0000
Date: Wed, 04 Nov 2026 17:57:55 +0100
Message-ID: <87ik2cttyk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: ump: Data Entry without a selected RPN goes to the next RPN
In-Reply-To: <20261104121508.3972314-1-sammiee5311@gmail.com>
References: <20261104121508.3972314-1-sammiee5311@gmail.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Wed, 04 Nov 2026 13:15:08 +0100,
HyeongJun An wrote:
> 
> Hello Takashi,
> 
> While writing a KUnit test for the UMP converter, I found that a Data
> Entry received while no RPN or NRPN is selected is kept and sent later
> under the next selection. Both the UMP core and the sequencer
> converters do this. For example, at MIDI 2.0:
> 
>   CC101=7f CC100=7f, CC6=40 CC38=00, CC101=00 CC100=01
>   -> RPN 0/0 = 0x40 (40200000 80000000), with nothing sent for 0/1
> 
> The fill_rpn() returns from its skip branch without clearing the data,
> and the flush on CC 98 to 101 sends it with the number as it is at
> that point.
> 
> Dropping the data in the skip branch stops this, but it breaks another
> case. The fill_rpn() also clears the RPN selection after each send, so
> a repeated Data Entry for the same RPN only goes out through this path,
> when the next RPN is selected:
> 
>   RPN 0/0 + 02/00, then CC6=0c CC38=00, then RPN 0/1 + 40/00
>   -> today 0/0=2, 0/0=12, 0/1=0x40. With the drop, 0/0=12 is lost.
> 
> The other way would be to keep the RPN/NRPN selection after a send,
> like fe85f6e607d7 does for the bank, and drop data only while nothing
> is selected. Then a repeated Data Entry is sent right away. Selecting
> an RPN would also have to clear the NRPN selection and vice versa. The
> spec's translation rule (M2-104-UM D.3.3) says the translator "shall
> hold the latest values for controllers CC 6, 98, 99, 100, and 101".
> 
> Which do you prefer? I can send patches for both converters with a
> KUnit test that covers these cases.
> 
> I found and checked this with Claude Code, on x86_64 (KUnit under UML,
> and a sequencer test on 6.17 and under qemu).

A good question, and I'm afraid that there is no perfect answer for
it, because the handling of RPN/NRPN is very ambiguous, per
definition.

My gut feeling is that it'd be safer to keep the values.
The Null (0x7f) is provided for explicitly clearing for that purpose,
after all.


thanks,

Takashi
