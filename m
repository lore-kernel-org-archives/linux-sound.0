Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07103B71A4
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371925; cv=pass; b=Pd6Ziq5wuMJV1x2vYbIvAP+y7yIjCFSWVMYwrHC0L2UGtViCh3YOXI8SWJjoDuXdiR+qhZ5+ZYn5freYQklhJaHxs0OZO0H7QjrYuq7ZQEa0/PyifD7SZOqrSdBmaZrHKjTf4Zd2FMwAsV3lABcRg7KMN+Aq3M59wVwjYQ+n2rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371925; c=relaxed/simple;
	bh=5l15B88NLthdQgscQ55G1vqKEjt0lOSt03a8tHYJH8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdYThpyTTnUXzRMzfbLNzRxmNya9lwsxzdVLLMP5d0fJk/HVRrdGaZnkViK8qK7HHsT/R437D++TX6nkXaD+GWw93GVIRBUo8MNLg1yboKRo6sPxVMejG+M2/tFRpFP42BZYaDBiOL32Ha6M/gtGQGXU8+HnKP90vlLbFQ500oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=AcClDof8; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="AcClDof8"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1332843b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789371923; cv=none;
        d=google.com; s=arc-20260327;
        b=RJLExcjjG62dhIP8ug5FBa9w8mpEvHQ+ZGsvhTJ2viU8OkKh/cxnjTpQlBgBeE2c+t
         ig6C7RfRdsMH3wSNZgjAvBYn/HlgioKvLr8KUqMk8v1qE6g4QakpADycVrn5jDXFdZN7
         Qpo9ZB1P9ubZyqf+Ctg41JbgQyGcrmfX7ZvUbcEG90kIUFLN1EonVKPn/k0Pq10N8MHr
         yJKTFdZl4JMEWt8Jk4a/rTNfzNV/5ChoUiE4UWmj95kvBuVvN1CVUzJdyy62nwBQmviJ
         oUBF0WNG/Y27D0zfvstF7r0oRS/H27ozuuaPvPxrbUwnp/hDFp3YIHaJGOYoWgqK0+SE
         FQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2o0BwYErT5KRPH9CR8Eo7YP3BfkkFlg34zMmtMPE9U=;
        fh=rQn5fxkCZTRopiUHNSHh9VtkTW31eN/wxUWXI5QrMOw=;
        b=gji4Hoc7BWCNvj6hLw5+58Xf73gTInbVAXSXf3naQ7qrIQpxeb+8Eut21873rZfVCb
         +bPZAIrIStEkHCl8RP0j3XSZXAP59hYn/ATP+4ACyuGLoOUEyZ8KGcTBwWLpLjTdd4cq
         tEi9hSBcbgIMcSUcZz24st4430hFCtlaXhI0HaB938Kr/mgGXbFrewkp0fbkgA5Fk4Fa
         9yBQdxAelwZNRgxwiZTMV2uyZrenUbhBSrNa1PlZpRadjhs4vw87yDuSGdYbvlYKEHBC
         0NE9BcI6D852DB2QHFC6uKo4Vfbu6RbSGU6dHiLo1+dKAKBSGrzwgFSvFX+WypfO9jPH
         O9Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789371923; x=1789976723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2o0BwYErT5KRPH9CR8Eo7YP3BfkkFlg34zMmtMPE9U=;
        b=AcClDof8f/gt+h0I+R2lwZSWEY3dgyFfQQnjorxjqo8ii3k/gj8eko3rMNWoZHaLcW
         +y0vAHv0xk0VZ7LYjXcnu9NJWuVHJO9pk1VbtufxJlPb/1sF5MvRcSPm9nCptsIuFaRr
         aSHuyctpe91aJ8BnnVx6HZUMkD5/u8Am6TAtrSiGX1QZEs/jOXEVpop1uw5um241xuF0
         prnRio+/Sq/mhRzU6F48i7CiCLrEdx01NLTASk2QRaHDiWD8Q61dAwitqrpOwcVtCnE9
         3B+T7bgGlQztgjCoWsV/0Hgag68xpPKh3OFDLH6IEIBPkVNGi9rWHQ2EsAm9J/65kYzO
         2EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371923; x=1789976723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2o0BwYErT5KRPH9CR8Eo7YP3BfkkFlg34zMmtMPE9U=;
        b=MbFDXva4nk2D2GQ26YcGpkVQy1rqrbrzHIGYtg9LTmZQZZ3sK7WJmQUrMvhFuajuj9
         f2GFpc9e8AYLDkv2JoStKql/jnRAweo7cGiLVTq4WYQEYhGPDonCyh3LedEvOmR4ybeg
         EruXnny8s+ohxrHGWYMlvWicdLS14AM88/bPeG/Tm8XssuTPmPsKGFMo31neO0720Qg7
         X+ogrjI4PJ5a36N8q44I0VAlcJObOkSP4WX4bv2j3ju2l+5mBiwpmrsZX8MVE/LYySmu
         2vtv0ZxoUBOlSpEVAtUGhkVPxUfXy7HEUbPuw3dBiDyLx8bkBaNrcwUgH7jr6ktnRg4T
         SB/g==
X-Forwarded-Encrypted: i=1; AKwUvBygHL24hcreSzpcBCBG/oHPoDu6RpgUT8c3ahRyZDiALd8XF7T4FTNIBHTzxoupLgmBcmnrDLBNGesrRA==@vger.kernel.org
X-Gm-Message-State: AFuF++l1UgY2APtsFsBr4U+/DenpAb0Yl7nbP/Nfsl/2KhdrAfGKzdFB
	X6cS2fDm+h4nvnOsL5I0p2262L/7O2yo0bfcJ3EqLKCA+chtI2f+K3Fnd/silIqaWDGq55ODu2g
	zQZ6cKrtehSwpFoTR9dg8znTr6uDZFOZk/R6wj0Vn5lfyK3Y6wCtzE/OT
X-Gm-Gg: AYBFou17t0N1kzBjCrmfNySV8OKJ5Cg2oebH3tL016gbdllMylRSUaDNxPGyHPR2tMz
	tuPSJCZSddKO5+BKQGhOmYLJLa/TqfjIL2CLP1Wp6lO/TgjR+Xe5Pi1YknFOF/WbljMSssVMh2x
	Ist00XZ4K2wJtwrvAeSGz/v9FrFeRwUmMe4L3kcvnRtcJpvtyHbfmqZVBzccl6M4/RLX0pMJ2rb
	KAWjiJWhjrSBzJoERQ3IstwBVIaA7pfdFPlS+t+0xSnGenMfXFypHfRQmr+cveeCDEgzKUZouiS
	gGKt3LN6p396/WkYcayUz4lc/AkKyh715KH0zDp4OXVnYe+GM7FdzLxaaqXgvJnjFUUVke3SFTK
	BsjNxjK3PNwHwvQmoqN4ESVe1mii9irn5S54tWHRpK14h8jw=
X-Received: by 2002:a05:6a00:1c90:b0:857:7384:b5fa with SMTP id
 d2e1a72fcca58-86f869a66d1mr3136861b3a.22.1789371923258; Mon, 14 Sep 2026
 00:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913000515.2344562-1-xmei5@asu.edu> <87ld95wryb.wl-tiwai@suse.de>
In-Reply-To: <87ld95wryb.wl-tiwai@suse.de>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 14 Sep 2026 00:45:12 -0700
X-Gm-Features: AcwNN1U0c9yLgk_gWnRWtStU1D8IPk53vG-om2y9VhOJ5OUm4gxZ4cgjbJLcsMA
Message-ID: <CAPpSM+QhqyPHEg_ygC=8tFVRWeCBzT=z8yGM_+V9qJP7DZyGmA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: 6fire: fix OOB write from device-reported iso length
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, torsten.schenk@zoho.com, 
	co+855929c2df672879@bugs.sh, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:06=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Sun, 13 Sep 2026 02:05:15 +0200,
> Xiang Mei wrote:
> >
> > usb6fire_pcm_in_urb_handler() sizes each outgoing isochronous packet as
> > (actual_length - 4) / (in_n_analog << 2) * (out_n_analog << 2) + 4, whe=
re
> > actual_length is the unsigned length the device reported for the matchi=
ng
> > IN packet.  A packet completed with status 0 and actual_length < 4 wrap=
s
> > the subtraction to 0x7fffffec; a zero-length isochronous packet is lega=
l
> > on the bus, and the preceding loop rejects only non-zero status.  The s=
um
> > reaches memset() on out_urb->buffer, a 4832-byte object from
> > kcalloc(PCM_MAX_PACKET_SIZE, PCM_N_PACKETS_PER_URB).
> >
> > Even without the wrap the result is out of bounds: at 88.2/96 kHz the
> > 4-in/6-out scaling turns a full 420-byte IN packet into 628, so eight
> > packets span 5024 bytes of that buffer.  usb_submit_urb() rejects an
> > over-long descriptor only after the memset() and the
> > usb6fire_pcm_playback() copy of user PCM data have run.
> >
> > Guard the subtraction as the sibling usb6fire_pcm_capture() already doe=
s,
> > and clamp to rt->out_packet_size, the OUT endpoint's wMaxPacketSize,
> > which bounds total_length by the buffer size.
> >
> >   BUG: KASAN: out-of-bounds in usb6fire_pcm_in_urb_handler (sound/usb/6=
fire/pcm.c:338)
> >   Write of size 18446744073709551456 at addr ffff88802a3d0000 by task v=
hci_rx/5018
> >   Call Trace:
> >    dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> >    print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> >    kasan_report (mm/kasan/report.c:595)
> >    kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
> >    __asan_memset (mm/kasan/shadow.c:84)
> >    usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338)
> >    __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
> >    usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
> >    vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 drivers/usb/usbip/vhci=
_rx.c:242)
> >    kthread (kernel/kthread.c:436)
> >    ret_from_fork (arch/x86/kernel/process.c:158)
> >    ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> >
> >   Allocated by task 10:
> >    __kmalloc_cache_noprof (mm/slub.c:5563)
> >    usb6fire_pcm_init (sound/usb/6fire/pcm.c:560 sound/usb/6fire/pcm.c:5=
95)
> >    usb6fire_chip_probe (sound/usb/6fire/chip.c:133)
> >    usb_probe_interface (drivers/usb/core/driver.c:399)
> >
> >   The buggy address belongs to the object at ffff88802a3d0000
> >    which belongs to the cache kmalloc-8k of size 8192
> >   The buggy address is located 0 bytes inside of
> >    4832-byte region [ffff88802a3d0000, ffff88802a3d12e0)
> >   Kernel panic - not syncing: Fatal exception in interrupt
> >
> > Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire U=
SB")
> > Reported-by: co+855929c2df672879@bugs.sh
> > Closes: https://lore.kernel.org/all/gisnub8aWGLbyZLcDCSc7zWsHonMWGcyRgt=
5%40bugs.sh/
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
>
> There has been already another fix for the packet size calculation
> there in the upstream (already in Linus tree, too).
> Could you check with it and rebase/resubmit if the fix is still
> needed?
>
>
Thanks for your reminder. Sorry for not noticing that. A rebase is made:
https://lore.kernel.org/linux-sound/20260914074324.3590843-1-xmei5@asu.edu/=
T/#u

Xiang
> thanks,
>
> Takashi
