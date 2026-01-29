Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5321CA0D;
	Thu, 29 Jan 2026 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708234; cv=none; b=eoy3pZJgUkvkukpMxKlikdr+BdV/zLZ06XHkCFIjjkJWrzNkJMnVBUIX3j2g7bYoVaGqWS7qZc46WP+EpvirH+AitVgcvMJGTgFSoEn2PvZ9YWuc8iHMcoFd8V+GMCoqiTMeKgeCqt6uy89mCq+q7VUgggePRDBksvgm3qKRr90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708234; c=relaxed/simple;
	bh=bDEI/thWJiBMY9mHoZhi+D4YDmBmVFk7wRyPk8VhQG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPXwpu9tGSaW2mErrt7Hitd/+XtworwGyAt1jWxPuASOTKnIznCvjNtkcu0tiL7ivzx8SiyQB8eTFYU5V4hOQq4BPQT+4wP4nOtVV3GMk1JwL91FZMq0jhm+pEa0Hn9K2vJAEGXLQQKo+W797qiowiSGQdV0slt1/cm2oHyT2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ts+uVA74; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ts+uVA74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC791C4CEF7;
	Thu, 29 Jan 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708234;
	bh=bDEI/thWJiBMY9mHoZhi+D4YDmBmVFk7wRyPk8VhQG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts+uVA749boU+9G+2XKeP6LlKRaE+HI8B8FIDpZdTiZz5UpWhTKnaM6rpLy5/Nkkx
	 OpIBpTFjnBJI/btTpp0xSKJQVZOevj7gFaOP8lIrA5IJ2MN1k4RzKNq28L5pLsIwGO
	 ipuFiiWbDpbAZMU8CKnmFjU/wQsWcUiaeJyNZiXThIPdv1FfzT4cmf4pH4CFJMsp/N
	 pm/dZK0ss+0EFUw4iJS1eGTo/SDBWgZdzJ2DhY/2Jz7ARzrx4iNkZ18I6d4uyiWHNY
	 7jQSyTh4L4M50h8UWdZ1oSzQ9Wfj66WFRj0neLy6jdSc05f48+AV20YMj4oWHlhVNM
	 7eL2rIZGMdgMg==
Date: Thu, 29 Jan 2026 17:37:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: xlnx,i2s: Make discoverable
 parameters optional
Message-ID: <20260129-appear-thirsting-9628adba52f1@spud>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-2-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fFGVvv6Sr715S97e"
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-2-sean.anderson@linux.dev>


--fFGVvv6Sr715S97e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--fFGVvv6Sr715S97e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuaxQAKCRB4tDGHoIJi
0ubHAQCFNwUgG8XLJFa6c9F10Qwq9HGMzvxGVaHwSpRHGxmXGwEAj1DVn5SHnCMO
2rjHPiSbWkwrKh4KEXSjae4/DaSxQAM=
=F31q
-----END PGP SIGNATURE-----

--fFGVvv6Sr715S97e--
