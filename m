Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC98342512;
	Thu,  4 Dec 2025 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853461; cv=none; b=W1AZ/cGl9eGtV0b9EJ8lNMVcackx4F62O9U+TuToBZVchTHLxd8ZTxML/TNDT+GUsvG5b5M1HOwJ+UM49/Yx3tFJF4t2xAWgZ/OCnpTzxCb5QVhsuo3mgH+g2rWdBIGTduJCWxSYMy9wdtAI3KzJomH1GD4fuEb3OCqLJ+Mq0Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853461; c=relaxed/simple;
	bh=i9CaqxQSMsTX3d3GKpLlwKiiwYVr+NKfrtieZfUCrb0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NvbMz0BDVx0cy9LCLkI1p7smkzWvBlTMY6ChekCYdi+3+kA3PpK4bjhdjyTyNxKr2TzepUEC2xVpp44FoQ+xh3uc3JEUShSCOYxo6TDzkN2zxCKWFJ3T4gyGZMb+lQR6RGpJZD0ZtvpA5kuw5g1LJi1zbsPBQQ3gQ9HCnEsqveQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgGEGRhb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgGEGRhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C67FC4CEFB;
	Thu,  4 Dec 2025 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764853461;
	bh=i9CaqxQSMsTX3d3GKpLlwKiiwYVr+NKfrtieZfUCrb0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=AgGEGRhbV4A3T5G/djK7IUbU46ZAyHoBW8Oszk664tf3UT6akByAz3XH+JviqRAqD
	 qikEJ9fQvjwM/keh3Grm7hQ9iHqwepImCzYHBwxtYWJt+F8iGbl2W054yG75gwX6IE
	 qiVW61qmbMPGfq0rUGqaFdH63iv0gnC2+Tr0sP4A6GXvMDoOkI9U0TP2pOFEHxTaWx
	 LCeWzWuKDZ453OtuOIAvxqw7IVywCItr7cZL3bil8H7PpAXugZXAwH91p6rVQWpIIy
	 qCpLuW27fuEXJAHEXwCAOaO7yiCFjUDqXi5xNZ+wrcT0RNGqtIQckA89UJQjuKPWA1
	 G4HGW43LYuR+w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 andriy.shevchenko@linux.intel.com, kuninori.morimoto.gx@renesas.com, 
 nichen@iscas.ac.cn, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251203100529.3841203-1-shengjiu.wang@nxp.com>
References: <20251203100529.3841203-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: ak4458 & ak5558: disable regulator if
 error
Message-Id: <176485345924.29556.8568992403267479103.b4-ty@kernel.org>
Date: Thu, 04 Dec 2025 13:04:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 18:05:27 +0800, Shengjiu Wang wrote:
> Disable regulator when error happens to balance the reference count.
> 
> changes in v2:
> - set regmap to cache only also.
> 
> Shengjiu Wang (2):
>   ASoC: ak4458: Disable regulator when error happens
>   ASoC: ak5558: Disable regulator when error happens
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ak4458: Disable regulator when error happens
      commit: ae585fabb9713a43e358cf606451386757225c95
[2/2] ASoC: ak5558: Disable regulator when error happens
      commit: 1f8f726a2a29c28f65b30880335a1610c5e63594

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

