Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555F2E06E6
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282948; cv=none; b=HE6TdCNWEdGp9zRZBRn8LDsS3jeTDrJSPDDOXcZZmd5PAHXMguMOLVjrzlRNKsk+2T3cZUxsATQeqeqjvava4Pz5X136O9kIf6ldLqxXTvzHF1Nxh2320KycHQ0aeOfhxVk/SRE+rNOuoyg3zQIMVnjvMNsV5kZBcAa4lpWNlnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282948; c=relaxed/simple;
	bh=1vC7CpvtPvKGRciZdSDZePOIHaDOhqLg49fvBf9jisM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/rU5f3Jtym0mgjkqyD2HMbE7iFPYd03zz4LznWUJX5Qu5mAMmNqckDCqamkyrfD5RVvFNSQgc9hU2EkLV/HDQoYLfsx0OCFB+kWZuuxAv7b2aved0PihBPX+q5qYN2RXGjndEbcdOSsOsTSjMQoc15JJq1HwfOJdWiEjdJSDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU6spfk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU6spfk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BD51F000FF;
	Tue,  6 Oct 2026 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791282947;
	bh=b1UEEpblZ0ZVQuJMPP41L1HXHA1MpcXN3ajGPd7PzSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UU6spfk5LC3RrEDcL1H5l8cH15lQ/1EUwXhSdGXykLzjvKvjTtKzS5CIwcTz7kSMf
	 /QNeMMWVbBPqLRps/PA0fVk4WVbfWNPaTOSHxVaqnlD6AHwZS15B2WRqHkEk47hvVb
	 Ch2pVmjd1H50/bIG4II3chiPJIHQgDK8fxx0srYm34bI1iFbLtVO5zaaWn3gP6sTJo
	 HRi/1ioTeUubwv2/SYSPRPQ3FJnWmMGZVw3Xiz/j23D0bXj1JTTJxJUGvQ4+EEEqsl
	 UBkSdDTMp1MA9svgCz8o2+LB4eszPpd6lUnw7h8oAW2qYaKEtsLN5WS57oq16nHTdO
	 kjY4sBgYnMDaQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2BCC61AC57CE; Tue, 06 Oct 2026 11:35:44 +0100 (BST)
Date: Tue, 6 Oct 2026 12:35:44 +0200
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v4 02/26] ALSA: compress: register the open file with the
 card
Message-ID: <asTPAE4oztNl58QL@sirena.co.uk>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-3-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvgk3NIEc8T1ZjPJ"
Content-Disposition: inline
In-Reply-To: <20260916120320.18318-3-peter.ujfalusi@linux.intel.com>
X-Cookie: You will forget that you ever knew me.


--dvgk3NIEc8T1ZjPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2026 at 03:02:56PM +0300, Peter Ujfalusi wrote:

> @@ -174,6 +182,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
>  	module_put(data->stream.device->card->module);
>  	kfree(data->stream.runtime);
>  	kfree(data);
> +	snd_card_file_remove(compr->card, f);
>  	return 0;
>  }

You don't declare compr until patch 3.

--dvgk3NIEc8T1ZjPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasTO+AAKCRAv73Ows9A4
iSv6AP4zpUs5P+F8I48lzKZqLgSubAtVbBVsxnTV13nybjHzoAD+PHFhcRV2tZbJ
+9TWY40NtDk5z6keAPv1nRgI5XwE2gA=
=I2KG
-----END PGP SIGNATURE-----

--dvgk3NIEc8T1ZjPJ--
