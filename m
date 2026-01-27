Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D621DF963
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518890; cv=pass; b=Tl3yE6OGI5yRQ7n+boXmfTpv6iCsiu6gsG8fnVwbbzrqYniRK7ch46inUG9T4JVPfA0/WVB1WrPSldqkT5VhBZR1T2Tx3O7E+F+zfwum0STuWgrQliRj2wLIWtX4lUclwfa7CkwuvUKoMEN4I4ADuDB36zklYCdRsyd1ukG6OJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518890; c=relaxed/simple;
	bh=9tGFvRekgW0lDIVIFRyhlOyqoQbr6dGHebYpOLYRgV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYZPDJCIOCq4Ile7otn/gqA5kcl1fH1+KPtl1bsSu2PqHA5s5YDiHnw7CwKzij+pPqa0MDgt5SHt0H3q2YjjYvEaErAiCpCuLfrnxkZ9XPRAPQvXtnmGFOAShtWyq0Xyd95wQh3O66rQz+QxybZ79wB7ojkQ1ztzEvZqq5I5eKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DH1G+xrN; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH1G+xrN"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4042905015cso3424292fac.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 05:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769518888; cv=none;
        d=google.com; s=arc-20240605;
        b=hx9cHbb5mybqFZenywHTcvHHO1BBYXayimgRjsHYbNqcCrkyEQZhjo8g/251FLkpdA
         3mpk+Xy+O2w4k//2MJlNTpmsU1Q21D/LwwuUE2FhoIJ0cPnikRDC26fRXmxqIvKCDQSy
         AYolDwJvlu2g2JPjTZyGQ4MymlyZMl32r4IVjPqNn/8g2VBmFmCHSGbX4jv+Q83RxTOf
         /rctcZASBk30kSn08Ga1ih/+6siY/RFP3RoNqh0Tthk9lMtc0FhyozU6v+Z0Sd7nnNcY
         QhKAx5Hrb/D9upEQPWkepbYCPmRqu9hr7aQi3MatYDfKzNSNh9XOj4bj0Ud/sUZPidMF
         jISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EnMO7GK397RcjTFUAgOgO661fHa1QtA1KMXijXCcxzI=;
        fh=/WsQYZHapaIVV7/wnm2HHRpv6UPC4b4bZIM57Dd9pFA=;
        b=XZA3oPmfuHkDv5FCWx0LJu6UpmxTa2yv5qhgt2QyE72pW/z5v1R6lxNiwZ3ArnS8ac
         otAe7gKx7yEKa5ustoxBLMQB2szm45vGKpaDAndSAt/mew2hKSZRAq+W2AaqspMTXM8W
         nudhw2CCGVR8/cKfKK0c5/s5TIZtcJ2NeoxBPxnzbGOpxoX5h+6aaTsUYMRQSGjp3k0M
         f6O8zoTllUvlSlptlHgj7fI6FFIOUUxoqf1WnDNtq0mfSt69xoeto6Dn3J1lPGbwO8nL
         N1VgDGywFEqaiIIov6gPiikjtotoy8yf7c9+pAG65GOSZWakNcOhI7MK8g8m0UzrxwgR
         W/Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518888; x=1770123688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnMO7GK397RcjTFUAgOgO661fHa1QtA1KMXijXCcxzI=;
        b=DH1G+xrNF6Dw9+iUOAlugRxXPaOzQYjzDb9PzXItb82S6oBZLbagyG2leHhMZ2r3O6
         +SRcMnX4GTP83hJKpsRV2RPStz+SVew3nZCpM4nFnjCX1NqIRMsw0UB4ieR+uNcXOyRr
         P1nM4E1swN255etKaMJgezcfXe7aEp1CkQifuEPcgm9IdqXNtZ7M39sqEbN4Aoo51RDZ
         T19DXpbqQSZ7enrKqPz1zl3OBvC+xYZM2OQVQbpRZaE4LOvonMBaMQTJx13/TkLIVVyB
         XiMvjUo+7cIruXhYCWrn4SdMiGSxUeiwsWVbBnA/re26e0+XS3CoVxCakZIgSFyHQRRD
         Nq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518888; x=1770123688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EnMO7GK397RcjTFUAgOgO661fHa1QtA1KMXijXCcxzI=;
        b=eLCo/hFjjqWn0+9cNsXNYUyIJq+ZyEZ6GHrt41XKIfeYRV/c8EMwjcVPNVa2U32dDK
         mmgIqtcxEOdV7H/ro021IJruQXKtKc697auNjghIbqWPZrs4iFkk0eNhR9PXgutOimJr
         l9h2X/KNbSknt2J/kbSurwqx0rsh/Q69olH4pK8qmmQ4EWeZxjJkPE4a3RmWlh18191G
         OnEa6ffEFrO7wdl8+cN2Fo2Xn1wnWeNUioKGCmJh0OHdXciUUN+6tuVDHoVsisdlL3W+
         i2+FIxmcN5q2R1z29joDWlnx1XmTGfdFbzveQQ8tMGzJ37B4zBdRnd1Z4NfK/2QS/5GP
         hutw==
X-Forwarded-Encrypted: i=1; AJvYcCWnr7UyHyEiKouvvG9Bg/GptBMVasQccwZ7iHN8UQPew0z+7Qn6AOci4e3BLTl7YYPXog5kWdjcTbcexA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytMywYICiR/OTmiYic8OpqE/oOfq3ELZryijQxB8Onin+zWqsy
	Ua5ff8SujFDgxmX1HATGt7fSUqz15aABKxPgqYTkD4fqa8CCYVCmN8xPOCx5jMqQb2g/N5Rs2k1
	QNWpo9yieFsxdlmmD2h10FSaZGCnL0szakQ==
X-Gm-Gg: AZuq6aKYcTIecza+PPNiSz2YE13VGSW0o8OKw5VEVc2u/y4Jjs9VoCWIppi5u4RM7OD
	o5MzqmawzFwHpFuCukhLRv2k2Ho+7JmLSriRVm42s9zXnvCEcS8jbUqyDyCEFTnEWfnRs1WaMYa
	PdU+M5WwL/R/n/9x2khsq49GxHUddZ+6p3t7Hr5lJKzSyDyKrUemG8R+5F4QITzNG1mwKopWDCM
	8PXi8+tnxbOksaBpMwKvX1ce9UBaotaCve47uAMof3eCThVpVp6NpOk3qnasa4agmZh7xxU
X-Received: by 2002:a17:90b:314d:b0:349:3fe8:e7de with SMTP id
 98e67ed59e1d1-353fed87968mr1434199a91.28.1769518875549; Tue, 27 Jan 2026
 05:01:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103326.1920525-1-shengjiu.wang@nxp.com> <aXibZNhIZI01tJyZ@opensource.cirrus.com>
In-Reply-To: <aXibZNhIZI01tJyZ@opensource.cirrus.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 27 Jan 2026 21:01:02 +0800
X-Gm-Features: AZwV_QgK8-vc5MoE38DIwOTmi5gjm2DhgdYPE-YoyPhGmZSnrV2U4ZZPvcXtu_U
Message-ID: <CAA+D8APEa2+iGkONgEOWpRe-w1Ni-CmBpC90qPRYQj6mV72-YQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: add .set_tdm_slot callback function
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, 
	sebastian.krzyszkowiak@puri.sm, brgl@kernel.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 7:03=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Tue, Jan 27, 2026 at 06:33:26PM +0800, Shengjiu Wang wrote:
> > The slot_width can be different with the params_width(), for example,
> > DSP_A mode, slot_width =3D 32, but data format is S16_LE, if the word
> > length is configured to be 16, there is no sound on the right speaker.
> >
> > So add .set_tdm_slot() callback function to configure the slot_width an=
d
> > update the word length according to slot_width in hw_params().
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > +static int wm8962_set_tdm_slot(struct snd_soc_dai *dai, unsigned int t=
x_mask,
> > +                            unsigned int rx_mask, int slots, int slot_=
width)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct wm8962_priv *wm8962 =3D snd_soc_component_get_drvdata(comp=
onent);
> > +
> > +     if (slots <=3D 0 || slot_width <=3D 0)
> > +             return 0;
>
> You probably shouldn't bail out here, how does one disable TDM if
> it is no longer required?

Should we add some checks for the slots and slot_width here?
or just remove these two lines?

Best regards
Shengjiu Wang


>
> I think the rest looks good.
>
> Thanks,
> Charles
