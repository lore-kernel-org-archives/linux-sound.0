Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027124200
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNDZesLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30EFC433C9;
	Mon,  4 Dec 2023 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701693502;
	bh=yqaR6ErWHcshvm8N6QI3ct1mVUW7AZz/LWvjQ4StwVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNDZesLDtBLB2L1RV/aHfUQjfHfL4TVTLkgiDAJCuUT/8/odnkovPAHHSudBFPJ2c
	 Cc5WI3rpUcAhe9RZXTngZR8E6Tu64WSzuASNeEqMRQAqRUNquXNdfRWnP67md/QWhk
	 dIsplNbK5pioHaVQVzH2zV90KfGZ/wq+++awwYCFUwFNLkZnzK5fiBTyf6LJq+KmTy
	 qJR/94hvBpFEbyg4R6ydXqNOQ93QiAD29Ipbe34GoVij7Tgl0gLI4H6CnznFFSwhIu
	 jzEMCEUJ12DVEEqEyHEXY78rjIgAExBR3PHvkUzP16G9yGOcDARkipIckP5JjLlMgJ
	 cVeere0t9pmwQ==
Date: Mon, 4 Dec 2023 12:38:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com,
	chao.song@intel.com, kunwu.chan@hotmail.com,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Fix null pointer dereference in sof_pci_probe
Message-ID: <7ddeea58-f5d8-415c-8c07-c34be04d6a9c@sirena.org.uk>
References: <20231123155424.1275919-1-chentao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d0eSK/GLwNSV2WiC"
Content-Disposition: inline
In-Reply-To: <20231123155424.1275919-1-chentao@kylinos.cn>
X-Cookie: no maintenance:


--d0eSK/GLwNSV2WiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2023 at 11:54:24PM +0800, Kunwu Chan wrote:
> devm_kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure.

In addition to the issues others mentioned this doesn't apply against
current code, please check and resend.

--d0eSK/GLwNSV2WiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVtyDcACgkQJNaLcl1U
h9AkMgf+L+6WbJTiUIc2x5NzzC90SYhe4VZkSX5nDk0tim8631mq3u/Aw5PYWYlQ
J/9yRTpDiNAhPHYBNBQPFPw5h+OtXs+9kvhmsOZUim018b7sohjzXr9Y0p8C4yAB
zWL72CrBEGjPyw/jZlUQYsPl2Jfeuudj/MQwVKbtuXeLgbJbAdpmjTV3dOqaELXw
SHENzHmSVx4GZlvNVVi4u2IO24v09WrjM+HpJRW/amFmSwq+jV2A1cnt/LZpDbrO
p2rAlxXqOnjy1ciPBhHFhZ63js4ciuvpKYZa6bSBkyH6+zNzT+WViYnrKqwLLqYD
QFByAyqvfoNzyEqIPZcRtevmf+5QMA==
=8sV2
-----END PGP SIGNATURE-----

--d0eSK/GLwNSV2WiC--
