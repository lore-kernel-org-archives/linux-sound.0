Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D740BE6
	for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710522861; cv=none; b=OuCVrDIEPVv7D6+pPNaigJLARP7RbSR2NK7GJ+Ei8nICwN35vajfiXI0SmTU54sn3qTYSCn0KJA6TIHCiF4rRrcjMxYnmQ6Zi+ApPsh0sldU+1sqvLM52QDJ4xKHrZG7Rcved7lgnZwHle9gRX/o250IRxnpOESs3mwnbbV2ujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710522861; c=relaxed/simple;
	bh=OMUYFcPk6rQSQ+tSTqbatOncFfYSsSfm70s/P3vUlsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PCzPLN9kgnR7nHwxG+EWs71If4UYo1pqsRFXZw2GOrTuhJ5uqUobicoiBeTaeP5BjrsJhbeqQ4QDkLM9QolCH3M2AX32hWFHwOinRxkBRl0R1d0D7uuFKb+dEQZvRK1F08ALe/JSHNfbZn03RB4xqgq+Em73vdMyHgSzB/hG60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvJPictf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvJPictf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E95AC43390;
	Fri, 15 Mar 2024 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710522860;
	bh=OMUYFcPk6rQSQ+tSTqbatOncFfYSsSfm70s/P3vUlsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DvJPictf9GbnSp9MegLadGU/dsaqPNxG0JrEGKXpPyCgl6RYD/EYw7QoN1hwtIAWB
	 eF2hRFLUlvYgmIQV3bGk0BD8UQPjRj4cTvQUhWH1d5SRJ1C0zH+xoIWYUzxdEqlnVx
	 HFtRkCZ2Q/49N6P4OcG2TRkItAKvqjHavipZCcnsacEF8Tg1avvFB0OxpIpsPy5i6N
	 FA7aweJAkLLSrtegyj++TSEf4FLHDZzGVgJKtd1p4APcrtQU4jQXxcx6ZTzVZHyIMo
	 sdmE6nQ4zpLPCz468U9rM+uL1ovT/e8hOTHW8eqIb1VrhNLgL1xThJ0sEcA/GHxzln
	 kas3c7U3wdpxA==
From: Mark Brown <broonie@kernel.org>
To: Jiawei Wang <me@jwang.link>
Cc: linux-sound@vger.kernel.org, sashal@kernel.org, 
 vijendar.mukunda@amd.com
In-Reply-To: <20240313015853.3573242-1-me@jwang.link>
References: <a127404b-a071-4917-8ddb-d7371c721827@sirena.org.uk>
 <20240313015853.3573242-1-me@jwang.link>
Subject: Re: [PATCH v3 0/2] ASoC: amd: yc: Revert "Fix non-functional mic
 on Lenovo 21J2" and "add new YC platform variant (0x63) support"
Message-Id: <171052285905.54017.7217285466307758536.b4-ty@kernel.org>
Date: Fri, 15 Mar 2024 17:14:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Wed, 13 Mar 2024 09:58:51 +0800, Jiawei Wang wrote:
> I would like to revert two of my previous commits after
> realizing they incorrectly enabled the Yellow Carp
> (YC) driver for Pink Sardine (PS) platforms.
> 
> The first commit was reverted because it added a quirk entry
> that incorrectly enabled the YC driver for the Lenovo 21J2
> laptop, which is a PS platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
      commit: 861b3415e4dee06cc00cd1754808a7827b9105bf
[2/2] ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"
      commit: 37bee1855d0e3b6dbeb8de71895f6f68cad137be

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

