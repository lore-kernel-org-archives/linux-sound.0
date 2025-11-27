Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2606F23BD06;
	Thu, 27 Nov 2025 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241966; cv=none; b=bhHJrxHIJg+hhesql+FI2RvvQMBDQ8rCJwiAYSHkk+cpUL5Tl4Ym/uYq8yQu1r3t7jORWeV+MqrH5kUkkSr3Se8L6cZ5zQn9IniGLDMSAmxnvc0fyCqE/TguQH1rlVpd8XCm3fUBFwxhitLUwQ6/l5UZpiw/xJrSmzDTc7D2N2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241966; c=relaxed/simple;
	bh=gl+EzPNGafJ7jQJ6tiuYqWV5iXsj+0GEBxzIQ4UuGvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZWm0gO7NukIc16ueJQy7DH/7jtJmET3DUR+X7wwyxVnxRls+laZ6+pwv1VNLuIvM3w8OIBveMFaez2XjirM/ftqpcLdvqQSzu5+b+bhtrzTCO4FKDEdC+9ku7p1W65vcJ2N/caTCG96S01+ePMpabWJw0eESqqJMkjs7rSvck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=es6buQJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="es6buQJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6EEC4CEF8;
	Thu, 27 Nov 2025 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764241965;
	bh=gl+EzPNGafJ7jQJ6tiuYqWV5iXsj+0GEBxzIQ4UuGvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=es6buQJijARK6o0zrNAYGkmvMqoave5nYxcfGBzWHs4GOIx+vKEWgoK9KrXGRybWv
	 +nqDB8QLaFGrVYcBY7xQhxDYcahBDAZ68nqP4OJzZ9lHH0+5IUcp1rFISdkKh6FvuD
	 IyKDfO2tER2RnIyLR4TELsUX+hg4Jn5PyZIO8eSoG9oROXynz1fRUlJ/QUFsSpMoWO
	 YrumsVZ80jPcSCG38lbT+rb2ZPj4iymmiVxEje8z/uU/IfT6+dUSgNANTZJxRfWKWU
	 gVPZHEeEPAYDroYkjh1l1b53TsjNHmaqerB7kWCV2/Cy/mppqoEesJGi6kM0hiqeFO
	 N8qo6/DaVsxug==
Date: Thu, 27 Nov 2025 11:12:40 +0000
From: Mark Brown <broonie@kernel.org>
To: HariKrishna Sagala <hariconscious@gmail.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, shuah@kernel.org, perex@perex.cz,
	tiwai@suse.com, sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound/soc/sof:Use kmalloc_array instead of kmalloc
Message-ID: <80668037-20f0-4f56-b0fe-388b26563361@sirena.org.uk>
References: <20250923142513.11005-1-hariconscious@gmail.com>
 <fad32f5c-f9a4-4cf2-9082-845deff309ea@sirena.org.uk>
 <9e808d38-c720-fd59-8bc1-d1da6255c59b@gmail.com>
 <19d12aaf-99a2-3b9c-e1d2-c39a77c9e1b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7VXtdtPUSoiY94jx"
Content-Disposition: inline
In-Reply-To: <19d12aaf-99a2-3b9c-e1d2-c39a77c9e1b3@gmail.com>
X-Cookie: But they went to MARS around 1953!!


--7VXtdtPUSoiY94jx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:35:34AM +0530, HariKrishna Sagala wrote:

> Just checking in to see if you had a chance to review this.
> If it is missed in the box, please let me know.

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

--7VXtdtPUSoiY94jx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkoMicACgkQJNaLcl1U
h9D8mQf+LBgAsO9Lq/fz4riD+bpYduj5YuaTqWS1s6KFncq0uw+hn4WH0uoRf1i/
PzFAHGlZLPDRNqcwjA0Bg1iZipRqgAdIE65ZZ3UaROJ2b2JeyAxVR78U+qdYTkwU
wJro6uP1k/wtZ/ZPa8I+ZbafgSSXaKfyAOvQMSKT+ag8mm8vlj2JA8KXxjz2CbJY
ObuAZ0V6ByXxARZ2xsWU4rhpnQN68RtKysxQodaxGW8WPkyrmRwFwVFaxhAd2LSr
AmlmH2VPOrUoInzKA85HHJ9Zw+wX723pNazphiZ68WKZ+VDZMOH78f1iwLvM4dED
iwYnNEG9SPKQx0+ujIrhtYoeeelQEQ==
=gVOF
-----END PGP SIGNATURE-----

--7VXtdtPUSoiY94jx--
