Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E913E3164;
	Thu,  9 Apr 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755952; cv=none; b=WNOsrLoIRuYH2258LXRhTXhByuBrXXttuRglxYfaWfKbawl7cG35LPQuwulIR560vRKsDlp0uHqDZf+lV8y9DZg+bnIOFLEWc+o3ezfCoHhqMNNn/tnIIweZ+jkp/Duf24/frFcBNz1uKYPu/9zNTXoPo8y4ElPNIk4yOgL6pTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755952; c=relaxed/simple;
	bh=KIZYcpT5nMkso2ZhHwAS9rJmWqtYKh9Oho0nlbe3QXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFQ7p+TvmeRUpzJZMLuf8cFqRrIAOymsc+XgqfL0W/eho561TOJJm1jAXdtga+/46IpFtK7v/VXX3p6Fol6rm47wmGLmXJMKumvq3DsTmG8UXPRqOG46ljwuJ69y9ezZEicvOOdZmEiXS+BjBMMu+5tMhJaZ7WWbyS1+fh0wHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQdEwPg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQdEwPg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B648BC4CEF7;
	Thu,  9 Apr 2026 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775755951;
	bh=KIZYcpT5nMkso2ZhHwAS9rJmWqtYKh9Oho0nlbe3QXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQdEwPg920u9vZrPrfTINWoSFQtDrywFsxCAKh7qGJN4q9MVTS7nDbFQ7PXjvx8Lv
	 jqyjrUpwKQUA7J4t9U4dafkQ6sOLMYJX0NQmSe3pfST0G/mDVYh3U2j4lZOCfXn2vf
	 7BLkh3oHLtZE9VxD0wdQtmsQON24mnLi1LiXckHhSBhN4OngFzYT+avkJ1EpTH9R6q
	 jcFpQmkL4FVCzboIov7ht3ZuGAOX6EKD4OI1SocMlwu2np1Yyd//Echl3ACF8c70wt
	 Q6rMfleV6J1ObCwPg/bglybA07O1VAjMQpgAq+HO3m/6d49GslZ/dBwt5NTXR1tgna
	 57PjkcQwYktaA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1F83A1AC52C8; Thu, 09 Apr 2026 18:32:19 +0100 (BST)
Date: Thu, 9 Apr 2026 18:32:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Qinghua Zhao <zqh1630@126.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] sound/soc/tegra: Fix spelling error 'recieved' ->
 'received'
Message-ID: <adfiowS0E_XTBXmu@sirena.co.uk>
References: <20260409135213.16558-1-zqh1630@126.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QNtrcBHkZ9xmCDei"
Content-Disposition: inline
In-Reply-To: <20260409135213.16558-1-zqh1630@126.com>
X-Cookie: Are we not men?


--QNtrcBHkZ9xmCDei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 09:52:13PM +0800, Qinghua Zhao wrote:
> Fix typo in comment where 'recieved' should be 'received'.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--QNtrcBHkZ9xmCDei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnX4qIACgkQJNaLcl1U
h9DvMQf/RqtD1Gl15ezJeoG0JA0SIhIPYV27ASU53zcIbuu700D9Tfw6vSszEfJy
myAb2wsX4JY3NawD9QA56XkWmNlCQJpATOSNFOFAGPi7efXYGglcy9LDdtf98L0p
so08Um4hy80HX/3+djKhGLODWXzvGL8WXeR9RtPtc2EiHNsVeH8sIL52CwysuupL
pkB36xttpHu3QYPi5PC8AXkYaIWiLVIO6tx120ju8KF3jNc6v5iveInYICcYc1C4
zeTheCGvOloUjfjjGQ8QKsgNLyGBjore47ne65I88QyrbtMsGorqw2M5n6WCo0eI
wHd5/XHx4Denu/sSAjtlgSodHZDSSQ==
=ikI3
-----END PGP SIGNATURE-----

--QNtrcBHkZ9xmCDei--
