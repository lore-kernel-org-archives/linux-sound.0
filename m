Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA702A1BF
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 01:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781485494; cv=pass; b=EGl4X25wvyF4WLHX7mr18LQkdWOUITNcHddjlGh4G7uAfPtB0p1H45ju8AbPGkkCC+XeJwE4Cn9dsFPrn+NoPV5HjC9gTlREd3oOYJZecz7RFTJycrYBAia1tBng7JPxO/FaRpW+LOIEylBiWkWkavDqljgurElt1mAG0qkbagA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781485494; c=relaxed/simple;
	bh=R2ycl9QhnYSUjK91R3xYK2Q1tAb2Ce8h0XOfR+YQzug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNh8ab+6mojLnExAhaVAK+A0jLwfNh2KlyWa5A04YrhxO2wHzEw2jfeeL4QZwDijf/f63+eA6jOahfWEuX0fcHQr6QDvWnvcBaz97qzjWACuLjqdDF4TTGuYE2NZvvSgdpktjnbrR2+c7YoiJA5YFPZx9GNtiolOP9jqCXg4ePI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQnNStKa; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQnNStKa"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bed2195323cso398775066b.1
        for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 18:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781485492; cv=none;
        d=google.com; s=arc-20240605;
        b=V+m7CHhT3gZYRYVsqNH7zZ3Io8QmBMJFIMOMWCN1vg8FuBnTm4S6Whkr3/SjJQETK6
         Nlu+ZkfjuAYiaq7ID6jvy3BjPkgx9CRG7UaiYXdcjv7Tg77mhmKPqWUSfFpKc/JLoz7o
         wDhenPkZ4gMlMAp7IdfsT/yQcUFxOjxEld+JIT00iRk29X85FmZxMybs6gqg/xKmWWlp
         lwxFQUlj5lCPw2r6FsYRdjxu8TxA9H6zvl3HdJaPGHS2xrmGFbXoUlz+XA75iVEdDxZt
         1U6ab63Q+QlZuCM3UExCHtEJjP2irSDrIIHNSAWAVFAtIfWOm1QyD8cgb/9yz5U8H133
         F9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQSOOV+DBTiCCEtastW35rFQgcJIi8WkjbxM6bIBd6s=;
        fh=msL4PboLk/yGoyQs5gwSyGiwuG7S41/R7+MCeDQeF5M=;
        b=GebMcIm3+naNgRea2RrGheoC2Cer0qbZTRfZhdsc6yxDpkXx4telvUcHYCYi72b3O0
         X+IlO0ifJLpFpQ3mpNWjZp170vFc62DYVTGeGBa1GRPGtnsr9008k9yOxGjyYBFD1LoE
         JGgpOsj/ylAv6Vsfcw1TVSUBDofM3DTw3hZJtL8WnscJZFyt4dWLn3325cc5nhD1vjti
         XX3XvptjSqo0wKqMGnmhkFKWFe8jzHcdA4R0R2s4PuBPJEeD+sUGrC4wAWywG0/ftT0Y
         3iB+/u78hNBTgcvVH240FZNt5m9c2oYe88EotlpFbz+gAjlayUQoavIwnzm5S3Y2gDp5
         etZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781485492; x=1782090292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQSOOV+DBTiCCEtastW35rFQgcJIi8WkjbxM6bIBd6s=;
        b=nQnNStKat8O5PFdQJu/FdBnZU1DzxV3pE17Al6Ok8Vn8wDC3aqS5lb2u2vIe93Fonl
         scLZ8MwMxQ0xRi/QlXFHylaqQUBmo4tFTkddDG01XekCzTxwPBGGzvdphA3oN2sVlc1L
         arHlFGZ4kLZZWhW0deoAdVb/lDcjf80aEe3QKznASOxtQRwJnXsMH2fTi2Zd8EryzIFS
         3N8k6VVqe6YuTTMNsZkuQ0ASu16XvxJBxiQbq/gZt0/4IxEUxTk2yhgKE79Jj2LDjgIj
         8o+uMPiRIl6cTyMxyczBwev12eHm4tV+MqggSCAkwjG1rjFhetJ71pW1HZrFgX29vSes
         tR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781485492; x=1782090292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wQSOOV+DBTiCCEtastW35rFQgcJIi8WkjbxM6bIBd6s=;
        b=FtcBWN5CfZ2VT5D6YLbepJ4IhxOVKyYYX0Wy7+muMypiCB2doCRhuZSEQbQhKwo8BK
         h+sQHNWRF+5XTQIZqvc+THWM9wYFaUWfA6ryq7LyVmgy7+77JxjFgu5XO6s06MufVRWY
         6vt3gVJ8nVIvX99AEFvDuw2wo8L8Q4kvrLFp0qHU5hv4xEHpd5MbFmFuv3Mttpno6ni6
         aKpnf7dIWta5fDvgmRqAvP/dfwyfaGZmjOSlDRCGYxqBSZ9QImEpqFRBGG2BFoyJoapp
         lzR+b7s4tUpjLhaf/GG8VBUjGtt61pLi+jIHjhbCU5M6GXIhdPAJ/ShFK68z6ZgiXAYO
         a8zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u8PQIEg3GXDgPa5zzuTCXF0LN5c3z0kyuEII60A/fmNuwgNf2EHBZL39OiZCLjNHslwQK/IRuiHHM3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUm2VfcQPjsb7o/u4AQId+r2pMPzholiouA/rtmjG6PlV01YBg
	Lw1Sp2V1pof1bI/UHtzxz3N24oPql60UwUU9CwNGytWSiyYG8RPTPctW8Ge7rKCDn0tlcL3NFrF
	9t17fB/OzLvImuUdacpeyxwUmLSdAAgo=
X-Gm-Gg: Acq92OFiEAEe+NvxGAYPbXfUCvkzDu8CDdNeIaBWPWqGY5esXLqGEQv98LH+g4v15lf
	WJo2sVGWGj3i0ORX/+flINu8iXzKfYzDU7qdYZU2fXdYatS2ot/JStoRiPGbjKTaT222y2eusTS
	z2dxMZ+ET4FRvOXjaHE62LKEe6K0DixZIoHywOkC86b/Dhq93QhU7bo/FAMx8XUUWXOOtsKh4Nh
	EkPYmWD6fW0NuPic2btZnqAhqjJm4G2b9B4k4O+Om74u69N7l0huAjzaK0cfx16fBAa+w1gHT5W
	HasYtIOM
X-Received: by 2002:a17:907:6895:b0:bed:2a8b:3e72 with SMTP id
 a640c23a62f3a-c006c665bf4mr175509566b.21.1781485491299; Sun, 14 Jun 2026
 18:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <c03b86a9318cffe69ecf8d5c14543fc5948ab2c7.1780538113.git.zhoubinbin@loongson.cn>
 <20260612160134.GA1116138-robh@kernel.org>
In-Reply-To: <20260612160134.GA1116138-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 15 Jun 2026 09:04:38 +0800
X-Gm-Features: AVVi8CehLy42LEJgG2i99cMYFG50MlGhaNfJeJz81YaHZrK9mKFknfitnhAJSIc
Message-ID: <CAMpQs4LUs2g=_QvJ14NQD1KAEwvKgjNmdj6B-3odnqJNxEUcQQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Sat, Jun 13, 2026 at 12:01=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Jun 04, 2026 at 10:11:46AM +0800, Binbin Zhou wrote:
> > Add new compatible for the ATK-DL2K0300B development board based on
> > Loongson-2K0300.
> >
> > Unlike others, this board features GPIO-controlled headphone detection,
> > headphone mute, and speaker enable.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../sound/loongson,ls-audio-card.yaml         | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-=
card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > index 8c214e5d04b1..e9b248e8246c 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >      enum:
> >        - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
> >        - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
> > +      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
> >
> >    mclk-fs:
> >      $ref: simple-card.yaml#/definitions/mclk-fs
> > @@ -47,6 +48,18 @@ properties:
> >      required:
> >        - sound-dai
> >
> > +  loongson,spkr-en-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that enables the speakers
> > +
> > +  loongson,hp-mute-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that mutes the headphones
> > +
> > +  loongson,hp-det-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that detect headphones are plugged in
>
> We have standard properties for at least this one. If you see multiple
> $vendor,foo-bar properties, don't add yet another vendor foo-bar
> property.

Yes, the `hp-det-gpios` property can be found in
`audio-graph-card2.yaml` or `audio-graph-card.yaml`, but I don't seem
to be able to reference it directly.
I=E2=80=99m not sure if I understood your suggestion correctly=E2=80=94to r=
emove the
`vendor` prefix? If so, could I use the `fsl sound card`[1] as a
reference?

Also, the description for `hp-mute-gpios` is inaccurate; it actually
controls the enable state of the hp. I will rename it to
`hp-ctl-gpios`, as follows:

  spkr-en-gpios:
    maxItems: 1
    description: The GPIO that enables the speakers

  hp-ctl-gpios:
    maxItems: 1
    description: The GPIO that controls the headphones

  hp-det-gpios:
    maxItems: 1
    description: The GPIO that detects when headphones are plugged in


[1]: https://elixir.bootlin.com/linux/v7.0/source/Documentation/devicetree/=
bindings/sound/fsl-asoc-card.yaml#L133
>
> Rob

--
Thanks.
Binbin
