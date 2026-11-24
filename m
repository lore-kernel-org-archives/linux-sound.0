Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795554891;
	b=SEcB7goYNk139kVIhVn9hHQn/xsaL7+0cRxF1/0ROBpzUQIkiXOZ0xDq5VrGnlXjeOxy
	 fjYWcYa+NoBlZnl91c5aNvkn/HCWCcBxrcrUMkHbvy4z+jx9gqAPZ2WjF5a5vQFv/MulE
	 f1YeC4HD3yQS7zZH41kpqPZ/uXB3yyAzFQkORPiRk0g84dgr6RWUS+eSSRPaAEbMiMcxa
	 6zTzo1+87I2GQ3dtItRUQb0tLjeezuGWm/x76Uuz7cDmlN0PcTrl6GLV60aaWPdP0F0U1
	 Y8BHqjbpmDJ8r1R1WMdER+HpaV7eonAK+XRyNWYWo5I+ZJ5zTyeuLEG5N6EU+L90Y1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
	b=HET1IhRRbjRVBpV4ib0z8V7Ueidksi0nHB/d/g/chnIw/fpZvRMXiCcUFSVLLvZmp5eY
	 YjHn6JIH+YRmSGcMltVQqcQ6TZiixvhOvK6sFL+NPbaXHBs1Yr1HkH4HhZtvDIjDoXLU1
	 8LqS+fuI5i6Ivk2RFucQI/X7qAPedsCSaJiWmafspiitAuJvOGjKJwPvtFZKjIopSFsoJ
	 +ANXb+u4ax9oYGrw35j02cSAVsEuz8aYBjcCxVLMuKtB9kIrC8ILl+/vY4TBdf0toTvKz
	 K73xQ0JKVCF6sO7raOM/HosuBFZlLowOfwBvn0AIJ4ROs8Mxv56jfxnqi9u9pzSv8fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IWBxgdqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9D606A33A
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 21:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E9D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IWBxgdqF
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67bee1f693bso4037177d50.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554889; cv=none;
        d=google.com; s=arc-20260327;
        b=et3TkBxHaoLEuUsTFk6VEGchZ90LkvgcxdNkgHYtvfYxsj92vJETHM8OI9vt4tmX39
         fyGgCYziNNAmHTghGp350ShKweDCXr0qpDcqimje0fsmBQJvjYoxH9ZSP7WHv/ZUQj04
         qWQDejo1fXFALj0Q5cfGoeqzIfAcTAenZEt70oFc9OMjnbTgJfG5ZzYy8yto8Hi8zOzl
         Els2ONSGaQUK4Bxvfsn0NxpU7yThrqCnEL2mpK5uvBynKrljttfUqgOlfL6yEBFWdjaP
         kbSOA0pkzpfEICrFVOtWCizCU0ruCmJnKCgFE9eb9DSCFfglKCgaz1TcLTMSQHAekH0g
         gXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        fh=vUv6lXd84X6OO5UBodK0vnQhAcpZUP6fO6wNp99M1PY=;
        b=WM4GNUREI8VY6ERz+7b2kXJy0X0aLEH0CV2leohrlm2iTRvgNpqRjO1WCRTGGyW/G6
         zJGIWTJMDB8qrllHWZdicBez1kj5guze/K/BlhRKmIvjGtl89mfYbIMRsw08LADv51oZ
         zo0B+8u9y3hJYpoZdORMn0S1hJmDuHgjOS+F664MFfBw9mUL0Bn0iDCx1xcQVyeyMive
         4Cq8eUL9LdAkn3VTcOcI5PQBcqw996KkbMGGE7a3vZs1s6MVDR7BK6z8Bbu+dfHdFfd8
         2L72tsrKQpWWsV1Mc5zGnVAr0TYdOHcbYQGIwlo4xktq5Cxrvaho+vGr14eW5+1VdDUw
         DrGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795554889; x=1796159689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=IWBxgdqFp2x9XfPCnso0A2FH/xCUErU25ylGd9luJVJO+mW9jwjDcUc6j56Jo7eMZn
         UjDsGcxdVnO+JPKHL86/tNrDP03a9uOsvyZWaE09Ja/x4zZcuAJZBx6g1lS521mwQm1u
         1t1xtyQ5Xc/UIv2Iwa35nCEWMfwoQOZ6v93+xvRe7lQgBGjqkjpkS3QMmJFMP0J1KUt6
         U3jD4FvtgG1wLixarS6ha+vluA8fPBD8j9xI93MGiiJw3J/1B06xQFmp6aKwiJ3g3wHT
         VDaJ8YFqJ0riQg7jkTA3zaSONIcRhkwO0GSFsrd1WFKF1j/sGlGYViwaJL3wGcoyle0W
         01+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554889; x=1796159689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=oiv93Hsz5scs9vaaqLbArJmcQ4oyMFKf30+xAo4ycwaubkiSUj0r7aeVgFgPrCqnTy
         X2+f3vLrDRfHbC+EVlXDwnmp2rH0Z8C2BfXV1gKjiBbyI88D6/mYSy0sNCYWZ/tU5BhV
         n9vdOLWWX2WAO+07v3sPG5MVQ8ZYO9JRZkPzL1JZN4KXK4gaAhxRpsuvagWbuhu1a6/P
         mVXZKuj8QxK6o+WCTSoaloYK8ZKIdNB5FTUx1tV/QYsSXfOHG/DI/Gplg4+ymRxDVoB2
         KLTX09n/MKE/91MqeG9Jjyk0oTjM1jqYola6U8WM4731M7bmK+1bvYFRiyYjRoYG3KwN
         hngQ==
X-Forwarded-Encrypted: i=1; AL+hErHnuU6eaTWjD7jY3j+4YXKPmNWhSLWqSSb2vWkG+AIVIUAQYjieHClFx+zbB+cU7jaujfnb+MnPDWiLtA==@vger.kernel.org
X-Gm-Message-State: APuU4Z83t5Ju3PjR903/Xhr7kyYw+Eox9X/GVDhKwnH52yDDU+SKO5MV
	ZeiuGDDo7xYvFr6tHQqzn5MJRjmYastb1I1Sddk6wK910hDTR3mmj5HXQJKkO/X2b7pTkexCalK
	Hl102zGFbzlOEw4e6IFyUI9qJLKNTSwQ=
X-Gm-Gg: AZFdTZfanl3vp05OCiDJ0qOmrSuf0O7a4gkDB58Zw5MBJ8r6Dx4k4Jzx9NmVdnUFyjo
	uJm5iJb7aUZ3JIMUxoYC/Zh9+UspsdjLpsXNzOu7rXFPqsxp+4b7fHPBHaSOnpoHSz3r49YHZyD
	KmV78ESkYVQv0TMjNqk4cFwFpHH/XusPuIjqTIqtTaWBeiRHcpyBVaa5amXfQsxgQlWuj8KSOyS
	p0+2y0GRLBAxbvoer4RFSij6j/jYrCE5W+5d6nuV/ZH9CTPWi1Oy5UccJjIh/lY2EJuQ419LiE+
	CsiEcQDYk4bqv6Jax5N+lqJa0cQnnAuelQZG8AXmpnOeWSxSm7CAosmmez7isJwTkbifxoHg5RQ
	H/CByfpJczg+K7bLr7PesUPJPNaTWXCGrZivBnMtIvk/lNs8mctwAF4p4iW5MLrB6RcBe7w==
X-Received: by 2002:a05:690e:4090:b0:67d:a5bf:ac89 with SMTP id
 956f58d0204a3-67df42b4d7dmr8236792d50.10.1795554889394; Tue, 24 Nov 2026
 13:14:49 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com> <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
 <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
In-Reply-To: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:14:38 +0100
X-Gm-Features: Aa3M54rEVwCpdz6_8gjaGQEhKA7ZqL-_05evb2pOjFxPbafFazCrzB2je-Od50w
Message-ID: <CAFBinCCd==1Vf7jMCHP0VuWTNa7A5FvRfPYdk2zUaZ8eR54Z+A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>, xianwei.zhao@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

+Cc Xianwei Zhao, I would appreciate it if you could take some time to
help us clarify the questions below (or refer us to a colleague).

On Mon, Nov 16, 2026 at 11:24=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Hi Martin
>
>  >> +properties:
>  >> +  compatible:
>  >> +    oneOf:
>  >> +      - const: amlogic,gxbb-audin
>  >> +      - items:
>  >> +          - const: amlogic,gxl-audin
>  >> +          - const: amlogic,gxbb-audin
>  >  From what I can tell it's even amlogic,meson8-audin compatible.
>  > Although I didn't have the time to test in on hardware yet.
>  >
>
> Thanks for catching it!
> Any testing is more than welcome. I don't have that board at home and,
> based on my quick search, it seems not super easy to find one these days.
>
>  > [...]
>  >> +    audio-controller@a000 {
>  >> +      compatible =3D "amlogic,gxbb-audin";
>  >> +      reg =3D <0xa000 0x148>;
>  > I believe the audin registers are 0x300 wide.
>  > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
>  > that the register area is 0x100 wide.
>  > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
>  > =3D 0xb8. The datasheet [0] (page 395) lists register numbers divided =
by
>  > 4, so to get the actual address in the memory map we need to multiply
>  > it by 4, which gives 0x2e0.
>  > The 32-bit SoC vendor kernel [2] has a header that states: #define
>  > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
>  > by 4).
>
> I know that the register layout in these SoC is a bit messy, so let me
> explain how I got to the 0x148 that I wrote above.
>
> When working at this driver I used the S095 and S905X manuals that I
> found online, but based on the link you shared for the S912, I would say
> it's the same when it comes to AUDIN.
>
> Using [0] as reference, the highest register being mentioned in the
> AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 *
> 4). However I noticed that before that there are a lot of registers
> whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_,
> PCMIN_.
> The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is
> 0x148 (=3D 0x52 * 4). The other AUDIN_ block you mentioned is between
> AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).
Your approach is logical. And I have no way of proving my theory.
So the question for someone with access to better documentation or the
actual hardware description is:
- how big is the AUDIN IP block register space?
- what inputs are routed to the AUDIN IP block that neither Valerio
nor I identified so far (one reset line, one clock input, one
interrupt)?

>  > I'm bringing this up because dt-bindings are supposed to be complete.
>  > So even if the driver doesn't use a resource yet we're supposed to
>  > still describe it.
>
> I perfectly agree with this, but at the same time I thought that
> including registers which potentially do not belong to AUDIN was
> dangerous in the other direction, i.e. we cover a too large area that
> will be hard to use in the future if/when we want to use it and we
> realize it's really not part of AUDIN.
My concern is actually that the AUDIN hardware block spans 0x300 (or
close to it) and we'll find out later that there's a bit that we need
to toggle which is outside of the 0x148 area covered already.
Even worse: what if we put another register area after AUDIN and then
find out that this theoretical bit sits in the second register area.


Best regards,
Martin
