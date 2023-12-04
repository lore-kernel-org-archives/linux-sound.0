Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A02171D9
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViwkDc1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B86C433C7;
	Mon,  4 Dec 2023 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701710468;
	bh=vEGdHUMT7FCG9ZUAoF+g1mMhCIA1zj/Orwq4EG19kuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViwkDc1K28KiFfD+Sr/zg0sMKs/vqeT+nT8BthwOM4MA488BsOfjitesf1yBQckb9
	 TspN55vNbtwWkxGbdxjU5dc8nZEkwA+iWW7EpAzDs8ESreVI/fFRgqqiFUPls+xk48
	 kkTsMHKp8B4Bly/cK6cV5pdMmh2Z3MLr4s04kytt6y/hOfQZ7DSm8sBh1DBmQkkAx/
	 Ct/80+Uz+BaBmM3vuvv3osWYo2nacfrN7QRdrG72/j2nVU6IBtBbm9WdT2/PhBp10O
	 JaEsUz9uXgvddHDywKesVqFSqgIXby651sqtbdGOA2RDZ6FQPlWiv79S20QWPphuBx
	 gBqCyBeODwusw==
Date: Mon, 4 Dec 2023 17:21:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <trevor.wu@mediatek.com>
Subject: Re: [PATCH v7 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp
 for mt8188-rt5682s
Message-ID: <4da07f3c-ca54-4ff7-aab1-cf8e8a52f21b@sirena.org.uk>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
 <20231116093512.4180240-5-zhourui@huaqin.corp-partner.google.com>
 <f1b429e849621b772a529ba312e0aa8e715194b9.camel@mediatek.com>
 <CABRjgzvnaDaFy219HeM4mcBRnNEZamfqCgBXsnb=GUEGegf1og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPvbUY0L8ft8/l67"
Content-Disposition: inline
In-Reply-To: <CABRjgzvnaDaFy219HeM4mcBRnNEZamfqCgBXsnb=GUEGegf1og@mail.gmail.com>
X-Cookie: For office use only.


--ZPvbUY0L8ft8/l67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 02:16:39PM +0800, Rui Zhou wrote:
> Hi Mark,
> Please help review this patch, thank you very much!

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ZPvbUY0L8ft8/l67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVuCn0ACgkQJNaLcl1U
h9DV8gf+KURjesKkwdsCqfWX1l5POcVM12kOokp8N8K6W/91KDnzjuhs85fo2uBW
eDHxzBTlJmqnCZzNQFMjvM7TWpxUiFBCR3X17SsuhBsFmwMgS91jsGqv+NO7mlpF
Wdvw7vlK308hLDoQX/1w85ivCSJhgxtxE4t2nrAo8g3zbFCPwK0qJIw/aNFIPUaB
2paF7zbnoTtEK7fT3A+QPaTgGRJnj79LxVmF0lapZAq+GdVARlt6XafLfkVg8lSU
KsbVlh9zhONA0Og6blc3AUOcDta+s7GvG5FZ7as6qD8NbWhGWJ22+bo9rcGl9/dn
P/ZoW/Kqm3x5xh/RqD7D5tJXnpMWHA==
=d7Zb
-----END PGP SIGNATURE-----

--ZPvbUY0L8ft8/l67--
