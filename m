Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183898;
	b=CeYf3SO0CpOk1NuQ/6KTYDPk5PZZBlf6p9g1+Bfu1TNtHGYJgGjerGi19kz5EhoLo241
	 BdWPQ5BrpX4W8mnMq54pnJYm3Q4C8FzT2Zqx11aqWlo9s8jWOIk8PBOD1zcEE5qJhegL1
	 JLRo/F9djpyyQ1DHhYIwP2LmmdRgzhXhbv0QamyPO79xgrErRiHExvdKMMyyg5rnJA/df
	 nz0zxUl+efHC9ZSKEENqQ491F/THJ9dZPBckIUBDXV+jw2pi3EqNuERns+08Q/Hn+eoZU
	 IH1xdQrjkt1PWwk+7jtVpA12On8dr9Ab/r5a/0hsK6VlDY+8Ldw6/Jut2OxrCoamjUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
	b=hM4HvFkI5I3+zey0HKw8AN0EUN0oOSE2KQvf1DsU31dbTGs+oSvQcdCt5NugeSF5tZ1H
	 p/7ekqNSIuYNhGzq9xnGWjJalLyRDDLnZ00gkrQozLh5mD4HSkPDSkQOxtojaT1a40LfC
	 L9TPyWDcOJwUgp9O8/T1gJW2C1i88j1Cr97mvqIOit+oDkqFuj9Qg9t0UkCZTmiDBAnTI
	 ONgt61KHMVA2PBafwlbYGhyRl8c2e64BfLv6HcDvsho4KiXboCxcnK3W2tfiJbM9PAs0q
	 aa9f+BlzC4QkxGOxBsUhMPvRNtMfcac5HhKKmikv7pJ/ZOMDbXlTdIQJPJgKEBq9yeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGbSsJuD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E73606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGbSsJuD
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4550d8ab15so100034266b.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183896; cv=none;
        d=google.com; s=arc-20260327;
        b=kQYTfhfPRMCJKm2KIJxpPK8JTPGJImHtDLaj8zTqlgpEH1RTJ3jUOVkWI0n/OHxlu/
         37x4pLqeoZR63GuDSOvq6iOVJUkgot3F90T+ozc9lNkWUrJty/h9qEMaHQoxhIzKL1H3
         e3MLbJGY2TJQzbEC9j/dF+60kk4t8MsY24LZIvg6Ucmyp8r6aUYbI23AmQNKbPOcRA52
         7aS+JuxzZvUS7S3HkvmAFSOvJ6wuzHMVPs1+vkvOretuFWkL5p5p+smnZ5yoYZy15vGR
         Ivefkd+i6MyCeffQ6nH0AcpHZHlINF6jRD+bx/PTzrix1sTdJJtnwtd1s3m0X162o/dz
         QSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
        fh=YolIBYFno7CFBBAyaqMu/LEXiccVu+MBbBZi7oiHQ/Y=;
        b=VmhvvAIO9dWz1trzp73iA12lZ26IkYNZ1nLOTwOVMI0qD7sluTGykab+H8EMxKRdC+
         LEoQ1pWk53M7qTIzleogRDTZYxo1r5HT4/p1cAWoVf3iwreKyeYEegC1RaghtQKqOCej
         7UGeZxb8Ak3PGWmOgbhb0jsIE9+iDmK0o1ocWMlUhN5rPaJJRk3PSJqlOV63zt+dAmic
         5JwkX8XVe9vsQq8b+Ti4HQc3ZO+EwUH1yxUFL1NDqLS2dwzJHHfVoXu1hxgQuwPINQmg
         OrhW90rVLIxpYPaPQquR7PXy7fd32DsJBKb4Pk414M3qxrYqOkt8BQJD273AvsNb2bI6
         109g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183896; x=1793788696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
        b=CGbSsJuDFpm9cR/AinbpH4d6OnVs5671xl8yLP9EAX2fch6hUrzB32MgfiVv2Lq75z
         Cqzt2QW0zRHlpT/2hxtKY/nyELVgsw2awEpz6oZkUVpnn8RJAuznWgworfKq8bXVyxMt
         hKvl/y6GTfrXDJpIijuKrwl/CzAj1cnMj232QEj1CVfmYSrlxHOjI+snCe1JZd0orsuC
         dy2tuIbWA2suu2/kNYNcF27rKdalm9neTWF/t90O2Jos+ed14MXtgX4jKBnmgNCo4w5p
         lxzINgDIF4x+NI+1bsFWJYSp6CreQY6q3iKSGvGkT4DB25OiV+dYveecdPnX2yPSQ6/n
         itWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183896; x=1793788696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
        b=uJ6kpNcRyjFqEYUEkgoRLZ8mKPXWOPyCRaZzUFVxEyuxp6xbJ6wmy3mXBZAQCel524
         +gQYsKlm6bTKMQ34sFD74yilwsZ6O2ixGKCI7P0vjp7aSQywPJhpCfjwo3W79FhPMR/x
         FZ5svuWWBX3jz7w/tN8sb4KMXhExfWvulj/W6fqsxkQr0zVr/Jtvy0UWJ1vc84c+Pedh
         oghGXlnvplX0CbNkfI9xK3MRbSwZDnB4hcmiCWYc/RwYblD73H2conMu2Bx3ceW53wBy
         mt2ne+XfRjYZaMidGmjFAOrwfhq/ihsF/ng1H7RkQ+O2GwcSb5M2C+8w0QoPDCf5sjmm
         /NDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb6wRKfc5ah7IrdPUZ+l4+kPxxch5KxbNyK7nbtYbYWrBDFCeycW5B/XK51MwrGo47ihfIhABb+pIynw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLc8EXP80TgIeW/S0pE8TUI+sRX6TOlUvqBVLbvC+G/4b3xU8My
	UV9mPVAnBKCh4ov1iXLAxFQ9EcCEa6NrvS20HJUqsXolWXrXj2Vx+ljy2nxUBwgHAgkH2hTgO9t
	J+jANSi0wXPsMx47o85LqJgjvQ7KhS+GbR5rgG747DA==
X-Gm-Gg: AYBFou2W2IOev5uAwsiIyBK35EYanaRAM/X3rghBDE31doHMXgFaD2f8tNEHxIZzGYL
	vMNHt9lKbv08b23vQ6AbDpC5VSDPogd3hchI8loRfJ4u2N0aKG3+TDsCxhUUYDdaoIExXfcWb2p
	zPDCj1zbb8Bg4RXRPCdk7xvF8lTWTyJXDBKImOQbFZXvc5Pkj9LCIrINSPfX7cwrMBfh2QOkbLO
	T+jUxYk2fwdYi47VdjpWEBAdU6q09pifYGTAbZIsDlvDixUkrROHUORIjLmnM7mNIgcR13tYKkM
	rf3EH6cAamMHnYEQ0x96enW2jTzOdwoJ5dSuWKSWjQtoIQX6WhNwe0wf0RvXkzD92xIqnnbIT2s
	XHeUL7/oy7gzVbE8iKGysX4IpCv6FdvKrDp6dYFEY1HCV6x1GqtmardzqAWvL8j2qE0S6
X-Received: by 2002:a17:907:1b15:b0:c37:c0dd:6642 with SMTP id
 a640c23a62f3a-c49bdf39b8emr148047866b.37.1793183896319; Wed, 28 Oct 2026
 03:38:16 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026125751.1700779-1-stjepan.poljak@gmail.com> <87pkwv385p.wl-tiwai@suse.de>
In-Reply-To: <87pkwv385p.wl-tiwai@suse.de>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Wed, 28 Oct 2026 11:38:04 +0100
X-Gm-Features: AclHuK_PuamjIiFfAzndUS8tRuWw0N7bi55u4XT3JCo3FvrjTK2Q_qFdFwSq2b0
Message-ID: <CAKVkeTxg4LWANUmqa4rzC-w8Ai62vcxeSU1FCAWSyA76iyK8yg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Clemens Ladisch <clemens@ladisch.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:38=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> This doesn't look like a problem to be worked around in the USB audio
> driver side, but better to be addressed in the USB core, IMO.
>
> Please try that, or ask USB guys.  If they find this should be rather
> fixed in that way, I can reconsider and review again.

Hi Takashi,

Thanks for your time, and agreed. The host should have seen the
disconnect and on xHCI it does. The Pi uses the downstream dwc_otg
host driver, so I'll first check whether mainline dwc2 has the same
problem and take it to the Raspberry Pi kernel or to linux-usb
depending on that.

Sorry for the noise: I sent a v2 yesterday, fixing the review bot's
findings, before I had seen your reply. Please disregard it.

Regards,
Stjepan
