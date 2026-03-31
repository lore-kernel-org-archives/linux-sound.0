Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77194426D29;
	Tue, 31 Mar 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975852; cv=none; b=iA1u1FRchlTKk7nfHsU+Z3UWIDoMwfU/Vs9wux4SWObZt768dekFxzbznq83aq+GxVV91VCB1a9wlv7H10I98gehDzWl7bbdq1muQSa2wyPYBxSdtp1z3F8NtM/fbhCahZb7nryXRF+ylsILBBzNfJD3KVV+yW6xNa2y8vys2+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975852; c=relaxed/simple;
	bh=EJKY2UxCxiReZYgibbbEt2Brg1tU1kiPznWmqtnL97c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5u+H0KOpZYVdlTIAw51lO/M32oOUdXNLrN/jNLcjGv6hj7GkuQSIBHcoD1ecEidPmUsfH4j1yCvJd4r1pxLtmnxzj8uItK2jgSdfJoIaZiTxrQfyHBujLf/BHMKD0HGF3SPvcLtnNTQTC2DDGoDdcYReLCeUS5PyVsAhEanBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2p/w2mZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2p/w2mZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B754C19424;
	Tue, 31 Mar 2026 16:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975852;
	bh=EJKY2UxCxiReZYgibbbEt2Brg1tU1kiPznWmqtnL97c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2p/w2mZmvaJQNfj8YVfHPte/CIZluJCSi+Q14tARZbWV/JRmOF26SqqkyEAFeGhN
	 vy2cpa3RJwmIxTaAAzk0PoYCbbKCgxP1GMbokDSKzijbbwQBiIs0OSzZBzE2DOR5zq
	 DFYTUQWDCAiQd8thh1onHpUnPR9T5oFwxkJizoja/9CVmmz+hoPMopGqBIFwT5StiB
	 FjVR5pjKld8EFfZRxeIJn/vykBr8W7QXcZTFBKZ+ayCUHZZjMz8CSZV8dQZKe84KlC
	 6jpGoTdG1IHHFTwJPAl5pMSeuCBXR+ROfarerq/HL+mJ6LaFZ9FLRhfTsaExjQZI2f
	 8crXJ1mBzWqcw==
Date: Tue, 31 Mar 2026 17:50:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <bf385693-40ca-44fe-bfda-7e9cf5a27328@sirena.org.uk>
References: <20260331151638.1281-1-niranjan.hy@ti.com>
 <20260331151638.1281-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bYtOkZENscJz2yG+"
Content-Disposition: inline
In-Reply-To: <20260331151638.1281-2-niranjan.hy@ti.com>
X-Cookie: I just had a NOSE JOB!!


--bYtOkZENscJz2yG+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 08:46:36PM +0530, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.


> +static int tac_cx11_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct tac5xx2_prv *tac_dev;
> +
> +	ucontrol->value.enumerated.item[0] = 1; /* Default to DC:1 */
> +
> +	if (!kcontrol || !kcontrol->private_data)
> +		return 0;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return 0;
> +
> +	tac_dev = snd_soc_component_get_drvdata(component);
> +	if (!tac_dev)
> +		return 0;

Shouldn't these be errors?

> +
> +static int tac_cx11_put(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{

> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_CX11,
> +					TAC_SDCA_CTL_CX_CLK_SEL, 0),
> +			   val);
> +	if (ret) {
> +		dev_dbg(tac_dev->dev, "cx put failed");
> +		return -EIO;
> +	}

Probably nicer to return the error code you got here, and also include
it in the log message - that'll help people figure out what's going on
if things do go wrong.

> +/* Volume controls for mic, hp and mic cap */
> +static const struct snd_kcontrol_new tac5xx2_snd_controls[] = {
> +	SOC_SINGLE_RANGE_TLV("Left Amp Volume", TAC_AMP_LVL_CFG0, 2, 0, 44, 1,
> +			     tac5xx2_amp_tlv),
> +	SOC_SINGLE_RANGE_TLV("Right Amp Volume", TAC_AMP_LVL_CFG1, 2, 0, 44, 1,
> +			     tac5xx2_amp_tlv),

What's the logic behind two mono controls rather than stereo controls?
There's a bunch of these in the driver.

> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{

> +	if (dai->id == TAC5XX2_DMIC) {
> +	} else if (dai->id == TAC5XX2_UAJ) {
> +	} else if (dai->id == TAC5XX2_SPK) {
> +	} else {
> +	}

This should be a switch statement for clarity and scalability.

> +	switch (params_rate(params)) {
> +	case 48000:
> +		sample_rate_idx = 0x01;
> +		break;
> +	case 44100:
> +		sample_rate_idx = 0x02;
> +		break;
> +	case 96000:
> +		sample_rate_idx = 0x03;
> +		break;
> +	case 88200:
> +		sample_rate_idx = 0x04;
> +		break;
> +	default:
> +		dev_err(tac_dev->dev, "Unsupported sample rate: %d Hz",
> +			params_rate(params));
> +		return -EINVAL;
> +	}

This allows userspace to spam the logs doesn't it?

> +	if (function_id == TAC_FUNCTION_ID_SM) {
> +	} else if (function_id == TAC_FUNCTION_ID_UAJ) {

Again, switch statement.  There's a bunch of these in teh driver.

> +static s32 tac_fw_read_hdr(const u8 *data, struct tac_fw_hdr *hdr)
> +{
> +	hdr->size = get_unaligned_le32(data);
> +
> +	return TAC_FW_HDR_SIZE;
> +}

> +static s32 tac_download_fw_to_hw(struct tac5xx2_prv *tac_dev)
> +{

> +	buf = tac_dev->fw_data;
> +	img_sz = tac_dev->fw_size;
> +
> +	dev_dbg(tac_dev->dev, "Downloading cached firmware to HW, size=%zu\n", img_sz);
> +
> +	offset += tac_fw_read_hdr(buf, hdr);
> +	if (hdr->size != img_sz) {

We don't validate that the file has enough data to read here, there's a
check after the request_firmware() that the file is non-zero but it
might just be a single byte.

> +	while (offset < img_sz && num_files < TAC_MAX_FW_CHUNKS) {
> +		if (offset + 20 > img_sz) {
> +			dev_warn(tac_dev->dev, "Incomplete block header at offset %d\n",
> +				 offset);
> +			break;
> +		}
> +		offset += tac_fw_get_next_file(&buf[offset], &files[num_files]);
> +		num_files++;
> +	}

I can't see anything that validates that we stay within the buffer here,
we're checking if the header is in the buffer but not the payload and if
we do overflow we just exit the loop and...

> +
> +	if (num_files == 0) {
> +		dev_err(tac_dev->dev, "firmware with no files\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}

...so long as we found at least one block we'll just carry on.

--bYtOkZENscJz2yG+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnL+2UACgkQJNaLcl1U
h9BtIgf/bU7EFwG2Y+SSEzYJH66e9beq9YPIMBrknmMG8BLsw3g9gSO7/iU8waKb
KmMlZ+pgZqVfqXpDwDK18Kee3DFg/DKit82Ivt4ZNBo9GivPRLAvzGWdHbvFBWAS
tSGwurfWWg+hSrrAoBHVTfL0iy4LnpPWt3/aUW+qZHkrOA07Sxo6bZyMTNWDsjS5
AHta0DFiq6ZfUGzXAxAYdC43qoF+z1gVSP0g7vYpxoCxYDlC+9ut7TnbPtAsKik8
+QiwjCxTHJPjkZSEyI3bgACBDVJUUzCu9CHRkIXEoN1AQlkZ8KgouL/S9eD1apXm
GupKPmIqV3/+3mHYP0ZnkkmnceL6dg==
=1Iua
-----END PGP SIGNATURE-----

--bYtOkZENscJz2yG+--
