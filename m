Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361523;
	b=rznrXUxx2ob+QX2IVa7SQPa1rz9mKGP//AtXurpAchOy5CzYuxfghbgPClsBSWpmLuPr
	 Iim7dy2YhaqXfUM/6kFgw0R8UZk64SCvCU0Y0OtRaaXMC82wjGnVyBJEzjDL0jnRnCFQn
	 BeP2oZzwvnwnJSAMwybJOtB9HURppFDtpFf+rvs8IKF/50cZK54auPe8bVZZDqntgXSt4
	 Y5iOQ6JqhGg0bITicgzm/AUWBEcn9Xj4YRDxAWBq9qgYI4Attn/ZK5lL00tOXziWcNvPA
	 k4oXMt8C0CnvHH+ayTB8IWzeGzmwP0ZDQzverWEtAlbN7Z4Z73Bk/bd1oOAZ9Xos4Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
	b=ln33tkzishYL+XBlVzHM/0GsnllKocMsJ+8lYDod9/kFLfQ70m5uMiCuVZEiHu3d/hCW
	 INR7N9oVYYEHXlWt8ZUpjUq1ViDRuWE+oLWP5IjSZ/TwotrTyJe8MWyuY/EtLfN9gXuur
	 ayz3DKaKP4SuPHtzmFCwT9Psmx15FU5lOKnlnw2eLDb1k5pQh4ZLIRXny9LfParG7B+DD
	 0Gq0OljNy2Ge/kHdo2pvRL/1w8uP0AyvQF3XqzK4af1SFN6348gfbb37wL1TVMfYXyyTd
	 gPvpmeb1zdA+RqbnkTB1tHvxUiItUKO0bG5knwcdkhRr3A0eY1Pd3SbAm77ImJC3EYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfoscHDf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B8606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfoscHDf
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7987517aso15018825ad.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 17:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794361522; cv=none;
        d=google.com; s=arc-20260327;
        b=l4gm7klS/otF9juTcfl+p7i4d70N5XZG4PyyRQU/n9tr5ToyrNVAFCXfOHbjcPBtEe
         qcn2X4pd/FLEA1HCB3xb8c/zlzJVKJKRDoDgG9X0mn0AVaTM2+gusmJRIcyUFQHb1//+
         WMGnica5E19S1GfCXaiPGiyuZZSk0ds6ocScdKN0Bfi4IsvCmzYunvA3sZwjhHHJDmry
         JAvAs2YNRJ7MXe52LH14ym9lBSdN1HVoeutdg7YKSay9fqhGMYk7ye7EQQMP8+SWWNYl
         5zKOLFAl4j+wjI1o+W3BrYvTaoN07voddAlTou/+mwxulmr6eFNSGvTxIOCwOWvD+hsN
         l6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=Y265P7K0S2F2KWXZdVz0vUJqasW02shZah6dwtpvUMBhbfrqAVDDrNgutJqGiuZSIm
         BJDoqwMkeMYLjXB4cOV4SdYGKXOmtbIh0ukOanqW3IcAlvB+SyTRq2pnsT5l59oIp2em
         28pyJQWktaDKodjE9xfpynwClAd6mldqFP2Rn6+Xwo9PzV7pvZ0AEBRe9UO40QiLEWLf
         Plvjnf+c1M1zsKL5RLtdgmAbjzvAeGDRnmqB6pR0nIVGjunXIwyzU9vGfNlAJ1w6D7/2
         uy2Zt3qM6ioiGKvm3aNwwGWBeE57ZWIyhkA83HH8SfspOsG9agpAkiNzUM9QDjdnX7pE
         kh/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361522; x=1794966322; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
        b=wfoscHDfBkbI4PN6b76xpwmMtouJv/N3wZLugSwbocAP+WkXs3IvOrbKzPtwv9VPYz
         C7PGYLA1VOKRJxUDPernMVVBar2c/xHfQTsXykqtY0dwB9BwNFQ+ffI1HElRdcQVPPXG
         s2BICwxdMHbdZPE1nR0ifP2573SEbCqsOSXlmrSRXDM2aK7b+0/NbLNn4OLf8ijWxf8+
         /rIuo8iAeZuf74Jz67RJFbiT0ARp9C0FsEfEZjRjAjSJ5SoPBQog4CwexV298YadJ9S3
         EsmA70YXGcwQTphe4g6j2DM1DbVkffjv2r2GERSpWmoCsPtKuVb2Xe1sDHCoL+WtwEzE
         Qjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361522; x=1794966322;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
        b=SwV/ywQri0FwVBJNd4cqWtdtqN3MvL7h/Apugt7uIIUhaHwaKA82617j0ugUKo+p0J
         NYUN7wqTre8iZ1FI1igv/+lD1uvwhdmgjuN4c6SwXUtry2FlUJKTmI4Tgg/a463SvXVa
         71UZqmdr9Tr22ph4Ts+N/+UjDY9LX9mis/Ct2lpEb2njowdNkmXF78ub+SuJYbpqJ4lN
         o9GBEfdZC0zArSOwj0nnud0CYGDygjRZwxfLIVOn1cWv0+Elk5R5Cna/5wNX4pLC0HhP
         jlsdAXY8ZUhMIrl3usXi6Ua64I//D6rrxqXoUh5xCc5otOVob8nFo3l6whaSbonJFIg+
         fCsw==
X-Gm-Message-State: APuU4Z9LPlswWw0sIwMkcnCafBBsbT8dO3FzdR1cYZn4TRFS4K+9vxqv
	DmeUBoYILCs9JEKJw//ZE34LzpszAxldXu/gAhZB+6JUrYe167nrqhJU07ixu7baeBmny6ww6l0
	RLy1hQFDScRUtGlgdhY5PSLN09Ib7b7dPExI+
X-Gm-Gg: AYBFou0vqPqNbL1CIYb4MMQ6slTTAtA9uE0zUXElvY17+dPGO4HWawZeQuQHNibRPwM
	EhZHwYnz2jvS1BMxHD7hngoKG/TbxVrKSGbILXyYDCgd2dNYDBEkX7vsv/pqOYx+0KZuhNn2gTg
	oimx5GJ86j4ezasYrZh1sSOOoOTVCRS2WzH1ujmG4dkDrwhHFp4ehkKVdY3puLO7BgpKSzPSoVC
	YtglRQ4uKj9cnQ334phP93mJXvEnx9cbb8qiRC5RR3xRAYYhEIHP8O1i+3Z6n0soQZixwhnt4dZ
	6b2HMEiA6u2CDRMBWhFwmVj3oqXq2udxXsU9+cBcd63+g3pmJ9IoFWMVUYm3xP3oJmjW4vrCQxr
	jYwvLUQuxUwbxtnHMG81GvphbjyPxX8SarcPVH5NSr6aVcviATtoiIpLR49Ev8mLEOIrLTeUH53
	YCoMdYH5ekUYdy5YT84YmSk1yh/0+aym3w69d1X9JpOAbmD3V5+naFO1BvphnjNe1OkYGvcA==
X-Received: by 2002:a17:90b:4b88:b0:3b0:d0c5:c110 with SMTP id
 98e67ed59e1d1-3b182f45179mr883244a91.56.1794361522497; Tue, 10 Nov 2026
 17:45:22 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
 <20261110095525.504660-6-phucduc.bui@gmail.com> <sashiko-outbox-206833@kernel.org>
In-Reply-To: <sashiko-outbox-206833@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 08:45:10 +0700
X-Gm-Features: AclHuK-kPTPgQfmc60tjT2iHYfFGRxXNQL8R27UwPHlPQqdF56VBND9txVrlVgk
Message-ID: <CAABR9nGqVdrGYD8mz5bLLkXgqcAzD65H88iD0pddb9gog0aC8g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> > index b0d3413c27d2b..0d2be2d8d31ae 100644
> > --- a/sound/soc/dwc/dwc-i2s.c
> > +++ b/sound/soc/dwc/dwc-i2s.c
> > @@ -961,8 +961,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
> >       }
> >
> >       irq = platform_get_irq_optional(pdev, 0);
> > -     if (irq == -EPROBE_DEFER)
> > -             return irq;
> > +     if (irq < 0 && irq != -ENXIO)
> > +             return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");
>
> [Severity: Medium]
> Does returning directly here leave dev->reset deasserted when
> platform_get_irq_optional() fails?
>
> Just before the IRQ lookup, dw_i2s_probe() manually deasserts the shared
> reset control via reset_control_deassert(dev->reset), and later failure
> paths jump to err_assert_reset to call reset_control_assert(dev->reset).
> Bypassing err_assert_reset leaves the hardware reset line deasserted and
> leaks a deassert reference on the shared reset control.
>

Good catch.
I'll update the error handling to ensure the reset is asserted on this
failure path.
