Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0931527A7
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 23:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653968; cv=none; b=gPsc+64EMMUtG60VBH0r7Vlsi1lmNRM+WFpcqoJROfHSFH3mOD800wMVJbI/60tMr8I2VMaejnBwxNfgVGZNpbxu1Dzr6RMvrKkPJnwHHhGczNH9uBjqE41r78q6elMcG5fiH6VkheAuQiKJCVmNDUQdW8ctmHCRf7GXescw0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653968; c=relaxed/simple;
	bh=WKMFH6nLyjOO8nU4WqVRfOByOKC8PY7HCJCQUpPmWP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mp+xUVwc59He89wV4oLQuYhiTm+ppBVXuk14c0L4QphVH1HcOXX1jRm1rZon1/RSMXvWYhm69YMbKWasfpwuTlEyK5Mrtk+zvjoq4NFGh8Mh3dAeV0Rgw/l7izk5vQO9HA1MBEruiPoNTHx0FrWg3RxVBFGDq5dlBfiZehGyMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZv5CSb/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZv5CSb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4AAC32781;
	Wed, 10 Jul 2024 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720653968;
	bh=WKMFH6nLyjOO8nU4WqVRfOByOKC8PY7HCJCQUpPmWP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lZv5CSb/lwRlh4zwiENegLezrb5jusGlHt/TatcU2ef/zDA5+t9jUvKTf42DegBlN
	 N2SgQIqSF7yWUBXzxLPlKbsozfIAOy/vCC8u3TtiCksV8bwaxCZUeXJbOnt8//vufA
	 rWc+WHRAYcHS+LerTrJMxUnQYfTLd829bzinhX++qsmIWkB9598yVMbYIiDN4cfLKJ
	 iR2n91OfHfzHjkIeDawDugosbjX9iCHy9lhYCRqln1FsUxE1KKa3pKrUmwy4Sn/mrm
	 kk36lYpZNe3ID3L2vmOBKcLLZFNTgqf2UoST6EwwA8UFeB4hvC6RkIog7l3iLdqtHd
	 cgk4yh+FWKvIA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Paul Handrigan <paulha@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com
In-Reply-To: <20240710160416.2617173-1-paulha@opensource.cirrus.com>
References: <20240710160416.2617173-1-paulha@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: cs530x: Calculate proper bclk rate using TDM
Message-Id: <172065396662.391308.3041132210143214998.b4-ty@kernel.org>
Date: Thu, 11 Jul 2024 00:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45

On Wed, 10 Jul 2024 11:04:15 -0500, Paul Handrigan wrote:
> Calculate the proper bclk rate using the number of tdm slots
> and the width of the tdm data.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs530x: Calculate proper bclk rate using TDM
      commit: c62bec0fe36873ab6c87c9ae84a6b661d09244c4
[2/2] ASoC: cs530x: Remove bclk from private structure
      commit: 0d1ebba74fad7b6b3eb0e2bc08d649d20c7aa7c9

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

