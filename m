Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793617097;
	b=TrauZRGXUVwaiwIF1dFZJUeC3oHV+5tjXhGwgvh3nlMDEAr2hpwSfXrsjVMZuZC0xEHo
	 YVXSIqifjuDuZO0V53E2tEbNV9UlJmu6UZnaIO+7kv2/CNOxDI1JXSyCTewf89Nvel4nV
	 pEnTfXYVSW8DHeqiquhbkUQmKm7+uR9r5Rzhby+V7RtuOAEtCRmDgLOJxYWSX9DdptHJP
	 LddGoubl7ZynPZZhW30rhhfTw8FClyO446RqN8t+4VgyYdt9QfDYcnKhCjihMYflCkhMU
	 8FHkm3TbfWcm3jSxpyKcNHfrfilQelZKxS1PJToQZG8KDDvdipNr+Nu+SdsbRl/VB2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cz4s1ZLYKS63kMii/3tiXba1zemnYBpDzsymQy3UySo=;
	b=yJ7cTPQFznOjk4CeWg+ki0UfXgacexYmSId13aEsZICE4rOsiHSqzciTIzgpwnhdpPka
	 0IaFdqqYSeOB5vfzCem+VGd8zEZ2eyBxGqJBWupfCc1dyXh1KwfSf1XDmBK0Afbs8JUl8
	 ZMUTaiw7w+gz44YML2MKYm99O1c2y4w+ai1ik17l0Oz7SwiekTJ6A65NJ+GotfHy/ovIF
	 SOI7uWjVMnFx6bdIGHjxdVXXPQoSgoWeaSP9HFdrMzQjJ6a6ES0O7Q7fbop7xQhcV/JpN
	 URvh/X4euOUbtdRBSTea+hgofWKETTDZigH85fpXgHkY0jbCAFmkGm3lUwkYanR2KMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LUlSbHN/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E2606A330
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 10:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUlSbHN/
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4970117eec.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 02:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793617096; cv=none;
        d=google.com; s=arc-20260327;
        b=p3n0J6x2qP1LLeRC7FhQzdyFX5sgGMHWi/mxu8UQWq7e1MfuZxsDCQGshPuX1zxmVv
         EMMSkk2K5bF3xsT8fVCiMuC9f1HzfHvuF+hZZknasYRV6+OyJIvB0ovn82PPvpF4PR+F
         uYvuQFHhgykat60gQSJb/jFDmwwscZ0wJ92PYqaZfZJteF2vPNMhnIANWsBg9ptu8MdX
         OdFHftj3I6fpyzI9mEe3becP9/h8IWiyYbyibIUqrtmgaozq0mSSkFp4qxkGkzeM6apJ
         bAWV73oJDFpKESEt4/lcPfSebrcM3zDy6VM1FPPRj3WvGpu56ShWaBO5GTWEj6VBh0P4
         A/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Cz4s1ZLYKS63kMii/3tiXba1zemnYBpDzsymQy3UySo=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=KjkJMYNfgietMIKH5t3R6+ZOfDSuVqhQxkI83iD6Ia2vFBLadMkDg6f9bBwMovvlZ7
         zLiOTi9YDjlOpx7gH8+6amzyT2Z9cQE9FHYzAryJ+Lgo+dQVCzqyzPQcYmx2xprlfjXE
         nxkAnFyCYfoG+cXDRJ4+O/H9Bwx7+G2KoGDuuTXIWGA48lKJBtlATsaqWhF5lqCXmjs+
         gffVqX7PLvdAychh+tdCJAg/8iL4SP9AwvytgtSnhZr9F4xjr487NsFprINAWmspPaHy
         2Nx3St0r+Xu7pkr7ExZ12vCczVB4WeIwdVWu2rEhYGL1hpkmUR7H3vS8p6r9V+M244HC
         mKBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793617096; x=1794221896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz4s1ZLYKS63kMii/3tiXba1zemnYBpDzsymQy3UySo=;
        b=LUlSbHN/O+6cEBoz77FOwiGpsrjGzW4qtGB0rZIxrQE2T09JfmbrZqUPxCjpLxtR4w
         rNNLAWYB+4URRk205JqiyIed5LoEmnCE5v2Yb4ti+7FNEOyuS9dVoIxGv2YwBNIaMJmu
         SdOY9Y7yHcQMYW05kdMlHVCMn56Z4SfJOI9kgYEXq8NlZ4Y7iPWhmdNMUDI+6NMJJ0pA
         YukTVuCV2el6zIyxHWeNzJTHGOvJiJmkaXLTaLR6tBtFKODrc/wAIG260uWRGcjFgEyR
         P6u2AgBqprUeRD+4/GdO+2y/ETyfApD+Z6/ZCJpHQ9ysXbmt7hgKSsh5ZjbNcOFEybsX
         zo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617096; x=1794221896;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz4s1ZLYKS63kMii/3tiXba1zemnYBpDzsymQy3UySo=;
        b=DngjhaS7u47fB3b37njft0Y6X4pEULH8v0jMs4GSPZpuooucFaVKjh6WqE1EhpapZ5
         G8NpUn2Pe9j644KcWbnksLwJl/ghJZlgl2STnEcoY+J0GOWNrs28IN0SUMmfOhRV46GX
         fhy2eEDpRjrX8fsTfk7QYV9Pn8N7qmkFMVfSBfjoalk5ulVTCYtn3D1aFGeY1QFHFOQA
         X27cRle1mIO6D9+j9PgHCgBWdpsmZf0MdenLKvPPJbUQbsbRZ9nHrQkp73+Rj+b+V/P0
         kZGIbmsU5F9EuM6bgBABqcX8QdLtCotoD1QFMkj0UAJsA6yMbZDttNO9ABYwARWmioVR
         2YMA==
X-Gm-Message-State: APuU4Z+u3ux2g9WQ6vgNz8JiovA39MDt7w9CaBEr7PtK9u9glnN+vhsx
	7PjFrB9323OWZqNy/LLNnHqqWV9nP6LnapRH9VJf9Xv9Cyfx2TULHbENO7lTFwDYjvzAVHVirue
	1YrnVSEZDJcYuroBD4BwvnTeS56rwxv52rA==
X-Gm-Gg: AYBFou06fp9PyhgbiOwX20vFyfaLK13DJJbRO5AKQ5LC/zb3bMuc33YPKrv419Rkx4m
	wvnLjjir0OsPUSSDezDsoc1hzJ7xNWlHqiu2Q98s2xT2mR6YSEYQG8FAT3Bkhu2+ZiFuvtYYdlI
	WlaeppSfKGOUG5B0zbvIRckknxhoBCr7BY2VGyofmU/cfezyYx0mNrdw7izMMlHVKyeYBo1JxZJ
	c30RfT/i1GYClK9UpPJ5DHE2dCyhS7IHH8YaaTBCE5rSnSfxxr1gPMtJAvVX15TtPuQ3X+DmaTY
	0Xt5hZ0LrqQSL4VkKEghNGO9TggRyiQV4hrx8GxuHPcFYu5SfLMpmrM7uhJuZvQ0bDtfa8ccQez
	w2wTbvvh3t/G1gfFxGiGKvtbh4nqoCvxPqVJLNiwQNcE8pgCAbxCAPeXw17V3d/GVPVLt
X-Received: by 2002:a05:693c:41d5:20b0:368:d0b6:b231 with SMTP id
 5a478bee46e88-36a4239256emr14328643eec.10.1793617096282; Mon, 02 Nov 2026
 02:58:16 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Bj=C3=B6rn_Lieske?= <tangshode@gmail.com>
Date: Mon, 2 Nov 2026 11:58:05 +0100
X-Gm-Features: AclHuK9TyCHEs4iNCc9HKpBOTAB-NW3W283YpFL_d_rLKDJH0gLOOXY1BtdBlBU
Message-ID: <CANDRFVyCFpxHnCU6xX4CkP9Dtz+5ZtdNDsSB+EV7hBE+hsQ7Ug@mail.gmail.com>
Subject: =?UTF-8?Q?ALSA_hda=3A_AE=2D7_behind_Tsi381_=E2=80=94_intermittent_playba?=
	=?UTF-8?Q?ck_dropout=3B_experimental_MSI4=2FBDL64_findings?=
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linux sound maintainers,

I am reporting an analog playback dropout on one Creative Sound
Blaster AE-7 with the older Tundra/IDT Tsi381 PCIe-to-PCI bridge, and
sharing a reproducible experimental investigation for review.

Hardware:
- Creative CA0132 HDA [1102:0010], subsystem [1102:0081].
- Tsi381 bridge [10e3:8111].
- Host PCI topology in the tested machine: Tsi381 at 07:00.0, Creative
at 08:00.0.
- Kubuntu 26.10, Ubuntu kernel 7.3.0-10-generic, PipeWire 1.6.8,
WirePlumber 0.5.17.

With the stock snd_hda_intel/ca0132 modules the device and analog
stereo output register normally, and sound initially plays, but output
repeatedly goes silent after about 10=E2=80=9330 seconds. A codec/output
reconfiguration can temporarily restore the sound.

We tested a modified snd_hda_intel driver that (1) allocates eight
Tsi381 bridge MSI vectors after CA0132 codec initialization, (2) maps
HDA INTA to the bridge's MSI vector 4 (the fifth allocated vector;
base IRQ94 and audio IRQ98 on one run), and (3) adjusts BDL position
compensation from 32 to 64 frames under a very narrow,
current-host-specific AE-7 guard. We also configured only the AE-7
analog PipeWire output to use IRQ scheduling
(api.alsa.disable-tsched=3Dtrue). The bound HDA stream reported
no_period_wakeup=3D0 and three IOC-bearing BDL descriptors.

On this one machine, a 170-second PipeWire tone test was audible
throughout and produced 34 consecutive IRQ-positive five-second
windows, +4,025 bridge MSI interrupts, HDA sd_complete progression 98
to 3,986, and 2.5=E2=80=933ms LPIB movement consistent with 384 kB/s DMA.
After installing the signed experimental driver, a separate 40-second
playback test passed. I have since listened to music for several hours
without the original dropouts.

I am deliberately NOT proposing the experimental code for upstream
acceptance yet. It contains a host PCI bus-number guard and extensive
diagnostic instrumentation, and we have not isolated the necessity of
each change. Another V75 trial did stall despite IOC being armed, so
intermittency should not be hidden. Reboot, suspend/resume, and other
Tsi381 systems have not yet been tested.

Reproducible Ubuntu 7.3.0-10.10 source diff, evidence and caveats:
https://github.com/Melbar666/ae7-tsi381-msi-linux

Could you advise on the preferred approach for safe matching/ownership
of the Tsi381 bridge MSI conversion from snd_hda_intel, or whether an
existing kernel mechanism addresses this? I would also appreciate
feedback on the minimal test matrix and how best to separate the BDL
position and PipeWire scheduling observations.

This seems distinct from the AE-7/ASMedia ASM1083 boot-probe lockup work.

This investigation and its initial code were AI-assisted (ChatGPT
GPT-6). I understand that a human reviewer must take responsibility
and provide any applicable DCO sign-off when actually submitting a
kernel patch.

Best regards
