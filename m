Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDFB5B1FB
	for <linux-sound@vger.kernel.org>; Thu, 14 Mar 2024 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421782; cv=none; b=im00JhZUOOrpiPet3Zw8NgXQ3eNvMbrlng85KBHnNXuYTIVqg8/NEWmO26DA78aUhIwhRhlUBNuFBqqjBza8nyTJ7+bXQeTzL6aAnXPhk+yjO+A7I11YhpPeVqjX1vC/a/gX4TwUR7Ll4WKpoY73FqZPF2WNV13MqLXwGI6e1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421782; c=relaxed/simple;
	bh=moxYV2veOlDpbPvBbKmV/hhhGqmcCwXrXFGWDDOO4Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz66RtgZIqRFmg0FenPWE0STwrZ9f4+0RfxaXSkWozb4YzjabfbnuWqciXYBmUDvozNCv08Uo/5dDB4Jey/++gP+bUVgyH0C5RDj+zifjgGRmDRhgf07ALE/JG8PFyokOKnJUDLMRwR1LntIyTKvevTPds8BOw5+cR0EJudkcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3jt8NB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3jt8NB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279C4C43394;
	Thu, 14 Mar 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710421782;
	bh=moxYV2veOlDpbPvBbKmV/hhhGqmcCwXrXFGWDDOO4Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3jt8NB25j3xTBSuuzb2vv7Stl2AxO0P5BJSu7IkJ5NWLIEN6cl/5rP/3V86UQaWX
	 CaijZvr9t2JS5+7kcIejI2eLOpNxxCAFnMJUZi4KrZt5qM6yiQFHVHUEsVEuf7ZKSd
	 qUVfekbE7u/W3344XsaXAz9XurHPO9TVeAE3r9JyR+ijbQEt6zWWRUbRp6e5o0PfZS
	 1PypTDVlwBCJMWwmjG20cYbVreCp9y5S5lRywVCzaiFNO6EfeyyhzPvXpGV2rvZLdY
	 vgevmcdb/Qqsz5mQb4/XvNiUz/wEh8yJiM4tTqL0Zx6J4T6rzzkQhQDn6Hhdrkp3YN
	 Z3yGcYTNF20Jw==
Date: Thu, 14 Mar 2024 13:09:36 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Jiawei Wang <me@jwang.link>, linux-sound@vger.kernel.org,
	sashal@kernel.org,
	Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Subject: Re: [PATCH v3 0/2] ASoC: amd: yc: Revert "Fix non-functional mic on
 Lenovo 21J2" and "add new YC platform variant (0x63) support"
Message-ID: <60271890-cdb4-427c-9ade-49b2fa492e7b@sirena.org.uk>
References: <a127404b-a071-4917-8ddb-d7371c721827@sirena.org.uk>
 <20240313015853.3573242-1-me@jwang.link>
 <2768b0a2-d228-4d26-90d2-b4f6d83cfb5d@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CCuayVdyU+TKu+5m"
Content-Disposition: inline
In-Reply-To: <2768b0a2-d228-4d26-90d2-b4f6d83cfb5d@amd.com>
X-Cookie: WYSIWYG:


--CCuayVdyU+TKu+5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 10:44:27AM +0530, Mukunda,Vijendar wrote:

> Could you please apply this patch series? Without these changes, function=
ality
> is broken for Pink Sardine (PS) platform.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--CCuayVdyU+TKu+5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXy9xAACgkQJNaLcl1U
h9DUxAf+IpWvDUzWTj/LNFVrrKF33135Gh3lD6cSTYGUVHZXkh+LQOGRW727WDO7
wrDj56K8JAPdlps4eR3jxWL/WBV60fRNxo0YCUCblGxG4oWrdBYWTFOk1kqniLTl
i29eRm8A66pic4+xixCZXMyqNY9Id0YH7DbD1WPAuY63h3h1oAYGJbQTyHjvG9rF
y11Zq/nz4tzR27vnDHAEFSlxjvnW4Rw6o2daFuJqfveod6tCuBk/Mk0sas4fgvcz
CiUgBNyqliBMRLi9PnEyfE5aQjFMM0dfkLul+MRG5BadxdWY0Xo+Q2wRM8ntCg6g
pLi7jk1Ju/dpg8V5ly9MIFp+F5RPZA==
=LpN0
-----END PGP SIGNATURE-----

--CCuayVdyU+TKu+5m--
