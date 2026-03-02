Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B492C3768
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449325; cv=none; b=ixn1Ey31DuCkIvM5rKOf7tzZw5Pkh5sGlU6iFTbfgh/+P2Qs6503v0SnwAXsRUnDsO+0SBjECG6pQ/t388Ou7RGc2oKvyzI9S7Ps+vHfVyWcTWKlTW7RnWd6ZqHs9jOJPZCQAYhpJvdgsKCJb3JOOP87dIUrr+95D7vB6/sJN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449325; c=relaxed/simple;
	bh=FPUUwSTSnHifTg1q09fFBxiGrVRvJtWxYMGk/Hf/oPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmBzPUXgEUVHURdw7DdKKXyOfPSVtQliyEFEfj8asiRhZDtxFScWKgILDzycW7PzUuWDqx3P0i3yOKzlSN8HehQGSVZz/gllfPwODh0OCS/xHmsVRWT5gBID13v+bzDJnTbYr8xy15m1vp0yDBN78Y3E1cA5xilzvk1BCuEJW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWbYPDe4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWbYPDe4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b2965d4bso1118571f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449322; x=1773054122; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=MWbYPDe44zed2KsOUc14yPFYKO+jR1+crKAFR8UALOdYgwe6zoku1UeiELG5KFjJdT
         Z282fgcSIpF0sQSeERm28ejPpbskvZa398Yg2UiSpx2/RC7juHgpDGMjtvTa0Vc0FA9b
         46PvUbwynXZump/jv4UoWLj4K4kXg9K29BluNYLnh7un1liI3grXJDye6PxieBHBLBXl
         ipl2PYX8tQGayaIIpWFrwUqwqay4Rm7K5PsvOdjj9kEMVN+H2IYYMgLJirw5nIQfVKow
         +RsSDNN56oa+ozQd1RHvYBxRt7sUjPfLNeHxZUqmbGeeMXcbFGFqeigVwSnMxRxMEKa2
         Nb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449322; x=1773054122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=U6H6GyBaC0UMR+LI58s3ndNjO5EX9eHeMfrY9jrzeAtPNVm1D2z7+JdwM3g5rrkjuF
         Vt9XIhIjW4vhtSZGuyiAJL2B6pOfV3ki0vS+M7K2i6YBL1eyPq0uvPBDBaY76WFfv/37
         5vfqzIpg8jhEd7vkA4Ac/GVh33lT1UenEDQjTOFf4SYEwVtLINdGIZ6R5pI6KmpIQerq
         YzX49qb+bX4w8wA1fECkS0BvOhQVPvSJPrGC7HrEW+8wzXRzjwOixxJG70Suxh6O1Ljf
         FBPU2UHjMpy2tk55uzXxOVt20piooyalITeavXq7kUTGhkar4cae9Bw0kkD76v+msRIy
         rCdg==
X-Forwarded-Encrypted: i=1; AJvYcCUxGojJGkeDEtuChcvuTwPt99Zq/Z8bl9IvOI69Zum3rAZXF+J+IbnHzJqJYA6vhFUrSIxf3RCrMMZmLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCF9gsTe757qV4Z/7Obh1CEwxcWjMz1WDh+UF5NMDpVwopdnsc
	UGQYO1R9/g9ck34k6Mn4mengMsb1Zbdv6BVRE9+HHP7he2eHSrTXPLb8
X-Gm-Gg: ATEYQzwfVoMlzqNm8PMTnWohCFvmAeaQpGwYJTpcUzRzH8lTxc0aYP99LeGa0fI9Hha
	qXeKjnJr0EpAp7ZdQlp5KQUHt+052T/X8g0eml0qM1qhWgTA1WPtfBAaomj7JS5j2DWXjGO6aPh
	1IuJOYi80W128oSJc3xZrE6YEVVVK75sA6Lp+eT0zmgO9GPGmmOnwjOOfvfCXwJGmrAsR4pqsDe
	jOcg/+axyiV/1KFh+NMqqX2cSxNUrMXUhuhzeJpMjnEyfXkQ1jJyngfobHIvTjvoloVOHzg8KEN
	8CMyo7cvv/MVvHQvdx7dC2om6jPppINyIm5lP5/AbLBrr6wLyOvVTetOpPZ/1LY6MimR9BiAm5g
	pYzJeIz0oK4xR1Rq/haGjPHoOnk4KUPoqqYk8tlM/dbstphGRQH3R4fMujn93C1oNyLSxQucmZK
	/GcmRIMj1ToWS+qbOXzJvheOA3sHT9Kc4=
X-Received: by 2002:a05:6000:2483:b0:439:ac53:a94d with SMTP id ffacd0b85a97d-439ac53aa50mr10380328f8f.29.1772449321007;
        Mon, 02 Mar 2026 03:02:01 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm26841661f8f.7.2026.03.02.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:02:00 -0800 (PST)
Message-ID: <de48f967a50b8f780dbadc562833ae6626be5268.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Danilo Krummrich <dakr@kernel.org>, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Mon, 02 Mar 2026 11:02:44 +0000
In-Reply-To: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
References: <20260302002729.19438-1-dakr@kernel.org>
	 <20260302002729.19438-3-dakr@kernel.org>
	 <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-03-01 at 16:51 -0800, Guenter Roeck wrote:
> On 3/1/26 16:25, Danilo Krummrich wrote:
> > Do not use driver_override as IRQ name, as it is not guaranteed to poin=
t
> > to a valid string; use dev_name() instead.
> >=20
> > Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> > =C2=A0 drivers/hwmon/axi-fan-control.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-co=
ntrol.c
> > index b7bb325c3ad9..ec4bbb104449 100644
> > --- a/drivers/hwmon/axi-fan-control.c
> > +++ b/drivers/hwmon/axi-fan-control.c
> > @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_de=
vice *pdev)
> > =C2=A0=C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NU=
LL,
> > =C2=A0=C2=A0					axi_fan_control_irq_handler,
> > =C2=A0=C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -					pdev->driver_override, ctl);
> > +					dev_name(&pdev->dev), ctl);
>=20
> The devm_request_threaded_irq() API documentation says:
>=20
> @devname:=C2=A0=C2=A0=C2=A0 An ascii name for the claiming device, dev_na=
me(dev) if NULL
>=20
> So NULL should be sufficient.
>=20
> Nuno, was there a special reason to use driver_override ?
>=20
>=20

Not really. That driver was one of my first patches so most likely it was j=
ust some
copy pasting. NULL should be fine.

- Nuno S=C3=A1
