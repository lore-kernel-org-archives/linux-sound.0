Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0383BFE3A;
	Thu, 30 Apr 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546636; cv=none; b=CEu9mrcYzKo4Oxiy/eNmiYFFnZ1U71mZUC9BcUvTfYVSkFJUY91o1Zp6ratScCOgsrLSc8J8G6NXHbIcuEl1uOdIQUohBXGgesz3RZ4AlIBPxpOy+eCNBSgs1bSLBloD+Pl/Vm5Bu0YWghtRaBuWqLJmA9sh+g13xholqt7stPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546636; c=relaxed/simple;
	bh=PQNIMo2BpV98lLEoLSY6fWGreFp5u1iHt2sIrfI3VL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMNTeGj+/ehKaGHOqF+kHPuobevfCUnUTe0hqPL7Q2tN1Kvx/ql9RqNJYFA7W21nUoze9guGDcjbHffkaKSQw5pI0tyPYIKOmIesuxMk0LpAdejER6Qkc3fvm+ZzYUln7XnoRb8VaFFH4YvZpGj73+6VNJUiuQr2oz2HtUC8fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIt2pCVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIt2pCVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0426C2BCB3;
	Thu, 30 Apr 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777546635;
	bh=PQNIMo2BpV98lLEoLSY6fWGreFp5u1iHt2sIrfI3VL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIt2pCVuAC3WJw5QXsIW/KdNTaLi8yN8JRKkV+CEFifcjzRwiS9Cq1RJ9xKBFnMYd
	 67dOZq2jinwSAFXdfY2U0Y9fPajGEH26kHMH+ZLj92DdIwdMrxMFs9jjlEgQzr2Mgq
	 uXojMFBx5BCEUiXy/tPSR6kKDuQORf1NZ3gGWnsqN3njXxQmvcgryXek5QcE0qxKHB
	 fJz62BOtaV99xNmJ7UefhF5OlV6L0T6ciISA2xienfw/K1ep17XZ8GgmL8JKjwV5M0
	 H6MT5P2L5flxBQFtRMeAmFYgX2bMNPXRP6rKxenTalJGr1sDlP+ntRtekry1Ho33wx
	 bH8uBXRRAngbw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 778DB1AC585E; Thu, 30 Apr 2026 11:57:13 +0100 (BST)
Date: Thu, 30 Apr 2026 19:57:13 +0900
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v13 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <afM1ib1iQG0ha5l_@sirena.co.uk>
References: <20260430072324.2183-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QF+UMiTBb644z40/"
Content-Disposition: inline
In-Reply-To: <20260430072324.2183-1-niranjan.hy@ti.com>
X-Cookie: 667:


--QF+UMiTBb644z40/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 12:53:21PM +0530, Niranjan H Y wrote:
>   Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
> power state transitions. Per SDCA specification, after writing
> REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
> is reached.

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--QF+UMiTBb644z40/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzNYgACgkQJNaLcl1U
h9B1uQgAhhi3tYqXgrRnn2ArDWgW2Nc8v0UwjQU5kobsOG/2D66VWgQ/A7oKGpGJ
A00sJz73Zy+hyOWH2rNeEjyc9fXL122KfowsCtCTQcIjZJECRPz/DWfCRtVh+rfG
lz1BUvnjiAyaXWVrxZZll0CSSz/qoC7uTBSBui3YfpNaukGyRX+PPejHKPfeJsvk
UmLcs4Gwm2Vgl5Im/zrMy9UmZ+ywdz0Bz0FFrH+o0MR+aSkrgbwrDqFQUnRhc4c3
QblxpfmgazVt9dla2qTpICjmfMgDpU1iJ6EamgTXNTrqQY5iN44+7+GVfiUGGV3B
XuCz+tXv/OCm/SU0fhax0tXMv7MLdw==
=xSnY
-----END PGP SIGNATURE-----

--QF+UMiTBb644z40/--
