Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5E155A46
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 21:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712181360; cv=none; b=LD3WMvgIC/pc7kPhaWPNQdP5seSIXQXVLtm0IYAUxAZzzeV6xGYqNsIZRVfAO3rnnTZ81F5WPk4Yk+hiGAJWEJsA/X67JVLuNZj2VOv4guJPv/0apwvBllq4a0QfpqkAb/534MI0lqo4xfuaMK71oabBHcezHkMI5Rpw0M4yfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712181360; c=relaxed/simple;
	bh=MiTX0xqaUlFd2eZKWv3EUSMbEgNrariYQ5rdD86HlCI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oETx9Q7HhmUI7JZU7CZC8IOy11/BY6K2d16cNqmrSRkOHZnO+QzZvIORZRFLwtu3OuPIcMH38m8Jath9cDGINwE+esU553uSNDxo3rw/L224wgJky8CStlFWj67CinZU25imDSWK9sXUxqeNsB8TTooA0OFoup8h9uBV6dyJIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLArJI0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLArJI0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E7FC433C7;
	Wed,  3 Apr 2024 21:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712181359;
	bh=MiTX0xqaUlFd2eZKWv3EUSMbEgNrariYQ5rdD86HlCI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YLArJI0YJ8kyBr+o+g3sCoeGmHHsm60wdWziag63Tlxf4wX76xmsaeMXbR41zW42p
	 xvHLowKTk5Z13acbh/0Si6vjwwu2ATMF9yeW2v7j2NF2Uy7obe5WbPDygo22oEiGPE
	 GxEFlpVl97FMtgHZtw5xX7JhBZOFn2M/EPhqMNnMWtC6q883Lv8KSUMNAtCRqyLdmn
	 ZNKB1d/AvlCeffDXdTrobWpg3XPEh788RSShNjYwZCEwuDomSsr8jVAu9xtmwk63wn
	 rwjYMJWwpOWKLW0TC3p+y5ueD8Bh4Z2NT/4tEKi+YZv6NA8oHf4V1s8gH64bgfKlmh
	 625ksQnSyYuJA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com
In-Reply-To: <20240403111839.27259-1-peter.ujfalusi@linux.intel.com>
References: <20240403111839.27259-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: lnl: Disable DMIC/SSP offload on
 remove
Message-Id: <171218135835.1234017.11958635771463090197.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 22:55:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 03 Apr 2024 14:18:39 +0300, Peter Ujfalusi wrote:
> During probe the DMIC/SSP offload is enabled and it is not reversed on
> remove.
> 
> Add a remove wrapper for LNL to disable the offload for DMIC and SSP
> similarly to what is done during probe.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: lnl: Disable DMIC/SSP offload on remove
      commit: 3f5eb32513e75eb321919a703800d4e13e9d3ba8

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

