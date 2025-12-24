Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19527221F34;
	Wed, 24 Dec 2025 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766608210; cv=none; b=IoI8mEmhSl0QAVDvB75dJLgr+yUq7rN+5gRteEjcxEeothNL1+ctQS86r+oA0kay3Qv2KZ3ApuGIMSDazavhv/p1E1EU0nH9loYBvSn+fbGJLYU+Ta76o6NDeLwAF8f/DHAhzRPLfS/qhUFO4ptQdIg5f8+bdOxBcwUYytZL0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766608210; c=relaxed/simple;
	bh=wmS3id9EcK0cIQdCD72nBHD46MqIrntdRcKGmvGTeKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ht+jWzj8QmiWY/UGi16jLFvom7e05XS+3fAt4DtGvarB1lWfsWeE9sRt7iSqNVfkKyL1Nt8UhLAfFTxv/N8MdIeNiC5xsDg4XHNdpNHHCEValZ4tye27WeB/QKHxiBteiMBgHMS5a/zEG/t8Kjk0dqcWV6PWLkgEueA1ZxT2r0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFb27WcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFb27WcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642CCC4CEF7;
	Wed, 24 Dec 2025 20:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766608209;
	bh=wmS3id9EcK0cIQdCD72nBHD46MqIrntdRcKGmvGTeKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFb27WcAFJFSiXG+t5qQBuzY82nKZU+vKHPuya14NUWfLq+ATgLhM/1r9jaxHE8P+
	 ed9d6TJhQeTDKAaplkhvKiTdupUE1/DhcOtCXO5pgZAbsUOE7juHikXPIG3RORxN6V
	 vUZjfTujxHl3Bn6G/yL+nT3/MDkINF4K6LTThCI6+aFpUK8wKakvx67WjQpTRaT8Aj
	 EJ23T+S18xjqrsDumbEEI2Cq59QBk6e62lCNQ95nfn7f0Yoi5tXIcUgXCBQxQkzuTQ
	 CtKjrpRWqQ2lefhzwpKwEzXhEMtXmQN+iZzUPxGDcgeyp2pZurjkc6fZ7t4uXzy8iR
	 Q0xdEuB05s7tA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2030F1AC56B3; Thu, 25 Dec 2025 05:30:04 +0900 (JST)
Date: Wed, 24 Dec 2025 20:30:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: SDCA: Replace use of system_wq with
 system_percpu_wq
Message-ID: <aUxNTF-wOWSDBCU4@sirena.co.uk>
References: <20251224162635.147710-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xWdktTKIjnmuLjns"
Content-Disposition: inline
In-Reply-To: <20251224162635.147710-1-marco.crivellari@suse.com>
X-Cookie: Think big.  Pollute the Mississippi.


--xWdktTKIjnmuLjns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 24, 2025 at 05:26:35PM +0100, Marco Crivellari wrote:

> -	queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us));
> +	queue_delayed_work(system_percpu_wq, work, usecs_to_jiffies(timeout_us));

As with all of these thus far I am unconvinced that there was any
intention to use a percpu queue here.

--xWdktTKIjnmuLjns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlMTUgACgkQJNaLcl1U
h9BjMgf8DMhAbdNuWqGCBeuKGoTjLZMcmOQb58G6MiRszrwGImqPs6uuylNcZnP2
a7t3Esu03jGYfjP5hmITZF4rYgfVc/my2+l0tQ8AQiLyze3d6qQwSmKRLIdH8v6r
eWIsuNlDotXxDdGuanmr4pEF7KKfrInLCcczLvJS0ojEVJJ/AeWMDqZ62marhajY
12FmhlC6jU5VZTDmqtxu3VawM/HzLRtk92Q+f0VCVWpsKGFgQmor1QBkHSSH5dz0
qmP99EWCDt+cxLd6NcUI+U5oK4lx+Ffeu5UyVzPXEn75gBhDcnKDvA9sdX/FiQaL
J5IvTBVYCcD2OzF5L387LDEVv/8dnw==
=g2DL
-----END PGP SIGNATURE-----

--xWdktTKIjnmuLjns--
