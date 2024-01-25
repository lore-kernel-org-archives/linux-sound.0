Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5271F60A
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706209945; cv=none; b=STMDMotuVtmHqKY+w+dDEWblB+QRvNHzNaFEbdn7B/ehEt8jWyubVb2SIOcklG7stL8oK73EQ3ZZZick01bbUMWEYpMpdXmd0kwFrb+aApPmCh/60YYDotR13g3gYe4l5KpETaszp15kDwdVy6651K52KuOoceX83RAQkX8vTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706209945; c=relaxed/simple;
	bh=mWQXownpH5H9R8/P5+iuEQp/UesRsl7bUMqYRhFDxv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqo+6PY2FO+CA6PZL5Nf0Fl9lBq/w0T7g+N94bnRmiKPde2aT8CHcDMxxzT69pEXGH0F+kMAozavLk7NrbpekN/VsRw/cZKh06L2aT8x2lT/SVWukjauR6afrTsuppWMDCvsxodZxS/YPKkVl46etLxlcSfVqRFba6N2jQV/Axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkxHGz/p; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkxHGz/p"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so53512e87.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706209942; x=1706814742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTuffw53HA6ugoDRsGQyD4P85l0Jg5fzNwB6j2+kgK0=;
        b=HkxHGz/pNNZYnZueO4BPtyXtV1BseE5Et4jYsfsUbc8kWM4NO7d3rFDNxlAOjblr6T
         xso6VDpnPVR0lIvw/iF21h+34O2ZPt/ZSsCWT6BJwdGKam5liqx9ofe/oE1KQ04BRa3q
         RHgc3of2Eztc0G8J5caHjPOMmHmjwiyeEpA8ZBrnEEY92bByNr6OHoES7v/Hi9s2L1f9
         633wRZNhZKi6ZbFCnKHlc2S25cBoJE8YyL7c8pUVflND9p/7/s+MJfeRQlWRoisoDbtM
         1XiNN9OC0BVJecUSY2Q0Ui265WFUdADf68JFsE0gonGAJk08fmJOPLHPs0cLZUy30Alg
         fBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706209942; x=1706814742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTuffw53HA6ugoDRsGQyD4P85l0Jg5fzNwB6j2+kgK0=;
        b=HyGPIqJ7AA9hJ3XjoM5+OQC7dhhoi98twQmMizbulAaPClZiRwSb+M/cti8dTdRAB1
         WTRrkuYxk3DTOunNwIiLQY0amh7M+47Qc9AIcQfC9BQNjzj7QAS7Qx8wEzO9YVOBwNRO
         7hiCmwBQijL8StI+29QfJmI0desGY9OQRrCGyjBjrAYqnsprf3wLJVgHuxinusTRUnYk
         4ALM7okrtQ4K5uJe+JOqd0nmPixNl74+viALh+yLvapTY5UBGbffbSm+j5Jf1nkskLY/
         f3Vc0k1LoN7GGXmyMMj9F+yhtuuyviMDA58cJ9G7iioLzUUPg1wbU922mXFhCOUlKfM0
         BDZg==
X-Gm-Message-State: AOJu0YxiElSzuV8wucRkIZsv+Th4RK6wC4ufPRf7f3JfeVbXVrKb3U/9
	hRv0m9GzRus9g2WfFmeuNsG7bNo8u1rGIqtMgUcC+PsICvY57LaCOMjf25Oge3rlmSd1krSCylO
	FC2jyymXF8w2Gfs9I3eCzdWkyBvc=
X-Google-Smtp-Source: AGHT+IFzbr2DgW8GIVJNnbV1+DHjrXhqslg/F6avzBMWVrzX3kV9kfUPfDfG5RJGEOHPur+i+8iecnXjYbDLbHXJDk4=
X-Received: by 2002:a19:4f52:0:b0:510:e05:435a with SMTP id
 a18-20020a194f52000000b005100e05435amr146518lfk.26.1706209941469; Thu, 25 Jan
 2024 11:12:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com> <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 21:11:44 +0200
Message-ID: <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Refactor the code in cs42l43_mask_to_slots() to use for_each_set_bit().

...

> +#include <linux/bits.h>

> +#include <linux/find.h>

Of course you can leave them, but I think we more or less _guarantee_
their inclusion by bitops.h, otherwise bitops.h will require those two
in _each_ instance of use which sounds not such a clever decision.
That said, I would avoid adding them here as the compiler would need
to mmap() the first page of each header, check the guard and unmap,
and repeat for each header. This will slow down the build for no
particular reason.

...

Adding nslots parameter is a good idea, but I still think the code can
be refactored better (have you checked the code generation, btw? I
believe my version would be better or not worse).

> +       for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> +               if (i =3D=3D nslots) {
> +                       dev_warn(priv->dev, "Too many channels in TDM mas=
k: %lx\n",
> +                                mask);
>                         return;
> +               }
>
> +               slots[i++] =3D slot;
>         }

       i =3D 0;
       for_each_set_bit(slot, &mask, CS42L43_ASP_MAX_CHANNELS)
               slots[i++] =3D slot;

       if (hweight_long(mask) >=3D CS42L43_ASP_MAX_CHANNELS)
               dev_warn(priv->dev, "Too many channels in TDM mask\n");

The code is simpler and behaviour is not changed.

--=20
With Best Regards,
Andy Shevchenko
