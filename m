Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967734;
	b=Wa8UhNmLoVy1gJM6eEEM4wlq6TjlvwPXmGgjpnQpzTi+fQIlEEvi/FZvklTJamSIpdEt
	 0PHyyprDEjR6yiFoc1ilh3gOTX+XWpl45lgX+pPYlRjvAJhBefb9WioJYKSfRhG7LA65P
	 dCyoEoN6D9LecQTgZctxTHVkeUrPV9uqiMRwgE5bwrSIw0AHgQXQeCUPIVricNBFyAoaU
	 WR4/1hJwYYD2Kqha9cEK1DMSPEHG7NdKInPajcW3zfTddNZgYC0Lfx00R5KVu1Y+kmDyj
	 o2b7Cuf/voa9e2YL0ntY32UtdGLEYjFnExghAOjcPLnSEXBuJ3krbkUhFrkWMXYASXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
	b=IzBS9dhizmmQB4vuVLkSkVeF7OMG9KOdoGphDa4LmS/9SfEoWXS7nFdVOJgznX0OQKjU
	 zzOoSQvjm3kV2mh4LzKfGAbZHMdgIUDyUp2s8AhX12l1KshWSIbUGrb2KfQwz0h8NmZ2d
	 CvRTJDJ06zyq8pTCTDuI5CAmMS8Y65mKZzZOF1Nvw7JA/xu6bfRBLCOFoX32d5WfS3+Dv
	 LtU22yNEK7+gK06EbYMEFBluB8t3lzLFYaFSHUXBx95168QBXYgVUbBiN8xNs9OTTJ73V
	 jhmcv8IlHaQt8Epe4P83UwmzgLg2yIfsdPYzNNStT17RYfxzFR9P7+CVmcHmosi3s6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNQzYg7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F30606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F30606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNQzYg7C
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb61185057so3955695e9.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 18:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967732; cv=none;
        d=google.com; s=arc-20260327;
        b=M5VxW5d6MXGz4SS/Ynfo9WlPCqXLOHL4P29qhmK+xWlvRtdlWGRB1GNdJGdsNcDdbY
         T4GgWz2nnpNdLOYB68PjYE2LeNbF5Q4XwGphnLJ0D4iYnfLAajCs0ly2CCWBUyZVctPA
         RcfY0kf4y8ZHYrSqZixn+YD8MTkg3JcLPY6vykjY+uy0RgYC3YAUMVA/wWy0XF+SEei4
         grB4pdtiOyAIPp6yVQ2TmJDNLKgkcKxzOzaL4Fm5EajM6lWAe5InyR6RQJNCQdrPk0oT
         i4dqSJTEZkmp2NSqzWb1VkxnQODDf1JuYEmo+YR8XBWjlco2i4Mhr8XCur97gwXUZmvu
         K3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
        fh=lQiqbUM/aFL1Aak3ECVHzCLutdtZlKXKi3fmll8il3A=;
        b=dWh1u5p6VkDHDB50/hYlWX68KDurI5KWVUM6KxNc6nUoicPWcIlwFF53mCQSyDwjgR
         HANwWTFJ5Tbr84M4stXDjVcbIpKQGdXuNDzFVbcYQo9pGNkRnqVecggx7J/nGwCTfAqi
         npnAyTHMwTUPMQpwbnECk5wf/nV8Nl7QCTcABF4pYecdGQCBGaRNwg9V/89VsCQT5i5C
         KS7+bhmJ+Zehf5fuTU8+hjhfk2BRiQ7ncn57YwyblBASuPJ1lVYRF8XXAM0H/ZKc2LCO
         Q5Du4i5An1GfgRyTIJ4Xri14bB65HwEqhCZvsjcEFd9cPCzRYDtf7Nj5INS6Y2qZjxgV
         KmUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967732; x=1795572532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
        b=gNQzYg7CcWwzdj8W2QfegbnOcstMNOCuflnYT8t0ts05KXj+6aepwlH9E44d3KuJAG
         5CBxH5pde6frZf+yZiof+8zYnufnaL8zUfXFhYsf762EKu+1pGKIwg8tc+kaf/o+cZEP
         JDlIxGPU6aRQejae1tLMqU9+yIzP2Zc5eSu0c/VHnFAcQoQVHj3CLLy4O/uuzfkgflZ6
         GQKn4pyyf2wmeOErOx5z7G7TkXTZo/DOJHmV1YbyI9CFo7F3fhu9+il7vDvcPD1Q7ZqE
         DPBUCfAo1AcAVzPeAOenFsEPFWto/kXZAn/CKFo1kTd4J3JLAK+cHGQUUJycXFabJCfq
         U8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967732; x=1795572532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
        b=I4UaZDvJ/EaumMzp4iWfb//r94fBBcS6n1/7ToF2yczm9t44Qml1VKVmQb3ESQ0tIP
         LSlhVD30oRDM5JMnXHs9wEP14FrAyX7qi0O/1OaqNaO6SpDuKzWeonflAbJHlbRb6Xqw
         njd8xTNpxJQ48UAcS6f8E3hI9dgLtk3Mo3a8d6DXjgEmmpCyC9Ot/w73CHmvKZvWo0vd
         vt4sWRSe66OS8Oadj+at3QNyJC14lRXwWPOkeh0ECmXbzznxXgKnfjBM6KWy6sXzYBFf
         x0l6X/AuF6nixfnEbkGOSuEyjxTlfdTjZqLbgmZPXDWPZu2kGLQrnivEjTeFoZU6cAdu
         pIKg==
X-Gm-Message-State: APuU4Z8evzZXcS3PYIUWuhtEdI8U+sr6jzWqiBEfmKe391LQ3hWwDuWF
	h/LCyTRZ68aWKw4vcqng5W4XZtMsPA0WvQ7WO6LaREEzE8NqtumtMDBL6pVamy/qE/XjSK+sgS6
	QoADKPevkIXA21/H5U92fA2q3YPfIKFMR+wyhWmeFuQ==
X-Gm-Gg: AYBFou2hxnQIL/gyUFT0t0y2ZWLeHAsaSjpgtosKnmwMD97+BbRnRgx6D0KMvEWDDg7
	jmuOmS3S+yu7RGDG1OVvkC4BV6H4+cbC6oIgdIbnJ/YVJzAUprpVDA+pLHrKhNKXC7H2O5Uo1ld
	aR2xb3k8gd7VU6Egn2ebigS76Ol6QkzTmBwj0OM/D/wWZSIWcwN3K8KzW0W+qGv9xqiwQO/f6uV
	6Ym/dxzwyJQLISp97Cev4wkwsc+0Hll7YnLE0KuQPZMnXZP3eXQPAVStG68Y3S894ayuIIV0MBR
	SjAabwYUYSCiOGcUqoSraZfNjhihYqpan9KulqbK6EraXW7+slyQOQL/MBvOgMAw/UPsnj+hGcY
	LiMtB0pcuuYBrqK0ari98/Xh0jd3aKknMLKZ/UA==
X-Received: by 2002:a05:600c:1f82:b0:4bb:6848:d433 with SMTP id
 5b1f17b1804b1-4bb7da4f53fmr18806175e9.26.1794967731860; Tue, 17 Nov 2026
 18:08:51 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com>
 <87v75vzuvb.wl-tiwai@suse.de>
In-Reply-To: <87v75vzuvb.wl-tiwai@suse.de>
From: william <assassinshalo29@gmail.com>
Date: Tue, 17 Nov 2026 21:08:41 -0500
X-Gm-Features: Aa3M54pqBgpwRf3ktpoGGAdXdfWopucfTaGk3UTSe5A5MIyEtyQPBujmBvw12hs
Message-ID: <CAFjFWEgAJWe1q-3U2=5x4Tu0DcGcAano7nownXjg-uF9FADbRQ@mail.gmail.com>
Subject: Re: [REGRESSION] ALSA: hda/realtek: no speaker sound on Lenovo Legion
 16IRX9H since f2293e7b2ddd (PCI SSID 17aa:3842 shared with ThinkBook X G2 IAH)
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, evgeny@devduty.com, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks for the quick patch.

To answer your question: I have not built a kernel with this patch, so I ca=
nnot
say I tested it. What I did was boot 7.3.4 with snd_hda_intel.model=3D17aa:=
38cd,
which selects the same ALC287_FIXUP_TAS2781_I2C fixup through the 17aa:38cd
entry. The log then shows "picked fixup for alias SSID 17aa:38cd" and
"bound i2c-TIAS2781:00", and the speakers work. The effect is the same, but=
 it
is a different code path, so it is not a Tested-by for the patch.

About the Y790 entry: on this Legion 16IRX9H, /proc/asound/card*/codec#0
reports "Subsystem Id: 0x17aa38cd", so the codec SSID is the same one used =
by
the existing "Y790 VECO DUAL" entry. On 7.2.10 the speakers worked without =
any
parameter.

One clarification on my first message: the last paragraph about silence aft=
er
suspend is a separate issue, unrelated to this regression and to this patch=
.
Please ignore it here.

I would prefer not to be credited.
Please leave the Reported-by tag out of the commit.

Thanks,
William

El mar, 17 nov 2026 a la(s) 4:10=E2=80=AFa.m., Takashi Iwai (tiwai@suse.de)=
 escribi=C3=B3:
>
> On Mon, 16 Nov 2026 02:24:00 +0100,
> william wrote:
> >
> > Hi,
> > Commit f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps o=
n Lenovo
> > ThinkBook X G2 IAH", Cc: stable) matches the laptop by PCI SSID
> > 17aa:3842, on the
> > assumption that this SSID had no quirk entry. The Lenovo Legion 16IRX9H=
 (83DE)
> > has the same PCI SSID, so its internal speakers are silent on kernels t=
hat carry
> > this commit. Headphones work.
> > Hardware
> > Lenovo Legion 16IRX9H, product 83DE, BIOS N2CN32WW
> > Codec: Realtek ALC287, codec SSID 17aa:38cd, PCI SSID 17aa:3842
> > Amplifier: ACPI TIAS2781:00 (i2c-TIAS2781:00 on i2c_designware.2),
> > driver snd_hda_scodec_tas2781_i2c
> > Kernels
> > Works: 7.2.10-200.nobara.fc44, 7.1.6-1-cachyos (live ISO)
> > Fails: 7.3.4-201.nobara.fc44, 7.3.4-1-cachyos
> > The 3842 entry is absent from v7.2 and v7.3, present in v7.3.4, and sti=
ll
> > present in v7.4-rc1 and master as of 2026-11-15 (checked via the GitHub=
 mirror).
> > Analysis
> > snd_hda_pick_fixup() walks the table and matches PCI-SSID entries befor=
e the
> > codec-SSID fallback. Before the commit, 17aa:3842 had no entry, so this=
 machine
> > fell through to the existing codec-SSID entry
> > SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2=
C),
> > which works. With the commit, the 3842 entry wins and chains to
> > cs35l41_fixup_i2c_four(), so the codec master waits for four CS35L41 co=
mponents
> > that do not exist on this machine.
> > Evidence on 7.3.4
> > dmesg: "ALC287: picked fixup for PCI SSID 17aa:3842"; no "bound i2c-TIA=
S2781:00"
> > line (on 7.2.10 that line is present).
> > /sys/kernel/debug/device_component/hdaudioC0D0: master "not bound",
> > four entries "(unknown) not registered".
> > With dyndbg, after "echo 1 > /sys/class/sound/hwC0D0/reconfig":
> > hdaudioC0D0: trying to bring up adev
> > hdaudioC0D0: Looking for component 0
> > hdaudioC0D0: master has incomplete components
> > After unbinding/binding i2c-TIAS2781:00, tas2781-hda logs "adding compo=
nent"
> > but the master still reports incomplete components.
> > Workaround confirmed
> > Booting with snd_hda_intel.model=3D17aa:38cd (alias SSID, handled first=
 by the
> > picker) gives:
> > ALC287: picked fixup for alias SSID 17aa:38cd
> > bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781=
_i2c])
> > and the speakers work.
> > Possible direction
> > Since both laptops share the PCI SSID, the ThinkBook entry cannot be fi=
xed by
> > PCI SSID alone. One option is a codec-SSID entry for this machine place=
d before
> > the 0x3842 line, e.g.
> > HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Legion 16IRX9H / Y790 VECO DUAL",
> > ALC287_FIXUP_TAS2781_I2C),
> > I have not compiled or tested a patch, only the model=3D alias above. I=
 am happy
> > to test patches on this hardware.
> > Separate observation
> > After the workaround, speakers still stopped after some idle time. It w=
ent away
> > with snd_hda_intel power_save=3D0 power_save_controller=3DN and keeping
> > i2c-TIAS2781:00 power/control at "on". I applied both at once, so I do =
not know
> > which is required. This looks unrelated to the regression above.
> >
> > I'd really appreciate it if the issue is fixed, as I'm now having the
> > same problem when the laptop is turned on after being suspended for a
> > while, and I haven't been able to solve it.
>
> Thanks for the report.  Could you verify whether the patch below is
> what you've tested?  I left Y790 entry as is because it's not 100%
> sure whether it has also the same codec SSID.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> Subject: [PATCH] ALSA: hda/realtek: Fix regression on Lenovo Legion 16IRX=
9H
>
> Lenovo Legion 16IRX9H has the very same PCI SSID (17aa:3842) as the
> recently added quirk for Lenovo Thinkpad X G2 IAH, but it needs a
> different qurik.  Although the quirk for Legion 16IRX9H is present,
> it's not applied because the PCI SSID 17aa:3842 matches at first and
> the new quirk for Thinkpad X G2 is taken instead.
>
> As a workaround, put the codec SSID matching (17aa:38cd) for Legion
> before the conflicting PCI SSID quirk entry.
>
> Fixes: f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on =
Lenovo ThinkBook X G2 IAH")
> Cc: <stable@vger.kernel.org>
> Reported-by: william <assassinshalo29@gmail.com>
> Closes: https://lore.kernel.org/CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah=
2DqY-GCD1w@mail.gmail.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/hda/codecs/realtek/alc269.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 2c541c68ff5b..1d609584e778 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -8542,6 +8542,8 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>         SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPA=
D_S740_COEF),
>         SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", AL=
C287_FIXUP_YOGA7_14ITL_SPEAKERS),
>         SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_=
LEGION_Y9000X_SPEAKERS),
> +       /* Legion 16IRX9H shares PCI SSID 17aa:3842 with Thinkpad X G2 be=
low */
> +       HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Lenovo Legion 16IRX9H", ALC287_F=
IXUP_TAS2781_I2C),
>         SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_=
MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
>         /* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book=
 9i;
>          * use codec SSID to distinguish them
> --
> 2.53.0
>
