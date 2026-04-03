Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363E3064B5;
	Fri,  3 Apr 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222765; cv=none; b=vD2IEqBJ6vh8wCppXn92tlbxaYsB9s3PjbFhBCTGmmQbaVDiQ+8hl+xUEfrOhlZV9L+lYiTUYHtm3+rLRercObnZHEoqEk/zSE1qnfwY9/5L3nW5/rj01UOlt/ya0iQDvGINtASUI+8DlqMctRkduZjHN0AvdGRrAxZI9X3yNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222765; c=relaxed/simple;
	bh=6H8ZOdUlnj4xej6kjiSRihuxPeol09eRmtdapdzL98U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6pEpEQo/ObqOoTrPSjUNP5t8Gby4PE6u7tTO1NPHRNXO/b8kO5cTqlNKW1Ms0XCCaP09p0ws9BqRZ9DFGvlMsYyTbI1VYLlmEQziEYAx+4OnZR0FqNxWhg3b7/i0HiAdVCQRuEXHgsFCGnAmDja4CnWAF4yjfwX9GFfczZjLEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lG8CwJXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lG8CwJXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA866C4CEF7;
	Fri,  3 Apr 2026 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775222764;
	bh=6H8ZOdUlnj4xej6kjiSRihuxPeol09eRmtdapdzL98U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lG8CwJXHWkE5EHW0zmRyDXH6YLZ8aV4IjUy+YAL2m33ILVUQyaR2U5XIOWptn/S1C
	 GUVzi1zpn0a7XcTuufv9qu81JhnkUdTlsXdx5NxX8FVgM06eQ9Bqlmc6GVR+Nnao5M
	 WEPyDJUwA8tkJJNTLsmYhmM+XJb3Pw81Rn82YodAK1cVSgj0Xi4UkRl4svB0G7FAEM
	 GWGCq/Gpvt7L7h9CJ7vOfkqjxSlZ9Y0EXhhTR98jplJQMcs97aCXKCGDHaGD19v+8N
	 EKSPBDrJYkCtoF4av8WmrySyAj73a6OxFjVCfYUNxZkZvOFnY7bGKXYJp+Qr0VKhTe
	 PUWatvMWUAygA==
Date: Fri, 3 Apr 2026 14:25:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v4 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <f6b53407-1655-45fa-88c2-f7d348c78bc0@sirena.org.uk>
References: <20260401132148.2367-1-niranjan.hy@ti.com>
 <20260401132148.2367-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uSf/oosmgJ3A9tfs"
Content-Disposition: inline
In-Reply-To: <20260401132148.2367-2-niranjan.hy@ti.com>
X-Cookie: The Korean War must have been fun.


--uSf/oosmgJ3A9tfs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2026 at 06:51:46PM +0530, Niranjan H Y wrote:

> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{

> +		/* Detect and set jack type for UAJ path before playback.
> +		 * This is required as jack is not triggering interrupt
> +		 * when the device is in suspended mode.
> +		 */
> +		tac5xx2_sdca_headset_detect(tac_dev);

Do we need locking in case the device is not in suspended mode and this
happens to race with an interrupt?

> +	ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +							 TAC_SDCA_REQUESTED_PS, 0),
> +			   0x03);

Other writes here are protected by pde_lock.

> +	ret = sdw_stream_add_slave(sdw_peripheral, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret)
> +		dev_err(dai->dev,
> +			"Unable to configure port %d: %d\n", port_num, ret);

Is it safe to only log this error, will the PCM have any chance of
working?

> +static int tac_interrupt_callback(struct sdw_slave *slave,
> +				  struct sdw_slave_intr_status *status)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
> +	struct device *dev = &slave->dev;
> +	int ret = 0;
> +	int btn_type = 0;
> +	unsigned int sdca_int3;
> +

> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT3, &sdca_int3);
> +	if (ret) {
> +		dev_err(dev, "Failed to read SDCA_INT3: %d", ret);
> +		return ret;
> +	}

Can an interrupt be generated during runtime suspend (or race with
another thread doing a runtime suspend)?

> +	snd_soc_jack_report(tac_dev->hs_jack, tac_dev->jack_type | btn_type,
> +			    SND_JACK_HEADSET | SND_JACK_BTN_0 |
> +				SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> +				SND_JACK_BTN_3 | SND_JACK_BTN_4);

The detection function detects line in/out but this doesn't include them
in the report mask.

> +static s32 tac_download_fw_to_hw(struct tac5xx2_prv *tac_dev)
> +{

> +	offset = tac_fw_read_hdr(buf, hdr);
> +	while (offset < img_sz && num_files < TAC_MAX_FW_CHUNKS) {
> +		u32 file_length;
> +

> +		if (file_length > img_sz || offset > img_sz - TAC_FW_FILE_HDR ||
> +		    file_length > img_sz - offset - TAC_FW_FILE_HDR) {
> +			dev_warn(tac_dev->dev, "File at offset %d exceeds buffer: length=%u, available=%zu\n",
> +				 offset, file_length, img_sz - offset - TAC_FW_FILE_HDR);
> +			break;
> +		}

Shouldn't this jump out of the loop to the error handling like...

> +		ret = tac_fw_get_next_file(&buf[offset], img_sz - offset, &files[num_files]);
> +		if (ret < 0) {
> +			dev_err(tac_dev->dev, "Failed to parse file at offset %d\n", offset);
> +			goto out;
> +		}

...this does?

> +static void tac_remove(struct tac5xx2_prv *tac_dev)
> +{
> +	snd_soc_unregister_component(tac_dev->dev);
> +}

We used devm_snd_soc_register_component() so this should result in a
double free.

--uSf/oosmgJ3A9tfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPv+YACgkQJNaLcl1U
h9B6ogf+M0J4d/s0QiIW2ffe6mWWWlKr4FVA7j//+mmTrmA2s+a3S1lRTjpb6K+i
CgJ8+b50ETtkF4NKClRsm5RLlPRxzFcWKABF8tbLDopYI6odlQ3WzieljX+gG/gg
jky96xG8q4UYmUsAQVb+uJMQ2eh5AyAoon+J8sWRejXpGssq0/+Ll/velPYNiueg
u3IDESZJVQEufWogGYRvAAJKQqGsHVSKmJQm2nhofNwV5+jRlHbbcBAK3pfiZ7gu
9LdV5jZK9zXchLJvmOYKS4MqCvrzoIMYEVHWCUcvVuoaMBD0i75e4H/kBuBUAiW+
3pyJfhMETXZpjnyXEiqw/MhqtSNx/Q==
=stMn
-----END PGP SIGNATURE-----

--uSf/oosmgJ3A9tfs--
