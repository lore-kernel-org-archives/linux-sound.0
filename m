Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA97135403
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136173; cv=none; b=oNkBd7x6LVQ1jv1qivqq0AElWssdkVFJ1EtW2uwaHH6ZYxq6Fmve8ndGJtECN+v62yHBT91qMrh4r8NCBhbfiqByyOYrpxO5lliOjl1TPdxVZLNnAy6q6lbLsm/Yy/gVziVlWFIpayKK+XXRvb+rBSJlUBh8/5x7/euuE105vyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136173; c=relaxed/simple;
	bh=Qukh6NM4WCRaJv0AHT7llBYLpgcSaOJfBHV+ajCKoe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cyeg1EMetz99WR8lIDSW9Z22t7BO4vOfMhb4yLj1fui/TI3Ow2caoL9dcxKv4TgwsCG6sfvOa2bHNAsqh+ZIA/3oc8oyHZvnBwejARO6bPy9ElHxBP6uU8VhDxi8xUjoQ4m28xVjufI6x6L8KSxyaE4EEcJVeWHdJvJPyJIL3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfjpdfB8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfjpdfB8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a26f73732c5so679285266b.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706136170; x=1706740970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue8zgG0OGtGYIx4fDzhlZnBCUkiqmZh3yBn/xzVgujc=;
        b=SfjpdfB8A4Lf64+Tq+iQRE26BY7xyMepjoH4tEGIk9eRVlL4qbvZUpQ88A0+cEFASh
         5xmGSMZYJiRdBVaGZlcmkNegQsfB213ROimmQyLefVptPfj+nUYNNDQS4kyOkoYMrtV2
         zMHQcszTsAQjBXIoO7LvCRgKyDlQVsLjXMzM9u78adnRa8nP/WfIFuSe1Se/KOA2+xOU
         3xSR+qK5MGzOYA1U/rh14UfWrTg1FEwVWa1pf1BAenoH5c21gicVt19IEacYIn8VCgUy
         Jt7x+aKz/TcELWXfRPdHih+v/nlp1Sq738//v/g1qMGaQ8CVdMKwZqJPuAHom/rTPgT6
         oM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136170; x=1706740970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue8zgG0OGtGYIx4fDzhlZnBCUkiqmZh3yBn/xzVgujc=;
        b=RVDy+SjBuI4d4DwfZWnVS3cp4gA2QyeZ7RJV+bHTM9Y3Nqc73YMe5CEfwCEdNrrmin
         WsGXp/XoL9QshymE//slxH085C1R9BYm+A8UHXeOHFtP8pJQ64jnQh+lEQi3LwYbolSI
         0rQ9URynSSvcxLSr5CLdos03YlQ/qSXemXLsrK+b2Q9D2tueGvRBec0F/0/Sa7ZsAQAT
         j5hn8JKe9btE2VK1eL7tLlq4Dg2o5ovw7LaDhg2WcDP0S7Ip1acFIQWSzz+P/yXSRBTO
         BRm5gl8yAQqKNnTGZxxlYUyDn6JZoMY2iWiw10Lj02yAxIzOM1VYtFHmaZgwCt8+1U7/
         +HDQ==
X-Gm-Message-State: AOJu0YxaWLI5bYMNUfkpuuQ4ltX0dUZxgjV7jxqvfv9rMuOQEqpGZciS
	oQPTiyJUPUrb32DLfStDGZ3z7aLp002PL01+4kkA+MYBX9FiaGmXwHjtyE79i4nfpYdqgAnGLBl
	qT/4YjlJEPOoVqnR8ygWdzkPKFI7RKCPhveg=
X-Google-Smtp-Source: AGHT+IHchyYecXM5b6MLOfUREflDjiLwSN26eIdyuYW7kIh/JLcYrHnz1XXpmgVWcAxmhQD+yFqx0vDmPj+/iAGCXGI=
X-Received: by 2002:a17:906:f6d4:b0:a31:953:5869 with SMTP id
 jo20-20020a170906f6d400b00a3109535869mr23245ejb.53.1706136169789; Wed, 24 Jan
 2024 14:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com> <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:42:13 +0200
Message-ID: <CAHp75VdmpPXmQTDSJLotiYSxVO=4Fn27tWwQsByzYQuZwmHJ9A@mail.gmail.com>
Subject: Re: [PATCH 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Refactor the code in cs42l43_mask_to_slots to use for_each_set_bit.

..._bit()

...

>  #include <linux/bitops.h>

> +#include <linux/bits.h>
> +#include <linux/find.h>

No need, it's included by bitops.h (and there is kinda guarantee for these)=
.

...

> +       for_each_set_bit(slot, &mask, sizeof(mask) * BITS_PER_BYTE) {

BITS_PER_TYPE() ?
But actually it's unsigned long, so BITS_PER_LONG should suffice.
BUT. Why not use ..._MAX_CHANNELS here directly as it was in the
original loop? You might need a static_assert() that tells you it's
not longer than bits in the mask, but it probably is an overkill
check.

...

> +               if (i =3D=3D CS42L43_ASP_MAX_CHANNELS) {
> +                       dev_warn(priv->dev, "Too many channels in TDM mas=
k: %lx\n",
> +                                mask);

This is invariant to the loop, you may check even before it (I'm
writing by memory, might have made mistake(s) in the snippet):

  nslots =3D hweight_long(mask);
  if (nslots >=3D ..._MAX_CHANNELS)
    dev_warn(...);

>                         return;
> +               }

--=20
With Best Regards,
Andy Shevchenko
