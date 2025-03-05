Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53351256C71
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741204614; cv=none; b=I84AmH4/lbmIEbkyJ2N5pLFFNzksXSiecn0PilhcEIHO9EbuHBiWm2N+fF6mrAE4VDYJOaMZN9osCt4/Y9XH94LzisZxuAiOcJcHO0kVk+4QMmXRz52IhWnbGK6pB5YjQrufEmWg7Td29hADWqqeeibGWVONKHxX73IGW+EwtTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741204614; c=relaxed/simple;
	bh=zGWStF46nX5uSowCt+x8Sy1XFFqC+SHFn2oSwa/ohbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qe8/Q9CBKkTxk71+Rw06XBVJTjJQ+33bv8gU426iRuI2Nm4ppY9lElitymCRP6MlVQhh9pec0APlTRL/umcTKGY8PqbvfolnxwJSvC31JHcKu2ofIDoaFewcIAVMFYDBDAYhIqPnRVjESlaRZjW0Q61+PSkd4LJvn2OBPhTXpkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFm2eEGq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFm2eEGq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD918C4CEE9;
	Wed,  5 Mar 2025 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741204613;
	bh=zGWStF46nX5uSowCt+x8Sy1XFFqC+SHFn2oSwa/ohbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aFm2eEGq6IKUf3zRsDqh3I/MLTlj7ZVhO4vl+We6MKtkuVT06kSaqFP0xQfoMbuLi
	 01aoqX8HSsnXkvJRUuR76Qv6GVOkDsvTDmxGgNavrVc3KGdd0bxh5CqAF4aB8hJidI
	 VFQWeQVWZSIlN5na8AP9HypJxxsQr+Wk9FSBXsSTRXTHWFjxvadMeJWR/BlSsF7cmZ
	 omlFbcHVYcL4KL+8P2DDwey6t0x9PyKCSfj/lLc2JVqoRNrgQsluMCZh4yPIBIjdtP
	 hz9k3h+J9MaGLOanhFOss0daHl/48rNUChAvSAffOHIx6CyoAjrJisw2bmC0S8S6ZO
	 ou3790e6UEEQA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: Intel: boards: updates for 6.15
Message-Id: <174120461251.267307.13855518058903376863.b4-ty@kernel.org>
Date: Wed, 05 Mar 2025 19:56:52 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Mar 2025 21:54:34 +0800, Bard Liao wrote:
> 1. Add multi-function SDW mockup codec match.
> 2. Add couple of new codec configurations for ADL, LNL, and PTL boards.
> 
> Bard Liao (7):
>   ASoC: Intel: adl: add 2xrt1316 audio configuration
>   ASoC: sdw_utils: add mic and amp dais to 0xaaaa codec
>   ASoC: Intel: add multi-function SDW mockup codec match
>   ASoC: Intel: soc-acpi-intel-lnl-match: add sdw multi function mockup
>     codec
>   ASoC: Intel: soc-acpi-intel-ptl-match: add sdw multi function mockup
>     codec
>   ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 6x cs35l56 support
>   ASoC: Intel: soc-acpi-intel-ptl-match: add cs42l43 6x cs35l56 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: Intel: adl: add 2xrt1316 audio configuration
      commit: 8b36447c9ae102539d82d6278971b23b20d87629
[2/9] ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb_l3_rt1320_l2 support
      commit: 02467341e3577836648753a9e9a5c196f08187da
[3/9] ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l3_rt1320_l12 support
      commit: ffe450cb6bce16eb15f6bf90b85b7e5f9bfbc1e3
[4/9] ASoC: sdw_utils: add mic and amp dais to 0xaaaa codec
      commit: 65e246d33dede0008f281d3d09b7695bef2d18eb
[5/9] ASoC: Intel: add multi-function SDW mockup codec match
      commit: e1a0657c6d943528ef58671594ca7e5b17db5394
[6/9] ASoC: Intel: soc-acpi-intel-lnl-match: add sdw multi function mockup codec
      commit: 438405704eec45c06be9adc94eb5f94855412790
[7/9] ASoC: Intel: soc-acpi-intel-ptl-match: add sdw multi function mockup codec
      commit: c7a6a74f847923bb726029b85a3fd0e05e9fbb04
[8/9] ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 6x cs35l56 support
      commit: 1ff07522690d2c2b67343099d2d046e88f71cddb
[9/9] ASoC: Intel: soc-acpi-intel-ptl-match: add cs42l43 6x cs35l56 support
      commit: 7172d9ae29afd00c8ee9a8e3a4eba4cea5d5e403

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

