Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867826AD9
	for <linux-sound@vger.kernel.org>; Sun, 29 Sep 2024 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727651070; cv=none; b=m5y4pjNwWLotDxLym/hlvVcY93qX97Z7wYKg++pqgxiBiwxgTAJjMzeVNIH+OLdo7QLoMunsbgioeSlmB6YtB+D2SFkVvZOPP8P0kv/hKTjcbUX0+UNKk/BlqF5/29xe9fknXwFLqzDqZsy3Q7ZyLckQtJxOeca/icnbYh6JDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727651070; c=relaxed/simple;
	bh=hVwRhI7y9BSFblPuNcJDXRTxXGTpzBr/sB5a7Rtodpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+PdUMtoFIOmkQhQ5XrWsUGe5dT7ELhklAI4tD2WvzPEthr0/zRbU0iacfgRReUhIpZVLyj6Du1f0rAJZiDFUvAEk+suFci3BSYnAlJZkAgjC725oarYlySTIUFSDDyXeR1QKgv+hFBS8dAlQd7r9KUohY6M0g45oMD5z/DfwuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnvHMtej; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnvHMtej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCE0C4CEC5;
	Sun, 29 Sep 2024 23:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727651070;
	bh=hVwRhI7y9BSFblPuNcJDXRTxXGTpzBr/sB5a7Rtodpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnvHMtejlWlgqYLZtcNSM7/eLIcRfCPdSryLChPr8oL/JJyWJ8LdTf6WOQLZC4eLN
	 AwH2MM4vsJe6UjdKNYtLIrs5+5PBWREvv6t2gpek4CvknCqpbHuIOrC0SIf1Fm6BKW
	 nAeJjKowHg7hjmfhVNJDSNH6po9JItT3JXERrT9EKXmO6xYaVGbTKBbPLKDrm5LNrz
	 cvkicJ5SHk21eeUwLseZhSTpdorZS5EM4oAK2dQSvj3MmNUzp6xV6KEwHBgWUCBpFJ
	 pRXQqZSRAldCRmUWQSUbDhVdJ7zGWzaJBHGqbeWujqv7v8dmRRgVIs7NOwvdfr2YDN
	 Vr6fVpg5xbiLA==
Date: Mon, 30 Sep 2024 01:04:20 +0200
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, oliva@gnu.org
Subject: Re: [PATCH v2 RESEND] ASoC: rt1320: reads patch code from firmware
 file
Message-ID: <Zvnc9B7ESyg0LaPs@finisterre.sirena.org.uk>
References: <20240927084049.2618948-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlX3Mmdh07xAmudY"
Content-Disposition: inline
In-Reply-To: <20240927084049.2618948-1-shumingf@realtek.com>
X-Cookie: Editing is a rewording activity.


--nlX3Mmdh07xAmudY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 04:40:49PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch removes many lines of the patch code and
> reads the patch code from firmware files.

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

--nlX3Mmdh07xAmudY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb53PEACgkQJNaLcl1U
h9B75wf/ZkjvzeCKm0b39sDkSW6Xr/tBqoLdQnzlr7fQ+JTv/dVW3YuDiXnlxMiR
rb5qoA4EpWaq2eM8Ogzh3gulQ1ssXPlMZiJP510etFxBP5nTUW8pt9J3Ziqhvq7P
G+Qy8LI+QCaRTSqp0c0N2YkdwEIfLjv8t+XmksUuSmmaB6yANxbThNTHOs9juEfL
hAlL4b2TEgAHjFrj9RPziHHaBtni+Hc2xePH2Va1SpXTCJKz5sOWTYwEji7L1n8i
ve7YoLyF34qsaPKPgyGAOUkmeCOprFjkXfsE7E1KRkU3EGSzzGHfv1O6Do579Da4
EL4TxJ9oXCwbSV7jbR8Ghi3M4aHFgg==
=vj/0
-----END PGP SIGNATURE-----

--nlX3Mmdh07xAmudY--
