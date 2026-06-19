Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510D9348C61;
	Fri, 19 Jun 2026 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869694; cv=none; b=duSBb9sA9RZjCCg5QhDNEZcjr9ckteCIbGdBlJ9EqjDiNwkGUzfv9N3PQaUaUanodqHOZgQ0wIa+3d5pgJkhLcd8E4hj/3/zioYxn5spzRfI/hMtqebkP3GtECvB44aCM8D5E1h+fjFybA5oRkSrfEWzmKts/XaGrHvCuzOQ+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869694; c=relaxed/simple;
	bh=nosz4tn8/tEXxjvcQ13H2YQ6eYqlrQ8U4s/FQ9Oi69Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMd3eWxpjYX2FBsCEEs8AcfGVJlFN1b73PsgdPm+TovfyrCCcoxAluk3GLCn7sryroJZN0oLtgH4uXonAU/323zPlNP0bsqsaEuLNOIyfeO4F9pFpnvHGI+5p7R053H/wUzuVv+SeVdF+uJ4GPJqLRposQzxOC+V8jQjsYCmBwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kL5DzCtX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kL5DzCtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8451F000E9;
	Fri, 19 Jun 2026 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869692;
	bh=nosz4tn8/tEXxjvcQ13H2YQ6eYqlrQ8U4s/FQ9Oi69Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kL5DzCtXKZQQ6IF146jKcxQ3PZm59bTnxTDdLTc/0tZ85fpCjR8e0nH76wC54E4fv
	 H9W+WQMBOQ4tJGEbYaIFvbWhQJsAEJ1ZiDYltCPtyXY0GsEgpt4U9s28OxEBnvEQ3i
	 hi1kSp3sF4oZjU/lsSjVo6djvoB2ubudS6dIwMpCfHrwaFbtHIHx4Sb1cOR4gzOktS
	 EoKZsWw1lif+SAleZ1NW/2CFHfrf26rGBK7y0Ex+1QAz5XFB8bXfqQTXAux39OSgXN
	 xripoHrJAIS/oGy00bYCs1bMQ8nbQLzyQu9AomwBi86zUpC9qtP+JYyDPTkB6aWubD
	 mIz5DNB+gIa0Q==
Date: Fri, 19 Jun 2026 12:48:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rander Wang <rander.wang@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: rt700-sdw: always drain jack work on remove
Message-ID: <3c7b621b-2eb7-422f-bae8-03610e79dfdb@sirena.org.uk>
References: <20260619080334.2296419-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mhYOf0XvyoT4aJep"
Content-Disposition: inline
In-Reply-To: <20260619080334.2296419-1-runyu.xiao@seu.edu.cn>
X-Cookie: Courage is your greatest present need.


--mhYOf0XvyoT4aJep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2026 at 04:03:34PM +0800, Runyu Xiao wrote:
> rt700_sdw_remove() drains jack_detect_work and jack_btn_check_work only
> when rt700->hw_init is true. That state bit is cleared by
> rt700_update_status() when the SoundWire slave becomes UNATTACHED, but a
> jack work item can already have been queued by rt700_interrupt_callback()
> or rt700_jack_init() while the device was initialized.

This doesn't apply against current code, please check and resend.

--mhYOf0XvyoT4aJep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo1LHcACgkQJNaLcl1U
h9COlQf/Vbm32caJOTw8K22wDeCm35YTrE23qNIb9oYRtvEfsEqVH/KdYDW856B7
5qryXCaXvCGQmTYiPcOsQOcqUa90BU1uEdEeYZeWvcctMIzIQN8ywAm+OJ5LVCMW
43j6YCax/XG1ZHGrI9fYcVRUh6DG0iGHt4w6CgfmgyBAgJaKXX9/7q5jPhgdtgdt
WFFn0c0ZevWz5xYanbW9Rf1kAPTKkxaBnHvU6+r/5y6tWWdw4n+lvh6nW/1pVul6
8i3ugW5r6ANRAIrloDXSue2hqhLyOlmS8fBbsWAJPkst9Y8f43hxIYAACJlUF+7Y
p7QxY7b5upUnQwiPeW2QvekzP0QxKQ==
=V+v+
-----END PGP SIGNATURE-----

--mhYOf0XvyoT4aJep--
