Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920B1EE033;
	Fri, 23 Jan 2026 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188149; cv=none; b=URP8rFJAyp2aKG2TtcKJuK96ygRa9xlcmd1dUXeorqKYMs0NvBdsxpWjSSDOnudPCRbuebGDbQmOLP+Gq8SEYLK6A1LCjjOY/0uNXs9vnVkK4SvIDOIsOieVHtcluJ4M/T2oHzKXQJYgtQW3JB+Iv7EehLeNKewKb2vj/6hMGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188149; c=relaxed/simple;
	bh=iVW+7CkiN8t59MDvx+2XzQluQI1KKt6encMbiwb5Phs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlOfVtir32NNhRKAEjxEx5H4FK22TCh9VQ34NXwvXLDKWcuV4CTVcwWf1WqCWDNjVyMczcTXR7tZAnByZfLhM9nxa6CnhQz7P9V3L9GxC0HxQ/PmAWbSoZ9lgM/lYv1zQSHiPFt9C3lcVymAo2AUN+7NfJM2u/yqQzudoqRB9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIa6ZquC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIa6ZquC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC43BC4CEF1;
	Fri, 23 Jan 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188149;
	bh=iVW+7CkiN8t59MDvx+2XzQluQI1KKt6encMbiwb5Phs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIa6ZquCipr3w1g1nta83dGHc4Sy4bblnz5hdmiew8FyczgmNI4quAh4cNRrdrvTY
	 xU98UvTiPSTSMjroyJKQPb8vsTgJAmww49Heyn3zk2gChb0B6KDQCwaJQNqJBf7FkP
	 ja/8eNMr0mF5zeHVmubHZA8zLADMpfpEOgKzu2x131pYx5XUthKfuphwSPzsL2Xiyb
	 uajAkaHZoFJRez1pSla2u257AoqELbwoP5V+ojWEfEL3EtmsPpgqndWZVZcp4ELf4x
	 iiYbbo9OrVQgS81UsdZKwLToxxQxUqdduUDlsE5ZH5Nf7B+havM6uCnxcSR34NCKQy
	 R/0ifrMv1mcRA==
Date: Fri, 23 Jan 2026 17:09:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	wangweidong.a@awinic.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	broonie@kernel.org, lgirdwood@gmail.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: aw87390: Add Anbernic RG-DS
 Amplifier
Message-ID: <20260123-empathy-unissued-ce879a2fbfe5@spud>
References: <20260123154731.130649-1-macroalpha82@gmail.com>
 <20260123154731.130649-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yw5HADqUeVykISp/"
Content-Disposition: inline
In-Reply-To: <20260123154731.130649-2-macroalpha82@gmail.com>


--Yw5HADqUeVykISp/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Yw5HADqUeVykISp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXOrMAAKCRB4tDGHoIJi
0o5iAP0Z4efMn16t5/r1M35ktzOWRtmlNCNUYYybATjK69F4PQD/eE8MhKajPzII
oIPzRTmk3HXPYwKyGMDh4C72NKhCXQQ=
=7Gqe
-----END PGP SIGNATURE-----

--Yw5HADqUeVykISp/--
