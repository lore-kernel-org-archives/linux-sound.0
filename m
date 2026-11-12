Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496797;
	b=M3r9E4dh1YPxxrvbzNTnWYh0H06uhXAA0fk/RUQJkpVrpYs2aw4hjE8971ca8dDNKVzO
	 ygxx5p2zi2efHDTxPMXjOP4z78imMEp4DeNZGMmP6HK3m3QemIx6euDtLyuGbdY0cvRrz
	 PsHIHpW3Ijr8NMNEOs+oxavgDVIbH3zIApEktfW2lPXXvMfNxN+1VykvEXIK6EoXFHeWT
	 k8nBMGd+AT1M9zFdg6MS62m+u6IctTheAM/MbGr2KDIF2251djSa69PYqojV1U7mpQN2Z
	 8e5Lfvl9IOlnYZ/PdD1DKxk9K37D9kwFZktWNxA4t/RZIXgETBHnfsclzXNDYQh/LRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
	b=R+plt7wyx3e1qyqTsG2RU46Ut+ZIFO6JDd1M4RQ2Bz2GaHa5NjiSQREtGr7QDHxn2nqw
	 Fs4/TdVuHpCLGM6jauUfklIOuk1BPoXjE/SL+lkOsRzkEPdp1rW+rRJYf7FHlyz3fdSyA
	 RDqAOFfhn5zenw6I+wq0yPVaHBe/meqLYSbRgYZ/qgmJfbat3boP2/SH7xn1QEcEvtfwI
	 Djn9Pr25GDI6gh8bPR7qzEpy9mrdzy9t73POKlTcWj6NBI7vfvmzbqWolTmWYGbm7ykJK
	 pScEas4gJmXSbBweTbFr79uWwe3ZkHdpkv+0xRqL/E3/L/H0nPKRNI2UXFt3R8vBlYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7dcQg+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B5360A3837
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 15:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B5360A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7dcQg+J
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso47239345e9.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 07:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496796; cv=none;
        d=google.com; s=arc-20260327;
        b=VKBKJ3Amj5wzV5kVxLTObq6qFx6jnbAbGgYN0y0741Kow4CnvU/fNfq2p/5n3YKMb+
         fL8RoViV6sijQXjaDyYWvTfC4J+1yDODmZqv8iiQKc3+IEZvIIihFzijuewpSmfEsLEI
         CDMj6e/lVkWzlBZ0b50xKQ2BIp5EcnIjyFFkvR00+HTxGKTp/szOFozjtyzyBEqzSHzs
         otIxuLOUt++xQ/aHHoXq8dRMPg4nGys3F8UBgkDph5J/muJYCLAFJEIzHwZhq/pdVZTu
         wmf6ov+jvRGu2ao1DQaGHwUWtXHLWvRRXq1SGBbYaDgoF7fwVR3uh2wei6B7MHdPzTJ0
         l69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        fh=JQM0LNF88pSK24H4tG7r+PY586kxHPfQg/yLLZCfiOs=;
        b=sFgw8OP4pt8cRi+SE+r4QuukPQzkMDmkU6kk5s7Eg0lSPztfDzn1zAiSvHWbGCRf3O
         ELq/zi7kWDNBNqkBWIGM8C/77WvlMaZ1JTNYKTi4eBb0kYN3xVZH2omCIIJ6cGnkC3ly
         YCVHOx5Ylu3nI9e9YCxUGgPJHDB66dv3ecRjUuH09hawoj9LTR352eQYJZA/NCCnZt0T
         eY0zfBGTZNMIHoBbBzbbXf14JngyioOuReGUYgSP6doXIIbQ/GjdYewc+O5O1Jo7Bwnx
         8+7RoGr50jvg+p9XtHi2lloMUqA8W39QY5nblmdIIG8sDgRl8oZBSLKhtz9+MneZgBxs
         pG/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496796; x=1795101596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        b=H7dcQg+JeXmIUtaBoHOBZEkaRVl7MEvQtQTBpyHbMB2ZB3FXidPoh0FB/5NyyB1soA
         7ZSCH98M5G6uv4ZAw1wS+1I4Dlsu0+fyL3KpPyW2aGFlpxT3AONO3MrJRpN9BcHNBp9F
         7a2CZebhKKJ53YLYTHD6GgN/Lav0R9quZPccjsWUOtDbgO0CGyNDDEHIjhm6Z1ZF9vRj
         rO2SWeDet42ODC9K78dzBKa6reZAebmBvxhzHdKr1wOggPAgohTNm10Gn09V+imLQ5RK
         RvwR+31dnwnoQWkHnqnFvpnPIiKEVimrCk3ybSxZvj16i4HCvob+y3LYB3DGJiCWw+UE
         JJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496796; x=1795101596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        b=PwZyfvH/KvADPdEtPFNkjfxOh1pXKCEImZ/5AIdt/fg9SzVKMwEH4eUAgKpiNfoTMm
         vuBvlDkeubL2vEDSJC0ThnSI5K8aoKthX4ayBwBI/YnJk/klroLBpdpEv+KvdnTRX/yP
         Evyi9msqyAKTZI9S9ctlTp6mVJv+d1+2hahusP2nc0oMedVVeL7B42oqUv3YMPhMuE8h
         tXtAwbpmoC2dSLufN79SnIyy1nT2u38j33Tn+pb4NThWzcdGtiZiwKzc000rzUnQxb/j
         edvVk49RU5eurUOgncnxwGC5vH30y1/FruRqAjg2ieoHlp+6oOCrfMicQZi0NojoBt04
         E+5Q==
X-Forwarded-Encrypted: i=1; AL+hErHqmsUQO9yn01H+ffShLAqJoxckaNWgLWUqjoHxmB+urr6MBs2xQUjjipqAqYJLLxsmNthZCqeRn8m35A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9L50R8kkFt6mUQEP1J5uJ67QzpM96BaaMNm93uHNY09kE7Aa3p
	Xv5bWzUG2khsTGw1z6aYxwCuTMDBSYeOhkieH6LJuJkszlq3ZeaGkWQMjdtaHZ3R3j7PhPpnirg
	Gze4iv999HTyJdzhmVA6mXMOxt5qqsbk=
X-Gm-Gg: AYBFou1RHaj/XMkjjph1x4pXaGJmWzruMlG0WirWZdYwfZlZ5s5w/DYeEIPNYi0bQto
	I2xI0j0DnJWfydQodBhNIT2kLsYS1tAhDxmFhSFhxb095ej/eGKIWtQdR5V/c95Q8tThElrEMcY
	BKAm96FIiH+Ks+mAn9kIW+ozxlJmVYDTHwH/Zz0kguOr8a29YFIarUtdLC7QOMJk3jwuKemPC1E
	Iny0un2xEBwMBloE8nsQzQVVAVtgo5Yw0eFubHA6GS1JSabYkDAmKdnvczE4PXEidMmlSFHMhP5
	nZFyDOMQFl3ntBqcF9FM89J5ENB7iHHsH2EPatscVHc5/oKzjID03Q4fRSysap7D0YcQ8eYoCXO
	BrqoFkktvCkmbg6paCvawgDhJrMjyvUMS8Kzkmw==
X-Received: by 2002:a05:600c:4f84:b0:4a1:e92b:ae4a with SMTP id
 5b1f17b1804b1-4ba093b9a3cmr106590855e9.21.1794496795435; Thu, 12 Nov 2026
 07:19:55 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce@gmail.com>
 <7cd4c010f13ee085e3aa4396705b6b06ed58f7e1.camel@irl.hu> <504167422048bb8197a1ca3fac079cec9dea1ae7.camel@irl.hu>
 <CAN6p6iiFz-JXOt9iFUPa3x4Aqu2c96=ERf0AMZ6pPVWspd=jLw@mail.gmail.com>
In-Reply-To: <CAN6p6iiFz-JXOt9iFUPa3x4Aqu2c96=ERf0AMZ6pPVWspd=jLw@mail.gmail.com>
From: Mohamed Yassine JEBABLI <med.jebabli@gmail.com>
Date: Thu, 12 Nov 2026 16:19:43 +0100
X-Gm-Features: AclHuK-U1bKsRdqloiglORwVbHTYD3ELvn-XYZ_Olj9JVapFRVasjDHISUDa0vE
Message-ID: <CAN6p6ihogRNOPM4siK=QykMk_XDD_Essf04OW8d5Q52vORNA4A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/tas2781: Only accept CRC-less V1 data if all
 entries are valid
To: Gergo Koteles <soyer@irl.hu>
Cc: regressions@lists.linux.dev, 
	Cristian Castellano <cristian.castellano@icloud.com>, stable@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gergo,

Regarding the Q27/Q31/Q58 formats: they are not from any
documentation; I inferred them from the data. Reading the first word
of each entry as Q27 gives a plausible speaker resistance (3.82 ohm on
my Legion Pro 7, 3.64 ohm on Cristian's Yoga Pro 9), and reading the
second word as Q31 gives exactly its reciprocal, within 1e-4, on both
machines. So, for a consistent entry, R0 =C3=97 InvR0 ~=3D 2^27 =C3=97 2^31=
 =3D
2^58.

The V2 dump from the ASUS ROG Xbox Ally X thread (with a valid CRC)
fits the same pattern: r0 =3D 0x3c5f7222 (~7.55 ohm in Q27) and invr0 =3D
0x10f615d5 (~0.1325 in Q31, i.e. 1/7.55).

My guess is Q5.27 and Q1.31, but I have no TI reference to confirm it.

Finally, all testing was done on my own hardware: the original patch
was tested on my Legion Pro 7 16IRX9H, and I reviewed and own the
changes.

Thanks,
Mohamed Yassine JEBABLI


Le jeu. 12 nov. 2026 =C3=A0 16:09, Mohamed Yassine JEBABLI
<med.jebabli@gmail.com> a =C3=A9crit :
>
> Hi Gergo,
>
> Regarding the Q27/Q31/Q58 formats: they are not from any documentation; I=
 inferred them from the data. Reading the first word of each entry as Q27 g=
ives a plausible speaker resistance (3.82 ohm on my Legion Pro 7, 3.64 ohm =
on Cristian's Yoga Pro 9), and reading the second word as Q31 gives exactly=
 its reciprocal, within 1e-4, on both machines. So, for a consistent entry,=
 R0 =C3=97 InvR0 ~=3D 2^27 =C3=97 2^31 =3D 2^58.
>
> The V2 dump from the ASUS ROG Xbox Ally X thread (with a valid CRC) fits =
the same pattern: r0 =3D 0x3c5f7222 (~7.55 ohm in Q27) and invr0 =3D 0x10f6=
15d5 (~0.1325 in Q31, i.e. 1/7.55).
>
> My guess is Q5.27 and Q1.31, but I have no TI reference to confirm it.
>
> Finally, all testing was done on my own hardware: the original patch was =
tested on my Legion Pro 7 16IRX9H, and I reviewed and own the changes.
>
> Thanks,
> Mohamed Yassine JEBABLI
>
>
> Le jeu. 12 nov. 2026, 15:43, Gergo Koteles <soyer@irl.hu> a =C3=A9crit :
>>
>> Hi,
>>
>> On Wed, 2026-11-04 at 16:55 +0100, Gergo Koteles wrote:
>> > Hi Mohamed,
>> >
>> > On Tue, 2026-11-03 at 10:27 +0100, Mohamed Yassine Jebabli via B4 Rela=
y
>> > wrote:
>> > > From: Mohamed Yassine Jebabli <med.jebabli@gmail.com>
>> > >
>> > > Commit 408249089c48 ("ALSA: hda/tas2781: Accept V1 calibration data
>> > > without CRC") only checked the first device entry. On machines where
>> > > the BIOS populates fewer entries than p->ndev, the remaining all-zer=
o
>> > > entries are applied and tas2781_cali_preproc() divides by zero on
>> > > playback open.
>> > >
>> > > Accept CRC-less V1 data only if every expected entry is non-zero and
>> > > self-consistent (R0 * 1/R0 close to 1.0), otherwise reject it as
>> > > before.
>> > >
>> >
>> > ...
>> >
>> > >
>> > > +/*
>> > > + * V1 data without CRC is only trusted if every expected device has=
 a
>> > > + * populated, self-consistent entry: R0 (Q27) * 1/R0 (Q31) must be
>> > > + * close to 1.0 in Q58.
>> > > + */
>> >
>> > Just out of curiosity, where do Q27, Q31, Q58 come from?
>> > I couldn't find anything about these.
>> >
>> >
>>
>> I think it would be good to be able to see which commits were generated
>> by an LLM. This way, people wouldn't have to scour the internet trying
>> to verify hallucinations. Furthermore, it would be possible to see what
>> percentage of the kernel consists of public domain/LLM code.
>>
>> Best regards,
>> Gergo
