Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595A18DB0B
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946605; cv=none; b=gZPbL94v4qBR5GTNVoriCew9Ozny82WP7rQJJpDG+xhBEVy6nrOZYfCkp3MQhSEE5YtK32vvpzUzzjznqeMwtN4KxHuQeX2SI+VoO1TlHjnPNr8MyNSP1HW9qZYwAkIs8CE9TjaVqAFnJ5bD65ZZf3czH15Ts3MKnU8Qm7Ml4cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946605; c=relaxed/simple;
	bh=xuBOiK9OZrpx0geLLAZI80768+DEmJENxcmo5AreaGY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=DiYaRxCjh6v2RgEZOW0BWLl8ungOqSPeUmrjHB1YTXBL27a00T6/+8hWSnFec9wTEbWI1bxCy/qT64Vy/w7cS3D01KEoyqRz6P4+Il/Rx3CS9e+Sswxop/6F252LdSEOUhjvrjtv9evb3f7rbbngQAgC6W+jnxY95je/BMvOJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXaA/LEl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXaA/LEl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a39e659cso15482355e9.2
        for <linux-sound@vger.kernel.org>; Fri, 07 Feb 2025 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946602; x=1739551402; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xuBOiK9OZrpx0geLLAZI80768+DEmJENxcmo5AreaGY=;
        b=DXaA/LElTapbO9QAaDoeHjfheZS99i36YNxS+iAc6pLbhHRsvH3QkBZILO0vxZJuts
         kLZ2FwQKpjWyi/7op3Nafgqbj+HsI5/LE7rJPG4t+TsTSH2T+JQqmCQc4ebQatfSNgAI
         TTMOQ+ZmT89sVvFi6p+yLdt0wFOUS8roETW41stX6AjcU0dVpv50u98oQl0kiZGZHyTO
         QpRDybq+8Pqa9JXQcT7kQeZEe2mGdpLy2wW20d3e4sEi5EumYpMArZXdX+nGplsXJqmo
         kLRsg1YC8GZOaSm7wv8U/T2RkQLRYjh0Rn0LzBJ46eBC9MgwSEjqUmQ3/giw0GpetjJv
         nUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946602; x=1739551402;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuBOiK9OZrpx0geLLAZI80768+DEmJENxcmo5AreaGY=;
        b=llf8/my3//DaLzzsM3/7uJ+FJyPmYAbp0Bo2j226ZcBDpFINM6p371542qJlB6DBZk
         /GBMziC3Jk71Gl6TxaRpOJRcOyPguPKA2FHZYJFX0FbXDR4vOCwrEb5Z51u60uot5tL3
         0pDq0ZFkIimOcdmKZq2AyEwT2rbkdLSmwo0glqaA7suK6LedSlDFe0QUiwZbZqW8kFfY
         Qy7V6vcES+Y5M3sclwepNc87Z2fQoets6YB5g80NN62yYLVptbjPDZOnVC1D/zt3+8iL
         bkyK89RtaTkEi0KPnROVZCxHUxhb/4kBoT2FdcErPy0mMIncrQmw5WBSECA3kficJJjW
         SHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYN9yAqv5YHAB7tEbfC1gBP3LDy4O/bhOraQX9b2tnlezzk0hEMkao16wrhhwdBlsai0reutZXnReMTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkcHsrROBe8t8RFt/UxMnVB1E1IOtVnSknZ5hsnnc7kBJ0I294
	PhTfZHnNuKmGR97M2olIG0GsblHTKrG6CcOdW0tQSKDrxlZLzvafVaWXJy75kAc=
X-Gm-Gg: ASbGnctKOAmemthTgLtSl7SKJcXOBj06m7LuFfeER1eM4mqh6PIsDXZGpBjOB4vdC7U
	r9HiVsgSfmbWUY7YkVgMhoL725MxOkt0s6fRUXUjHuwBcF4ElwL4M4mhrF5pH94HfHAF/RiiXF1
	vSzVCtI++8sBOXfPd7xUnnoski67lzGb/6Jkekuf8Rlsaqmwfm1P34mBySToFkCJhi6biCEyQQ7
	VyniS0N+rIqXPAZEd8CN8KD+2vprOn3LA869kFoHrxbMHJjGfnQP0TTmtkWLvvNo7qU+DcCU6oU
	+Tc1q/drVMKrOdPWHmAjKicTSWcMGXXmazFDLA==
X-Google-Smtp-Source: AGHT+IHq7KQoZQ2RqVLVRntXbha/7fVYoAkdQDTnXrJkcofGGnkTfQN/5R+GY2nVMsv0IkflnQdfVA==
X-Received: by 2002:a5d:64e5:0:b0:38d:b2bd:aef with SMTP id ffacd0b85a97d-38dc935ef12mr2706898f8f.41.1738946601233;
        Fri, 07 Feb 2025 08:43:21 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd093e1ffsm612847f8f.100.2025.02.07.08.43.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:43:20 -0800 (PST)
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
Subject: Amlogic ASoC vs. VDEC deadlock bug or interaction
Message-Id: <A97451C4-BA1A-4A5D-9766-BE4915E8C5E5@gmail.com>
Date: Fri, 7 Feb 2025 20:43:08 +0400
To: linux-amlogic@lists.infradead.org,
 linux-sound@vger.kernel.org
X-Mailer: Apple Mail (2.3826.200.121)

Hello folks,

I=E2=80=99ve unearthed a bug, and I need help with further investigation =
:)

Here=E2=80=99s the description:

Amlogic G12A/G12B/SM1 boards experience a board deadlock when playing =
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

In the last week someone suggested enabling =E2=80=9Cslab_debug=3DFZ=E2=80=
=9D to see if that would generate any new clues. It has (the Z option =
triggers the issue, the F does not) but not in vdec code. See below:

[ 2.789071] Unable to handle kernel paging request at virtual address =
003c021d57237dd2
[ 2.793032] Mem abort info:
[ 2.795798] ESR =3D 0x0000000096000004
[ 2.799521] EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[ 2.804808] SET =3D 0, FnV =3D 0
[ 2.807840] EA =3D 0, S1PTW =3D 0
[ 2.810961] FSC =3D 0x04: level 0 translation fault
[ 2.815814] Data abort info:
[ 2.818673] ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
[ 2.824142] CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[ 2.829160] GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[ 2.834448] [003c021d57237dd2] address between user and kernel address =
ranges
[ 2.841556] Internal error: Oops: 0000000096000004 [#1] SMP
[ 2.847098] Modules linked in:
[ 2.850133] CPU: 4 UID: 0 PID: 11 Comm: kworker/u24:0 Not tainted 6.13.1 =
#1
[ 2.857063] Hardware name: Hardkernel ODROID-N2Plus (DT)
[ 2.862352] Workqueue: events_unbound deferred_probe_work_func
[ 2.868157] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
[ 2.875090] pc : snd_soc_compensate_channel_connection_map+0xa4/0x1d4
[ 2.881503] lr : snd_soc_bind_card+0x2e4/0xb4c
[ 2.885923] sp : ffff80008008b9f0
[ 2.889217] x29: ffff80008008b9f0 x28: ffff800081b0c970 x27: =
ffff000007521200
[ 2.896323] x26: 0000000000000007 x25: ffff000007521088 x24: =
0000000000000118
[ 2.903430] x23: ffff0000082bd5f0 x22: ffff80008125d130 x21: =
ffff000007521088
[ 2.910536] x20: ffff800081b4ca10 x19: 0000000000000000 x18: =
0000000000000001
[ 2.917643] x17: 0000000000000068 x16: 00000000000000c0 x15: =
0000000000000002
[ 2.924750] x14: 0000000000000000 x13: 00000000000e4ce3 x12: =
0000000000000000
[ 2.931857] x11: 0000000000000006 x10: 0000000000000000 x9 : =
0000000000000008
[ 2.938963] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : =
0000000000000001
[ 2.946070] x5 : 413c021d57237dd2 x4 : 0000000000000001 x3 : =
413c021d57237dd2
[ 2.953177] x2 : 0000000000000000 x1 : 413c021d57237dd2 x0 : =
0000000000000000
[ 2.960284] Call trace:
[ 2.962710] snd_soc_compensate_channel_connection_map+0xa4/0x1d4 (P)
[ 2.969124] snd_soc_bind_card+0x2e4/0xb4c
[ 2.973197] snd_soc_register_card+0xec/0x100
[ 2.977530] devm_snd_soc_register_card+0x48/0xa0
[ 2.982210] meson_card_probe+0x214/0x290
[ 2.986197] platform_probe+0x64/0xcc
[ 2.989837] really_probe+0xbc/0x388
[ 2.993390] __driver_probe_device+0x78/0x144
[ 2.997723] driver_probe_device+0x38/0x118
[ 3.001883] __device_attach_driver+0xb0/0x144
[ 3.006303] bus_for_each_drv+0x80/0xe0
[ 3.009940] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[ 3.010116] __device_attach+0x9c/0x1b4
[ 3.020430] device_initial_probe+0x10/0x20
[ 3.024590] bus_probe_device+0xa8/0xb8
[ 3.028403] deferred_probe_work_func+0xa4/0xf0
[ 3.032910] process_one_work+0x140/0x300
[ 3.036897] worker_thread+0x2a0/0x4d4
[ 3.040623] kthread+0xdc/0xe0
[ 3.043657] ret_from_fork+0x10/0x20
[ 3.047212] Code: b0003616 91046294 9104c2d6 1400000d (b86068a7)=20
[ 3.053278] ---[ end trace 0000000000000000 ]---

Boot log (until deadlock) is here: https://pastebin.com/raw/KQmXMaNH

If I disable the sound node in the board device-tree to prevent snd_soc =
being probed the kernel boots fine. Interestingly I can now =E2=80=98play=E2=
=80=99 HEVC 10-bit media; Kodi fails to show anything on-screen due to =
ffmpeg not finding a valid V4L2 capture format, but it is otherwise =
trying to play the media file and I can press =E2=80=99stop=E2=80=99 to =
exit playback and all is fine, no deadlock. If I boot without the =
slab_debug options (and the sound node restored) sound works well =
without any known issues. There is clearly an interaction between =
snd_soc and vdec.

The patches that add HEVC codec to the vdec driver are a mix of =
unfinished work from 2019, and work to add 10-bit support in 2022. =
I=E2=80=99ve tested with the 10-bit work and all ASoC patches in my tree =
reverted (a couple of minor backports and a hack for channel mapping) =
and there=E2=80=99s no change. I=E2=80=99ve built a 6.12 kernel and the =
issue exists there - I suspect the problem dates back to 2019/20 when =
the original vdec work was being done.=20

I will attempt to built a much older 5.x kernel to establish a bisect =
boundary, but our embedded style distro packaging and the scale of some =
of the patches will make a proper bisect challenging. To do much more =
I=E2=80=99ll need some guidance as I don=E2=80=99t have the c or kernel =
architecture knowledge to properly debug.

What ideas do you have? - What=E2=80=99s next?

Christian

