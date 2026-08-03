Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA323BD1B;
	Mon,  3 Aug 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724245; cv=none; b=Yb5L90cvQmBNLns6KIDFMF0apC8C3YI4aOY98IJdy/K8V1bVb0Bw3BRgXxdBwHQzaDyxphnC9+M2FQMvTd2lI8GHi0G6jWQwpfFcUG3ViHacjYazWstBT64fTsqhJyncphKvUYahF4CPYry4p+c2udIARgp8B4Zkcr8TyVgk9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724245; c=relaxed/simple;
	bh=dFufYCbCTFpjoDYzjAiyshbG9ugy5oAi9IlFUnYfpTc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=XxmHNM076vS+79StaZePMaODmBS4RkeLGGqd1sTZtNSIKqQ27+E2lP+u/F1OHkHu7UBmE5ChY+SpjlAbXua8peCRPmBxHxSOK8QkIzzP83P89eOjrXaVKzQ4x6Vncf6W0KRVPxkIK5dVOAntwGhWIZaB7sDsN94KD5C14KrGSQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=gn1t6pm7; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gn1t6pm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785724216;
	bh=VHxV9t8YiiS63VYfe+5FgSlLpbL8CZ/gf+KB/A1f4zk=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=gn1t6pm7CM40vvbh4xckp2ODekNl0vsBrfElAghAIM2zzEVtfTq/6xApxBS2nlfrB
	 yuJfzgwQOonEeE2pEUG2IlPBMLtcUpJAnCd26a8w7GBFDCBc0dbekIYaHeqqnrDGbn
	 BCqHMS3Xlee66acxAfHcoi8wkcsnlcvuaYq3FQWY=
X-QQ-mid: zesmtpgz4t1785724211tfe1ca16a
X-QQ-Originating-IP: kZcIIQPw8yJ2Ij6Xeff5lr9tzuCK2zUjxQmqPijcBAs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 10:30:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7980296911698113881
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 02 Aug 2026 19:30:08 -0700
Message-Id: <DKEYEG48XLAC.4J8YYSOVORZ8@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai"
 <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: spacemit: Drop redundant error messages
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MhJ5K6/MvAhh5H67xPcYXcQ1B4dNgtxDfcR7DDg8iqU5+qgh1Diyv8gC
	EedrHe2S278Ffht/xdUZ3OfhXg6KEZILXZNC/UDgfVZpja32m818XYKUVYzBxII0dXs1+/6
	rtgl8zoohJ2oSwTq6SAeLynM9LW+g+GGIwMG1WpNWxLhCzOhn2MtuHG1PbQz3Uv2iyrBodC
	zot2Rg+MApJsxndjWexzdwXIMgiwtN4//l1B2/tdwPuTXd6i3yjUnxOwc+eJNQGiPUZtTRP
	aHe+lcpBQ/5QrfLF8BgaUg3DnGSwGSweB9PMuCkihnGuT/+z6kHYLe5MuORztu3Rtrx9AIH
	RfxKs/zs1d/LrCvhvGN7K6EQAQUFH+XgI9ZcBsimuMXE96Q8eAyWxB3ra/+a8hsRtn3sly4
	JgZS70KWcJbVo/baO4FifCN7WK9CCn0mvw+tKalhNHgqhFXBYDbaEoex26pZGOiakSMvEJG
	e9z3gl8plk64bdgMY3nnJ+fa4VogXU9KyhT/00iAkqMzu5qnpMZ6vnup5NZ1Sb48arKGlfh
	rrfftXGIJ/szqUYW3BM+cesy5B7a5LVfvtYwYyk+t7Hixf6GelET/sfKearmT2LQxyVZDkr
	uYdZBfN+sneCKXRIHryz2Ab9DobNuGlVp5zPIF2W0qska8MOaI8qjzr/xVf0EPdqdlbfi1f
	vImaRxZYqmXn+IWemCOtdeNBvwCInUF3wqr0oX8gGGdsi6yn9Tkz8Z3/eHj8YP1x7jHoJse
	Coww/1Ijrw0swcsPcC5ZtCXJgwksCq0SiOgMl7kgM8rlIwspD36c2vWT+o7r+WAaLhZX+LH
	Xj2kvEkn87Jj1GNSMs+FVzUQEGGPDnHDXyptap0SmsT9ynVMEnR9cr/EBJ1s5L9WYFnwkYP
	wHZDDlxHVV0U9y/KEQZQRp2+8xm+UJLlZJi9/XsaEeNkJvwc5mHZPwRPC2K0bgKn4IuJvqi
	fFmpJ3pLUvgcObprQwyujwjSvb6ZidhdV026bXit4AH+FGpu/LFNXQ87tQwp2aAD2aLJGgD
	MQ0kaqo4BC/eGaSBNsrm9lkWfhvQxMi1WDuocaWAi3MMhjM2chcls9kPg+cwyI1oYFAIzOA
	599m/0ZDBPFG/QUckkZ+rQ=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jul 31, 2026 at 3:15 AM PDT, phucduc.bui wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The called functions already log failures where appropriate. Return the
> original error directly and avoid duplicate error messages.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/spacemit/k1_i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> index cd461f2aa756..64510c9a1a89 100644
> --- a/sound/soc/spacemit/k1_i2s.c
> +++ b/sound/soc/spacemit/k1_i2s.c
> @@ -478,7 +478,7 @@ static int spacemit_i2s_probe(struct platform_device =
*pdev)
> =20
>  	i2s->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(i2s->base))
> -		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map regi=
sters\n");
> +		return PTR_ERR(i2s->base);
> =20
>  	i2s->reset =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(i2s->reset))
> @@ -495,7 +495,7 @@ static int spacemit_i2s_probe(struct platform_device =
*pdev)
>  					      &spacemit_i2s_component,
>  					      dai, 1);
>  	if (ret)
> -		return dev_err_probe(i2s->dev, ret, "failed to register component");
> +		return ret;
> =20
>  	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_=
pcm_config, 0);
>  }
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCam/9MA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAxQA/2DYCuc67ctUxgO1VADuU8NdphBXB5/3GDya8AM5
p+GmAQDtiqRFSDixu2qu42rj/vId1THpHiepPIVvYmqVFAwCCg==
=ZzYU
-----END PGP SIGNATURE-----

--bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465--
