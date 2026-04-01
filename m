Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C584779BF;
	Wed,  1 Apr 2026 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062589; cv=none; b=a5bMbrTwpywRnmEG5XQ58J/J4+WmGJOOs0i6RvPVacPiKnSmF64mV4CK1OWGfJoKabhBfuJ7afFDDSDxiAezI/FkpeC17HES+TXDa2ClggYAIanvvbcPnJfFNDw1renHmoqq4mjTd2bFcuNl6I6HObvR32BYah/gHgbC53AJmck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062589; c=relaxed/simple;
	bh=JtuP7vPnFffiZdmEnggWNONBs26JwGvGwJ7IAIpurQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hajwmL3DPhHoX5TZA3yQFSUk2uh8AwmTbxw8+WH8cG029dnueVj9TIPxrPzGgf4qb7QRdz7VTPELlAm+b3HMXfnm7IVl8Up3mtmWSVqBjRN8oQBrNw6EXy4lVj5aVs8Hw+AaWT6N8RJbaP7gbbaWaVTjzUUfTwX3v/FunFxupZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEOFVcEm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEOFVcEm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A54C4CEF7;
	Wed,  1 Apr 2026 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062589;
	bh=JtuP7vPnFffiZdmEnggWNONBs26JwGvGwJ7IAIpurQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEOFVcEmkejqemYu9gD1QVBBnGGdJ6a5183yyH7vg94RAvsTzp/3hIIZlQctGkcs7
	 MHQssxvOFXFUGX6IAa79WgQBtLqlItM2F0SBu054JQuNmuAQNxNth8RC1KFpwDVUCj
	 nvbK52HUEAV57Xw45y+qqwCuRfmYrJiNMUo/pvrqFGDDC6Gok5uSw62IL4XO9oFsAI
	 4nYfR39/sqtCO5MbVCBGluuFSyBiw3KH03tFpAHivrWtF+TUUEk8KZT6euRf4F5Knz
	 35U0yhUEGLClRV9IiuEbZdM++sdU5KGGhYam2zSlU1KaDF7Fif6TvL0E3gXOm7wuX/
	 Wn6tV6B7hUM7Q==
Date: Wed, 1 Apr 2026 17:56:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com
Subject: Re: [PATCH v8 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
Message-ID: <f226a03d-f2d2-4a85-9a63-5ac93b665740@sirena.org.uk>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260330082105.278055-9-srinivas.kandagatla@oss.qualcomm.com>
 <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
 <6be87f21-1da0-412a-8662-ef05ca32f3c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xUit4U/rWLaTNSx6"
Content-Disposition: inline
In-Reply-To: <6be87f21-1da0-412a-8662-ef05ca32f3c4@oss.qualcomm.com>
X-Cookie: "Yo baby yo baby yo."


--xUit4U/rWLaTNSx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2026 at 04:54:00PM +0000, Srinivas Kandagatla wrote:
> On 4/1/26 11:25 AM, Mark Brown wrote:

> [PATCH v8 09/13] ASoC: qcom: common: validate cpu dai id during parsing

> re-ordering these two patches, should fix the issue.

> Sorry about this, Is it fine if I send this reorder in v9?

Yes, it was otherwise fine.

--xUit4U/rWLaTNSx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNTjYACgkQJNaLcl1U
h9BCSgf+LQqr/13SpqYuSRvPKSn7plrzehU/l1FCowf22rsrd115KRv6RPjbTO9z
GzlmlOzhfNRXdqzum8D0NE0puZB++7IB8+jeMiI8UgPcT7nhVX2uZmgWg208S706
MdyE4m5i0rfatTJziLap2Npd6YOotbiey8W/JGdrKclg4ffn36CmyOiBO4deQPzD
/ogS+YwAfxM4pK3kQj+7bashffpssNRxhz3NhvDGnAkSlSpAMs9QMiuW43Wvo5ag
itW43O2iv4c+0y9WsHguPVlZlDtj5m6npTjkKEEMVVnmdXeTLtzdlFJYhRtWVDpF
RHNQHx2UFnHA9+B7+ls1QFr48rmoVA==
=kifs
-----END PGP SIGNATURE-----

--xUit4U/rWLaTNSx6--
