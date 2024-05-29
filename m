Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43E1B810
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717002685; cv=none; b=PA9mQdjlo6Z/IjXtmkL6brjSRJXaz+CSezdE/Yi6V8+TjqhbJ58SBwga3ccvlZ/i/engV3ktZciL4XwZfEXwVRzuYCCuOHjWqDOr63MpyvlfdXwTxLk7P46wixKCWfdseA7clOXB6mgOeGyMFrsHxj6Q/qMPlb5MDyg6pcGPCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717002685; c=relaxed/simple;
	bh=9UpR3hGU/5+3bUNpfdSES1Ui6yAXcd8PftieunFAs7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JZxYpM7Bf0bxmKiqvilJNpUnzGhuKn0XIKNbW0ud4ExK1AbOanPqxqmz2oJvmhTQJSfj5addgkNDnzAPfzIhgyeu+1XJjQwoHB4e4OYs9K8x4AGmaenXAT0n4sGG4/fhakpZdMapxLdO9+/F8i+iQk7rbvnAqkgw/nTjYdQqutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyaBnfEC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyaBnfEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C078CC113CC;
	Wed, 29 May 2024 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717002684;
	bh=9UpR3hGU/5+3bUNpfdSES1Ui6yAXcd8PftieunFAs7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hyaBnfECVPHlH84ACfb81Qj4jMkCnvaRlTS4D1dCP7Sptb8I916D5XPQI5W4y0lhu
	 1SJK6WYF+Dcpa98zfNGv5ZCAAA/he5RFUCf9DZqN4gH2xMRJK/hS+J43uAAV7ZO+wB
	 dD9U4hYOQxlPT5rYcwyzNwDBHDGh/B92H20Cvewi5YbDo/RQyVp0wv+idMBh65nFXA
	 V9VAIUEfWERowJYhSdUX3yDKYOenCu1DDR2Qt93tvkFj/CcoQcwG8ifLKW0d9OnNsv
	 72OuITvVODc+fG35isNk9t2JNpoayvYY7Ed0TRfq4NeFzjwyrt6eO5bRMpUNgbkU0c
	 nR/eNzp60w6oQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: add missing MODULE_DESCRIPTION
Message-Id: <171700268349.145451.11791404311765995337.b4-ty@kernel.org>
Date: Wed, 29 May 2024 18:11:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f

On Mon, 27 May 2024 14:44:10 -0500, Pierre-Louis Bossart wrote:
> 'make W=1' now reports missing MODULE_DESCRIPTION lines. This patchset
> cleans-up all the module definitions and adds MODULE_DESCRIPTION lines
> as needed.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
>   ASoC: SOF: AMD: group all module related information
>   ASoC: SOF: reorder MODULE_ definitions
>   ASoC: SOF: add missing MODULE_DESCRIPTION()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
      commit: e30a942861b540e056425a8e31ba801de1ed4f25
[2/4] ASoC: SOF: AMD: group all module related information
      commit: b88056df4fcb7b5930d6ee3fef494e8729dcf2b2
[3/4] ASoC: SOF: reorder MODULE_ definitions
      commit: 06a2315da0b02db4f2115bc9253daa270571e389
[4/4] ASoC: SOF: add missing MODULE_DESCRIPTION()
      commit: 3ff78451b8e446e9a548b98a0d4dd8d24dc5780b

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

