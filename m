Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46631156870
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712180800; cv=none; b=VYhn9eW1L9y/Yj+1q3g11P3TpUPa8HJi00XpweZw3lDn89cqxWNFMXbDFP3jpjL8mgVlvxXOte4NWHcsoUr4/pkABuDYpYV4AQiiAseE+H33rA9x6v5TKxbuD1E6dQiwwFQl9uNdNysKMkUlAN5Ki9mdp+FOK/LmCNsv6Bv4o0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712180800; c=relaxed/simple;
	bh=3AszeCoBz00N/iEihRNL30Ov+o5IDqbf+6XzAXZxQyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=upG3jqRUKchGOajusaf3PwsPvbPNdnz7wRLEYMMjbKY7OwJggsFvOID8fIPw2qmWiYUnz/+eoJqNX7Zh9op+5G8jHfxI4Hr6jMa4S2Dna2keifDZn2/SlL766hlr+mjdHZbrxkQsdjE6OCMg194SfKAU46RcPl6sWzVfz63272k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw5Ox5mH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw5Ox5mH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5184DC433C7;
	Wed,  3 Apr 2024 21:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712180799;
	bh=3AszeCoBz00N/iEihRNL30Ov+o5IDqbf+6XzAXZxQyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nw5Ox5mHPonTZzzAWYPBV+WWKO8qYUXB6y5CU9Ft/ht75ibkWL0lD2s9ZmniEONfn
	 mSB8Ikwk2ogNCiTqifG9vfwuhOyFbkIwV5W4+9CCmpjjR0rZPeXLfSl9WCJCs7G+74
	 JhQnOOVkUC6CAc0JkpaKG+GHcdHVv3GoAO7RL0ahShddWMg2otZvuFcUmt56uq67po
	 bfv8dM+er8NzbDGlxSCCYro0g7B0HBORtY89R5j6Dxix7YC3JCWcwJILMxXc1W6x7C
	 2m7LRtI4wbMBGzDtwr+mDfJVa2ULIZCGaT4t1fppd247u5xAUFrIyB67XPFy6Z0QFd
	 m9bxy9CHpGSng==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 rander.wang@intel.com, liam.r.girdwood@intel.com
In-Reply-To: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
References: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: Intel: mtl/lnl: Improve firmware boot
 state handling
Message-Id: <171218079806.1232330.6908806906332989574.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 22:46:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 03 Apr 2024 13:52:03 +0300, Peter Ujfalusi wrote:
> this series improves the firmware/boot state handling which will allow
> failed IMR boot recovery and human readable boot failure decoding.
> 
> Additionally a new debugfs file is added to force a purge/clean boot
> of the DSP for developers.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Intel: hda: Create debugfs file to force a clean DSP boot
      commit: bbdf9af261adca039de29e7fc1faff367bf7e9a0
[2/7] ASoC: SOF: Intel: mtl: Correct rom_status_reg
      commit: 1f1b820dc3c65b6883da3130ba3b8624dcbf87db
[3/7] ASoC: SOF: Intel: lnl: Correct rom_status_reg
      commit: b852574c671a9983dd51c81582c8c5085f3dc382
[4/7] ASoC: SOF: Intel: mtl: Disable interrupts when firmware boot failed
      commit: 26187f44aabdf3df7609b7c78724a059c230a2ad
[5/7] ASoC: SOF: Intel: mtl: Implement firmware boot state check
      commit: 6b1c1c47e76f0161bda2b1ac2e86a219fe70244f
[6/7] ASoC: SOF: Intel: hda-dsp/mtl: Add support for ACE ROM state codes
      commit: 3dc2682870ea8f5a7749c069dfc4e0040e69cb5d
[7/7] ASoC: SOF: Intel: mtl: Correct the mtl_dsp_dump output
      commit: 40bdf121a3ed91281196068e50789888e4b1d2d2

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

