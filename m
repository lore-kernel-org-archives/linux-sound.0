Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241633BBB1;
	Tue,  7 Apr 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579480; cv=none; b=YaQo76qVc1Q+2RA8WsWs9p0p8bf54yMwZanEEV74buJvBHu1Vxd6NokhuxQ9gGkyFb8EtNfantUuQhDpFm/pGJ2yYiJlnzc05QRzQn++//6QaM8L6M1cZXL2w2nly+9DeBzICh8R49Eh+exFXN3ZCjbqkt9vte/iMRH1de+77T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579480; c=relaxed/simple;
	bh=IhhGju7oqqnV8Z9qZnQxFbh0mrHzfgv6Yu9RulAXYoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcnSNWdC5GrIJXDTQszHAtbH40z4FmIH0sB8pmOm/9u8eop4uQ4Gl5CsNF3wrD3F1Qo9u2gFJN0VyldJh5wLJNzJh9VLluLFFeKmM1LO1XKyE5VHREulRKe7Cso1fbmnxtbc2XdXaulCNMwfmnxnhaF9qBPGHo971/H7dUPZLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDkctQHv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDkctQHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A43AC19424;
	Tue,  7 Apr 2026 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775579480;
	bh=IhhGju7oqqnV8Z9qZnQxFbh0mrHzfgv6Yu9RulAXYoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDkctQHvLp7g9/jJ+p1nJTETl7ZdtpeXwsEmPb7btZRnBnSyt/3cKCyTBGoPTQuXH
	 b4fMBEmB7YczsqnheAYtiWnYGAB2Qgsly5Tjuha+amL6487SnyZ4edFKMHULji116z
	 +TT1mEXS7gErUUnfgNzx6+AyXb6rSi5eeA+aCvckKQN3/KKAN70ZdHVxGEm/5o3u8f
	 C5JjsGtI0gA0R/iUdvMGARoMSoyrhIGhbdwdMGLV5T1KsPC3tcXqQpt7oW9Y2stPPe
	 R/vRDyZm0kWgKgbSbms6ZC/tE+uNWMP3O2tWwkNbwocoSILUMIODjMCcNBRH97BIOD
	 xkxJzy9gG/MJQ==
Date: Tue, 7 Apr 2026 17:31:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v5 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <476c9252-fd4d-4e9f-9f32-6ae3aa3ddc1c@sirena.org.uk>
References: <20260407094829.2391-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xt+1sMGIDHIUEAge"
Content-Disposition: inline
In-Reply-To: <20260407094829.2391-1-niranjan.hy@ti.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--xt+1sMGIDHIUEAge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2026 at 03:18:27PM +0530, Niranjan H Y wrote:

> +static s32 tac_load_and_cache_firmware(struct tac5xx2_prv *tac_dev)
> +{
> +	const struct firmware *fmw = NULL;
> +	const char *fw_name_used = NULL;
> +	s32 ret = 0;
> +	u8 *cached_data = NULL;
> +	u32 fw_hdr_size;
> +
> +	mutex_lock(&tac_dev->pde_lock);
> +	ret = request_firmware(&fmw, tac_dev->fw_binaryname, tac_dev->dev);

This is happening in the SoundWire bus callback - if request_firmware()
ends up being slow (eg, a userspace helper faffing) we might block other
things on the bus.

> +static s32 tac_download_fw_to_hw(struct tac5xx2_prv *tac_dev)
> +{

> +	while (offset < img_sz && num_files < TAC_MAX_FW_CHUNKS) {

> +		if (file_length > img_sz || offset > img_sz - TAC_FW_FILE_HDR ||
> +		    file_length > img_sz - offset - TAC_FW_FILE_HDR) {
> +			dev_warn(tac_dev->dev, "File at offset %d exceeds buffer: length=%u, available=%zu\n",
> +				 offset, file_length, img_sz - offset - TAC_FW_FILE_HDR);
> +			break;
> +		}

> +	if (num_files == 0) {
> +		dev_err(tac_dev->dev, "firmware with no files\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}

If we've parsed any files then an oversized file will just break out of
the loop and download what we got already, is that desirable?

> +	if (tac_dev->sm_func_data) {
> +		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
> +					     tac_dev->sm_func_data);
> +		if (ret) {
> +			dev_err(dev, "smartmic init table update failed\n");
> +			goto io_init_err;
> +		}
> +		dev_dbg(dev, "smartmic init done\n");
> +
> +		if (first) {
> +			/* Set default value to CS:11 */
> +			tac_dev->cx11_value = 1;
> +			regmap_write(tac_dev->regmap,
> +				     SDW_SDCA_CTL(TAC_FUNCTION_ID_SM,
> +						  TAC_SDCA_ENT_CX11,
> +							TAC_SDCA_CTL_CX_CLK_SEL, 0),
> +					tac_dev->cx11_value);

This looks like it could race with tac_cx11_put() - they both write
cx11_value but the control could be modifying it.  I can imagine that
happening if userspace starts and is setting config while the SoundWire
bus is coming on line.

--xt+1sMGIDHIUEAge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnVMVEACgkQJNaLcl1U
h9BHRQf+KQyCX4Yu9sbBhfgi35l4wvLKRvGI+Cvihs2u/dDU6xlUd2hdc0BawqsH
lSrEDCdboi+kXdQWOYy4q6GJWFrVA6eI9A5l1jQuni9/Oavdj8ZigPBgL6Tcikuw
g1zYucxfMIhho92F3rqf/azdG35NkS00uJM3eGNK3qxY9oOJVTSCdi2j/dQgjyvp
WWEd4YSZCwtFgdqIGWPqTAWFbQPkxWONTuUdtUa/t67tzunptFrgurZuk84MBtbT
vtGA587GxbpsxsswO1Up28+/uS7EOFyBMQOgxtvNEInNHjDuXJMhO0pqjyCSR4vV
/CBZZpudF35sH40sS/oHshgmz50/wA==
=Cri3
-----END PGP SIGNATURE-----

--xt+1sMGIDHIUEAge--
