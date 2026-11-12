Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488114;
	b=CbWfo8CTfyIe/fYVZTXJ2lxBI2wxHNKvFklZMP4DDjsMgbA5e1OdVnaWM/ejCYcPelCh
	 obtrkPSDF2f6O5JalafGeV3lubsO9pzWBJrkLVpnhK+NyRkRE2SdOY9OwNP9zKFIb9Kk8
	 WIY2YcAYxTMeSdC9+WqVXZWzGm0VCHb6+7VXkim14tkkDQKf0SuhCqxfbOSjYw+STgZrZ
	 y5a/h/trpPLax9upRkSqr43+2MINvJ4TULWnr+GtwXf0iOBCEKkdBrVkUs2ZB0KztE8HZ
	 gY0jifjf66NUT5mphnQKGHcSNHmqPKPWqgP0L8IKLToaTzs3ejSAoQpViaSerNxaZ0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PBMKYmwNElZuOIl+rN1DVV8FCfwrcJ3udl/MwzFva6Q=;
	b=uneVBDC44HqjXHcxoL+6bz1ZjuiQkg1YdeOG2BhGgkpKi9sjlM687DI22ygX/u8ycfYu
	 w/KTRS/Y5PRSOhwX2Kw1zqB1YCPi1FGOoREUv6YTjS+Gt+8eAMBkqgEU+Gvk4S8GiHNRd
	 0aXIgf85XoRhAcnuUWijazzRQMayfbpBThE7woX+tJL12QlS9J6b/TrNDncj+IhEvJle+
	 5R9iJQ/Sr8yVCnv4rYMBuNoJAhpBOlc8LL+4aikaNo/SGOZSZ94DoLziB0tSFIkrIFSLI
	 uNcObwG0H/tfniT6IBvTINI/GRFFoNDCVl5NKrm0nAiq0ISnjQqOO5IWXHJV8E976Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CgxBjzCj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C0606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0C0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CgxBjzCj
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b3a332105bso8422017b3.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794488113; cv=none;
        d=google.com; s=arc-20260327;
        b=cNct6HItJ0+Bc/Tsw45y5K8VBlFVk1nblUwlSB68uXhZI6XVNiVm7Gbd6AWbYGBRoi
         zbje7htbxAkbIxA7lTDgN7OTGN0yZ/3wjO4Vm6KCweTyHtwRnD8jbxgY1+fVR5r5c8i9
         V12sDPn2uy3eIoQRArFgiOavCLGE/E3t6nXZmvwtzcOg33H0UQD12ro+oeXeWPvJAOF9
         Ijl6evQStwL+5cQDqYB8BvObVD0n8aL2TnRLag1LTApp3Sp4Mt4/KabzWnCL0AIQm1+P
         975/LQiPE/yALQ/LlW/JBe5BIIoi6TxoQEXZlPX6jpB37wzjR/vnpg9UhL5p3EJ7BdLH
         ng6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBMKYmwNElZuOIl+rN1DVV8FCfwrcJ3udl/MwzFva6Q=;
        fh=Xq6kNYr8qEYCC66gl4ebDYvzEt7HVQWxXXbEgNcG1Vc=;
        b=pJ6rhz4JVvg0hYlthdT0dyqUOZOCkKJhc0hSkxOPRxm6lXMPZgCGIoBdhf0VJWvjQf
         QQ/yQsBt1aG82yI1tk98nyoqvITNYvu0Wml4NR4ohq3SxHdxDnB67WiM5wJUtJnfLS8G
         C2LblNzPjGSJp84l/jCk4VC8B1e3WJ7IexKDYMe3ZFvFK3WR5HW53iYA/w6rMS5ywtH0
         HZ4S8mDSvrPDtoo7fxY15ezPjAg9Oc0UNOMebjZbShdDKMDrvLYPQ73in9piEn/lGp1o
         l7e5rTkHJ97bM4OL+KoGKnO7ZKvPFsbhD6ReW4F5+5X2HTvZlPDmLahyHfOSW5ZoJ+Q/
         xY6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794488113; x=1795092913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBMKYmwNElZuOIl+rN1DVV8FCfwrcJ3udl/MwzFva6Q=;
        b=CgxBjzCjzfJocH+1coRkX4twN1uPlp+A30VBlJWv4aBPEhLhtHvUVSfQ29uPFwLJ9h
         ndKWKT0JfOkTdCiApBcJGbKnoeBlNHLlgd3E61B728F+HMZTBXxP93jMEXLOf1rRVCaJ
         6sCERwq9PYtmxhWvKQviFkLc8Wp0cYO6Kd8yELQ8JPknI5QaM8oqX3w//Ne767Wrt95X
         RBslKs0JKpHNkBfUpqvfXE687FOQd9Z/sDqBwnEJ5onX8DE2scP6GWv4U4TONVygTqEG
         YNB33EU4BLlLXfJgXffkwT7jF/nXaQPrsbXQpztpy2soi7kscuQsc5A1cXRaJRiyggYP
         M8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488113; x=1795092913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBMKYmwNElZuOIl+rN1DVV8FCfwrcJ3udl/MwzFva6Q=;
        b=TT2w01CS6+OMI9wXNuFhXLjCMqtkGbcND4GICNiMFSE+A/kewiOKrO6phAb0j8ItJT
         PWtaxgg2Cu1JyCm5vYYAnYeIE+UzrLUtYsMkvlNfIr2SJwzc2Trb+sB1+EFpFYNdgwaF
         6EHzfvE52B7GuxREKGHu6ScNr7OGSFLWwITe0S9qMn/TOZPcX5qUQiOTcXokdvMhVoBb
         ZKIc32Q/Pfr8wsZdLbsWGYdJGG4fwvje/xCaD5d/lEd7vmiqv6/enNzQS4uBVtaN1MxS
         72Kk7SFWtKEs07q8eXvkBZ52m4R8jGEqJ+Ku5KfaJ4KOPbjSRm/TULCCJ1cdtHrZepFh
         Kwiw==
X-Forwarded-Encrypted: i=1; AL+hErExaCVJ8iMV9FnAxdmC8dSCbOJnigVIJwzZqmxH9kISGch0xPgBPdWRjPraMdiDuPaKMwUL5TAbJRsyFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VonaY36ydFt5F6Q/MpcI9EVgkP4Dt7Pfo4gu8vfeWhUQBhTuK
	Hs1l45jq0ZxuT0q52kXBnVktGAnwjFk0yTnruYLaA1i/s5T3dJ0WB/LFkL/jXjWnB9Dgczxu+4V
	JBQf3srtEFQ2ZA0p1H0O+KZDiHyC5yFY=
X-Gm-Gg: AYBFou2SmNJrjJhGQWLAc4QyaT5Y17ti9vmyykcVfdrTu8jmrwMo33QXQXRaUpYUkve
	FbHfqQQ9wCbs7iQeM5GL5VPotG9i5tvKEc2sSnG8VYAGZhjWK5zyjt8Lca5iCxIp+Z+Zh4LEYKF
	IUxqB5maaS1HPxITyKONJ/ukxJY81LLLQ9Ti/R5/6dT+XBn9t4WIqzn6ACe1gQLILrehCHT1Yn1
	C1srIOUDFrfESzBAVJCP6jazfxccYWvAKaqs/NLThqKbuTKOEjh07mHtuz6S1RQ8m7A4cUDqZ0M
	ozxEyZheU7KsHSld/if5d/Ih/3v+n6sF2LKZb01p17dln07PK/IZF7KpCgzuupUd+hZ7FjExlVN
	Opw3HmRSr145n7oKCKe5FYozXfoJoszSEFhVuORN/3yvygW8FmLCPf+MVjoo=
X-Received: by 2002:a05:690c:ec9:b0:8b3:50a5:b787 with SMTP id
 00721157ae682-8b3bb28a0eamr19804477b3.33.1794488113399; Thu, 12 Nov 2026
 04:55:13 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANd6Td+b6ituLFzkhvX09vricCY541fQapNOk3rTa=74zWA5LA@mail.gmail.com>
 <87ld6yrzs0.wl-tiwai@suse.de>
In-Reply-To: <87ld6yrzs0.wl-tiwai@suse.de>
From: London grad <londongrad@gmail.com>
Date: Thu, 12 Nov 2026 12:55:02 +0000
X-Gm-Features: AclHuK8BcHMeGJFNiJTzPTE3SrixMzrCmNJlLHRg_HqhW3ZGuN2ApleDHNjBIsg
Message-ID: <CANd6TdKdRftWyo5Cg_85-fBVGW3oHAntEY-DdCpQCDSyRpOprw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: ua101: reject mismatched capture/playback packet sizes
To: Takashi Iwai <tiwai@suse.de>
Cc: clemens@ladisch.de, linux-sound@vger.kernel.org, tiwai@suse.com, 
	perex@perex.cz, Xiang Mei <xmei5@asu.edu>, co+24304d323d28f156@bugs.sh, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much for the reply

I don't currently have a way to revert the commit, but can confirm
that the interface works fine when booting with older kernel 6.8.0-146
from Ubuntu.

The 6.8.0-149.149 series were rolled out earlier this month, I updated
last night to -149 and this morning the interface failed to
initialise.

Best regards

On Thu, Nov 12, 2026 at 12:37=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Thu, 12 Nov 2026 10:25:39 +0100,
> London grad wrote:
> > Hello all
> >
> > This patch may have broken ua-101?
> >
> > Kernel 6.8.0-146 still works for me
> >
> > In kernel 6.8.0-149 my UA-1000 fails with
> >
> > `snd-ua101` rejects the device during probe at every physical sample ra=
te
> > setting (44.1, 48, 88.2, and 96 kHz), leaving the interface unregistere=
d in
> > ALSA.
> >
> > ### Relevant `dmesg` Output
> > [ 2622.796887] usb 3-3: new high-speed USB device number 5 using xhci_h=
cd
> > [ 2622.928793] usb 3-3: New USB device found, idVendor=3D0582, idProduc=
t=3D0044,
> > bcdDevice=3D 1.07
> > [ 2622.928798] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber
> > =3D3
> > [ 2622.928800] usb 3-3: Product: UA-1000
> > [ 2622.928801] usb 3-3: Manufacturer: EDIROL
> > [ 2622.928802] usb 3-3: SerialNumber: ZT02743
> > [ 2622.934792] usb 3-3: playback packet size 560 too small for 15 captu=
re
> > frames
> >
> > Submitted bug report here
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D222261
>
> Could you verify that just reverting the commit fixes your problem?
> It's quite possible that this patch is the cause, but just to be sure.
>
>
> thanks,
>
> Takashi
