Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B594756AC
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859521; cv=none; b=IEnqh8rYAYJM0N26H2hK2+kI/huuUDty//3gFPGduF2syLPpuBLvY3zaIhedD60ms7LzNHirL8FObLVcLnHrPt50XGyQmMGJoEox17lIKDar4KkT+L8PvtkEv0dThnyqomU5UKR91tXBQTZkVpbzJ+DWH0xP082etF1/aYQ0xRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859521; c=relaxed/simple;
	bh=QqOvZ9LltYbgDT/ws3cVSCdmzsba8fl+vSNqPXxNF6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj4Fp8w4En2LEphFnqVrpidoEB75+t1qruSjYhA7XGbgZ07X9u2WXSOu/YFg4Rf/50RQ+xJ9RzwuHMe7SdwtviwnBWHNqNtdwpsbXV2mvVGgdqpiwM+wSe2QRxt/I22W69q5jsh83eXlcfR6Ycevciq0ib31yfCTPMtwYGwFUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONPcCjlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONPcCjlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDDE1F00A3A;
	Tue,  4 Aug 2026 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859519;
	bh=vbOdgI8/oCDXIZQ4Rp5DK1v1AGEZMqYLG/2x+mdZg3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONPcCjlzMYA8jZApyqNSI3cjRiqKDoSf//PjHDRCMdUKEW+CFmOC4ZQa1cWuIFMsq
	 QSWWSCSMHswiVIM9HgAJEUpYSwsiwCgP67Un+jTeu5rM4Mm9TKbrhiXQdBcdwLvkKl
	 fEdG9z/DOq1tn5nPsEzZjkb3AC4iti/mea5CV/G6oQ1NN39Inq6KNkOYKlabN46a68
	 xo4ZSItpOboDoabrLbnBQugcFNuBM6IJiy1cODj1zWZ7iKODTBMrnQA3oi8hKofsgr
	 Geis9SpFHrV/mUSKy0J/b3QaIbwqAAKSg8yEkyn5pgYeTkmw+J3AyicuSfXyrJrvAr
	 7yOYWSWKcitnA==
Date: Tue, 4 Aug 2026 17:05:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, derek.fang@realtek.com,
	pierre-louis.bossart@linux.dev
Subject: Re: [PATCH v5] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <45c3d0ab-1136-42f5-b722-eedd499a4bfe@sirena.org.uk>
References: <20260804104828.557228-1-shumingf@realtek.com>
 <2fd91870-51d8-4604-a281-36b6c234d737@sirena.org.uk>
 <anILbp5sytyR7rGz@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SXcOEZ4mhVvUeJXV"
Content-Disposition: inline
In-Reply-To: <anILbp5sytyR7rGz@opensource.cirrus.com>
X-Cookie: Biz is better.


--SXcOEZ4mhVvUeJXV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 04:55:26PM +0100, Charles Keepax wrote:
> On Tue, Aug 04, 2026 at 04:01:44PM +0100, Mark Brown wrote:

> > /build/stage/linux/sound/soc/codecs/rt766-sdca.c:240:41: error: implici=
t declaration of function =E2=80=98sdca_irq_cleanup_late=E2=80=99; did you =
mean =E2=80=98sdca_irq_cleanup=E2=80=99? [-Wimplicit-function-declaration]
> >   240 |                                         sdca_irq_cleanup_late(d=
ev, function, info);
> >       |                                         ^~~~~~~~~~~~~~~~~~~~~
> >       |                                         sdca_irq_cleanup

> I think this might just be a topic branches thing, those functions
> were introduced by my recent series which should be in your tree:

Or it's missing includes?

> https://lore.kernel.org/linux-sound/178517447302.50339.149980331405646910=
7.b4-ty@b4/

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--SXcOEZ4mhVvUeJXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyDboACgkQJNaLcl1U
h9CuUwf/aRhLpBtHBWx3v4xIkbFZUMGL7gO+urQXXiXs2CrrBijV9T+jOiNwu+z5
olnK0QOc0GqlaSqzcfSdGVNoE6MKKy5yaxKYY7Rfz6Zti49Xf3ZhJyEuU+GLnzX6
IacaNxeAvK3oAo8VzFvrqf/pcbNCMOipkQnH9DMVuCpkjprKbWqYZ1VUbZKeTRv9
2ML7mvo3o46yo57oHhVh0E53K4XD0amob+TOP/CSG96Dha8Laltk1BBaGzhZPrgZ
VrtfWUXatKUme25DPhjUXbFBK91kjwRl0JsdAoj4QtEZ+fd8/IwRTN+NMs1ZUUUp
yCIcRw4ava81MalKwbZbi4HlszR3mw==
=wHgG
-----END PGP SIGNATURE-----

--SXcOEZ4mhVvUeJXV--
