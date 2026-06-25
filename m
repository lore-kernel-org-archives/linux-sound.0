Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8080137C918
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782401298; cv=pass; b=BI+5hYxXLGq1hDrlM9077rluGjxw9e83BnIVFRZFblhyDbUKdO8IrTWRv2SHl0yfaDweyqcyGvckTgnKZMmkLBCao4GemK5pqpbl+z8rOaUcHUyslMFoI7vNTYA7BnVu8JrzXdj4141Kx7tGwLpuEZup/OFVU1s/9crYgE7ow38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782401298; c=relaxed/simple;
	bh=nTmwSKXe6ts62Xm441zE3pIks1+k9u5kPCom98bYYeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lq9znDMWoV9DOVmyFEvFE821aSabXbJ1Yf22wRyD3GjWYbYk4ETxruAbu9bifQhVfc2f8N/mBIFTFZ7J02HYe1CMIT4KRtGVyLCBjR4rsaXbcQMaZEMZr7n9k4SaDMjt9GS1CKnsznNX/qM7L3OcGJTuxr2zmwpVpY1lqTzW4zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4zA9Xf2; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4zA9Xf2"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ce0f17a69cso19126506d6.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 08:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782401296; cv=none;
        d=google.com; s=arc-20260327;
        b=fOKu1MB7UIzMECg2jXfJyNGcy9T2I1EvQsBxUXR6nBtHsQi+/pUfYg89svusXQDMuy
         brBQKfxG33v28vzNqEQd/0Ms6s/XlctlLL4gD2o4McZuQJpaNiUy73RJl+UPIWbZpW7/
         KA6n8WhfGl7iwxsat8PeYy7S84rhYdU6wFjq6GvW0iuZmbUNWaJLotuX61hihdp14EwR
         U7har66U7WzsUhD4mufngKKRJO9QJ0JhPjaVqyhF40E4hTjOnzL50dT4MO+6OZzN48uJ
         vAAQkCHw/9cWkHIY5ATKAtvpC5Tl60RjsgXSK/zR3kU6nIMUpSEl2lBLr+Q30Ncj++eK
         dDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=;
        fh=fKPsmKom7bGRZCyL0tQ3dRl1brO72CCPsrh4KGE+C2Q=;
        b=SyW5MJjhhWYkpF6THcfmGu76h4qdPw/kb/vM0kOYDVCmScswVobXWBX0AiHeIFEJER
         HkWl33/waYO38hffVui8TMSVOyhHy1f2YnhgGED98Yw7h4eYN51q1fEjDyaa0ScWlC+u
         DsgpJFy08K0Y4ZhfTYpXMg/9wLbsejZsW5EgBz1SD4YyaeCKHgZT0QPEl2TdkKVSSSRS
         uPN3aCfHqNPoHx2DWodMgNsN6Mpt63O5pcNx3C46/zwweGBuaLAb25Rp2OAhINDw0+yN
         QBYzMXgTyaurTBJ913+F0nuKAojNxLacUA5TAhfnTSoo0bzG781q5gx0JQVbuKi0xNge
         jRTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782401296; x=1783006096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=;
        b=m4zA9Xf2Mc+B9IlQ73JOwSj+0Nd8nAQNIB4SHEErGwMsFp7FHzuyg+qgqO7ohQArZE
         3zREoRkFIk6dgp0vBIEO8GTArqUK02gAB+Ejg3wqbuz4A0ujUa+8VFEPcoML0aKa94Lc
         v6Rv2sQK0toPnfjqVAPLOiCpq9EYL/kdtINSJVGyWIrgQy2SC5pRLPXcAy5QyG0LPh4n
         aKQTrQHvXFRtCWGcQxDxGFDwkuc1V2HcMqosgRHmXmD3eK78bxwdVF/9eYnbz0/LChdj
         me7qyJFnMkmOr+e2jYXZARuB7RKG7QRZihM9MfaxW3aFAMl74BnB7gPkU6unO9y0TN22
         AWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782401296; x=1783006096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=;
        b=cZmzUhcduW38lRlObHRnATSoD5LuVnfb/z3h1+MXx+HYQTSKcT7K9nE1DhWevJFxrq
         o3L/SwAI5jFl8HIGE0VWtT29NbAOzWIoKarXKsB4rtXzpXl/Vg3Yn5CY5PNKaKXOlN8i
         g7JZfXbZvmL5BXD3gW5H4Ksm80mi9G4Vp5jvGkuB+mhYqbbZDDJI+aqRyMV3erTeAIaZ
         7oDcLzrqsje+x5JAb9bypjWugMTR0vG6qje2kOVwc9DoFUTGSh+VrXYD4knEv9kug/S3
         QEi12ZFY+RhaRuBUjZEooO0rVC+FQ5smKnZmtN1kQxm8lM9gG401Qy9HTjMM0F5CG2Cz
         cimg==
X-Gm-Message-State: AOJu0YyxDjrBFVc8QFkUN3ykSs2b+yBoxOsLRah7UIRsWYcOBRdmCOHx
	R+YnbyW4E9qDEcp8Q1V5Sf4RWHfsoGCdVS8NVrjVJvWlJro4zWPsV2H08Ydm73w5Nc20kSgfnJZ
	ROvmDY5DQtvJouiXV88cQCpXzFo+mYUI=
X-Gm-Gg: AfdE7cl21TzttIHzSCwGxaLYD0BQxo2GVrdCRsbe9sIvmkfr9X1QVG1Hsxv2DkDVZUa
	sZ/oyKMalU+gzkwqAoUbAnXj5ihMQW/+lVrgIgtG95+d2tLFsn7HpKl4mQIGaLj9g3152F7I93t
	p8x1J7A1p21mdfnWmYmBRTzYq3d4xn5mq5dx4vNExSqc7CUxdz5GOF85Fv9bqRyc2n9ZCNRmp/l
	6JNcdUQupkPr+6E/ZdwYtRFWwDfr9hXBUq1tPpP4zZU3IyxrvSinju02/RhveTsdSj29jDhkQed
	32kp8jeEMYlwMPJjCjpPUhrqxlC3u3eojA5gvt8ZAdkdwaIx6RSgmDytzLRs+Mohx9s=
X-Received: by 2002:a05:6214:5987:b0:8dd:7a07:3046 with SMTP id
 6a1803df08f44-8e6d968d428mr54431736d6.42.1782401296470; Thu, 25 Jun 2026
 08:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604203623.162640-1-manishbaing2789@gmail.com>
In-Reply-To: <20260604203623.162640-1-manishbaing2789@gmail.com>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Thu, 25 Jun 2026 20:58:03 +0530
X-Gm-Features: AVVi8CfJ9i1hrsgaC899ejQ_T6dkqai50m7ftNq7tqvPMAUS9Ij33c1efD0NHEw
Message-ID: <CAJvdc_eYE6y-quKfeLocrF_PtWjmaFY5m=h3w9KdKktjxy+4sQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] ASoC: atmel: ac97c: Fix IRQ handling sequences
To: perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
Just a quick follow-up on this series. I would appreciate any feedback
you might have on these patches.

Regards,
Manish Baing


On Fri, Jun 5, 2026 at 2:06=E2=80=AFAM Manish Baing <manishbaing2789@gmail.=
com> wrote:
>
> This series addresses two hardware initialization and teardown issues in
> the atmel_ac97c driver flagged by the Sashiko AI bot.
> The original report can be found here:
> https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gm=
ail.com?part=3D1
>
> - Patch 1 moves request_irq() to the end of probe to prevent a null point=
er
>   dereference if an interrupt fires early.
> - Patch 2 reorders the teardown sequence to free the IRQ before disabling
>   clocks and unmapping memory, preventing a use-after-free.
>
> I am submitting this as an RFC because I do not have the physical hardwar=
e
> to test these changes, However, my manual analysis indicates these are
> valid bugs, and the series compiles cleanly with W=3D1.
>
> Manish Baing (2):
>   ASoC: sound: atmel_ac97c: Fix IRQ handler null pointer dereference
>   ASoC: atmel: ac97c: Fix use-after-free on driver teardown
>
>  sound/atmel/ac97c.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> --
> 2.43.0
>
