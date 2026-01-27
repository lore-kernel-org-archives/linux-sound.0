Received: from sender4-pp-e108.zoho.com (sender4-pp-e108.zoho.com [136.143.188.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0233A6F7;
	Tue, 27 Jan 2026 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769551954; cv=pass; b=OY+o8xybsOZxIaMiQKLtgIwnvPwFDsxxd5w3Z9AaDOZQrpAXbvGyDOEa7NWrrcQmJT628JmCfc7145RLz5cpj74cYfK5pASw6TW2twoUUDXiTnCoWNweSUUEbgGbnkOGEoWe3csNkGspUXWGbnnyO5Lad93ES+VkY65NKcaNCqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769551954; c=relaxed/simple;
	bh=/yIPtSetq29iBS6Fb+rzbr7y6xYnFJZxJ8v8z7DwNHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoJy08T4k9MEmP+JUNG5If3Nzleoq6RX6v8FFTLoJ5GokAMe5Lopco0glXkyGCER4ekh0NZwnSQzHjRygEArNhzrhZL4reI8TKEyE3rkTRGCaJTrr85JJJacw66U9Qctg3JaM2gPLJAbiKIOlCk0Y3CONYH1jDckNBnBeuU+br0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=jOaQpXak; arc=pass smtp.client-ip=136.143.188.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="jOaQpXak"
ARC-Seal: i=1; a=rsa-sha256; t=1769551931; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KWWGP3eQkiPTtzLBHpgVlyQavNZ+Eratv6VCREuHhGkd+yJ55INII+aCXslQf+O8tBA1yr4s+hK9J5R7a/FWXGZekbGPDdJ9a7kIMPILKgNmWynXNMaI9ZJ1xa025w6CsXtzA9GGwp9pfuDXieXVfpIv3uAamtwtlXKzh+aBfwY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769551931; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WlQt+ss1G8efG2qofo6jb6A9w0j4Ayb6P7iOr7JnFrA=; 
	b=WVYweafi6F15VKpZgZt2+jpwkjmkdjU/wxswjMv0BB4LsWuHukg/m6JSDzr7Z2fSq+yJMb68F2Pg3FLHgugDBHerLSXA1YfLI4ui7DrVw2k0L9LJEPrfu1d3vAHZSy6YERIwHjODgQX9tWTVeEy7+WZEOJ1SSBvOzoZL7HP7xuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769551931;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=WlQt+ss1G8efG2qofo6jb6A9w0j4Ayb6P7iOr7JnFrA=;
	b=jOaQpXakYiSid0wpQGxBiKmIkORxIDMIw7i1baza6GrPASuNvhwtlvU2AAx3NreE
	WLwk9Y64V/yHOeXMYYsgae1kiqdVH8McECYk6cjxJw1JTldVJF2mGIKauCQpXrDJFmc
	x8+BmDK/8RxTNTQIl1Fd8y/wuGdeBBG1TYzszUWI=
Received: by mx.zohomail.com with SMTPS id 1769551930714470.1972618683276;
	Tue, 27 Jan 2026 14:12:10 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 66C98180DC7; Tue, 27 Jan 2026 23:12:03 +0100 (CET)
Date: Tue, 27 Jan 2026 23:12:03 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] ASoC: rockchip: spdif: Use dev_err_probe
Message-ID: <aXk31GTmK_5wUQ9t@venus>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
 <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
 <CABjd4YxVQfp=ZuovBhAzqX9pDBnBmntQoxkr5vXnToPc3pRARw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zckbwwqnfppx2fwi"
Content-Disposition: inline
In-Reply-To: <CABjd4YxVQfp=ZuovBhAzqX9pDBnBmntQoxkr5vXnToPc3pRARw@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/269.526.30
X-ZohoMailClient: External


--zckbwwqnfppx2fwi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/10] ASoC: rockchip: spdif: Use dev_err_probe
MIME-Version: 1.0

Hello Alexey,

On Tue, Jan 27, 2026 at 09:31:18PM +0400, Alexey Charkov wrote:
> >         ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> > -       if (ret) {
> > -               dev_err(&pdev->dev, "Could not register PCM\n");
> > -               return ret;
> > -       }
> > +       if (ret)
> > +               dev_err_probe(&pdev->dev, ret, "Could not register PCM\=
n");
>=20
> Shouldn't this one return the error code, instead of falling through
> to 'return 0'?

Yes, good catch. I will fix that up in v2.

Thanks,

-- Sebastian

--zckbwwqnfppx2fwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAml5OC8ACgkQ2O7X88g7
+poEWQ/+Px2Z+QDfvYva4Nx6YQX53SGZ5rb10Dyq8gZfaZ0jK2fV5/EADqsmV9kK
PqTkajCE8T7S6VtsoaodMNlBNqJk4SkcGltYYW7op440nNaK4GG4s4eyWwluqiER
F4U4X8vgNoOqhziacZOvgDtZeWPDwK9fVg1a9u8nlDBDpsXJusmnzmk0GMtd93Dg
fPG2Dgi+gysuJvv52lm0/M47hgKH9jDhw8oDTBERlu/RLFsbjDuBQ4Q3Mfci75JK
dVygcLJ+NNtNfVWpJWPtQ77eHTKSraZ+l90sJFKzj3+LBfTeU2lUqlxqU2AShEqE
h579dBFVQXfaqnFmLPpxKtf1WF08/7cBLKtSugUuHHrNFQVzYpMy/LQpn/UXj1H+
hEf5aRlVlHDIBaZcLjLvabN9ygVjgXtkdwjP1/0qQUVmQupQFOnmiInotZ+Hi0xG
YhgOqJnGmB8AfYtnu95tGrBwGl9Cln4+q/Wvzr2kpQ+xPB6GZtq/vSCoMZ0ouROs
UmkjUyMUYJ1R7Vy16O8p+Ip5te03mZydnfO9ROG8bBVL75bIUO5+nJHSU2PryhES
OI2jw6JIQuHv0STZc8mnez5V51gwHgFClAegrgm7F/NN2096HhZmJ0062nm4OosA
DMau/+v77SY6wLlB975j1bcGISNtkCBnR4LD8rrhw6L8cwq3Tnc=
=T0r/
-----END PGP SIGNATURE-----

--zckbwwqnfppx2fwi--
