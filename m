Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621638;
	b=YFb0Mv70y5g6poN6exbPvdWSnLTaSJVzZrn1SNZviVMfMgaj/FS0+T5SE9tc0VJ1XIX7
	 cMw4nsEtAw+6RYrIEVG5SlnnZzXaiB/qSM13jKHwn2uT5v4Wg3sifMA6PP3cqtf5Q2+tL
	 wOVumywRsLLNrV9j+mrP1Vf+pn+yV6Ki8BiNsKvlNy1CFrXjfN8AXUoc+ToUvPtMFnzxj
	 YM+LPXvvYgmeL/u07pH5iUhBIvdTDE3lm6mLYTy/9Tmi1KFzk6oTgIys7odvUc5rmlfBT
	 wP/8yYorq90ofAhuJOn7W8Wo2s93Td+7Uaphlr34sbWxRxynVE4cXjkHSzdp9dm3/qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621638;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=lepUxE6g0dBTxfDnnmeNKmTx3vQR3lgLfMBKGs4Ua+4=;
	b=D+pCEfpymqtm/TT/6rrht65PIRe/voYiS2BWj6/yNAbWlpEBCaPIzbVZYI1CzsjTpLVY
	 PEexFuToiX6pG0A5nwPb4aLZZu5z5A4TBHPtTBEIhbGGbOT9PMnoKKkNC8/NZ/smFUIWK
	 VUUSkByaZZkFBKnRsNJmVZoH2nW64rD/eU2Y6jGm0IjQcYUHeo9RyDAmghcH+IhJ13OsU
	 DevKxVRPPyF4z659HeSKhk6G+a9KQ7BsRcoGyy90QUWT+LhB6MmeM6mW74t0K0Lv7nu0A
	 txffA8UxYqhSdfpftDa4id6jbnmwJdGSdvGDHt+O9t4bLPIm/iqrJXFjbhNO8KWgCpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yy0b9DF1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XO4Wv3Iz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=McplLCoI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iFVK3v3K;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB542606A336
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 15:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB542606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yy0b9DF1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XO4Wv3Iz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=McplLCoI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iFVK3v3K
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9EDD31F88E;
	Wed, 25 Nov 2026 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795621635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lepUxE6g0dBTxfDnnmeNKmTx3vQR3lgLfMBKGs4Ua+4=;
	b=yy0b9DF121fCEqapSBB8LKg223gfCF1STYy9YiseNdgITh/3Mv+ZvygVeWhqiFnJPunf+D
	nhTYU71gxkYKRZrpFBF8m+8BiehHLht19liE4ImvlNIj6dE7+xgtULH/n8EBe+zRWcTgRk
	uDoU5M/tmrNhK5WvvV8ySTcyLQ6nGRY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795621635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lepUxE6g0dBTxfDnnmeNKmTx3vQR3lgLfMBKGs4Ua+4=;
	b=XO4Wv3IzHgw3lM5gGCqjw6AnwdOzIaZhYZOAoGB76rJvWdUWZEBC2UYfjQO1i8XflT4NSV
	Tr6pymZ5V96uswCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=McplLCoI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iFVK3v3K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795621634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lepUxE6g0dBTxfDnnmeNKmTx3vQR3lgLfMBKGs4Ua+4=;
	b=McplLCoIBGvYSfRMBd0qg5V+lBiKIxhQOxbE45uNwxlIENFK0oPst5NOcBaVTTo/XIrq6h
	36rV4DdJ9tpInlYZuKHz1xxaMHBNDut5jecPAROpURtRCf+DXp91A7wvLSFHaFuzQZ6EKs
	WDnXGCsD86uEDRhpf3npyMuCSK/3TBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795621634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lepUxE6g0dBTxfDnnmeNKmTx3vQR3lgLfMBKGs4Ua+4=;
	b=iFVK3v3KWNEZj87iuUA5APwDSLczPgGzFUJKNqHa4Meo0ZxLLz4mbkVM8ulaftPtU4+CIJ
	HbZHYXKJmQdV4CDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EE0A1339F;
	Wed, 25 Nov 2026 15:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NzHQDQIDB2vMOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 15:47:14 +0000
Date: Wed, 25 Nov 2026 16:47:13 +0100
Message-ID: <875wxk7w1q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?KOI8-R?Q?=EB=CC=A3=CE=CF=D7_=E1=CC=C5=CB=D3=C1=CE=C4=D2?=
 <a.a.klenov@yandex.ru>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>
Subject: Re: ALSA: hda/realtek: no audio on ASUS ExpertBook B3 G2 BM3406CGA (ALC256, SSID 1043:1704), fixed by resetting COEF 0x10
In-Reply-To: <663131795497400@mail.yandex.ru>
References: <663131795497400@mail.yandex.ru>
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
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,alsa-project.org:url];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[yandex.ru];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:url,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 9EDD31F88E

On Tue, 24 Nov 2026 06:22:28 +0100,
ëÌ£ÎÏ× áÌÅËÓÁÎÄÒ wrote:
> 
> Hello,
> š
> On the ASUS ExpertBook B3 G2 (BM3406CGA) there is no audio at all from the
> internal speakers or the 3.5 mm headphone jack. HDMI and Bluetooth audio work.
> The cause is a vendor coefficient of the Realtek codec: resetting it restores
> playback on both outputs.
> š
> System:
> - Laptop: ASUS ExpertBook B3 G2 14", model BM3406CGA
> - CPU: AMD Ryzen AI 7 445
> - BIOS: BM3406CGA.208
> - Distribution: Ubuntu 26.10, kernel 7.3.0-11-generic
> - Codec: Realtek ALC256 (vendor id 0x10ec0256), subsystem id 0x10431704
> - The laptop shipped without an OS, so there is no Windows install to compare
> with.
> š
> Symptoms:
> - dmesg: "snd_hda_codec_alc269 hdaudioC1D0: ALC256: picked fixupš (pin match)
> ", so there is no quirk entry for SSID 1043:1704.
> - Pin autoconfig looks correct: speaker on NID 0x14 (0x90170120), headphone on
> NID 0x21 (0x04211010).
> - The codec dump shows both paths unmuted, pins enabled, EAPD set and all
> widgets in D0. COEF 0x0f is already 0x7778.
> - The PCM stream runs (hw_ptr advances). speaker-test directly on plughw:1,0
> with PipeWire stopped is silent too.
> - The speakers work in the BIOS hardware diagnostics (beep test), so the
> hardware is fine.
> š
> Finding:
> The vendor coefficients on NID 0x20 read:
> š COEF 0x10 = 0x1d20 (0x0020 is the value used by
> ALC256_FIXUP_SET_COEF_DEFAULTS)
> š COEF 0x37 = 0xfe15 (0xfe05 in the same defaults)
> The other coefficients from that list (0x24, 0x26, 0x29, 0x45) already match
> the defaults.
> š
> Writing 0x0020 to COEF 0x10 restores audio on speakers and headphones at once:
> š hda-verb /dev/snd/hwC1D0 0x20 SET_COEF_INDEX 0x10
> š hda-verb /dev/snd/hwC1D0 0x20 SET_PROC_COEF 0x0020
> COEF 0x37 did not need to be changed.
> š
> Current workaround: an HDA patch file loaded with "options snd-hda-intel patch
> =,hda-asus-1704.fw":
> š [codec]
> š 0x10ec0256 0x10431704 0
> š [verb]
> š 0x20 0x500 0x10
> š 0x20 0x400 0x0020
> This works across reboots.
> š
> Could a quirk for SSID 1043:1704 be added? I am happy to test patches.
> š
> alsa-info: 
> https://alsa-project.org/db/?f=ea9d806a452f7528ec56ae8c9e78fe0fddef5bcf

There is already a quirk for ExpertBook PM3406CHA (1043:1664) which
might work for you.  Could you check whether applying the option
  model=1043:1664
works?  If the above works, it's a simple quirk entry addition.  OTOH,
if the COEF with the value 0x0020 is really needed, we need to add a
different quirk entry.


thanks,

Takashi
