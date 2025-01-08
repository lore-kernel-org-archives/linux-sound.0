Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9AC1FC119;
	Wed,  8 Jan 2025 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343129; cv=none; b=MWr6ADKqKIbjd38d0C3cdGxFCl77x6eUaPKCA2HAqKVcsFmcdub7pv1aDr2oASAZNMFn3bAnrYQSrkWxKAGur2M6qnAv2pvyTTIHnpEi6I1Ze5tzvVuqft7Kq7tG+VM+68eG0d9ziplx/x3cO8w1598eCLyRJo6cDZ9nFRlzG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343129; c=relaxed/simple;
	bh=TmCxxuqJ8wooWHmUjs02ovPmHZKabam+CVoVOZ8zKpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dcTGvpfpQJ+yQervrHMdCgAoeGMdHUS4f4pIMiJUZ2aK5VY8Ltlxb4cD8p4fy9vpXgrlU3lyNCskW1z1CYfgnZoZHWEkYYg14ncGktt+KxJg2aGzgDfmmjmegDYeMhTfmoNGh+9d1bRrX/se2cYev/lSmfAzKj6099VVkQhSPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMBa0MZ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMBa0MZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58656C4CEDD;
	Wed,  8 Jan 2025 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736343128;
	bh=TmCxxuqJ8wooWHmUjs02ovPmHZKabam+CVoVOZ8zKpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tMBa0MZ7D0dCChNajHfAWksyD9b8EndkuRm/yUdpsriO94acSMrnRg/iIq/YeC4IZ
	 CzoX5jiPfO/DssKEASqTrTOycs2WS5HbcvfShRCtOLsK3ZMLoUmdv/XoKYnRboi0m0
	 ynmOPKXA3Dx7SKojKvl7k6S89WxLvclOIlbwEqGyRzA3/9F5gPgRH3mHYqhKzAYPKb
	 9hkOTeCnrBRithOipzlnUm9HXGC28v3GaVY4P+PfQhElZJSULHv2dSBPaKLppcEK0E
	 xy8wRrUf1IEk8jKWMwEWx+B7ZnzgA4KoA5qIEkrNwNBvVgAr34FZm5LmT6gL4fzEu7
	 bLQLCkl/hNAfA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, oder_chiou@realtek.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jack.yu@realtek.com, shumingf@realtek.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 0/6] Expand SoundWire MBQ register map
 support
Message-Id: <173634312610.36797.7747742160413075735.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 13:32:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 07 Jan 2025 15:44:02 +0000, Charles Keepax wrote:
> The current SDCA MBQ (Multi-Byte Quantities) register map only
> supports 16-bit types, add support for more sizes and then update
> the rt722 driver to use the new support. We also add support for
> the deferring feature of MBQs to allow hardware to indicate it is
> not currently ready to service a read/write.
> 
> Afraid I don't have hardware to test the rt722 change so it is
> only build tested, but I thought it good to include a change to
> demonstrate the new features in use.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/6] soundwire: SDCA: Add additional SDCA address macros
      commit: 7b16e60b31202254c62a29f5c709ffb42684b6f9
[2/6] ASoC: SDCA: Update list of entity_0 controls
      commit: b21468e83b787ab31aa9df8f429d2ca61def0cc9
[3/6] regmap: sdw-mbq: Add support for further MBQ register sizes
      commit: fdd9ef3dce98e035d21c17fac587cb6e3c7706fd
[4/6] regmap: sdw-mbq: Add support for SDCA deferred controls
      commit: 5bc493bf0c37c157bf2eb364e55a1c6f8bc43a69

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

