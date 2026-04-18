Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B118C352FA5
	for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776512452; cv=none; b=QBILE1zQDScaahEuVJNu9rV70Vnqk2Dk+n1ArBaAiG+HhKGEzu6oA168xQCClWSydavzbFS631Zt3sTlbZl8LGAY3aZZDo5CmVLy5AVl6zNIhdVN0jCK9l1O3vgCjfIMyLYEUbv+3dHYJEIPN0wl1bRPXxvODATk4lVQql+Sym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776512452; c=relaxed/simple;
	bh=152FCEZ6y9LZI6H9RnVi6/PPlNvFNYw8/yMF/6yJduI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0t6FKsM9L33KVxcEav6UYaREUC5y6BXAW5rzbPJxlcnwMs1yxDzUJTMeNud51nHFYeSPmAMItxdmG/saRAtNCV3/E6RFusFnRFdRyK1/npTJ5Z/PkdVe9c8PuCFSRQjpFx+JZtuyteH7PDMY6A40qadNQ6nJ6Se+xjA/UB75EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=WGMbrXIp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="WGMbrXIp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1260221f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776512448; x=1777117248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=152FCEZ6y9LZI6H9RnVi6/PPlNvFNYw8/yMF/6yJduI=;
        b=WGMbrXIphdlXyDIB8K/AMt8jWqOLjeQ6frUG/vNKdfosHQMKJYUDEpobBKLbL5CtR1
         AN14+kCP9Q/NHiYJ894zWyroTgzSdVrZDWyxGUXsEj23h1jBaUBWvKqBYrtHxtSoOvr5
         NZ00Af43bHgJoacJsTC43XS5T6pRV5hbm7BLMKW+x1ZO9s9JncI6sEke31+l7QXmb/7d
         l/Be5xHbctEae7UlTML9UuDEpjOl3eQI/DVnsTxQloaZf3Onyvf47fSt83gWQiNv/qm+
         N1QDlVtyZNb4J5NxN6q4O+AC5SOSxCJnTYl6EL1ZbkELojscoxRE7nUEwGRKug2fbEHj
         We5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776512448; x=1777117248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=152FCEZ6y9LZI6H9RnVi6/PPlNvFNYw8/yMF/6yJduI=;
        b=IpasRE+OMYJwtI1MNehEnt3QJNJ5A2RU0ZcnUKfSYGjcIctVRDpV6YaswCBepONxLR
         ufTj9zp/h2a75ZlbURpgNNUitIUMoCBqndg3MKxSO2N6VZ/fCSddFN/nLmrpg41A/WhG
         q3Q18jnqjR51NAFp9nMKdyDzh9XfVovCAVMBg+K1l6Mpa2czBbkhnnt7ztOEXAncirYK
         3wkR4cABG6n9u9CDnVbPWFpzMu59tLQ+7niU3nRfX8ciFZePcE5T8IkB6kM/w0R1adGv
         2nuBQx//1b3wcmxGSYS3A5WbEdflVN9fcn+Bkxtmjg7B2mv/K50kq7VKBAMDGSdqpmlA
         3FHw==
X-Forwarded-Encrypted: i=1; AFNElJ9u8MO23VarYHcjpsAzrrnvwOWojBDEGhFJ2U56FoHaPIuIL6q5J02/LHyveLjSHldABesiM3hI9ZAAwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjO3K+1Y9DzX2ub7bGT2ivkIwf7b2lDjCHEZua8OXSghYVczt
	NUYsgLRMDOHru2cRebLjDAz7mAyBEL7tzBGalvjq83WGoxrh0Mg9cOdeW9IdOxJfcnk=
X-Gm-Gg: AeBDieujCNVnAb/cPGUJqqbGw42LN+r/PccZ6zXgkv1WzbZRo5hknyv5n9lmPqQunoG
	H7SaJwTCfcvJ9nJEvq5PTaXF5Zs460YUHXf8LKwj6UEbR/8CFVHxaYA+TfUbyfnkWfynXpUG217
	veS3/Fu47bIhYdqPuRM+KpvOUuWs/SCbXXIn8K0I/urHEoZ+am8XM+SkTm4OvG+go16x3eQwzpY
	y08eLr0PVbEcx7iTI/A8FrxcEDU4fxtt5PAIwZtcKrxfTdgVG1uJtHjJXFXPU221lKbV5+1ORK+
	9JCnppmmbbXyHtZLC9VMqjJpzCW9qHi9Ld+AM/wz/JF6T3sW3vlTQIyxyIldZRzniHJtzcJbi1y
	JKUctDJxLSelMqSUBTz7lz5ogI6P2jf2+rmJU4ncGSAkf4+e//Kz8qiaSTYrGCETuaVRlQwHKht
	jGQPPecuPs+Kyu8LwIhhFTDiQZSpPNzPvV92RCvqM=
X-Received: by 2002:a05:6000:1843:b0:43e:a6f3:b763 with SMTP id ffacd0b85a97d-43fe3e237dfmr10429773f8f.44.1776512447854;
        Sat, 18 Apr 2026 04:40:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e3a341sm13536078f8f.24.2026.04.18.04.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 04:40:47 -0700 (PDT)
Date: Sat, 18 Apr 2026 13:40:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Jian <lazycat-xiao@foxmail.com>
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, 
	loongarch@lists.linux.dev, chenhuacai@loongson.cn, zhoubinbin@loongson.cn, jeffbai@aosc.io, 
	stable@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Zhang Yi <zhangyi@everest-semi.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Alexandru Ardelean <aardelean@deviqon.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ES8389: convert to devm_clk_get_optional() to get
 clock
Message-ID: <aeNrKkEjYDlvsuLM@monoceros>
References: <tencent_7C78374FB9F4B3A37101E5C719715D8BC40A@qq.com>
 <aeI1_C5WGY5SzzcD@monoceros>
 <tencent_EA958964799F4CF9F76BA2D10149C4E9720A@qq.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36zcp734q3dnoypj"
Content-Disposition: inline
In-Reply-To: <tencent_EA958964799F4CF9F76BA2D10149C4E9720A@qq.com>


--36zcp734q3dnoypj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: ES8389: convert to devm_clk_get_optional() to get
 clock
MIME-Version: 1.0

Hello,

[Fixed address of loongarch mailing list]

On Sat, Apr 18, 2026 at 04:18:10PM +0800, Li Jian wrote:
> =E5=9C=A8 2026/4/17 21:34, Uwe Kleine-K=C3=B6nig =E5=86=99=E9=81=93:
> > On Fri, Apr 17, 2026 at 06:53:14PM +0800, Li Jian wrote:
> > > When enabling ES8390 via ACPI description, es8389 would fail to
> > > obtain a clock source, causing the driver to fail to initialize.
> > > This was not an issue with older kernels, but since commit
> > > abae8e57e49a ("clk: generalize devm_clk_get() a bit"),
> > > devm_clk_get() would return an error pointer when a clock source
> > > was not detected (instead of falling back to a static clock),
> > > causing the driver to fail early.
> > >=20
> > > Use devm_clk_get_optional() instead to return to the previous
> > > behaviour, allowing the use of a static clock source.
> > >=20
> > > Cc: stable@vger.kernel.org
> > > Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
> >=20
> > Are you sure you identified the breaking commit correctly? I intended
> > the patch not to introduce any semantic change, and even with your claim
> > I don't spot the issue in abae8e57e49a.
>=20
> There was a misunderstanding on how the Fixes: tag should be used - I mea=
nt
> to say that your commit changed a behaviour, not that it was broken. I

In principle the usage is fine: *If* a commit changed behaviour and
failed to adapt a user relying on the old behaviour, that warrants a
Fixes line.

*But* I claim the commit didn't change behaviour. devm_clk_get()
returned and returns whatever clk_get() returned; with and without
abae8e57e49a. And clk_get() wasn't touched in my commit.

> should have pointed to a commit to this driver instead.
>=20
> In my case, since the device was described in ACPI and it does not export=
 a
> clock to the operating system, it was then necessary to utilize a fallbac=
k.
> Before your commit, missing clocks returned a NULL pointer.

So I'm pretty sure you're wrong here. Did you try reverting abae8e57e49a
on a broken state and confirm that fixes things for you?

Best regards
Uwe

--36zcp734q3dnoypj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnjbbsACgkQj4D7WH0S
/k610AgAu+LKDGBFbOvkeruzFxDgI8KjJ02DhdrZFeCHXxpJvN0WT/lbtVjcB7y/
MA8YGt3CV3z8idnWGk3W9o5ukCNMZWoPTXkjOon8xSPnIauiQjtEw/Afkc96vzRF
IroKFWaGVx0YOV3b1dGTti1YyMCLLTQfGxKtCZPYW8UU64oC+9HNTkHtJkyYqAxC
aZfpvddNGcdGHOMc6ZmauZ98/bTLB4RocqZCkfa7kuTZr9jekmMoryZgJJ9PsXUv
6f69bf4UYxfWp5AnpvSY/6VyRw2dDsx1+aNqFFSC6cZeaSov0ArL3vkVKWd6Ihk1
7QQCoKSEgeYWm/nTdfu2AAI2euNaIw==
=Pe/z
-----END PGP SIGNATURE-----

--36zcp734q3dnoypj--
