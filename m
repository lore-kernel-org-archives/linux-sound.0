Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF134C79
	for <linux-sound@vger.kernel.org>; Sun,  9 Feb 2025 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739085554; cv=none; b=MHpDk+24LDg4tzy9QEOIqCA7a4v5NUyBrcjKXd2Kz8bX8oVOBrHj5PvLHgxNfRUaFXVjJ9tVwSeV4N+595+QASzilwlcz5j7U7ttcsG8Ywrdw+ekxwl7YEvSS5sUfntHTEHIq9anLui3cOK1+hb7NCZb1smA2OtFVPjKNtZy2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739085554; c=relaxed/simple;
	bh=Be/TkZhDldtJLSE9EWVKHYkYd14HQKbNbtl1yrtX5Pw=;
	h=From:Content-Type:Mime-Version:Subject:Date:References:To:
	 In-Reply-To:Message-Id; b=LXX08BvSSKkgzGZlhbc4VsmEidIjPzL7xfIeTbUm+9fpYoLhZltBkmGxK54nlX3HFl0XwMEDLNy7GDcYgI6GA4VT9FeHxEHEMELPcMDGncvopa8rhpsy1wWqlwnXXn8l5uwg7dvhAsokUIp5sGB7ODlqyLkDj6Pb5YBNSK7mLVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5Ay0Wuy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5Ay0Wuy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso1307169f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 08 Feb 2025 23:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739085551; x=1739690351; darn=vger.kernel.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Be/TkZhDldtJLSE9EWVKHYkYd14HQKbNbtl1yrtX5Pw=;
        b=Y5Ay0Wuy/QJ0HbQQkMg4sjrGNmTHYPYynOOnJtG21xEUkW7L78u8iJYPBIxlhbUotj
         2FreO2qzBnKrWZZ2ROMcxjWQv92k4CfbG0etKw7p117+0DvGYUcYyaPwRePKCDSIb4Nk
         w6sJZIZiH6ckawfo1kK2V3xI7MVl1bAx1KSPbcSs5suy4pgD8AIrYJFxQfeywC3E9pCh
         WfE0b0mGWiel8/JggywNt9iic9IbcvKRNvE89qQ3YJsAhdhobXcPk/3qwiINBzBj7epZ
         MWK6/E/9qK5AViLoQJsv4bFkB/Rdi4lf8rOpjbpQ5Q4j2+BUEERaU16jLlarq0ElHIkj
         I8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739085551; x=1739690351;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be/TkZhDldtJLSE9EWVKHYkYd14HQKbNbtl1yrtX5Pw=;
        b=nui59rcTc2jC8QyWEbuu0eNVzUXipZDms1BS2ihhq2jzpIUwF/yHK2XoBwmQUhgaJv
         BVCbCZHW4xQXn6vsVqje6HotNatDAuHJD62xafXJkjRSM1nj3BmnDxKZv+Gz3UGJB3ll
         QHkVYuov1XKhUQWUZVIZfW3ne6xbMxfXspEoOLzvNPQSh/rjWtRB1teU5Cx1gQ7GipA6
         Gr34m4xncfnOYaUnWA1/H9GwRy0jJpMcdEOrBNeykGE20/KPXLcoofrHMa13GSiqIlGT
         fd42NznLxYi+KDYZSzWGTkFNxafXS8MKaJchCkIg96HeZYrZIchUvJkQ43xHcP+XImhE
         PJgw==
X-Forwarded-Encrypted: i=1; AJvYcCUrIsdMwCUByao8V4w+DyDaOSijfwLyIER2bxFdFiH2UgeFLwAbJxTOkOAkbGlmgZJd1UAxyGyqTvkavQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyutvYu4upRsOOsPrUkO61rfVpwPSXQLFlb2l78mvjp85PQt1ss
	2Fwx6RPnldOqX7AnnXA1X6IQMXi0ZyXAQ3XdHOvWnw7goqSAxCVB5VXmGFC8
X-Gm-Gg: ASbGncsH30yjUbdK4YAAqiIJrWrSr6h5Y4P4ylAaDNKRQPEmb1j4KIZ+zPuNcoPaT4a
	kuOzp6vHsXGJ9Yczw1iAmnpXYKDnepYd9fOfhZblftqkQuWwUKNnlHmr33ItWex66mQ4+kIoe4M
	a9lGe6bOcLSWQ0Jgm3FOU7V5kzK7+eQi4YmIND06DL+exDfq1wujYHaOPFetQQYPfYf8Er1bweS
	KqJ/pKS2RFZundPJd4til6abGQ0iUdG3fyxzqe8AAyHXJV7SpXY/OGMEU6vZor2zBJ+SdGM6uIL
	bteK+wh+tunl7vuwuxnh24q729Bx6bfFcVfsLQ==
X-Google-Smtp-Source: AGHT+IGkZMn6PlUjMstdOXU+R5UQv73yH3thGdlO/whD6V89aaFXkHCuQH84HLcyyq+kK+sUwxSOPg==
X-Received: by 2002:a05:6000:154b:b0:38d:c6b8:9fe1 with SMTP id ffacd0b85a97d-38dc9ba7670mr6887253f8f.24.1739085550466;
        Sat, 08 Feb 2025 23:19:10 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc4d00645sm7748488f8f.66.2025.02.08.23.19.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Feb 2025 23:19:10 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: Amlogic ASoC vs. VDEC deadlock bug or interaction
Date: Sun, 9 Feb 2025 11:18:57 +0400
References: <A97451C4-BA1A-4A5D-9766-BE4915E8C5E5@gmail.com>
To: linux-amlogic@lists.infradead.org,
 linux-sound@vger.kernel.org
In-Reply-To: <A97451C4-BA1A-4A5D-9766-BE4915E8C5E5@gmail.com>
Message-Id: <A374C4C7-4BB3-46E0-8842-E1D6519D3B34@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)

> On 7 Feb 2025, at 8:43=E2=80=AFpm, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>=20
> Hello folks,
>=20
> I=E2=80=99ve unearthed a bug, and I need help with further =
investigation :)
>=20
> Here=E2=80=99s the description:
>=20
> Amlogic G12A/G12B/SM1 boards experience a board deadlock when playing =
HEVC 10-bit media via the hardware decode codec. They can play 10-bit =
VP9 media, 8-bit HEVC, and H264 media without issues. As the HEVC =
decoder is unfinished work (patched into a current kernel) the =
long-running assumption has been that the incomplete code is at fault. =
As the hard deadlock does not leave any splat clues, the suspicion is =
memory access or corruption. The 10-bit HEVC path uses MMU, although the =
VP9 codec which shares a lot of common code with HEVC and also uses MMU =
works fine. The 8-bit HEVC path is also fine, and this probably explains =
why HEVC decode has no deadlock issue on older Amlogic chips that do not =
support 10-bit output.
>=20
> In the last week someone suggested enabling =E2=80=9Cslab_debug=3DFZ=E2=80=
=9D to see if that would generate any new clues. It has (the Z option =
triggers the issue, the F does not) but not in vdec code. See below:
>=20
> [ 2.789071] Unable to handle kernel paging request at virtual address =
003c021d57237dd2
> [ 2.793032] Mem abort info:
> [ 2.795798] ESR =3D 0x0000000096000004
> [ 2.799521] EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [ 2.804808] SET =3D 0, FnV =3D 0
> [ 2.807840] EA =3D 0, S1PTW =3D 0
> [ 2.810961] FSC =3D 0x04: level 0 translation fault
> [ 2.815814] Data abort info:
> [ 2.818673] ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> [ 2.824142] CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [ 2.829160] GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [ 2.834448] [003c021d57237dd2] address between user and kernel address =
ranges
> [ 2.841556] Internal error: Oops: 0000000096000004 [#1] SMP
> [ 2.847098] Modules linked in:
> [ 2.850133] CPU: 4 UID: 0 PID: 11 Comm: kworker/u24:0 Not tainted =
6.13.1 #1
> [ 2.857063] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [ 2.862352] Workqueue: events_unbound deferred_probe_work_func
> [ 2.868157] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> [ 2.875090] pc : snd_soc_compensate_channel_connection_map+0xa4/0x1d4
> [ 2.881503] lr : snd_soc_bind_card+0x2e4/0xb4c
> [ 2.885923] sp : ffff80008008b9f0
> [ 2.889217] x29: ffff80008008b9f0 x28: ffff800081b0c970 x27: =
ffff000007521200
> [ 2.896323] x26: 0000000000000007 x25: ffff000007521088 x24: =
0000000000000118
> [ 2.903430] x23: ffff0000082bd5f0 x22: ffff80008125d130 x21: =
ffff000007521088
> [ 2.910536] x20: ffff800081b4ca10 x19: 0000000000000000 x18: =
0000000000000001
> [ 2.917643] x17: 0000000000000068 x16: 00000000000000c0 x15: =
0000000000000002
> [ 2.924750] x14: 0000000000000000 x13: 00000000000e4ce3 x12: =
0000000000000000
> [ 2.931857] x11: 0000000000000006 x10: 0000000000000000 x9 : =
0000000000000008
> [ 2.938963] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : =
0000000000000001
> [ 2.946070] x5 : 413c021d57237dd2 x4 : 0000000000000001 x3 : =
413c021d57237dd2
> [ 2.953177] x2 : 0000000000000000 x1 : 413c021d57237dd2 x0 : =
0000000000000000
> [ 2.960284] Call trace:
> [ 2.962710] snd_soc_compensate_channel_connection_map+0xa4/0x1d4 (P)
> [ 2.969124] snd_soc_bind_card+0x2e4/0xb4c
> [ 2.973197] snd_soc_register_card+0xec/0x100
> [ 2.977530] devm_snd_soc_register_card+0x48/0xa0
> [ 2.982210] meson_card_probe+0x214/0x290
> [ 2.986197] platform_probe+0x64/0xcc
> [ 2.989837] really_probe+0xbc/0x388
> [ 2.993390] __driver_probe_device+0x78/0x144
> [ 2.997723] driver_probe_device+0x38/0x118
> [ 3.001883] __device_attach_driver+0xb0/0x144
> [ 3.006303] bus_for_each_drv+0x80/0xe0
> [ 3.009940] usb 1-1: new high-speed USB device number 2 using xhci-hcd
> [ 3.010116] __device_attach+0x9c/0x1b4
> [ 3.020430] device_initial_probe+0x10/0x20
> [ 3.024590] bus_probe_device+0xa8/0xb8
> [ 3.028403] deferred_probe_work_func+0xa4/0xf0
> [ 3.032910] process_one_work+0x140/0x300
> [ 3.036897] worker_thread+0x2a0/0x4d4
> [ 3.040623] kthread+0xdc/0xe0
> [ 3.043657] ret_from_fork+0x10/0x20
> [ 3.047212] Code: b0003616 91046294 9104c2d6 1400000d (b86068a7)=20
> [ 3.053278] ---[ end trace 0000000000000000 ]---
>=20
> Boot log (until deadlock) is here: https://pastebin.com/raw/KQmXMaNH
>=20
> If I disable the sound node in the board device-tree to prevent =
snd_soc being probed the kernel boots fine. Interestingly I can now =
=E2=80=98play=E2=80=99 HEVC 10-bit media; Kodi fails to show anything =
on-screen due to ffmpeg not finding a valid V4L2 capture format, but it =
is otherwise trying to play the media file and I can press =E2=80=99stop=E2=
=80=99 to exit playback and all is fine, no deadlock. If I boot without =
the slab_debug options (and the sound node restored) sound works well =
without any known issues. There is clearly an interaction between =
snd_soc and vdec.
>=20
> The patches that add HEVC codec to the vdec driver are a mix of =
unfinished work from 2019, and work to add 10-bit support in 2022. =
I=E2=80=99ve tested with the 10-bit work and all ASoC patches in my tree =
reverted (a couple of minor backports and a hack for channel mapping) =
and there=E2=80=99s no change. I=E2=80=99ve built a 6.12 kernel and the =
issue exists there - I suspect the problem dates back to 2019/20 when =
the original vdec work was being done.=20
>=20
> I will attempt to built a much older 5.x kernel to establish a bisect =
boundary, but our embedded style distro packaging and the scale of some =
of the patches will make a proper bisect challenging. To do much more =
I=E2=80=99ll need some guidance as I don=E2=80=99t have the c or kernel =
architecture knowledge to properly debug.
>=20
> What ideas do you have? - What=E2=80=99s next?

In short, the reason HEVC media plays is a bad patch =E2=80=98fixing=E2=80=
=99 a pointer dereference; which broke some V4L2 plumbing causing =
Kodi/FFMpeg to software decode, thus avoiding the VDEC issue. With that =
change reverted normal behaviour (deadlock) is restored. So there=E2=80=99=
s no problem interaction between snd_soc and decoding. Apologies for the =
noise on that.

The snd_soc failure when =E2=80=9Cslab_debug=3DFZ=E2=80=9D is enabled is =
still valid though (AFAICT)?

Christian

