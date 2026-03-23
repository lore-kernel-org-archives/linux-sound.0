Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94980345729;
	Mon, 23 Mar 2026 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304114; cv=none; b=fVBIYvqs1FZSt1icWzTOHFad/5gPl13c+3v4WEnNsmVyjja+qCl6tCQKIISbvexiTrLU7j1bE9KdSuoDCEVg3Ba1dlnJvkmvVUIdNqtvQ/LVz8/Fyjz3Q/+n7kxqAeZZBWkcb0sfUSgWINXAI7OTMpspbaft25BshKmhmcyrGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304114; c=relaxed/simple;
	bh=wqKmbQmWxfHigh/7SSC/R9uzjBXb214d2a9EyIfpBic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awyvCs4elqgNUsPPQmBUBGF1BC7/Wb7Zh/3Zgg3dF2qVFBwQ1gvSCmiBhBEzx/GD22301CPvaTUPB7ToO+si7asM/bjqo/Ov8EMM1TtdhUSJsuUuLmrRnOhom/pK98ufqHrNl/9D8ijDT2vi1ytl6Cp7k3rZwQ+eRChcscaAlwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmS2HuFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmS2HuFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87ADEC4CEF7;
	Mon, 23 Mar 2026 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774304114;
	bh=wqKmbQmWxfHigh/7SSC/R9uzjBXb214d2a9EyIfpBic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmS2HuFtagoM4EF54vwWk1z0ftxvcTSCiGTfVIoQe0XRtdvkdgu+bv3/nbzX9mraA
	 T3sburh7Z3t8zaRTocQ7JjqaOUruwvF23nOdDTKVXwbuoQkRmE+JRsZA+UbzjqhfgT
	 2XwJTNSwoW+rxBggXTY4pI8O4x5xbPYYuhA/XK4QDP/9eedC88exVHy6oj5iZ995ff
	 4BqYhfeo0RMSEUg4rEH1TjwME/PMKx1WDUShJDZ6zoVWoiMRI5KGaf+oKJorhzc3rG
	 I7+QsFhNDfoVzTOQQGCL5PHCI0TtOscGBZntSGEdt1jqUvmxOShuG2jk+0G7ExwO6T
	 EEh1yux1LDLVA==
Date: Mon, 23 Mar 2026 22:15:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com,
	v-hampiholi@ti.com
Subject: Re: [PATCH v1 1/4] ASoC: sdw_utils: add vendor_id to
 asoc_sdw_codec_info
Message-ID: <8fd1e3d6-c3ca-4b6d-bd36-4ef9f4b6de8a@sirena.org.uk>
References: <20260323041505.2088-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yLm4IXd0auSGz8Az"
Content-Disposition: inline
In-Reply-To: <20260323041505.2088-1-niranjan.hy@ti.com>
X-Cookie: This is a good time to punt work.


--yLm4IXd0auSGz8Az
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 09:45:05AM +0530, Niranjan H Y wrote:
>  struct asoc_sdw_codec_info has part_id which is not
> sufficient to uniquely identify devices. This change
> adds the vendor_id field and updates the codec_info
> list with the corresponding vendor id as per the
> Manufacturer's id in https://mid.mipi.org/

Does this need rebasing against current code, there were some Cirrus
machines added recently?

--yLm4IXd0auSGz8Az
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBu2wACgkQJNaLcl1U
h9Cm9Qf+Ofbo+ONBWWJSvLd9Yn646GdOBUsJZYMk1PN+jIMtfrz0DLLtUGH5XrOX
6UPU4dEK9fohfJu2n6douv1U/BmWu+EexdljWMp4bHQg06EO2v1u963YHHCjnfZy
lg2hIjr/prdnPdC4vjNr+AOWPDXuHq58A5OHX7bBVWzb7sZzP8XbSmivPIBWNKjs
tDEfoPCtX+6ZlE9m8Vt93/NWVl7f11tsbjiXikz5fYITfbx+wsyYM6yDMODZBPNU
ma3fMcOaN4npBK6Cyv3VZDUxjRn8HKudN9xIFUVxn6L0O9T66tVe8C3HpXeYnEUJ
RBZiNI3Ni+JxKfDcRSzAHfWoQZaEnQ==
=1xxO
-----END PGP SIGNATURE-----

--yLm4IXd0auSGz8Az--
