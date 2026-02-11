Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB036BCD2
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808721; cv=pass; b=de1+umeiBeAbr+FdjXGRcrRoWqP4B07f9v3DhFy/cLesAMLSXjHC1v+qzA1RxVpQMCC178z5aSFo4LGIJ02Cb0KIbRwxDsOl65H9W+UGE8/5L/z0PkqVWRZtF8BMquTDz6An7MOkKSsEYJRYF4phKJUEaPFZV1AevVpQ3hfB/hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808721; c=relaxed/simple;
	bh=5hgrsko0i7f6QMF9iWY6a3SEqKH81lnUbsBN0wjCE+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQtOik1G4RhMBp9zPs4Igi/o8cJys+4OweRZC5JxBOwcPhFkFc/Q7H9tl1GGChkaMqsElu+AUU6ERvWvhZLc32wTnVC13yk9H5QvtmhIrzLXufr46Ks6wnkYEJGVTpD5iB1jxvK7oIvg/WU6hvNVqC3tITCBpliCnjyw/JeojBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/zmnSZu; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/zmnSZu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8249fc726e9so269454b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:18:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770808719; cv=none;
        d=google.com; s=arc-20240605;
        b=QNFw5H8xdCj6rr3lpvBAMT7SCTXUdkuhivZRgjUSZyhj/6qnwL6KGXC2iApCVx5bxb
         sAFoUANFzjxY+GIHU6JzC2KNvhAWomILQFlWOPAxU4UzE5PYYwBxJ40WG8VvZRxGIj1Y
         5a+l7FOL7zm2Gij6mpay4D+jeMOPp4u9/TMV+KHQdF7G19fwFm7CRSEmmzz4elkLQ8Lt
         3Z5fHWqooZkdJGWe205obOYW3pzPVHNFA6hiJpdWE+PH0kSwD8bUk3Td1zVGV1nvazqj
         ocABULjVWdI3+gttElPWVX0wuCR9MUDJlRo10OVMz6QpYEYylSw81TelpERclnOkekM+
         QRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6s4BIBUKN5D98c5LNrzS0ZqPHn2vIMg96zycq33zJo=;
        fh=KigxiJtDV33v+GLUxQPQG+014KO+NrkZney8MSPKbhg=;
        b=bdrVHeuESwdyJbT5NE2DX2I8ukj61pk2A3LR7wIjBCm4yI1VYZ9kLhdoM6R247F1h4
         R42mXfg/xJIfs7PRCTiFiS04ig0CfnjX7dVRtnO/yL6YQg9X/9CBa6jppSkbdmoFVAQ1
         iFPvWQmxPYJymfx3ItvqDIkQlAvQ6OZZeG8UM1rB+5EgMdhbgrqh2H8DhJeCIMQ9Abqk
         7bEaFcy0Lauz/OXuvP/U1kWQP3rVWtqouOezSc+lFF3j4K53ZBBNUZEB9TZ3Gu9si7ZP
         c68IglAWC8A0dGY7vygcUvI4tzxwwCaVWjPetUoWniYVdZIdqMYsbm6oz6vBVxCms0yv
         jYCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770808719; x=1771413519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6s4BIBUKN5D98c5LNrzS0ZqPHn2vIMg96zycq33zJo=;
        b=h/zmnSZunwi7ZHwOHC/4S0ZACv5qTRDW1JiOkKM+PDXGfLcGcQzm9rTAwu+Je2hhNf
         3PslPIEX7zpHtTdsaJDIND5FxsC+xVX40Mi96uJqqCWah6RmY7Xhuz74n+dKBMuQ0sVB
         rXsdgkf+uKsVo06ooefKFLSQ9OYqdyn+4In5SUcW0L90ALpWdH+37CxEPtYuqHIlrsyN
         /IcgLeAFh/3ed8qB5jPcwhzKTbJJyuZ4TqDvW4kPS1EaxoUU43yA2+CE3oyZxIDFhBZ3
         2IEwpNtBBoBV0phxRBCZ2CuAH6uui0y7NGUWIulNashsNGuJiGPtllq9KCu8ufDj9BDR
         isQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770808719; x=1771413519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6s4BIBUKN5D98c5LNrzS0ZqPHn2vIMg96zycq33zJo=;
        b=myBR74UZs96Nu4bPMZYnqAcSimWar4tIXULK6uMJpJ6J2pyoWl+NHI6sVLsLknrf0Y
         cWlG04f5mg+83y3x0g06qry5SN1ErU/fNNe1lQNmsMQGVrxjIyY+eDzj1F8K7KRS/Hpy
         jRskVuyTRkIaLswtdgTH8EjrMnM96bNHEEckkTWeY1NbWw7emrG9CyRYUjMs1wP9Gxt/
         sDmwki8vlXAXO4s9qdMTMfFz1QmPYzM/ZSMAVfghFkr0s4jqPOb4YLD1A4MD8BNsRXgD
         RUE8qvp35h6UvDOYriJ7rRXP0qeT/dc013qwqI+udGkOr7yRR0db6LKZm/g2jn1XBB8J
         1F5g==
X-Forwarded-Encrypted: i=1; AJvYcCXw0zXdDgypLcdLSIIfXl718OWbETjIKyyLZKv0kBuGEI8MQchWogXtRIUUFp3jhKU9jKITq5ua33ss5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjxf5rFRkPgXY83ZFGdEgPp3qDQEkAuST0gIb18wCaEVwiwE/
	TpB9ISBoaV/Q6R8YmKt++CTwsM4ovnOrRT2QVDXLJdhtZHJUJnm4sDRpXnHLvIB2fzyBTCBZ3dp
	/Jyyvl3SRq171RYtj389ekJ/L7U9mPls=
X-Gm-Gg: AZuq6aIXUURSLCb+dCtHuNVZ9xhQweIuEIckDNaONeQegq944AtPFZb0S9pDzwU7YzG
	s9TvcZvEXvxoQP9swYixUrVGeqpI1binFBoB68dgOlNaqYLfIDj5tziCOx0Em24lNQB4UpZmF6a
	rZzs7KNDaG19BhIUdiZHUUSwQfQ3x+J7dSCIU7wyjlfAsvNkfdwMToEWmS+RV6qAT44twEZqzDZ
	4kI9eqgwyB4aGC2GqPIa1I2fjh4QezbwYHKnNSVvOao4c3eOAPNf6Al/6DSIRUIBHXlzPaaI7rg
	2XCoV3Ha
X-Received: by 2002:a05:6a20:cfa9:b0:38d:e674:b60a with SMTP id
 adf61e73a8af0-3942e3bd579mr2494359637.36.1770808719278; Wed, 11 Feb 2026
 03:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com> <20260211093527.2892297-4-shengjiu.wang@nxp.com>
In-Reply-To: <20260211093527.2892297-4-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 11 Feb 2026 19:18:26 +0800
X-Gm-Features: AZwV_Qjg4jaxdD6mOKRolClKPwzpCCO-1jFoM4aMo9x7m4KpJDblvAVz40iVzqA
Message-ID: <CAA+D8AOzSJPzBRfWwQnsASt=tPiuQcUvY=5MF0OXJuj5ymvyrA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: ak5558: Fix the supply names
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
	tiwai@suse.com, ckeepax@opensource.cirrus.com, 
	andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Feb 11, 2026 at 5:37=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> According to the binding document, the supply name characters are
> lowercase.

According to the change history,  seems caused by the patch which
converts txt to dtschema
So should I fix the binding document for this case?

best regards
Shengjiu Wang
>
> Fixes: 2ff6d5a108c6 ("ASoC: ak5558: Add regulator support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/ak5558.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
> index 73684fc5beb1..48a690d81047 100644
> --- a/sound/soc/codecs/ak5558.c
> +++ b/sound/soc/codecs/ak5558.c
> @@ -31,8 +31,8 @@ enum ak555x_type {
>
>  #define AK5558_NUM_SUPPLIES 2
>  static const char *ak5558_supply_names[AK5558_NUM_SUPPLIES] =3D {
> -       "DVDD",
> -       "AVDD",
> +       "dvdd",
> +       "avdd",
>  };
>
>  /* AK5558 Codec Private Data */
> --
> 2.34.1
>
>
