Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107861;
	b=OCw8Od8x5m7RCxqUASchglzAl9F8Y5GbW6Lob8jCalxPIytfo7+W3JnFQC/vHOS46ePM
	 LWSh/yAxJWNCyTQUWKk7DpE5hEdY+pqXJPJGKnOxRtuQ+tWN3Y7aY+HqMNJ7u5M5ztCcm
	 1KFMTc65024tmorPqlsGZ8LeDhPh0JN0K6bsNuvsPOwd2FZlc4kLrj6fb5znjRiOIoeTT
	 6RXTjf7LZPZijBoLig6P2nQtXr4zBY21oEUtHE/ycVuRh/qfXNPKzGgNJPRmw4yCfxrd1
	 +7AjSuHLyDF5D7RVkZQdCQgrLrrMD5XejyDKFCgbQTCJpZzgy8HNLCsWUl/sAhmmorw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107861;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vki9EMmfCD/z216lmntBVKXZU3V0TfjyIEOj4i919I8=;
	b=jDNBGvxWH2/jGsgAwrVB4mQw/nhIW1Uwto8vR6wnKGOHYQ89boBvRRLOwcYRE5u4K5xg
	 FsDi0/X80J7bBS4LydbfScjtix5b69+H+sB3hitwo8pvKBaH6ugg5tCIN0I0UTdT5vhg7
	 DvXEi9rfmAwxmN+F5McGwfLKAcKuxZy3QzOlP0G/3u0CQsIYa7zC/pp37lBbCBw94RbE7
	 w5JaNokjDFJEu/hd52rQU8MXFuEkVumlt0T/Zy1Frr7oOtUZ9iINp30JYuQspBabNMp41
	 b2cifYAO9PE45+xcDUFBL107V60AdmRPSEVp5de/7cfVUxEhlp5xKYUoUji/brsBTww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ppnlzd7iwzdythoguh7bzb54si.protonmail2 header.b=gbG+ulpt;
	arc=none smtp.remote-ip=79.135.106.97
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322C960A2611
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 322C960A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ppnlzd7iwzdythoguh7bzb54si.protonmail2 header.b=gbG+ulpt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ppnlzd7iwzdythoguh7bzb54si.protonmail2; t=1795107857;
	x=1795367057; bh=Vki9EMmfCD/z216lmntBVKXZU3V0TfjyIEOj4i919I8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gbG+ulptvKAv2UeMm652vTwFjU6ggzx0NHGB5hZehcl55FcZT/7+0pXyyRE0POt89
	 /LMfX03nCFhCr9qQbx1fmt5mO6Fbl8lO7tyyMhp0DrZlQaQL0PhP1yYwTBRwwu9w47
	 Dm3teuCwMDFvlG++rZTfalsTNB57DP+T6/zmSceRg4PMQfA3UwC+rMOm/ncAOGDzN8
	 cstQa+UQp45aZBuwBwNsWHrcAvG3BzhSc68mEM0Mw98TP34AoTRNCC+M4FqxH9Me1L
	 9tXi/hTpY6wwKdgOufml6KrELR4HASsnK7GnXW9hZpC1DbbeTKkocK7NpQMmWLzHdD
	 4qOgWoMsrtShw==
Date: Thu, 19 Nov 2026 17:04:12 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Nordschamane <nordschamane1@proton.me>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v4] ALSA: pci: add analog support for ESI MAYA44e
Message-ID: <y8SPdsADwNjGP-1-DP6RnFyI_U3U9rOPwfZbNAsW1_Ve2MmpN9eKNFgfct44XkalJGJnI030YTHCYSKMQ3UW7wfciSbsqeK2_IS8VYD_Q0c=@proton.me>
In-Reply-To: <877bicyedd.wl-tiwai@suse.de>
References: <20261116-codex-alsa-maya44e-v4-1-381358afc43a@proton.me> <877bicyedd.wl-tiwai@suse.de>
Feedback-ID: 234176850:user:proton
X-Pm-Message-ID: 91993f084a6185c6b01f2e6b7252b5754c39e49c
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks for reviewing the driver.

> First, off, as Signed-off-by is a legal requirement, could you try to
> fill a real name here?  At best align the From address together, too.

Nordschamane is my long-standing public nickname. I use it consistently
for this project and prefer to keep my legal name private. The same name
and contact address are in the patch author field and Signed-off-by
trailer, and I can be reached at that address.

The kernel submission guide asks for a "known identity". Linus changed
the previous wording and explained in the commit message that the kernel
has accepted nicknames:

https://github.com/torvalds/linux/commit/d4563201f33a022fc0353033d9dfeb1606=
a88330
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-=
developer-s-certificate-of-origin

> Try to use guard() & co instead of the open mutex or spin lock
> calls.

v5 uses guard() and scoped_guard() for the codec mutex and register
spinlock.

> Most of such stop synchronization should have been done in
> sync_stop callback, instead.

Each direction now owns its fault work. The trigger stops DMA for that
direction, and sync_stop waits for the shared IRQ and that direction's
queued work. The close callback clears the substream pointer.

> Do we really need a manual expansion and the format conversion in a
> loop there at all?

I removed the ack callback and its sample conversion. The driver
exposes the native S32_LE format (24 significant bits) and maps both
stereo DMA rings directly via MMAP_COMPLEX. The RW_INTERLEAVED fallback
still rearranges stereo frames to match the two hardware rings. It
copies the sample words as-is, outside the stream lock.

I tested the final v5 on a MAYA44e. Both output pairs and four-channel
capture ran in both access modes at 48 and 96 kHz. Duplex ran at 96 kHz,
and all 40 linked PREPARE/RESET cycles passed. The inputs were undriven.

v5: https://lore.kernel.org/r/20261120-codex-alsa-maya44e-v5-1-49f3682dfc81=
@proton.me

Thanks,
Nordschamane

