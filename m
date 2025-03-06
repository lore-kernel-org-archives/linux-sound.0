Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB620E334
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268581; cv=none; b=jh7altkDz+4IwxKT/M/BO0g22BJAQoHCwdidYYwgAef+rrh4gSCNfK2xfhnrnRPqjfo7amiriLJpjvlyJfuO3uwhwHbP4RS8e78pvK/57PAhdx0Ve3f69atIGSQhxNU171OqITwq7JrYaBMMnfMVbn6jRnXxGmL0A//IN4gWmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268581; c=relaxed/simple;
	bh=tSIt3k8keaBpWZgmF/iwzqGutn9OVtVo1dzF5eEK074=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcadf+ObOLjv1cf+cOEzKO9G/AfiGiQHS/hc7O0wr3qh32MWwQcBW7JB8G50pBW+lx2m7ucmJGnY/bKvqtf17SzERkr8sHKLtcWr7C00mJZhPt3fJyXK6f+1uXSxh8ELaaa6AmCk6DpkvCdbytA2MwsFznY3lGvFIPjik7tGQO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWuS8w37; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWuS8w37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D32C4CEE0;
	Thu,  6 Mar 2025 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741268581;
	bh=tSIt3k8keaBpWZgmF/iwzqGutn9OVtVo1dzF5eEK074=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWuS8w37nsqjF6lyNclxjxA1wSnXE8r3SH100aMm6iM90WnMvfKN2s2RrJEZLt6Nj
	 NCJ7bc4L4FBXP6cUEEYdrNHpZzrXqD6NtuCvKabBJSZeovCHnC7bqLqJsErRxMoiok
	 6R1Kk13p/nNHBx9Ms6wO6dzBQZVXLwKQoJT95h1UVN4qbHMwoTFOQuHeEZtClY3Lvs
	 wF+I+Goej5q8ioB/6SDfkO0DeqSZKIuRSEarovkv40n8bihdpvxBBpVfAHqTVCW3Y1
	 V+fxShKUs6RHmbl2W42wsq9ycmcE761sAcMoN+tklXliXOqok7XH7ON+GfJpkHulj/
	 hFI6E0KoKFHFg==
Date: Thu, 6 Mar 2025 13:42:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH 5/8] ASoC: SOF: ipc4: Add support for Intel HW managed
 mic privacy messaging
Message-ID: <07d7106e-97fe-4895-a471-db09f7a169e9@sirena.org.uk>
References: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
 <20250306133527.16722-6-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="olEi2MV9vhY+3pBC"
Content-Disposition: inline
In-Reply-To: <20250306133527.16722-6-peter.ujfalusi@linux.intel.com>
X-Cookie: What!?  Me worry?


--olEi2MV9vhY+3pBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 03:35:24PM +0200, Peter Ujfalusi wrote:

> Platform code can call sof_ipc4_mic_privacy_state_change() to send the IPC
> message to the firmware on state change.

What's the plan for that plaform code - is it expected to be the machine
driver, or something else?

--olEi2MV9vhY+3pBC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfJpl8ACgkQJNaLcl1U
h9AZVQf+NM+Qxxq4XkzlwMVZsbQERrtiGCc2JysYQ2ek6otHCg3LGJW6Zjpw1xtN
jIOeniG2N2RFm7UGbH3TCty3FjH+pwLfASL7X/dOGhnhUcYfWyWQ6ufWb87lUQXC
rwLn7MgIbh/6RNANNM40GwvzKE7nnArqjuI4bFCf7jcFonmatL9AubEnkeBTkp7o
tir1wvJYK+sweLqsF5b4UNfDqrkfjN1AKbEolq+H64JtzVjhQ2UcQ2VkEjHekVI4
+Bgtv4eRsUj21d4DBGxysSP93MRKvEosWC2BtS0jUgGZmKircTgcIPHH2dLjEzNi
IikKFC52p6BRb8nxL1tS8DFK+TI/Og==
=Ag+4
-----END PGP SIGNATURE-----

--olEi2MV9vhY+3pBC--
