Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050621;
	b=IL1tk5fdWp3KeEiJ+K8/GL7sbtA/mLjQJd4XhBLCHjaNohL64uPy+Aew6/2cCuuI+kSN
	 dtxQpbcGVy1Ey/uXLG0UPpjaF2WMdwdbC68OXfgCZSrm928V9hH+q8mDlYOnMfAn5BV1p
	 dcxI58wGTA0/QaflPPVLKX6K/fdisz+Edm5r9+ORngiTZ0RRUohDIOU1OhoqD/1jWAhkw
	 LC/xr0VAwDR2WCFBIQwGFqxZYbxdF2NHx23Z9YbR6KGhw5gohxGgALvQrRhVAfHI13HN1
	 /kaI7ELV89f5gl9/9eaSbThojobuLuA1ng2GsCxo5IZCnkitnC6nyuRyZC8EQM2//ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+oJdKvf5ACTFVjDlEtyhUTinT8osTOQujRk8hU+DRPU=;
	b=pLnkgGKGhaXOJF3j1DBNmBCCUgJ0qCo+g5o5Xw3O5j9EtkxedZi79wfXg5VLa4ttx68D
	 moMfbdrcLYc2Rg04dnETUA3HaYvLi7/aND+nY8181V0rNPWIyc1/RTs9sottMg40lDhKi
	 SZBlXNKkEKTSQLSpt02kc/iI4AuEbv0FVkGG5NJisvK6B96e/aCFq2xqscGlNlxlovbFc
	 TZIwOhKlR6q1fBchnk/BKrL8A37eE/QdKzHvEW6lKc2gcQ8ppEWvWET59HI1KhmqXs3B4
	 ZWObTfQs1P0BxbOSa6/mGHTszXEtWwKE7LebNsosNnZgCFd4OF8oN7fo4J7jVakL8Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrB4CP0b;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A0606A32F
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0A0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrB4CP0b
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4918c2d727fso762592f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050619; x=1794655419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+oJdKvf5ACTFVjDlEtyhUTinT8osTOQujRk8hU+DRPU=;
        b=jrB4CP0bQ+koHaEjv8DWJ3WdmGF/+AKcrvBl0Q+FuPlbjKm9DyXPfJOoFs9mZzS4Rg
         +jG2kU2MrHVVlUbBwCtny5fvHHqYQaPPYhzxw5BKiTqpplykYZLrEL0aYRkYvUPHiuyR
         FKIF6C9JdV0mRBgRKuFSR3BvNeTJzBA5yP95XotKtYxEMMO0yT4MKF1eqE5I38qki5mj
         XfTsVnxngCrj0PY45KGrydCTX6osmEea67P8Mm//njfZGYuZ3wfAGty5a3DXsoWxy4z1
         RYkL8apbAHgMW8qOXZ5rNsqx393JytNZqooaMQEBU3u+52eRrsPyURElWPwOAP0RPZwh
         gFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050619; x=1794655419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+oJdKvf5ACTFVjDlEtyhUTinT8osTOQujRk8hU+DRPU=;
        b=PDB51uFrlu/DNzAVGWqZpPuct6Y3MnmWEkcl4diiy0TqejBc+SDvFfXbMjupv7PAeD
         zQdA+dy2SCrb43ULnEip2FG7j9FjjhNfR/Ag1zfqViViXhQcR/T8rVl9cyvjxNatsaj1
         glfXTfD70NANTxvtcbomtCaxsVNv9lKtH9or2xG8JYWRA4WT1Y0VAPDqkVjt+HJ66lih
         bkZ2jsd3zF4AxuVDT/ES4GibMRy1FpTO/0Phn3BN6CtGZmKJCwhsid/WqecAQlHoytYB
         NqmiTnDJZJfa240EmB0d7zsosCMb+3MHbOt1fJ6IBN6tiypyRZx0CgUUMbC7GZlo0ZhU
         a0nQ==
X-Forwarded-Encrypted: i=1; AL+hErFpitj11cYCONoajc+VACgfUfzFk8YkTNvVaBfnU7qJ7LFKYes9Y1QdX36odXMX9hC1qrwKAir8+urAnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FM13ePciSNsSJcgxFAg9bh6H/sNWiLGI4h7DdQBCvt213Fv3o
	QdWt57R9M0t+Fw3V9VMz4hxbWKigFjShxgNDDqgDn+0oOJiivcxGpQfP
X-Gm-Gg: AYBFou0YPtriQmyGEpqQRNrrpFEhdN9vMsTJSgwdbxkI3JxdXlnOahrrbDD8+eP73C7
	S/tLqXBIAf1oqn4zVwrttENdnQIzzGB38tgK4a/JEPjd//3P7wPlmZ0fPEoNfCo8ycMWqtpMJtK
	SqFp3lMDG0n+4dTS3COjkKJqfUn0pH0Fkl1QjD2Zk7MbhnuRi4syh32SbJpfyTKQ3K1/LjhGfjm
	zfAOIR92sJRjmi4BOegY78mCYPxJThtDRs7Bt0eNXsz8liIN3PyqXIqcoxRqCo/MnUyGVEsGVjV
	EGRYl6G/0N/GFsWVwoQc4DYeWjUxURXG38zGBk5e0uwmM1AOP+PBrgFx4aAiCuZRCvEPVbk+ojW
	VhscAiD8SEHGK0De+/HmIqgl+8VvADw+a7OfafDB7rqJllNj2oBDkHvk4uDZB/K8sc+YHfgTeV2
	rxcifAyQ8qtf8Qo9xxAOy21HuwlRuqxm/Sx/oZ57HiqPGAGuiWbNSTMRW4G7MXkOCcCHMoQItcu
	JYfPRnXCnA7DdM7Va2hYYT1OdojnfJQT4eujDZkd+Wt6k3YvoA9VG7h//AzJO1kfwxivcqLJuWs
	iBo87QE/HRlcz3A6QkAlfCZIHZi32+3ZvCtxZ90=
X-Received: by 2002:a05:6000:26c1:b0:48e:10a7:438 with SMTP id ffacd0b85a97d-49275a2721amr10861159f8f.36.1794050618996;
        Sat, 07 Nov 2026 03:23:38 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6385fsm8647480f8f.16.2026.11.07.03.23.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 07 Nov 2026 03:23:38 -0800 (PST)
Date: Sat, 7 Nov 2026 12:23:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Hoshino Lina <lina@lina.yt>, Christoph Cheaure <cheaure@gmail.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c): corrupted
 playback on ~20% of stream starts, fixed by quirk_flags 0x100010
Message-ID: <20261107122335.182f01c2.michal.pecio@gmail.com>
In-Reply-To: <878q35yp6i.wl-tiwai@suse.de>
References: <CAJr_eQ4QhhZTqjVRmRWLBMMVhqmx-dS_yC9TiozB8qS-ZCnDTg@mail.gmail.com>
	<fd618d1b-d4b2-44cc-b08d-7e664938e771@lina.yt>
	<878q35yp6i.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Nov 2026 10:19:01 +0100, Takashi Iwai wrote:
> On Sat, 07 Nov 2026 04:53:37 +0100,
> Hoshino Lina wrote:
> >=20
> > Hi,
> >=20
> > On 2026/11/07 8:26, Christoph Cheaure wrote: =20
> > > Subject: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c):
> > > corrupted playback on ~20% of stream starts, fixed by quirk_flags
> > > 0x100010
> > >=20
> > > Hi,
> > >=20
> > > I'm seeing intermittently corrupted playback on an RME Digiface
> > > USB (2a39:3f8c) with the in-kernel support added in 6.12, and
> > > found a quirk flag combination that fixes it for me.
> > >=20
> > > Symptom
> > > -------
> > > On roughly 1 in 5 stream starts, the playback output is corrupted:
> > > any non-zero signal comes out heavily distorted / with clicks, on
> > > all outputs, including the analog phones output (channels 33/34).
> > > Digital silence stays silent, which made the problem hard to
> > > spot. The bad state persists for the whole time the PCM is open;
> > > after closing and reopening, the next start is usually clean. =20
> >=20
> > What you are hearing is what happens when playback falls behind by
> > one USB frame on the Digiface. This happens mainly due to a bug in
> > the xHCI kernel driver related to isochronous scheduling when IRQ
> > latency spikes occur (together with the Digiface handling playback
> > underruns rather poorly). I no longer contribute to the kernel
> > directly for personal reasons, so I filed it here on Fedora, but it
> > was never triaged/forwarded:
> >=20
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2451673

Hi,

These are known problems and things should be improved in 7.3.

Particularly, if the HC is "hci version 0x110" or newer (see dmesg),
scheduling is exact in almost all cases.

As for dumping kernel patch suggestions on distro bugtrackers, you
should have known better what to expect...

> And, yes, if the USB-audio quirk option improves, it's worth to take
> it as default.  But, it'd be better to be investigated the root cause
> at first, of course.

It seems to be a common quirk of snd-usb-audio that duplex needs a few
xruns and restarts to begin running smoothly, not sure why. I guess
FORCE_IFACE_RESET was helping with that by clearing any xhci-hcd state.
It shouldn't be necessary anymore, we tried to make this case work.

The driver also has other potential issue: it relies solely on luck
for synchronization between multiple endpoints and doesn't even look
at urb->start_frame to check if sync has been achieved.

Regards,
Michal
=20
> > > Results (bad starts / total)
> > > ----------------------------
> > > - default, external clock: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02 / 30
> > > - default, internal clock: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A07 / 30
> > > - lowlatency=3D0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no improvement
> > > - keyboard/mouse unplugged (same xHCI): =C2=A0 =C2=A0 no improvement
> > > - quirk_flags=3D0x100000 (FORCE_IFACE_RESET): 7 / 110 (~6%)
> > > - quirk_flags=3D0x100010
> > >  =C2=A0 (FORCE_IFACE_RESET | PLAYBACK_FIRST): =C2=A0 =C2=A0 0 / 90
