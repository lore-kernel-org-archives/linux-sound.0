Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699087;
	b=HyvAny+4VjESe6QzEWRnc4qmS2kUu+Tv/EMaqAahH0KRQkyvIdUu6XsgCOlicM0A4AxT
	 KJVv+Igct+IOSg0PdOajBLchlk21ofoarOsJt8i6JdjUl2o7ypRpScMe3ZI0wKeNrFQht
	 gFCqnmJd/L/gcgBFSHsodU8UJPJEcN9qDjgv5bRh0pxE6FOpM9PswE+aUv32vBItZzdji
	 81sBS4lLJe0f9mvdCmi9O8G6jsNiYyDBO28wnQtSdtTSTecoJn7G57+DyFfuACnpF94Je
	 1ZUAQqAm4aLUzMkx0L8zPMqjhplnObsGiOvhsMTZzhlJ9ZesEtuqIIvLOsBR8Qzyv7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
	b=SyyPPtjD69Yxw8yK3qoCiihAqA8jU6FQCnEHPpupVfMhba7S5+DAZo59Tti7KmZc/I81
	 9x1qwBjvWeNficwNMrKIODE4ND4piFfU3ECkLWfira8r8Xmlvq6WpY5e8xmMuuxTa4dWV
	 uIedwriqCYDj1toA7jlXI+ouWGbsjyM4QZ2jhn75iTlsGFUfivrxzbMHWC5KuP661GC1x
	 uCob2iOEdn7FCD/y9GNbFXbt11xMH8EKvyJMP1WYYRxkWZxCIGxOn5bbymJh1t4PH/uI3
	 UkjpV+By6+sQFXlXdUH6CnC0oO75+TNTQi0v6I9/ZSVdgRRgSCFWVxQhzJluX9d411g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YguAz9ks;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EBB606A32C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 09:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EBB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YguAz9ks
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso27657215e9.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 01:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699085; cv=none;
        d=google.com; s=arc-20260327;
        b=mUsNlgOdXSHkm/nUDnQdI6F1bFfeWOW7NyPFa/1t0+fHAOIN2gHzDjQ2QPTPpLPsYl
         DrUZwoX8vOjxaHw88oce9Vpi6En/nMKgJBop6RwnsLEntvYBm2KF0Fl97Fmw4Pwa09yf
         mAjnxRbJr7+HSlhJF1ROzir7Lnv/MrNKJzI82najIP9x/rd96NPCZugebQX4mc2PNkby
         BZ73hRKQJkj5jspdpXw5KPxJAIg2p544v8D47vZejmzHUdCyT4pxrn5D8UwZMGOctNNo
         gcKYhgd10t/UOLLNLxtTq2d+du4K5BiWkKJRwMflV8sX3n7YnilU+MnzZFtFkZRL1cDb
         T2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
        fh=gsXT+ybrEtreEn/Q55FA2gdtP12gqe/D7WzVgne+5PU=;
        b=YV1xRnf39m9zZLD/850/NM663c223qudtzzxTSmpN0yDqI4AGkeYsNati25qPZAD7F
         1aKh9saP4mceiFb5PxI3w02QDo3X3EDCHdJTSJ6ooL1yZtkI3yZcvo6LxUvEYVN3n01a
         a503ymgMb5FknOAltwgXK96KfeGfutCXI5pn9w5YoMdH9sjKrCt07rev0bO++k78QQfh
         Y4Ps8EjZcw1k8bZJIQtosJIBIGqIfC66ii4gyqefNwjIQQmH6gsqpVOeBTCBhS0leHz2
         Azd3deyuIkBtrbyiLlYOHFTOX98VfCOBpOdeMG166iO9Pi1DVzUsQRwZhR4mwrmhmGPQ
         p+bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699085; x=1794303885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
        b=YguAz9ksusO1kYn9ldEh6G59tRSryK/H9lsi9C/OXfbDQzVbl+WhpbbBXkyWFd2M+h
         GVw5TCvwn55OlG5+4BmF0koUcdQBPyMCgWl7/FjYWST7xJ6UwFH69C0Bq4ttM7rPmZgW
         Yh9wnR6qai4FhnTVIvf5+JrXFJOnM30ITNmaLazUybtqgohKerZAAATk83px4TT3IZ6x
         BuqWDZ3SsxVTOfrC0LNECls5azbxKq7xgXnTlAdFEhnp+R+o9IePsDU8UgFVi57xRaCB
         PUP7Bemofx471puO1OnhL3YY1e6XP3J/s1rHmO4yVAgsa7k33zcJF21O2SLpDVSCFBeZ
         vCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699085; x=1794303885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
        b=2kR+DOPKes6b4S0d8RxEzu0f8n5sbD2MDZcuFGoa8JJehHGeaF27uhhXx3g4y5SwOg
         quRAPjkb2xr/+CjrVpogRl84+BeLxBKILoLqEPYAJ/w8f6tPHRmWOhJc5lTayRLSzUMQ
         pLcaECtxKtiQZoolwUCiOuKh0K75Tg1zmuIquIYvI9sKsTlNol/lyG+45akG2mHEZj4O
         /gQKRgRBTSCmbJdV7DdZ6SO9sWChJUd4UdTnIfVKXK5DFrmDB0o8P6skPGSZtj4zgYop
         UM25ZpLnijntY778uZlj+zEiogbwCx9SVMHcVMrpslkJY+EKJj6V5kzGF7wURxcH6e0s
         MKPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcThs+cIa0rjlsJpc6qdIuhaQVgDTNxfYAk2ArtI8nTgml8O/wr9mAAJQX4TpFvDl/A/WuWHeWM9istg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lY+75ue8v7xaHM2xVPRjgpahLax6ybS8L/CjSMRlHBUfFzGlc
	I78UYxasghQqsgsRc0rPRdMgsqWDk0GwS7pR0ot8r+LSLmuQqyJXYRDo1N28L3lGSxtNuG+yety
	X4aCiQa7Sv81fYO2uTFKKnD5jhssLqh0=
X-Gm-Gg: AYBFou2Zb1nD5nf4R5xVpHXKPRZ787//rlDGoBEeEQmwIcIUxB6t2gixWd7sg6LJH52
	ur4LA6gspyZsnniZySMubgApNMPa/teiPgan9oA2unnDWlBmkxi5Qm8d0od8IjSkfwthZ9ds87X
	RNWZXtSn8k/Vlr/sGan72BJjbprWw0Iz07FdF6D1tSkZad+0nqtW1iCLk7ktkc8KZWEzYhxcZZw
	zqmKMF90bJhPwMWclh8qcDTax/r+GrYQxP+K1CrdGLc+UYzDGa4tIvjwE0/XQQB4A2FAjOchZiZ
	rtLBNhnUaL7pVqZUbS/mMX0wTf38X+N1g/TtvMp55NPWergzApqi1aAhqSecCol+yanNrp9eUA1
	xBUveaxgFOkiyLz7IA/+DYz51UBV9qb6gadXq3AwrK0YXN8D3wmAcZnrtHsr6xOtxkoYMGQ==
X-Received: by 2002:a05:600c:5246:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4ac16acfe48mr291991475e9.10.1793699084886; Tue, 03 Nov 2026
 01:44:44 -0800 (PST)
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
Date: Tue, 3 Nov 2026 10:44:32 +0100
X-Gm-Features: AclHuK9LrOPRysXH3dwqwQb4TVsSxZhcptimLlVHKzJ2_9mQk8sFNwCloZqoTrE
Message-ID: <CAN6p6ihUEgoPLs-Xtg0Rwntoxzp-_9_99Aj7_R_M2PL0Vn7U1w@mail.gmail.com>
Subject: Re: [REGRESSION] ALSA: hda/tas2781: divide error on playback open
 after accepting V1 calibration data without CRC (Lenovo Yoga Pro 9 16IRP8)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, 
	Cristian Castellano <cristian.castellano@icloud.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian, Thorsten, Takashi,

Sorry for the breakage, and thanks for the detailed report.

The two populated entries in the dump are valid (R0 =3D 3.64/3.65 ohm,
1/R0 consistent), so I suspect p->ndev is larger than 2 on this
machine: the V1 loop then converts all-zero entries for the remaining
devices, and tas2781_cali_preproc() divides by re_cal =3D=3D 0. My patch
only checked the first entry, which was not enough.

Fix posted here, Cristian please give it a try:
https://lore.kernel.org/all/4e500063-d985-46b6-a0a1-3feaa77c4b2f@leemhuis.i=
nfo/

Takashi's re_cal check looks like a good additional safeguard.

Thanks,
Mohamed Yassine JEBABLI
Tel : +33 77 38 91 074
Boulogne Billancourt - PARIS

Mohamed Yassine JEBABLI
Tel : +33 77 38 91 074
Boulogne Billancourt - PARIS



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
