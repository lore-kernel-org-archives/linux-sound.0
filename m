Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2F3B47C4
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791367; cv=none; b=LSIJTwqxJs6LPaFVMOEbMhO7uFg8054IY9oqpgkDzkKGoCj0ke1DeXney69zOm+PuoPRl/LlMm8JRKE1/XqFvyqyHG5ompoYw3dZ1qwNbuPrvzq8FaSrL4PMHUcfnQO/MR0rFJhHJTauqsqiXWOv7MyOQ7V01lWmmJ1g9kbQET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791367; c=relaxed/simple;
	bh=Ft/t7bMlmHCFAvThe7jo4eb2q/dStpAF2paohKG9hMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfIzK6vS91PeCXHAtGAkSSAyaaSz/Ms7NGSTj/JKiLklxQyjwxDD20o5Q/UVU79Td8xAlOLpqt7uAcGBrjpWGZInEL/T5MLdZTwS2yWBoSnPfyzunqPRA7EqHXLZzB1qet3Rj9uayT5uw7D5kil6n7SMXYb1WT3kJS5QZ4nOwD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro6v5jLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro6v5jLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5DF1F000E9;
	Mon,  3 Aug 2026 21:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785791358;
	bh=dtdKP9jDoyST7fVqWrJfDoefbyGoLuTDGqNhzLSxU4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ro6v5jLruuWsYbvbslXPeSr4ruF7sHOkqIpoEtIcXJvT8OAYDHwKOKTutWTrhme/F
	 yKOgkE4bMgtM84gCKz3wAKLPhFXcBboa43vEN3euDOwXI895ahz6YstQCdBmMs5r1T
	 lZLqVG1FFQztPWljmJzORz82cF1Pe4KFbNDgfbY8OJbg6vFLT9FXMU2uMPtpSj6+Yg
	 AdMCoWyoF4vfgRyZk8MrUtZAhM7rRj9i5vdMj+t0Z3uDzJQrV3QS3Mx+wNAOJmWf8V
	 sj5DF1vaHZC8x3BTbvQu+ROtLBLHVPVrRnboNktYwjyzHydp9LoE5mLoFljE6jAFMG
	 JPL9QMbEvSJyA==
Date: Mon, 3 Aug 2026 22:09:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1 1/3] ASoC: tas2781: add capture_profile_id field and
 new tuning_switch prototype
Message-ID: <ba1c9d8d-cb73-4c3f-ba8b-d44fa0b00dfb@sirena.org.uk>
References: <20260801020821.2016-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zHxPrnFfwPUVgbRa"
Content-Disposition: inline
In-Reply-To: <20260801020821.2016-1-shenghao-ding@ti.com>
X-Cookie: Prunes give you a run for your money.


--zHxPrnFfwPUVgbRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 01, 2026 at 10:08:19AM +0800, Shenghao Ding wrote:

> ---
>  include/sound/tas2781-dsp.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

> @@ -222,7 +227,7 @@ void tasdevice_calbin_remove(void *context);
>  int tasdevice_select_tuningprm_cfg(void *context, int prm,
>  	int cfg_no, int rca_conf_no);
>  int tasdevice_prmg_load(void *context, int prm_no);
> -void tasdevice_tuning_switch(void *context, int state);
> +void tasdevice_tuning_switch(void *context, int state, bool is_cap);
>  int tas2781_load_calibration(void *context, char *file_name,
>  	unsigned short i);

This will break the build since it only updates the header, not the
source file - each commit should build independently.

--zHxPrnFfwPUVgbRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpxA3kACgkQJNaLcl1U
h9C0Ggf/RBMHADynvItVGok1zQs+UzhJ6eg0eZjqo9yrHIFAWUDyblYdVUDogWGf
QCTxES9sV29LaCDVEyQknSfEkcXBW/0NB6CQHw1ouALV+qXwnv3RcvPU3Ay2r3N6
fa5WORQzwQdRir+JmQmqWSy5XXqvo79IraMFsgUhvwRThJ46jgnB+EiJ5gIGIHOv
uMG1CJ2OJttvAIbXRVuDxco/gTB2ikJulF24+uMz2Tgv+W1Rr/dPMaV1giVhK2pE
ocfoOch6Tivyn83QEW2QoOOSYQbuSB6XFIgL2Y8ci8fGta/zfMf3jELm3UiO9aKE
bm4lx27eDu8csrUz7Tdj/5Z4zYsZoA==
=fCz+
-----END PGP SIGNATURE-----

--zHxPrnFfwPUVgbRa--
