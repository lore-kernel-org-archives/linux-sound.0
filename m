Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46915B54B
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724246984; cv=none; b=UyWpEOSabZ4FWHKxPkYuwGlxRpT9aGAejlz6l7Hdkc4WjEiukS9hvbiuXDcPAvIf/oGSsPPuTrrPRen4sxI5lqaPCDGg1mVgpAZuFFPvEXw9tm30nXU129H7KNL45ZAH1HvXlBNBvrayb/IRKX9OcwMlJ675hapYO/3WCv9pnCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724246984; c=relaxed/simple;
	bh=PHEgJRzZWXxa0vJ9q2HDbh2E4kBF0yeXkkNwmxw9YPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHiWka0pgV/soF0/vQu0bAUDJMh8otFbdGHNA0LcV7m4S+aQ6jxFVrePlJ3j28TRjY2tznTUXHZAVp37d98CuT7FZDDBG9fYqaUwkz4BgZOvfPIUIJqLuPbpdcB9D/kU8h5F23xmOR+3kSRqetyuaxOIfqc6imfcChURJkGqV3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exVdUVgB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exVdUVgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7604C32782;
	Wed, 21 Aug 2024 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724246983;
	bh=PHEgJRzZWXxa0vJ9q2HDbh2E4kBF0yeXkkNwmxw9YPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exVdUVgBZJCguB0y8vfCbLUyN6MuxhtZIRRMuP2QuK7wVDd1OGywaxkNCrkSP3Y2N
	 FDFTIvnBWXA3G2+UpvIS/9X1UssugL4rmReg4WYfOJ2b61mHImNKKA69QXWyd0TSuz
	 RNbxnJIIpNsWwPT5qaSOxDudepsSIOfYuErHAQ23F1hcWPt8fWdKit/lBkaAMa4GBd
	 4mTZW34X+KAo4+kQd/GQEzJ1EniyvHI+RHAYlbQSM1c4ATzZjZSQTbE327rU4NtYo+
	 +D3oEoToz8h4aYddPzbzRqX2gSjQXMarNJa3lRIb4OlrbuRUWVDFdIiYJ7Q00Y8axl
	 eLcNAUH+QgDQQ==
Date: Wed, 21 Aug 2024 14:29:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH -next 0/2] allow modules autoloading
Message-ID: <8426ce31-f877-4b9f-af41-55ab479f0524@sirena.org.uk>
References: <20240821061955.2273782-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5I2aYscS/sJbLBN"
Content-Disposition: inline
In-Reply-To: <20240821061955.2273782-1-lihongbo22@huawei.com>
X-Cookie: You are false data.


--q5I2aYscS/sJbLBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 02:19:53PM +0800, Hongbo Li wrote:
> Add macro MODULE_DEVICE_TABLE, so modules could be properly
> autoloaded based on the alias from of_device_id table.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--q5I2aYscS/sJbLBN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbF68IACgkQJNaLcl1U
h9AYWwf+NtRfhWaEnCbdq+GADp/LFXav13rAIA7CvWIay/Z/ThZX9SCYMrsrLfnI
fyrYjIzbJ2b5fQ0Q8CBYCehgy4rI+KOs3SnjDVC3xew+ZI1aZPi6K7Fpw8e/Ilj0
/SvDzr3itULOqDUlHYbNA+fwOetPovuLgvQoSZSZwkBe8yzyfUMehBYLvErRJznB
wX+aBLhUpMsdnDiaTpT8QKk2cQGIdammX38pgeRUc50t4IwxZ847gg62GMA2Sjkj
JpzahiEvh+psWx6wLj2PNP3WdzMkzr3vqY29vxhKXBkL0G6A/AH/Jv3eLaomgTFR
BIvyW8qx8p7q/Xmh/Ig2tJEJKPvNTw==
=6kpd
-----END PGP SIGNATURE-----

--q5I2aYscS/sJbLBN--
