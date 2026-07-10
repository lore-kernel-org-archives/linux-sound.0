Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE24279FC;
	Fri, 10 Jul 2026 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687544; cv=none; b=sHUf9MwuLYVvfwzjkGPMF4vtMCrFL0og7XQO+rLqztzeheO30LuomFQnsIeDtrUZK0OITlN6gx0rtqvCWJ4o7qDhmhf6EjRnQC9pFXWyORAdt1hxkyOEwGRMvC7aTxEzPJ8gVzKtR0MtYzfdMFzLDueGyhBvv4lLnqEUh+7oIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687544; c=relaxed/simple;
	bh=s5/RZPzefCDywMToLX8XJjiAXr/kjdPnno8fN2l6GYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUn7xuYMimuU8U0bwQBr3d3sECGawHscZd9cbb30hrlLePnPiKkv7UkDDies1IxVKVIGy1DOA5XCJU/gynRlJPTty+DdFGWlpA2kXCNKfYRHddKNDmKaZUzXhR83HfyTpUn3XFZhSNnop0hCgmjqvkQ7cPjm4C9B+T5tuAm/xOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehMA7wNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehMA7wNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC02D1F00A3A;
	Fri, 10 Jul 2026 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783687543;
	bh=4X8evUX2V9iqq6sU9qMMMiQ2PypjK7o3PEQzCy5lmT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ehMA7wNqBQ6vI49vR8o8HCN/8TFbwIfoAJ1uss8U+wewxNERxmpY/B6X62fiADu4+
	 hIsc4AKnwKj94LHCS2dUpzXHt+ItEXKzXT+M4CFQ0FYIfSx9hhV34FruhCnfeZXxYu
	 XN1BlPP3xXd3Viv1JaqRZ+BzCmTQM/8pPVjx2JZU8epe6huFSaDbzHyrH00EHvzZld
	 Rq3YYkS48JwMRzrNsTVQVAURsQWXyVjx0bkV8YZsvsQMNuUIs++oJmLdmloOzk26RX
	 1bIRI9ke10fEdNlSMrL0D2cGUJg3Q3gnkHHlrivi+Tza1L06YBNDF1fIj7DYP91Oev
	 U98sbLu5i5QzQ==
Date: Fri, 10 Jul 2026 13:45:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Wang, Sen" <sen@ti.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Message-ID: <2231177b-4cf0-4d07-840d-1c2d3bc4a4ef@sirena.org.uk>
References: <20260709221331.989109-1-morf3089@gmail.com>
 <20260709221331.989109-3-morf3089@gmail.com>
 <e3ee8a6f-dcd7-4205-bd3d-da34a1b9aa14@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fItWdVy7QcN0Zs0y"
Content-Disposition: inline
In-Reply-To: <e3ee8a6f-dcd7-4205-bd3d-da34a1b9aa14@ti.com>
X-Cookie: Did I say I was a sardine?  Or a bus???


--fItWdVy7QcN0Zs0y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 11:40:49PM -0500, Wang, Sen wrote:
> On 7/9/2026 5:13 PM, Gianluca Boiano wrote:
> > The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
> > speaker protection. Audio is received over I2S/TDM (ASI) and processed
> > by DSP firmware before reaching the Class-D output stage.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--fItWdVy7QcN0Zs0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQ6XEACgkQJNaLcl1U
h9CDSwf/Ya2AUuu/dn1qEHNfo+BP7bGGJSw5wry2xjlFtCAV4+aHN4tesbqwRBsA
AMn+aG9sSsKR6592dlXh+dVr77iy/ZojeQvEoZBwqKeNZJQtLzPrpokfYwjr7YlA
hiPQ7kIDkSl4GuaHrKec1w1M0TmB/kdEbqpIoCiIvET0y97WlsuF+DBWXlFQ/kF+
y1gJWot92yiZkNMNHCYxrW613kcuYwR9RQuRlwnBDcHw3jX6CkR2nNQjtibceq0p
p9OiTBym1M/hFk7T/b1ApdsDe/fGaYr6DuQA8nbdFSiVLgH618LRGTUgIDK6TgKG
2XyjEuIiRosZcbnxugAjmR0xDA1hLw==
=DgbL
-----END PGP SIGNATURE-----

--fItWdVy7QcN0Zs0y--
