Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D925564
	for <linux-sound@vger.kernel.org>; Fri, 26 Jan 2024 21:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305092; cv=none; b=hZNmdwuBOXL3kmfoy85/Sx+huoTqOlQjlFkhYtRv36SdZM6cs7dboqrmDlJbz7kCtBG0RuIz1uEYYYU5+0TuAodLyrFrN+ZuLGEvPunYKtRbpdX/f+AtINtdcNW59iFZ+pAURWWdElKACvnhmDygw4d1WzIl5rBD3Wqu7DJDXEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305092; c=relaxed/simple;
	bh=Wz1o7Q6iD89nk8IWCSK5qkbgtWiTCWqUvD9d8tOORmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uk+Sy8OznuY/PCx026fNjWcxxuanwY4zAJy7yF/GI/qD/JvCnR7O5AI7JIvmPqLJ9bFuuwryRYTYhMUEIDzBpoN/NGq3Xzk6uNYmcwNDlD/Ffe+rldYfalShh8N6WJ0FegjfyXQo3pIqClWsBJ1xFT1hxDbXdC9b9ELe2T8lohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSouTCKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSouTCKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7835C43394;
	Fri, 26 Jan 2024 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706305091;
	bh=Wz1o7Q6iD89nk8IWCSK5qkbgtWiTCWqUvD9d8tOORmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PSouTCKRzpMb+0QjyfZkgg0YMPC0NUqyMf1CdlBG94IrogewicQlhyMBKUpMo9E9Z
	 7iu56vP4G6H8f41QMSBrFHGy/JGuGo9EcJ2nZolotAtJkGV7mEjp+HFWL7FxvqkZjK
	 p8EES4aoIR/VN4e7TPn5xLRA03r8R9so9Yazqg1/NpEGq3/X35tb3087gHQnx8vtgw
	 DjlCOdhlHsal5ppMBpHxM0pw7Mx0VWEkK/kQNKWD213o1Wt1JPAM3UStfAIrGqwVII
	 K97U0mnQfVF9P1ovcvWDBMGw/LezHwJTXP2gtFLX6/kuNxXxQXWKcPtlOVmQNrVfmE
	 G7vgo3FG1p+NQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: andy.shevchenko@gmail.com, lgirdwood@gmail.com, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/7] ASoC: cs42l43: Tidy up header includes
Message-Id: <170630509047.52716.9195906453206651565.b4-ty@kernel.org>
Date: Fri, 26 Jan 2024 21:38:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Thu, 25 Jan 2024 10:31:11 +0000, Charles Keepax wrote:
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: cs42l43: Tidy up header includes
      commit: fb430b06397e5eebefd42584fe4dfabf2a3632e0
[2/7] ASoC: cs42l43: Minor code tidy ups
      commit: 40f6281c1e7d733399bd42fe97a0aae00b967a91
[3/7] ASoC: cs42l43: Check error from device_property_read_u32_array()
      commit: a2e7cf55db781654fdb2d3b2529e28c4d93e24fc
[4/7] ASoC: cs42l43: Add pm_ptr around the power ops
      commit: 7a93a9abe44386b4caa0e67977f41b8c9f06b51c
[5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
      commit: 96c716887c1a918d4cb4610f5cf111280fda48f0
[6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
      commit: fe04d1632cb4130fb47d18fe70ac292562a3b9c3
[7/7] ASoC: cs42l43: Use fls to calculate the pre-divider for the PLL
      commit: 31c6e53a4da5fe626b99e1ebf777d751994e3281

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

