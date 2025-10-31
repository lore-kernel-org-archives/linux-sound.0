Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AA2D0611;
	Fri, 31 Oct 2025 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922658; cv=none; b=Q7Uu8szDw2AwnLsPAgB0mLpAq452h/LrckUS9xHWewWCLw+nfOQR2GAV5UTatfzfd7Z89hl6mu61cRE/ArMohJvxdjPQbNB6U43f3f1u9p7OyBuYmwSoLG0Wlz2AKPsWWuSIKKGnIoR9LJ7eE/W2VELzKeuR7lcDp6ZkQDRHd9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922658; c=relaxed/simple;
	bh=IbWqcGEnm66/Hy3orOmHGjsHyPEiZdxQ7B4LhQ7y5Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtEKh0zRMxaBc1DyCQwROM9n3VuJMz0vjUPfnyqP/A0vfl2eAtO+XMEpU+MfKnWPgcPD8kuGd8L/htLp/9H+B+G8VRa8JiBQ1hqMu5g/av0+VqhSdeOPlNv73jkgjhwGmF4iupPNRSYb8A2W1Rb3mkGCiw76iBvPAgIq2tyUdQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBhF6cHi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBhF6cHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA53C4CEFB;
	Fri, 31 Oct 2025 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761922657;
	bh=IbWqcGEnm66/Hy3orOmHGjsHyPEiZdxQ7B4LhQ7y5Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBhF6cHi7nTnJRm4SGKdwymCOoyZ4yRZSlb8lp+PNfE3oZk7lkFED38EyqZcCqi57
	 iU4FGEQbLPRQx3tFWfC1wFlhP+aGBvXKjx4D+GJr9kXWqNajf5qX5DNW3R+7aJ7e3t
	 Sibc+LZU9uLHA8w+q0K7/pXXMeLxnHEqevkinA6+heQCdGD1GNDmaMuRTEeZZ3qHV3
	 xr5BRuXHnJTd7LW8GAiRN0MY+9SnjE5McsQ+2o5I2QhZ8I/r0zrqCb4Rq4mr3zCOqn
	 xRPTRUWaq5oDxKIG3vfVceetHlCLSmSmEn5qN3tfORgMlsxkAs11RcDH/dKnVnBfdQ
	 nYIwFZOX1eq/w==
Date: Fri, 31 Oct 2025 14:57:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 1/3] dt-bindings: sound: add binding for CIX IPBLOQ
 HDA controller
Message-ID: <20251031-grouped-retold-9714ab609675@spud>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
 <20251030110928.1572703-2-joakim.zhang@cixtech.com>
 <20251031-pearl-pheasant-from-atlantis-bf4e7a@kuoka>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hhOgIqtXpsewuC8e"
Content-Disposition: inline
In-Reply-To: <20251031-pearl-pheasant-from-atlantis-bf4e7a@kuoka>


--hhOgIqtXpsewuC8e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 09:58:48AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Oct 30, 2025 at 07:09:26PM +0800, joakim.zhang@cixtech.com wrote:
>=20
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 2
>=20
> You should list the items instead with description.
>=20
> > +
> > +  clock-names:
> > +    maxItems: 2
>=20
> No, you need to list the items. There is no syntax like that.
>=20
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    maxItems: 1
>=20
> No, you need to list the items.

Since it wasn't mentioned why the items need to be listed, if you don't
list the items for a -names property, then they can be anything and you
cannot actually use them in drivers.

--hhOgIqtXpsewuC8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTOXAAKCRB4tDGHoIJi
0vNHAP0ePHZpBi0G+mmqVIui0v/+JrhkPBQG4fnkuKmIqLP5mAEA38tbJx7mVHGA
bgeElma2gxsgLpaBV41/fE2xaI58Eww=
=PWs9
-----END PGP SIGNATURE-----

--hhOgIqtXpsewuC8e--
