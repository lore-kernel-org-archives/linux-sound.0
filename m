Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246356;
	b=BzXl/BKgz+o9GK7FrDpvmNKgpHU8zH81iZhsrRMRdxrar/S1WiGtw3c0KJOgHuxLB1fJ
	 m2S5r2Y3MWjisc6FXMTFoNXcgXKIDkYkqKg+uC+c440U73/8BdSxcQCwV0dLfPbgXgPWa
	 0r+bfH98MdO9a0sXgxzkwgmX6/m09UMXEi5FNmW9aJQNQRfclvwZoweXws6EaWdMt+EUY
	 x6nKDVOU2qYZmoR//awwlI+1RlgsW+GKkv+MYwbbW1MCxu9iTwZltYxwF9jh6NIky0X4j
	 WQAaVvUJxpasa7XbY2y7P1ZgLWr/z+55xegFPNjgXqoI4NJjrYDXjrmZcsJ67p59vvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
	b=kStWfMia7st6E9DNJaB7OkHn/heiDYsBiH8tcHIoff9S/b9abQbG+EHeKocy+vDsTK1p
	 yG4spM3rQ8livXuvbrLRxBIWO0MRINMFVEC12PhGUP7CKy6tdh49mg1uEHlJ1VEvcQMn+
	 IN/p3qK2UdgXhhiv8qkGdjS9Wpd5E2zhB2SYI3nm0u+9RnpADpWdZvPApykXKdmnZlJTO
	 Bz+37pjoAdKU0x+8dltW8GBf72w0CmaJ0LlPlRgBWfRM/TNiAPPlYNo9DNdTWaxZGr1xK
	 98lwsTwgaf6QjSnng4LNKbVJ5fbnwbrRfiF4tabrEqZusW4eVZTgvtWlZ7ybV9WSgrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpWqHhYP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C61606A332
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C61606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpWqHhYP
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ecbdf5343so14153176d6.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246355; cv=none;
        d=google.com; s=arc-20260327;
        b=iM0WzaQIT5IaOnSk8zyz0GKGKU4lW/7GjNkZVqgW/eAXbjh2k5V5dwz/hW4V2Ga7nM
         PYMoXmhFVQueA4Zn22eQNJGaonLEbbHo9mKKVBMm78+fkJfsIyCvOILD7L99dtiTww8c
         rwkZaFPeNP6aKS2WY7riBXE+EI6bRxMYQNfgz1wtBmWqNS1+WrNPw08ROFgAX2b55M7H
         Mjic9uB8UbL1wWJEtMRPEk+Fyo2hUJHuNMhCmX3DNoVqlyJoakDONHMXlqj8oP8MQKcf
         QFUVhnV4bJy61MEQctHS+A+clNb3A8oey4RzhaPS7Krbt68MAbShp/dD8eq8c9AAGqeG
         HfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=gSOUjPWqD+Rc5z1NZDly+bPsCrNPLytpDZ5fM6U0ajwpqQJJ/snqNOkXex1Yl23NtY
         JINEUw4nnwz+B+mEj41MtKqg3wVz7ACFNkczwnaz8UMF00uatW0QqhNAV8FwVdRQY3rT
         KUu/hZDM1DksGDYFFkVM+U6q7bF/RSgq6HskFYBG91a6xg43hzuahZu7aJctHp4bnyY/
         N3a5QR539aK7whc1jZbqzX6MITifZ7mZvp1ewqjuXKYbSiyC8luaogYpQwaSpDs8em/z
         q3FO55i1C9pCQBU136izyAHuNN1rKehM38uN2wRjCZSu7eA0S2udgwkjIuwlPWP/Qu8v
         uYQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246355; x=1794851155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
        b=kpWqHhYPurln/zssJJd0/7a84yxI3i4QqosCd2ZX5VfloLqg3YO7+kGdtwq+3iZdM4
         r9jB9l6hkl6Lq3MwMb+RITcjfRqmoUyHU/4jwiF0DUxoSZ1ek5Pgp/YHdVwdGVRR1T7w
         FlGDZTS2tksYy1PscrZlk2MwQIiyQRUFg43fAgraJmLHV33uytfOzKXzMBeoUvMV/Oxw
         jfqE3E04xa5nOsdalDQkRBKbNoPWjcTRoT0NBVRxoqn4jz7QKiUmDJnRT3+1VJ9mhPJE
         9LWAkxKDZuDi7sDRoj40h/0AuQ/2xhSoMdpQLFrwWDH8OszVu/dFxg4/PzY2reh5D+0X
         Rz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246355; x=1794851155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
        b=E7tS4kSLX+oDHQrE++M9XJRWAPjnJMaGAAjsqVS2BKzgX1iv5NMvSMgAwmXVsHGOHf
         OmI0LI+7+9QA009rLsBwUKpkjM/lP5x36dArhV1y87eJQLJrpscnJqRTzYVlpqbsHQ/k
         tgUfnahnkZmJTtGegGM9EZSOwxrdzfFKAyjU8aWAbs0Esc+UavkHxe55Po9jNvSMYN6b
         Te9Xvj+2R8ydhMLaRhRjaxVQ7REwUcQghri0K53MOJWLgjxnhKoSuR9+510Tp1AF0dTc
         g2hIcGvel8QA3/XfxfNQZ0QIwD3bLDSLb33phhhgiMXBHqD1uz77dOKkRW4ZWZhOLYnS
         GB3Q==
X-Gm-Message-State: APuU4Z8ikgcBYtju5e1VqF4qgzP6MX+dXSHP+ejuohM416uq09AdNOGB
	56apF99woazGGQ5l08blDZLKKhVtEO1IdL2HCQP+QRK3MpLySicmEC8ifAHTQfNvOBv7Ye0slZh
	T23lcIMJDpI0LAEBOurXS95ZHOLmI2RBKMtk0bXA=
X-Gm-Gg: AYBFou3kR0Uti9kQB0YcCAUsK5rjACfyYBLZlaRj11AzIA9gxuUkH2AfpMFgbmtb4Oj
	ZACIv2w59mbmvvZHncG8vgancOQAoHcN4209fRaP2nPKOJyI2GDjK20iEI5YEfM6+s0y5Wqo/as
	Mg0cKwk72lJ0T+gjTw+hJorwsWgK0VhFpK9YtT9OW145rw68C3RhPa5B3GxPO1Its0w7voe8rG2
	uPxxN91LUkgK9vjTLa3+i90/RjZ937VtxbinfKcWsJYtPqYYof8eC4Q1RwcKcV4p6lxajBt+ImI
	4oGU+blgQk5UJjnUwqmTo6yM4nfBrwdqnFynVUYwFNZ45GELWqV6LocxUnqV5tU3gLt5Dud6KJQ
	DJbxMGQHXIj4e/wGZI2qx8iyq8fFOGgRIDIr1gIDC/ne3YmSDB5RCx+gTBETQQRn9hqcl
X-Received: by 2002:a05:6214:598c:b0:91e:b57e:5426 with SMTP id
 6a1803df08f44-91ef03aa40emr2965136d6.12.1794246354571; Mon, 09 Nov 2026
 09:45:54 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109172134.1850973-1-hj351016@gmail.com> <sashiko-outbox-205322@kernel.org>
In-Reply-To: <sashiko-outbox-205322@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 02:45:42 +0900
X-Gm-Features: AclHuK9wMrzdjwSEcbLak8VBwH26J-EobC3IS0WRZ6HxSVSCpJQlGHcttTOvRV0
Message-ID: <CAGr5VtN-EZH9Hmn7vywihtdCRgtriF2p2rLLWOZWKO2=Mt18Kg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, and apologies for the noise.

You're right - this is already fixed by commit 965bad6195d0 ("ASoC:
rt5668: cancel delayed works on component removal"), which I missed as I
prepared this against an older tree. Please disregard this patch.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:41, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: rt5668: unbalanced disable_irq() in
>   rt5668_i2c_shutdown()
> --
>
> commit 7ffec355074a97397bd6323b0aff3802254c40bf
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free
>
> This commit disables the jack IRQ and cancels the jack detection delayed
> works in rt5668_i2c_shutdown(), and hooks that path into a new i2c
> .remove callback.
>
> > diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> > index 29d70802a046a..c56bbe3fc7bea 100644
> > --- a/sound/soc/codecs/rt5668.c
> > +++ b/sound/soc/codecs/rt5668.c
> > @@ -2584,9 +2584,19 @@ static void rt5668_i2c_shutdown(struct i2c_clien=
t *client)
> >  {
> >       struct rt5668_priv *rt5668 =3D i2c_get_clientdata(client);
> >
> > +     if (client->irq)
> > +             disable_irq(client->irq);
> > +     cancel_delayed_work_sync(&rt5668->jack_detect_work);
> > +     cancel_delayed_work_sync(&rt5668->jd_check_work);
> > +
> >       rt5668_reset(rt5668->regmap);
> >  }
> >
> > +static void rt5668_i2c_remove(struct i2c_client *client)
> > +{
> > +     rt5668_i2c_shutdown(client);
> > +}
>
> [Severity: Medium]
> Does calling disable_irq(client->irq) unconditionally here conflict with
> 965bad6195d0 ("ASoC: rt5668: cancel delayed works on component removal")?
>
> That commit updated the component remove callback rt5668_remove() to trac=
k
> IRQ ownership and state via rt5668->irq_acquired and rt5668->irq_disabled=
,
> cancel both delayed works, and reset the codec:
>
> sound/soc/codecs/rt5668.c:rt5668_remove() {
>         struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(comp=
onent);
>         struct i2c_client *i2c =3D to_i2c_client(component->dev);
>
>         if (rt5668->irq_acquired) {
>                 disable_irq(i2c->irq);
>                 rt5668->irq_disabled =3D true;
>         }
>
>         cancel_delayed_work_sync(&rt5668->jack_detect_work);
>         cancel_delayed_work_sync(&rt5668->jd_check_work);
>
>         rt5668_reset(rt5668->regmap);
> }
>
> During i2c driver unbind, rt5668_i2c_remove() runs before devres
> unregisters the component, so it resets the chip while the sound card is
> still bound and then rt5668_remove() runs and calls disable_irq() and
> rt5668_reset() a second time. In addition, rt5668_i2c_probe() continues i=
f
> devm_request_threaded_irq() fails, leaving client->irq non-zero with
> rt5668->irq_acquired false, so unbind or shutdown disables an IRQ line th=
e
> driver never acquired.
>
> The commit message also says that the component .remove callback only
> resets the chip and neither disables the IRQ nor cancels the delayed work=
,
> which is no longer true after 965bad6195d0 ("ASoC: rt5668: cancel delayed
> works on component removal").
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172134.18=
50973-1-hj351016@gmail.com?part=3D1
