Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CA3328E0
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 02:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652463; cv=pass; b=jj2niyKrFsDLxGp+97IUs3FRbr1kbjpYFQc3czf5e53EjN0PNOyETB4939JE1rnTvLBmg0g0Du/Bsn4MOfCq2dRffWcggh9aSyDHV/8DeY/SsWNWRzZfTPa/me0d6lrJldEtYhSa7CWajsioLLpazyjJ2hzO5KDhqC9Qn6akMkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652463; c=relaxed/simple;
	bh=oDVuCZ5Gx/glBVCpME6YGkCQ33hbuczk3pr5ShKRnqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpzFyp9MRvJuEDCek+qWkg/hbDF/TMLYTME46L4xDt6eDqbJ7eaLJeSSgs9OsL7d8t8JB0cr+vOeyO3ipssrkrunXtPWt34ZoG8ELPpXq1HOSrFAGP6GMrZI30Jp6t/bvSBEF4Ig1eKCmpeH4wcg7bVSnM/4h4aS8mynYn6R4F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+Eo34J9; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+Eo34J9"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c227206e6dcso247428a12.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 18:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769652455; cv=none;
        d=google.com; s=arc-20240605;
        b=g76XKkYXxzSIUqX+mDlZHKgLPXf2VsU+avNxOkvJHe4Q2HRjLHFcn2FQNM3RXGUPJf
         Ybi+yha0f0tdSKjwOxlzaRV8CsE0XcPxH0K4HWYBmXk/EQ+KF/TM2nt8XawG9bfcjX7U
         4Cn9koWLsROxwavqboTFY5IkERi8ZfpRiy0nI4B13n+XVdYnabxOwGyTWVESz7g2Z+Mq
         uWfoZ7E46teGaZXgosWuRqHJ7koZ8OP26+cLQrbWH7h17korfsGKA/zhOVgVD549wkVU
         AJOIBXMWfrqdu9Dzqi/p8irUCMeP+wyKV8hh25U1V5t2RUdxGKgOQU7N5VlBRATdKIS0
         Onzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        fh=JOoZPKsehf1CK/D9+WvWFzgNd64GGH/34ocegDUItMU=;
        b=QM1wzta/imE/N+JO/y2JmGmHSq3GA2W2V7grf7Eugb1VD/Rprfz55EPU2wqpxMLzv5
         k5+QEAQgx/gktRJxkrUn+vsQWBifBhiKhS+svTLl1lFQuonbfxRmaOcSiR2r3UbP2+wT
         it00vWJ9R5RVysCvN8eKpZ2IqOZqZGRXTuz/TLlSUiarnrFlvAvkfoQY46GR3dp/FRYH
         izU6sJBfsuc1F50U3z23CjAdw+CqRW6gCvFVvreO3DqWKZwQUUxHJc8lxypbg8oUSla+
         mBmD0tHCUtZMJZbyax/lMs47+9VsOZSLEb4jxP9zBwlGl39vTLB0YUaLmx6BJkSNsofl
         cJAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769652455; x=1770257255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=J+Eo34J9bRemQ0iHJkbQMh3NZHdr6faIJb2+gS6mDUeHGJymdT8MTMpUXY25X1+hSs
         +aS3kHspHL69+knqIGQrHHDwc/appvbBwm9FNbxcSWyq6t6IWmXasPwkNQedmsJ9zCsC
         CUfBxM5Tfb6usYXR/6/fJ9kSi3igDrfJpVQt3DM4I71T8lJtuiwD8RcWqzrOExdIGrmw
         w16pO2x6ZfUplYUQwrjwwsIkiQCChqdJ0r0kAn+HjRqyw/XMT7RusieH2IvQOt+tLyW8
         G5i7HNkJ1hSiqaNFlho98uZrXSLVGP9fLF5Xi7M3Sn7Pm+Z5TsEiWZ+UQ5nu5p1GyLvB
         ORqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769652455; x=1770257255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=GCYy1nygmBnZswzbPOTB9nF5jadsqU38YLTErXHm7j3aEPRoEcDz0V7LTKGphK/vq9
         l4jzbzEgFeqfzzFFC0LqRF5xIUpfE9Qs7T+o/dciEJmd5LqW3hIo+CAy+yOwHA8ylZac
         ZHDtt4zAcGSGrLW+U2t2uMX5U+ra8x+rMCuhyfI/TfxrRIGRCXSRq6TOmB824/o+vYIM
         rlrhUh8Wxrvhj7asITBH3n2qhLBzvBzdsTct0gZywi/G2DvAvEKfUvRhk7pQmhHHbU4l
         HEVRNfBZzxKWam0uBOmmX1zqgOL6OLky5mCDtq+YId8KpJGWJTaXYgnzvVXBc3HPFKgz
         aoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuM450OpIfVJZHkcUQiifsdloAdDMZRnAxF5YtnrMj+ZumgdcouPouoE7Yq/2ppKXUuqYGZk1yOI9CHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLHYxSip2Jlow3upHz7ye7XBztb3Ei0IMk+lcrUOIqsfC/crS
	CAIbVDe4or6r3lpA9/YZExg/mQZe/UpIDpWMab9CLyLikR31tkeKUIN5guritoJYHEervHLADwV
	Tw/ob75k/oiryP8P0WoseTk6voIaINkQ=
X-Gm-Gg: AZuq6aLRYTBfU60O+hA6oZVJUEI6tEW1hissyN7LKt0mzMphzg9bgRbJoBm1+ePSNd+
	plFOMhXOp45Pc4bsqeYfoTiktyOKkOmKAR0qjZrIJfwB6t02fC3tGKmI/cENDg0BXnuDjnXviMW
	sIlg1avb+65H+skZL5JDBRHnmEnpuEqlnXFcl/SDAefybqk7YplsdO0Sr9foDjIMAHfKh1SWTn8
	Fm2WZXqihwgzDGfzLBuitc+hb2nFdjH4jIA2dyoO9quGUX+qLm83OExdG8bz1/nwhys1Sw=
X-Received: by 2002:a05:6a21:9d8e:b0:38b:ec0d:51ed with SMTP id
 adf61e73a8af0-38ec658522amr7340595637.69.1769652454754; Wed, 28 Jan 2026
 18:07:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-2-shengjiu.wang@nxp.com> <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
In-Reply-To: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 10:07:22 +0800
X-Gm-Features: AZwV_Qg-rrUV06PleoYM6kICczpC4hfgzfJ0lPzEIvMPV1d9IUOkAJEm-OUeTRw
Message-ID: <CAA+D8AMb-QPuqXfb4RyFo-9WTaH78WrAnCGTaS3DGXBP74DT6Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 7:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> > Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform
>
> We see this from the diff. Say something useful.
>
> Also, why power domains are not required?

Ok, I will add more info.

There is a power domain on i.MX952 for the wakeupmix system that
ASRC is in. But it is enabled by default,  ASRC device don't need to enable
it, so it is optional for i.MX952.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof
>
