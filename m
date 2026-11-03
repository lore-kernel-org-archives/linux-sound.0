Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699582;
	b=ICB4sQZDyAcW8WJ1Q7Q9rrPNul9lUN6THOPTiQcEAgXqLxIymf7oRGT5/aBOv9i+btB5
	 OAINn7Z9urSBSIFe4PWT3LQQ0ilkeqAo9856nnaiawekIPq/9IfBVpmvOl9ptPueJXU6/
	 t5lERFSn0BY4O48rhdSi632G7vFO/CgdyQyqhCh03bo7zAV2ldsHscgK3WzEzPjB6nGjK
	 nxwwEfmAglQMnWS4JrUnAcWA5a9KSlZIupkw3SV1wsoJn6WLeACI5aIl6w/C0SScGwb8A
	 MDmRaABCGbO6DoPBcRgy+Ja1Hj+mJ8Zlj5KHOeF+29DOKgQxNmLmCgNwirW9r6zs15Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
	b=JbChQKis0knEMpgV3gDkadHWXuJvus3M45pK12OZQNTAl1p18S849/ODn0uUQg3qCqHZ
	 jcKreAB3DFgf1kkY9b5pP4sM5qDu4MifHfFRFA6kPDXgR8QaZ9FEKLrfeIjYpGQodvvtL
	 W3ismxYLx1Z0/t2jrkUZ8p3qM8u84BytwpJCRyoBhQqqb2+GqyH30NtPL8Vwe3YYTPJyg
	 suNJNk3PhEOBfjInor22jP3vUM86lSV4E+Wbjoi/70qlkYyeRBW83CRYoIzDAvkT9RNcZ
	 4lejqqyiQGXyoi/fGGGcmLGt7RneA+5ZzZo0XXiAFJjnTDqtqEmQn6ypjLfI+83ADLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peOfMWHI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FC9606EE86
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 09:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FC9606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peOfMWHI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6215375e9.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 01:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699580; cv=none;
        d=google.com; s=arc-20260327;
        b=cUv/YGMs9EHQZfpgCsk6dZV+GzJdehQiIxgo/CgBnd/VsNGdK9mJPIZdJoopLIYePK
         of+XK6fgIO3oeQ7z+8HB/pbByI7QKvi/8Lc0zngMxMStxvSCYU7ypFQG+VWTJEYgqil0
         5LqS/6sPtYuUVKipKg4/8oRDl8rgMFn5rkIoD6vpdYVQWw6txWP+6pejsVTh9FxcMUxf
         nluUGOMlnlUB0hTsYEWnj5LizkKAEqcRXF1AtlS1HJjgOTIgPzRYxEjIYChOrLSkJ8yr
         jXNKORjjTzKUKd6oiCZEO5PUb5MpO+iQ2IG9Nqz7SJq1dfRveZJOr59tBAtRU43MpD1E
         DeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
        fh=FN9ivj1agaRmxIx2InpbJ1yxWcXHdIzbn1DmXzyZI9Q=;
        b=HxRqfosZlWWC4XOXW0VkUZixxc9sHF0BqQ+slokNKuDvAhahZE6DjOlaD7tRTEHOSB
         zanTQF+SOKOti3Qlsn147b+BpqQzn/UleRpZJ5rJSOl8Afp7SFuSN9fpqrRZoBFjm7nb
         ax76m6MtCEz+37VNdrLzrpybkhXaIxGx1QKznOdUApqJfrePKypC66wH0M093HY+3h1n
         oZqdShMnVibP4ELgvR/idWmntxR6q7vr4U/jtwXacJ6TObDQbvi+LlH8tGIPLu4LlwW7
         rNz3cTE0w3LOBBM7ic6t2VgUEvgnQQq5K1HKQHLmZnihVXSFMqbKchpRqCIlikP9+Dgy
         yylQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699580; x=1794304380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
        b=peOfMWHIyzPwQL61CM2Ow15fwXr1AP34xKdyJRsvJGFAZthiMpVMa+CKMowW/WU88B
         co+S5JaCwDNgs3aoomA7DluS7vfYIKfqbHgzg7FHBBtl3O0VQiRADXJPD+IXWYv1kc+x
         WccRM5dwWr+wIWtHQmtYZTQiYyADTYnA6+Zx4UYOFIpUFREuYSmEznv9r14AWEFq3PjR
         /6wQEsXEVBQxClps1ArrT/n3tfUBaPgMGfM2dJ0B2nA6v0KJLsFPl8xFGJ27B7siqBZY
         5rXTU+p1w/BCSLrQ2jJ+zuDZlUFV0ZwMDubgurKGqBKuKmFwECymcdv1Rs18sIbGf02n
         js3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699580; x=1794304380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
        b=gwlr/2JSOsVy3vczPmex1PGfpFtZzIfUcHJTh5k81O8Pmt2/0+DynZuOHOYYC1xYrF
         23TKwW/9MnIAEVvxwR529cwqATvwjIT6/pJklMippWRL3jTFNsw3B3wgNuvCG3E1IHyL
         opJwXIBy6GrbH3I6vcGc+31pb8fCc5C95NQravcAX38ac5SZPIq+QciK+cyXa4rL57tE
         nK5oOBKyNENcjwFgAZxvYwZHXLyuWH2GGJ+5fsRBYwxDehKHi26I7yKlJxMrXufPAjuj
         8D6U6bOC1SJh3GuhBQyq9ksMkB1P31ar9qV5PSH3WTdqmGYc2D8S7ThrdX8rxEgIkIpM
         uV1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSu4AGsKJbKwZV8efi38xHVzDE9wCis31ON+xoz1gOaKo9tH8B9UPS7WJtPXsiDP1QLTBRymxG0ZSUxQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uU0MkwPUU7I0NtEaGyn1Ad2zwmJlyeF/yzqgygBnetzNny+rl
	zQrHI/UCcY7dQm3aQRQ9gwXLsAEHspLaKNMRbyYj/prBfKXtSYyKLhWGK2uQlDcvndaBi7TUYxJ
	xItx6fvt+sdvNfqitnfg+Vsxl73zZUrM=
X-Gm-Gg: AYBFou1sWy4bARDi0b6J369WlTXSjLyNITSKfEwsWd2RAhi6+Y2j6XSM9epO/lfF3JM
	VXlgauIJE9rJdHIWlK3dC6kC3626FhzFW/X7HYyyZve+dzajlShFqcXDHsJWpwnLPQRLv1VzX6d
	ook7rDihWX3cEOgzx9UfIach57Rd0j6z1FEjvancgIqBMBaKH3idZ6gpZsguGO7VxN/wk9/6bjj
	B4pBb8Hh/09xUwcRwtYrNgE7LBsFyqvkPkA7J3Cs6/m1ITgAFxU1eChcaOgmjCnFCAjWljch51D
	8kvLn7ZghTnMs08F3WART36DdH+zDTHdq50Jjvkhzq6MJpDg63Eov3n2TgvLMkipABT/Vhhjx76
	+Ib1Eu3bqknSWpudTv/8o4tOjtLu82JJ45baVQQRHrnh/FDbtIUBE4BgGlwc7NDMRVRmStea5t2
	idjVPoIhcDKYn8KZw=
X-Received: by 2002:a05:600d:6508:b0:4b0:b9ff:1e7c with SMTP id
 5b1f17b1804b1-4b0b9ff2129mr116381315e9.15.1793699579991; Tue, 03 Nov 2026
 01:52:59 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a84fe7b5-ba90-4e51-afcc-548f8b30180b@icloud.com> <4e500063-d985-46b6-a0a1-3feaa77c4b2f@leemhuis.info>
In-Reply-To: <4e500063-d985-46b6-a0a1-3feaa77c4b2f@leemhuis.info>
From: Mohamed Yassine JEBABLI <med.jebabli@gmail.com>
Date: Tue, 3 Nov 2026 10:52:48 +0100
X-Gm-Features: AclHuK_gVSoghFofHU4OU9sa8nsiBkF76JbJCDYGPYcibo5ActA64gLH3ScUcvw
Message-ID: <CAN6p6ihSizkgHHYP2ns1ifE-eDeR2ZsK=wWyi4JoEgF3gQ3zxg@mail.gmail.com>
Subject: Re: [REGRESSION] ALSA: hda/tas2781: divide error on playback open
 after accepting V1 calibration data without CRC (Lenovo Yoga Pro 9 16IRP8)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, 
	Cristian Castellano <cristian.castellano@icloud.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian, Thorsten, Takashi,

(Resending as plain text, the previous mail was rejected by the
list and also pointed to the wrong link, sorry for the noise.)

Sorry for the breakage, and thanks for the detailed report.

The two populated entries in the dump are valid (R0 =3D 3.64/3.65 ohm,
1/R0 consistent), so I suspect p->ndev is larger than 2 on this
machine: the V1 loop then converts all-zero entries for the remaining
devices, and tas2781_cali_preproc() divides by re_cal =3D=3D 0. My patch
only checked the first entry, which was not enough.

Fix posted here, Cristian please give it a try:
https://lore.kernel.org/all/20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce=
@gmail.com/

Takashi's re_cal check looks like a good additional safeguard.

Thanks,
Mohamed yassine JEBABLI

Le lun. 2 nov. 2026 =C3=A0 12:36, Thorsten Leemhuis
<regressions@leemhuis.info> a =C3=A9crit :
>
> On 10/27/26 23:21, Cristian Castellano wrote:
> > Hello, since I updated to 7.2.11 (and then to 7.3), opening a
> > playback stream on my Lenovo Yoga Pro 9 16IRP8 (83BY, subsystem
> > 17aa:3835, BIOS KVCN44WW) triggers a divide error in
> > snd_soc_tas2781_fmwlib and audio stops working. 7.2.9 just works.
> >
> > The only tas2781 change between the two I found is: c1b708f712f5
> > ("ALSA: hda/tas2781: Accept V1 calibration data without CRC")
> > (upstream 408249089c48).
>
> Mohamed Yassine Jebabli: have you seen this? It's a change of yours that
> causes this problem.
>
> Cristian: can you maybe try if reverting that patch fixes things for
> you? That we know that this is a option in case no fix comes into reach
> soon.
>
> Ideally please test vanilla Linux, ideally mainline? CachyOS might not
> modify this drivers code, but occasionally changes in lower levels an
> cause trouble (but I doubt that is the case here).
>
> Ciao, Thorsten
>
>
> > At boot the driver now logs:
> >
> > tas2781-hda i2c-TIAS2781:00: tas2781_apply_calib: V1 data without
> > CRC, accepting
> >
> > Before that commit the data was rejected and the amplifiers worked
> > with default parameters. On this machine the CALI_DATA EFI variable
> > (CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92) contains two non-zero
> > device entries followed by zeros, with TimeStamp and CRC zeroed:
> >
> >   0000000 07 00 00 00 5c c8 20 1d 28 b5 27 23 2a 79 42 16
> >   0000016 f2 07 c5 00 00 00 e0 2e 01 f7 2a 1d 72 6f 1b 23
> >   0000032 2a 41 4a 16 c4 0a c3 00 00 00 e0 2e 00 00 00 00
> >   0000048 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >   *
> >   0000128 00 00 00 00
> >
> > (the first 4 bytes are the EFI attributes)
> >
> > Oops:
> >
> >   Oops: divide error: 0000 [#1] SMP NOPTI
> >   CPU: 10 UID: 1000 PID: 1533 Comm: wireplumber Tainted: G        W  O =
       7.3.0-4-cachyos #1 PREEMPT(full)
> >   Hardware name: LENOVO 83BY/LNVNB161216, BIOS KVCN44WW 03/05/2025
> >   RIP: 0010:tasdevice_select_tuningprm_cfg+0x8c2/0xa90 [snd_soc_tas2781=
_fmwlib]
> >   Code: 4c 89 f7 41 b8 04 00 00 00 2e 2e 2e 41 ff d3 85 c0 0f 88 97 01 =
00 00 48 8b 4c 24 10 66 0f 38 f0 01 0f b7 c0 0f af 44 24 18 99 <f7> 7c 24 2=
4 88 21 88 41 01 c6 41 08 01 48 8b 4c 24 08 48 8b 44 24
> >   RAX: 0000000000000000 RBX: 000000000000002a RCX: ffff8d36ca8af218
> >   RDX: 0000000000000000 RSI: 0000000000000db8 RDI: ffff8d36ca8af21b
> >   RBP: 0000000000000000 R08: 0000000000000004 R09: 000000000000000a
> >   R10: 0000000000000100 R11: ffffffff87559290 R12: ffff8d3684e350df
> >   R13: ffff8d36a861d9b8 R14: ffff8d3684e35038 R15: 0000000000000002
> >   Call Trace:
> >    <TASK>
> >    tasdevice_tuning_switch+0x71/0x80 [snd_soc_tas2781_fmwlib]
> >    tas2781_hda_playback_hook+0x4c/0x110 [snd_hda_scodec_tas2781_i2c]
> >    hda_component_manager_playback_hook+0xb5/0x370 [snd_hda_scodec_compo=
nent]
> >    playback_pcm_open+0x79/0xa0 [snd_hda_codec_generic]
> >    hdac_hda_dai_open+0x5c/0x90 [snd_soc_hdac_hda]
> >    snd_soc_dai_startup+0x52/0x90 [snd_soc_core]
> >    __soc_pcm_open+0x108/0x6c0 [snd_soc_core]
> >    dpcm_be_dai_startup+0x153/0x3c0 [snd_soc_core]
> >    dpcm_fe_dai_open+0x109/0xc00 [snd_soc_core]
> >    snd_pcm_open_substream+0x604/0x920 [snd_pcm]
> >    snd_pcm_open+0xeb/0x220 [snd_pcm]
> >    snd_pcm_playback_open+0x39/0x60 [snd_pcm]
> >    chrdev_open+0xbf/0x230
> >    vfs_open+0x3f8/0x520
> >    path_openat+0x4f4/0xc50
> >    do_file_open+0xd7/0x150
> >    do_syscall_64+0x8f/0x380
> >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >    </TASK>
> >
> > The kernel is  linux-cachyos 7.3 (taint O is from the NVIDIA module);
> > CachyOS does not patch the tas2781 driver, and its LTS, 6.18.55
> > works. If it is needed, I can test patches.
> >
> > #regzbot introduced: 408249089c48
> >
> > Thank you,
> > Cristian Castellano
>
