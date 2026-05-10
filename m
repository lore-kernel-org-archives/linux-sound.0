Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF2813B7A3;
	Sun, 10 May 2026 01:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376434; cv=none; b=Pi958WiLU72OgpaGCvTSZM/g94Ul3NYYc4y76vezDUklYD9q6YyRq8+9XjibLtba/M7uQ7ED8Ksy4L3Sn0PjlyA8daaWNZZ8Dtk4gCu9XOaFIBt0TlHY84NJU7WnpYnjX94HGTWLlC0wka2gcOREqjxnRaFhhNYdg095HmOWF0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376434; c=relaxed/simple;
	bh=+4q03Cm6mQYjy5IHtdfh4Wm3Vh6orU1GKZEoE6lLEas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4W/p4lbkwrkO6b/Wgb4KRGQevw4y7ddxd+iVMUl9BS01NX98JKbQe+PiqaPplPmOziV06Fjfrn8znmM0dppWKJ3LN6Jgm3GEDJufH8xkHsb7G5prkiaq2DlkUCFhfqlcuSCy/5yo4vWT/hMddQpHtEzZTUbcoOYDeUUw4W60nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S63z8H7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S63z8H7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A5EC2BCB2;
	Sun, 10 May 2026 01:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778376433;
	bh=+4q03Cm6mQYjy5IHtdfh4Wm3Vh6orU1GKZEoE6lLEas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S63z8H7Y3gdPglkenRIF626iU92Fpp/vBdLMWwqQUio9Lj1cjbO/+kzuHfQxh3blJ
	 +XeciszZjoMNjZRCOyH7ehCe8chhyTG4WF8BM4xMd8z4WOLqBvnup0zoiNo1yHPN49
	 fabSFppkJUqu6XtNkmTLvhd7F4Zvrw1YhlwV4bTHfZ7M7K07JVk/BzwiMJ30QgnaAY
	 tclnotadbI0duB5X3Q/X0cXg+eGoT9hH0KqfNTYQ1OKSvm66ad8bgMCDQJX25r07r2
	 Cum7jXnGUDfoale0xOYyBNA7cFobMjyfEZWPrBnWMUnBSu76fZTElgUAST/x3y7KvY
	 GySLKAHZZy82g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8D2021AC5897; Sun, 10 May 2026 02:27:11 +0100 (BST)
Date: Sun, 10 May 2026 10:27:11 +0900
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?5p2o5byL?= <yangyi@moonshot.ai>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tas2781: reject too-short writes to acoustic_ctl
 debugfs
Message-ID: <af_e702o0i96rIMT@sirena.co.uk>
References: <97bd47532c39bf4406842528adc5883ce43bdb25.b9dfca8f.30b3.4f6f.ab3f.1a908222cdea@feishu.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wloWqfsrof1Gk2Vz"
Content-Disposition: inline
In-Reply-To: <97bd47532c39bf4406842528adc5883ce43bdb25.b9dfca8f.30b3.4f6f.ab3f.1a908222cdea@feishu.cn>
X-Cookie: Truckers welcome.


--wloWqfsrof1Gk2Vz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 01:51:54AM +0800, =E6=9D=A8=E5=BC=8B wrote:
> The acoustic_ctl_write debugfs handler allocates a buffer via=C2=A0
> memdup_user(from, count) but only validates that count is not too=C2=A0
> large. It then accesses src[0] through src[6] without ensuring
> count >=3D 7.
>=20
> Add a minimum-size check of 7 bytes.
>=20
> Signed-off-by: Yi Yang <yangyi@msh.team>
> Assisted-by: kimi-cli:kimi-k2.6

You haven't provided a good signoff here, the name and email you're
using here don't obviously correspond to those used in the email body.
Please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--wloWqfsrof1Gk2Vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn/3u4ACgkQJNaLcl1U
h9AO9QgAgy7wl3ZIGctcaa6Sat1H13QqO+brLZKAYE1T/pyNkMeJk2jCKNr+Mpge
e53gHDAnDruj2c8ONgLk5qtrULrMcJBktJldnVz8CyoYN00WMjcBMZni7CeKroJR
HBm0i1GJ/diQ/B5qS4Eb3+tQqu4VOJHu0wCmPoqN2Qo6CRsxzbho840kcrzPllDO
+sSVEzo3iImZCPQ6ZRJY5qL2nLGVuNzHfLnI3DVwzVEYSa8XZykpLvehH6q9cKj6
2zkjO7+Pshg+CX4+WzG6TLtIlx9buytcs//B8WM2bv+O2iCvk6GJm6rBmLsybYAq
mp7D4rZ3CwLl/TBCyAPIZXxST2WQ8A==
=kMfk
-----END PGP SIGNATURE-----

--wloWqfsrof1Gk2Vz--
