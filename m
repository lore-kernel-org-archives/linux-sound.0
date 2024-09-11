Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9411F1B78E3
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726079213; cv=none; b=Ouj0miwBIfaj8WOemg7RcnGsaUvGJ5QsSspm23Vgh/7HLrbTKs9c/besplLZ3wf75IfdQLxa0CjyEL1ZBzOOclTtxLcLPx/ybpeQp4fpulK/TKRDSZ0t5iEcPUcczqiYgCFdL5phRNZslN/w7SYcrFN1CuiEsNC9Xk419W08Kgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726079213; c=relaxed/simple;
	bh=SiBYQogZ7W3fgRHqvzLBeYJtjY6qqWWBd6G/SBt1mb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCESI+3AuIHpCEDOnCunWpu5GRjJqWcQKmRe3QlqqhZgNTpONlmaecEqPM75RC1aJEjdEFp11wdqtKyXbsm3JdCn/anGmAwrwQvTpWOs4UPEyMd/sCaaUNzKVCQZVYy4Gd995FUZFq3chvnmE8gXNCoM5PSIHPZuFKIi6nhTkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qL1qkbsB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qL1qkbsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6A7C4CEC0;
	Wed, 11 Sep 2024 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726079213;
	bh=SiBYQogZ7W3fgRHqvzLBeYJtjY6qqWWBd6G/SBt1mb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL1qkbsBMTNioKNJQW7/PjCxfOT3gik50xole5xXZitc+Coxq5oqnPU8NvcU9bG0a
	 Zy8F+iNXMGYGcE76iMSYk8FI4eMq0HBF/WjsQ00THukO5Am9L4YshORV9Ji6krHkUT
	 lf2P0j9RVaMJNlsX8FsRJst0WL6FSapg2SiJGUlD2JCic3Dc0RLgkYJU+kcL/xe3kq
	 o9t7pGhsdSeKc5Hjyo+G22vKfbfaCTNBvt+/rjnmIEnWmTj2rVsnv4qgyJqaSI1gl5
	 /b5DNfjKlF/EKxUHYdjoFHMSbsWr9Hu27I+wX7+VzFxC6CekIeo9thoMFDdg9LLJNx
	 LdJvPA6Fi08nQ==
Date: Wed, 11 Sep 2024 19:26:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: FW: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <20240911-blaming-scant-9537304c2221@spud>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
 <SE1P216MB2348C5726B70913B57D8C67C8C9B2@SE1P216MB2348.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IvHDJo7t0qbdzyog"
Content-Disposition: inline
In-Reply-To: <SE1P216MB2348C5726B70913B57D8C67C8C9B2@SE1P216MB2348.KORP216.PROD.OUTLOOK.COM>


--IvHDJo7t0qbdzyog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 01:16:01AM +0000, Ki-Seok Jo wrote:
> > >
> > > I have no intention of opposing the content. I am asking again becaus=
e I
> > didn't receive any warnings when I did the following, and I suspect I m=
ight
> > have done something wrong.
> > >
> > >
> > > ./scripts/checkpatch.pl
> > > Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> > >
> > > total: 0 errors, 0 warnings, 54 lines checked
> > >
> > > Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml has no
> > obvious style problems and is ready for submission.
> > >
> > > I was under the impression that this only applied to patched files as
> > described above. It turns out it can also be used with patch files. Tha=
nk you
> > for the useful information!
> > >
> >=20
> > That's not how you run checkpatch. You run it on the patch. Please read
> > submitting-patches document. It explains everything.
> >=20
> > Best regards,
> > Krzysztof
>=20
>=20
> Hi,
>=20
> I am in the process of carefully incorporating your feedback and making t=
he necessary revisions.
>=20
> May I kindly ask you a question, if it's not too much trouble?
> When running checkpatch, what would be the best way to address the follow=
ing warning?
>=20
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit de=
scription?)
> #21:
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sm=
a1307.yaml
>=20
> In this case, would it be better for me to add a line break in the patch =
file, or should I leave it as is?

Normally I would say you can ignore this, and that checkpatch doesn't
usually complain about the actually git output in here - but I think
checkpatch "broke" because you did not provide any commit message body
at all, so it starting parsing the git output instead. You need to write
a body!

> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #65:
> new file mode 100644
>=20
> If the warning is appearing because it's a new file, is it something that=
 can be safely ignored, or should I make changes to the MAINTAINERS file?
>=20
> Thank you for your feedback. I am learning a lot of new things!

Usually for bindings, which have maintainers listed in them, you can
skip adding a MAINTAINERS entry.

Cheers,
Conor.

--IvHDJo7t0qbdzyog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHg6AAKCRB4tDGHoIJi
0k01AQDETVi9UGrMYKy5h2BWVOoNATobIqVmYg1/AUDG5+3P4QEA/LVmvM0ml1qH
z1FnWpjwZYsvWrt30oYaxDa/0k1dQgg=
=emIJ
-----END PGP SIGNATURE-----

--IvHDJo7t0qbdzyog--
