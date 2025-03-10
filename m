Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1CB21E0AE
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741614674; cv=none; b=eotLpxWudhMjWzR73aSvTEU0twgjwHvCzgNz5AGhNZx/P9KH0qBpGb0iKAO/k0ObwK9kjo35GtAwd7c7rO13qNmTZKAZfTwBSXrM09uSIc65ggS7xKX1CdUAKPaiAQUU0mbDAd3GaDDenQTbb2iRcwRdnMwuKyqDLhrN1Xjtvmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741614674; c=relaxed/simple;
	bh=Es9DYIbOCvddMNCMB1N4LXfb4XFWVevll/hVNIpQhQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMapvhoOcvXbkpUorrf13ACjWv/G5cpVZjLvV4H1MJ0YUihL3A0a3PJ5tLwhGKor0hjpCawrV6betW1zbVSOHnz0ZpuMLaNyxrMN2tfit1ST9bmaMGZvdjkdbn0IHkkoL2oF/BzbNk5emMjXGA9hX5la67BkcdfVExAEA1q+3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVmd/kXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVmd/kXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3019AC4CEEB;
	Mon, 10 Mar 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741614673;
	bh=Es9DYIbOCvddMNCMB1N4LXfb4XFWVevll/hVNIpQhQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVmd/kXuTHkNgqXj6PX0a8/D1eHIl2hMZq46609cklZPZPplSUZBmOoFKBdHhWInY
	 nkxGJ6l2TktZyjTEZS8ExDZdlM2NXb9oP9oM34XirJ5I6Xcc1x87VwvIC2HhEGvYkm
	 DFIv5IO4Yj71yMYO+TVfamSQ6u+JaAZJV5Ak5SxOztl/ND0p+oC4aGgD9SOf9PTXAs
	 jhAcI3kkvQwbfHkbh4ejxydYl+MNVpcuUA2DwQulF/NMH915rRPbyorkjwJdaCYPaE
	 eWWdoPgsbk/cyXdHQ9QGnaPek4QWu2YVn0rbv0gy+3nsT4KmqlpKjaQJ+H7dWmcsyW
	 sfl1toAt091eg==
Date: Mon, 10 Mar 2025 14:51:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: David Turner <david.turner@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
Message-ID: <20250310-efficient-nonchalant-lorikeet-e14fc6@houat>
References: <20250304193912.5696-1-wahrenst@gmx.net>
 <20250304193912.5696-3-wahrenst@gmx.net>
 <20250306-delectable-quixotic-polecat-ecd2c3@houat>
 <CACXvZi-NT1e8YXJEmcHyf29eSr5NSL2fdLXfQb5amCf_YFL16A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbzi2mywobytncqp"
Content-Disposition: inline
In-Reply-To: <CACXvZi-NT1e8YXJEmcHyf29eSr5NSL2fdLXfQb5amCf_YFL16A@mail.gmail.com>


--wbzi2mywobytncqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 03:47:27PM +0000, David Turner wrote:
> Hi all,
>=20
> On Thu, 6 Mar 2025 at 13:39, Maxime Ripard <mripard@kernel.org> wrote:
> > It looks fairly generic to me. Is there any reason you didn't put it in
> > the HDMI audio helpers?
>=20
> I originally wrote the downstream patch last year on 6.6, before the
> generic HDMI audio code existed.
>=20
> I just had a look at doing this.  At the moment drm_hdmi_audio_helper
> doesn't manage the snd_soc_card (needed to setup the jack) at all,
> that still lives in vc4_hdmi_audio, so I can't see an easy way to move
> this over without a lot more reorganising.


Ah, yes, of course. Most (all?) the other drivers just use an external
I2S controller so the card is mostly likely going to be described
through simple-card.

I guess we can always turn that code into a helper if a similar case
comes along in the future.

Thanks,
Maxime

--wbzi2mywobytncqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ87uTgAKCRDj7w1vZxhR
xQFtAQCcn+WnymsJWLNDwnp9IG/O2RDSYMTmIETZ3NFuaaeOwQEAsQZReyCZR9rK
Ql1QslSWA5ClgWPNFPgISDUHS2WpFAE=
=Vj9v
-----END PGP SIGNATURE-----

--wbzi2mywobytncqp--
