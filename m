Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8541D3DE420
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281474; cv=none; b=lUR/pVAtjOmTbMwcRawv8BzigMdFTo1Nqur4lWM5cUsWGmedDh7cpdB8UhIOe9RrzKZO7nYcE7K8otx6f6zaYT2dWtg30edtGqG+SxyLw1JfWzhzHe8J7LfsjO7ZoXJuOxl172SawICMvSuauT3qJG3j0TqPKSnKikdw4yYQpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281474; c=relaxed/simple;
	bh=bNqw+zCUgNhPYxoHcuyW5P2bist78ZUNdH56sMW/0og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCLvR1VfEQgO7i+a/zWk9HYiHsJcsueq+NJbwAVSX0rZL9jazvSKLpBqm1yi0T0Qe4lqJuSmSO+JS1jM7UDCS+npWFa89V9TA8sgGlc99M5jYqQXfctJeTMALR/biA24VvwbQSxmh1iQcc9zaImoc/qvDt+kNWA3LKAUkYY/YhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iD5jDFDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iD5jDFDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCE11F000FF;
	Tue,  6 Oct 2026 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281472;
	bh=bNqw+zCUgNhPYxoHcuyW5P2bist78ZUNdH56sMW/0og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iD5jDFDOnxR2lZiwAAKewf7P04yYEk8hDuGms9AM24ml6zKrIdocaxWZFX17E+sw4
	 c3HE1FQ3lrskzrVPyBTKbF/7JsXCj/+GkcbFLhpKy0nM9/iRmSCsVhC2kiHxuKV7oC
	 nLODLPhJTDPvicZrg409HVmxqLMDALTE1QC7TsF7pHsQUr+WDrhIIrPp90/h0g76wr
	 nFofMY++1p13+xaR5fw3bg9OgOR1AZFaJmM+LprJGTN/pNf98p3ZOipS9GjhFk8ZZM
	 pxYXC0bgRbx0lMzhZ2RnIFSXgKnQR2QUMXTVCudQuHRrR9TqZwSJ7t6figdWs7Q9/r
	 8xKadycfU7cfw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 833A11AC57CE; Tue, 06 Oct 2026 11:11:09 +0100 (BST)
Date: Tue, 6 Oct 2026 12:11:09 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v4 05/26] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
Message-ID: <asTJPZHIYu4kO8nW@sirena.co.uk>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-6-peter.ujfalusi@linux.intel.com>
 <asS7ktuZo6z68chF@sirena.co.uk>
 <1104d890-a79f-40a1-adde-818fb1365e87@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyCZWr3yolbBhhJ6"
Content-Disposition: inline
In-Reply-To: <1104d890-a79f-40a1-adde-818fb1365e87@linux.intel.com>
X-Cookie: You will forget that you ever knew me.


--xyCZWr3yolbBhhJ6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 12:50:20PM +0300, P=E9ter Ujfalusi wrote:

> I can add the unwind, but I would rather do it for soc-pcm.c and
> soc-compress.c in a separate patch so that the compressed path does not
> diverge from the PCM one. It is not quite mechanical either: the command
> needed to unwind depends on the failing command (STOP for a failed
> START, PAUSE_PUSH for a failed PAUSE_RELEASE) and it has to deal with
> the BE refcounts and the pause/stop transition handling.

Yeah, there's preexisting issues with DPCM here.

> Would it be OK if I send a followup series to cover both at the same time?

Yes.

--xyCZWr3yolbBhhJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasTJMAAKCRAv73Ows9A4
iQm6AQDpThoLOo9OqyzZ3vHKcOoaxebLlyVke/JgIsT79om05AD7BQv87ROiEeM1
k+N398+S+McVhVNGWyJTyjVNEiOqyw0=
=tLQf
-----END PGP SIGNATURE-----

--xyCZWr3yolbBhhJ6--
