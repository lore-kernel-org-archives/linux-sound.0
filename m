Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246562;
	b=hoLCr9R93z/ZYPCPbpp7Vi0k1MaHK0ZR4GbmyrOYg6GV7OqYSF+QxARFMITIq84b7xMo
	 sFX5dRZbBgYuxj1/xQrDHi8wW8VC5w1m8IUTlftqI+UiiNOaqcKJd53yEs0gu0evRI2DU
	 6RkLwS5BlCkwI4TMPnZ+aWSM1es1PHcL08ry40C/M12YD/Oir4x+LJfjMlrOfKd2bN8fr
	 C3wdwPAH9wHxjVpEgEV9uWxgCJIKms656SGP1B7sxWxU7P93paWthl8GMyoAaeuK26o02
	 wlD0g2AyknMEOIjboICUp3BGa6WE7EbUpq1Wjx+YQticJwc/aAoQPsJI1j5GYCq4JVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
	b=tBNzumaq35zznPSwu5iKaI8EaQtRJySUFJ6veIOqg6w1St68Dw5DpYSEMPYnYnkEUjMX
	 haJPru9r0QaDZDDA1uCPP42yShmz5/rjZ6rsaMTl7JOO0IvhcsAlYdszpA9gD8s1ayZom
	 Pti9au2WtcjxBd1eJUC4QGM7EI1driOgeTKSO+GBfDadINgofZ21SmMEpamdonmooR1k3
	 FLZuEUSH86BKD8UKS6Xu14+/hP2I6VLgbSdLcC0C8pDNCLWC9GCJBPdYiVs/gzWzx2HrE
	 Zm06gAtsy3Rp9lASvevoPPo8f7PLFZX27t5ReP1YGsJhimZ3mwzDcRRVwsMorHTSDLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsnTLhtu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87516606A326
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87516606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsnTLhtu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91eb449364cso13500586d6.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246561; cv=none;
        d=google.com; s=arc-20260327;
        b=ShyjM6pMh5qmYQfCIlJKWmovRL7CXgVMaFsCcpPJx8IOM369k7iaFZY2kTAfzXdL2d
         AWGNsbgENn7nMIDCwM5/XrXPOODvohzYzT3DOzjpOr5e7GS+bgmzOzuigi3lyIfCX0rb
         6yta6y1miHJ79Y6dlo5xbnPXhatbvTr4GCa+X9pStlURI9LJ1K/k+agu+1/bEDBCmp1p
         pM6lb4vVSxESYfhyhWLCC60aaU+hi02vF8Ij39zaVxdPo8PxJ+C8gCwavs6GAkWlPYDt
         yZ+NF+s4YYnLYZLurzjVyt26OngEow9FsITmWr3zTJ1eBa6Qu+n0UDz4E7kJN/AIbIuO
         4TUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=B60/P3b6umlF5YrSk4y4oexhbGvsVfhZ1awZ0R57i+oVAFjqjhQd/QET+ML/7BvbCt
         nwWpGKqCltxXFS5qnGAKVPCYSBPlQvUWEWUi4+GRWTd0LEfvK6YYl19kny9n5Lo3y8Fe
         uDjV85VovY0URZavaAoJ5o9y8kt2LV9L7SfltsJcoXSRN0pH298If/XCrl9yFuAHFWaN
         0X1Vc14nTd0WY8rqYNOgBziJRuYb0rNygXZ+B6lqIebnifbiZt/kpV+4oP3m/JsFA9Ej
         +GgAuBm/7/RwcGSdjeMPEKjohG4EnDwXZn8VQLPB6xvG5KCGYkun39NQTIncXwXY7DuW
         Cv6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246561; x=1794851361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
        b=qsnTLhtuj7FJ8saGImM9jWpNBOa8rvAPwIfpEBoTYe/2M7EiehPtjL84TyGT+ikfKo
         NRQIYJjHIAH1aWK7w1UOEjYlWV2dCRrquku7WI0eDkNedU4QpDGt04Iv68j2MWSHOQBx
         lvCO396g6jdeyXOWUF2V75t+UFY0yoVkQeN6rbI5IbaoY7UMRoERKpB982xxttdUkeTA
         ATz7pO8nV4IblnrtZcltNZpiomNhXGCedjE7qHljtsrBG8RbTmU3cvch75gdirVw7niF
         UMhazSbSTv9hsCXsK38ub5bSmUvl4Mshv671FnFGrTREANCYWNdtChid0OvS9+mnU8Hu
         hxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246561; x=1794851361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
        b=t36e7pP6iTBYjMbhRO7sKfNCSTkRvk9CuheALgrFzj+ReoWUI5QgW40hw8tbtC4Ou8
         tErUlsayxPihpwlqUV57HxLtT+0NsTCFkyErEU8Ezd0ZLqvhrYamKiGVYG9F7U6j4/uX
         qNPfe2vut9+os8AXcqFItrcIO3RVAO7kmSwtLnVqu7RotLw4UY9O8g7DNcwj8elGsTej
         XhbSAJjicJ5fxsJHv6aXbBnXzH1EdF2vtkKzHGz47eymG1M+z5pGeSVdx7Xm1LJo2hNM
         sE8mg0dWqaLukV2GWdGnYDfu83mtyUfnpJp2WdeQptqjQzShofZLRQRoRCNfSmvR6y/g
         iDNA==
X-Gm-Message-State: APuU4Z+2zcIKUkECZ8bfetyuAqy0NBN87+1HEeq8+QSXCFgqGnL33+QM
	y2ved4YfVDWWtwtvh6mM2Xtq8PFfhBGGQs1bPiMXXAipK/nRZT+HGiy1OOyfNYPbFTRdRM1MhhH
	a/HS/yFsS9jkn5Yh7Gqlulq7vt9qbPBVTZsSXtcw=
X-Gm-Gg: AYBFou0FJPlHmTWlqPfkKqFrH3QkYgId0rqpN5QUJ4DkNr7siq2UMh/pykrG12SvnH+
	rBYJKHFdbMbxDTGU+gLnumg7V+HZFT50URSrlWRI7kOCreABXOxdoztwlI4jNYqvhQ5rlSP+Iqa
	6i7DGiQoh/W3MphWP/eUUX72dkqtQemBYGRHeb38pBoNVDPdJtY8aBL5FsrVA3lSETyF1l19V4u
	I/nDT8Glm7ESBZlZowZ1khw9fUj2wj5pZh50thTX0OZoUikUYsdYGky0aQkBQFQfW2RsuJvxGa1
	FLQvGDD+wTWTooWHg7MYwJOe8Mx0V2pETUuMcWP4BhS0XzwHro7L9o/d4oFv7WI4ehhVmYuLBIc
	3CjwEGCYqoU9/isckjYqTWX+AL7rWbRW/eztaFkIEZjAE3f3IBLk1MVk4YDXnlzlcAueP
X-Received: by 2002:a05:6214:518e:b0:91e:b874:12a8 with SMTP id
 6a1803df08f44-91eef90b51dmr6045326d6.24.1794246561412; Mon, 09 Nov 2026
 09:49:21 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109172155.1851386-1-hj351016@gmail.com> <sashiko-outbox-205326@kernel.org>
In-Reply-To: <sashiko-outbox-205326@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 02:49:09 +0900
X-Gm-Features: AclHuK-SNqa6w4k3WZEkGgV9OK01eh5S7VPHF6S3sDKsccoV_mm5EI8qfmCF-w8
Message-ID: <CAGr5VtMyaAp+xG4YthcKLPKD5XZwWQxmHPveOhwpnGKuw76m_Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, and apologies - this is already fixed by ca3efbaa8aeb ("ASoC:
rt5659: cancel jack_detect_work on component removal"), which I missed
as I was working against an older tree. Please disregard.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:43, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: rt5659: unguarded cancel_delayed_work_sync() in
>   rt5659_i2c_shutdown()
> - [Medium] ASoC: rt5659: unguarded disable_irq() in
>   rt5659_i2c_shutdown()
> --
>
> commit cfae689e1e0a124463e941d5a4ef73f9a8712aac
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free
>
> This commit disables the client IRQ and cancels jack_detect_work in
> rt5659_i2c_shutdown(), and wires rt5659_i2c_shutdown() into a new i2c
> .remove callback.
>
> > diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> > index 68f7d5673e190..721c742c0efda 100644
> > --- a/sound/soc/codecs/rt5659.c
> > +++ b/sound/soc/codecs/rt5659.c
> > @@ -4337,9 +4337,18 @@ static void rt5659_i2c_shutdown(struct i2c_clien=
t *client)
> >  {
> >       struct rt5659_priv *rt5659 =3D i2c_get_clientdata(client);
> >
> > +     if (client->irq)
> > +             disable_irq(client->irq);
>
> [Severity: Medium]
> Can this cause an unbalanced double disable_irq() on client->irq, or
> disable an IRQ that this driver never acquired?
>
> The component remove callback rt5659_remove(), added in ca3efbaa8aeb
> ("ASoC: rt5659: cancel jack_detect_work on component removal"), already
> disables the IRQ:
>
> sound/soc/codecs/rt5659.c:rt5659_remove() {
>         ...
>         if (rt5659->irq_acquired) {
>                 disable_irq(i2c->irq);
>                 rt5659->irq_disabled =3D true;
>         }
>         ...
> }
>
> When unbinding an i2c device that is bound to a sound card,
> rt5659_i2c_remove() -> rt5659_i2c_shutdown() calls disable_irq(), and
> devres teardown of devm_snd_soc_register_component() then invokes
> rt5659_remove(), calling disable_irq() a second time.  Conversely, if the
> card was already unbound before i2c unbind or system shutdown,
> rt5659_remove() has already set irq_disabled =3D true and
> rt5659_i2c_shutdown() disables client->irq again.
>
> In addition, devm_request_threaded_irq() failure in rt5659_i2c_probe() is
> non-fatal, leaving client->irq non-zero while rt5659->irq_acquired is
> false, so checking client->irq alone disables a line the driver does not
> own.
>
> > +     cancel_delayed_work_sync(&rt5659->jack_detect_work);
>
> [Severity: Medium]
> Can this call cancel_delayed_work_sync() on an uninitialized
> rt5659->jack_detect_work?
>
> In rt5659_i2c_probe(), INIT_DELAYED_WORK(&rt5659->jack_detect_work, ...)
> and rt5659->jack_detect_work_inited =3D true only run when pdata.jd_src i=
s
> RT5659_JD3 or RT5659_JD_HDA_HEADER.  When pdata.jd_src is RT5659_JD_NULL
> (for example when the optional realtek,jd-src property is omitted),
> jack_detect_work is never initialized and unbinding or shutting down the
> device triggers WARN_ON(!work->func) in __flush_work().
>
> Guarding this call with if (rt5659->jack_detect_work_inited), as
> rt5659_remove() does, avoids canceling uninitialized work.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172155.18=
51386-1-hj351016@gmail.com?part=3D1
