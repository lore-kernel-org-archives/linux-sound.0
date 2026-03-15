Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBBC21C160;
	Sun, 15 Mar 2026 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773618834; cv=none; b=FyKiJGq0oa54DJjB5gUXPbHItlAdiSvvsiUCcpwF9trStjaDZhaw8kPt2b8MZVSBIqkjJshEkfTVqCllE+b5rctLcYs8VS9tVn7fnK4laV97LQOM37w543BdOtbLokZiB75egfpPW1gog89HkANlJMXOGdEFNwn6QdaskwKqwdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773618834; c=relaxed/simple;
	bh=OWkYGFnwlMF+HSrAQ5jC6nMMOj5JlaBBnoBqg9CTPus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJs8Gk5+UKCfTHvRjmuKhjohtA9BOMgQpASoslZOYCxrQMLA0gUzTtVqBxHXlJjvk1Dw6x3Y0uSgyZHXetrmmXVU4FkGEQCjzmC6Pt93Go+dtk/GlAB2zZ13RzzyRjB8+Y8NiviUdHcxDIV36ufKCTLuLbUpcBi6eUXS8QKqQsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCCCVrw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCCCVrw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D7CC4CEF7;
	Sun, 15 Mar 2026 23:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773618834;
	bh=OWkYGFnwlMF+HSrAQ5jC6nMMOj5JlaBBnoBqg9CTPus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCCCVrw2kl7ySfvsEHfLzW2QL+w2qb8LI2zvewNCycC0EYaDML30Us9SOJqmIYjzL
	 9qWhI3nBsSZMdS6G85KStth4ysfoMtcvbPt4osxRfhv/y/baDEvIFVzq4FjDPy8J1b
	 mjl/WU5XfUqQddfU3igyj9rP2jZYNi+etfGX3z92MFeYAU7QqAAxbR7qFwur5NWB2s
	 TFZJYsucwCllT6rml5t89ts3LHHoVwGAmINFwfCeoj6YUGbZypEwqzWs/Enal5WU0G
	 aTzZeeU/OS4shqorrv8JYejtfI8hvTzU+sa61VD3wd3Z80LzZF+IH1kKvq6F2ed/qO
	 14/PnNQJ7vcCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4E3DB1AC5656; Sun, 15 Mar 2026 23:53:51 +0000 (GMT)
Date: Sun, 15 Mar 2026 23:53:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Eric Naim <dnaim@cachyos.org>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, hasunpark@gmail.com,
	linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Message-ID: <abdGjyMVd37aNqyL@sirena.co.uk>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
 <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
 <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
 <7790d1b9-5152-495e-85f2-3b1068435d13@sirena.org.uk>
 <0b451f26-fea6-4a4c-b986-228de98e566b@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KKlRIhLHeqd+XC39"
Content-Disposition: inline
In-Reply-To: <0b451f26-fea6-4a4c-b986-228de98e566b@cachyos.org>
X-Cookie: Identify your visitor.


--KKlRIhLHeqd+XC39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 15, 2026 at 08:20:00PM +0000, Eric Naim wrote:
> On 3/12/26 9:06 PM, Mark Brown wrote:
> > On Thu, Mar 12, 2026 at 12:19:48PM +0530, Mukunda,Vijendar wrote:

> > Thanks for duble checking.  I already sent my PR for this -rc, I'll take
> > the other two patches once -rc4 is out all being well.

> should these patches be cc-ed to stable? As it stands, I don't think stable kernels will pick this up.

Feel free to raise it with the stable people if they don't pick them up.
I gave up on tagging things since their automated selection of patches
picks up vastly more than I would ever select.

--KKlRIhLHeqd+XC39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3Ro4ACgkQJNaLcl1U
h9CsKggAhWUEl4SsJQakzZCT7TbBdpGHso8g6ztc2o+GkAzMsy3ox0fldHGAqkuz
VHUrYXKJ1WcXeBQWOBjqHDfjLb8KT345JoLKFyxhaK98a96L9f0bOxI2mpqTuDSe
48sD3f/DwhGrtUICT/N04WStNZ0Ilb4sg4nGusqTlmNaNoniRvbJsMGpWXATSeTG
H3BiceMDt9VQPZh8DihyV2Ssf6JVx1uOAVIUOyU6DjOeSNYpfSM/zyjMSp+hSE7q
OR/lXyKKOmp89TpoPW0idmsDWh1o/MiQKFch18rIAUbzZyBwNz2yPVGued50WE/K
5R+1Wr+dii09BC052yKVDuvdqFOpuA==
=FmCE
-----END PGP SIGNATURE-----

--KKlRIhLHeqd+XC39--
