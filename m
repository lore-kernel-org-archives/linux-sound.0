Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830817;
	b=fK8iAqTdBQyKPoosuVBOkQzW254jXLyECOPAi38BDg8UWFXuK6LftOsfmatitjei0xgE
	 bQpLlwJb8wwgx63vctjRl2L/S9Wl7ISXkmY/lJaw0KqjLeNb73eal5usH7diHuarroYf6
	 SA0z7BIosDUnLPmi0I2tYorKxu5Iaz3hwtAP/Lnes619sDJ6Bbd33t0mRSE0kvHJyuF6y
	 VCl1WmEqkhA2tLSM+/yx+ncfaO85rMR4/v+W4HZApJbitsmXdm6wTpAaGqbMAgBMfIE8T
	 YIEOUiaoOR/QqYnOMjMNjHYIDoQD4PZSCiUGRruu0HK0vNRclDZvgMjXfdz7bWdc4eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830817;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=KS1933ZhkJE5zrQV/NvOm1eT6QPdw7f6cMrD2ynq7Rc=;
	b=ykpnHpAwao5qb5pgD4iBMr/lE34L2qEsJzuAuaptVUD9/bhNVbzgXTt6IeznuQb/HvKu
	 eWeWc5rCc4YNHavUFYNBkiOUOIvtkVvCZrVJSSb15FRpFuHqb6ICC9WOH36CtltpusmPB
	 QG9gXsh1yIJSKpUbkLdC5wVUNodU8Ku0d+bR0v9BKYleQaC+bm4pvZhTyRqaqoqRiH97/
	 hnekSfn+1azg1E/E33k6Z8qUILHmmM7Lq0vBY5Q/YTDp+tQ5ntVZlFmc3rFBKKM9FGKdG
	 5bpSFZON89Or//b/OQmLjH5b5aPr8f1Wuh6/Yw6APrZj9kx+fbnT7kuIkS5h+zKtExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="0DFZ/cVZ";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PFIn8GR5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1P1C179W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oT2y0Xjj;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753BF606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 12:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0DFZ/cVZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PFIn8GR5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1P1C179W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oT2y0Xjj
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58BBA1FCCE;
	Mon, 16 Nov 2026 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794830814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KS1933ZhkJE5zrQV/NvOm1eT6QPdw7f6cMrD2ynq7Rc=;
	b=0DFZ/cVZ6FlCX15stvTJfhfzzW1GI6VA0FCFooRU8hQKBKVl7/Tx+0MIDXzuZEYZyXXxbL
	+Xq03kZPZaB48bHzZldklaoHB9KMYxgL8jos8+ZiOQljTgnKt9opccmVa+wRn06OMRlS73
	CcYHxAcbWYQaqyJo60HaundvhKYGZQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794830814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KS1933ZhkJE5zrQV/NvOm1eT6QPdw7f6cMrD2ynq7Rc=;
	b=PFIn8GR5+ojIkMkIPgss1V38WU4FpoNyFQfNRwUmhjfpQy1TUquDlOkc1wtDeR/WJGxLnZ
	bZKV6Q+1grW5+9Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1P1C179W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oT2y0Xjj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794830813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KS1933ZhkJE5zrQV/NvOm1eT6QPdw7f6cMrD2ynq7Rc=;
	b=1P1C179WFEEkiVBdZR/ZpUuwG8TSn09YYJocrwC5art2D5hnBwCZnx53cMma140rWD8TcO
	Q495bitm1+UCKTkwO8oe8H42BjTWqyeEzoW0hN/+HNzl5OvGqzHSnGyy8WJeLICGeFdGPv
	p5GozfnxkMhgqI0PtNk4sds4GBunDXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794830813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KS1933ZhkJE5zrQV/NvOm1eT6QPdw7f6cMrD2ynq7Rc=;
	b=oT2y0Xjj81AXpp8iM2n1M1IFtFlASDtvQOEviUMdB8CBX7TZ75sGvynejyaGyIwu122vjE
	+TCFCx0pMNQMjmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14BFE1334C;
	Mon, 16 Nov 2026 12:06:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qMtnN9zx+mpiUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 12:06:53 +0000
Date: Mon, 16 Nov 2026 13:06:52 +0100
Message-ID: <87a4n9yo83.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kresimir Pendic <kresimir.pendic@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [RESEND][BUG] ALSA: hda/conexant: SN6140 internal speakers silent on ThinkPad E14 Gen 8 (17aa:513e), codec beep also silent
In-Reply-To: <CACqGD_d5BCpzLPtnPPkraW+_WBVZbt9+1fiDrcJhCcqaQ5b6aw@mail.gmail.com>
References: <CACqGD_ebj5hUU2uFJO-aHjeftG_3-dEH1beQj0B7=qqdpWKnSw@mail.gmail.com>
	<CACqGD_d5BCpzLPtnPPkraW+_WBVZbt9+1fiDrcJhCcqaQ5b6aw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 58BBA1FCCE
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Sun, 15 Nov 2026 18:03:59 +0100,
Kresimir Pendic wrote:
> 
> Hi,
> 
> Follow-up: this is fixed by the Lenovo firmware update, no kernel change
> needed. Sorry for the noise.
> 
> After flashing System Firmware 1.11 (BIOS R3AET32W, EC R3AHT32W,
> Lenovo package r35uj32wd, released 2026-07-16) the internal speakers
> work on the same kernel (Pop!_OS 7.2.15, snd_hda_intel, generic
> 17aa:0000 fixup as before).
> 
> The thinkpad_acpi ECRD / AE_TYPE errors are gone with the new firmware
> as well; the driver now reads the EC normally ("mute: off", secondary
> fan control detected).
> 
> Lenovo's changelog for 1.11 only mentions a WLAN fix, so for anyone
> else with an E14 Gen 8 / E16 Gen 4 (BIOS R3AET28W / R35ET28W 1.02) and
> silent SN6140 speakers: update to 1.11 first.

Thank you for sharing the information!


Takashi
