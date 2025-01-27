Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F31096F;
	Mon, 27 Jan 2025 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004522; cv=none; b=uu/EDRMEszxCffyUWtl4VQ/Bxzh/8MO7lfN0eDp23fgcrqamys36KehfAqgn12H3Mzf/QvvmptJ+V6ZjyI+m95QzM9FVKzbgzuGx7FIdwpQyU68XhRpGdqyHGUUBSMxl2SXf1ds9VbaenLFsEIgcslXL5zSUdl9rYoVaeRcvDSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004522; c=relaxed/simple;
	bh=KsBUtVVk8C2eooQgA9Hhm8O9i0IC+GKVFUprFJAmEzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pls5TeYsEBgbTJ3sQ10o72U9DGhT84VX7DObRx2MevKsallKI1ylb8RZAeBhIFyvlaD4b9O/KnwYl9smZSWwkI5kQ6fxdY8o14MXaEmRVuSl8PBkEEFJ2qVpC969HrVf+JQKxxCJaLC8dcDuDlC4j3cQ4qN9hjoXzwN+8Qlg8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QI16hS5p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QI16hS5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBE2C4CED2;
	Mon, 27 Jan 2025 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004522;
	bh=KsBUtVVk8C2eooQgA9Hhm8O9i0IC+GKVFUprFJAmEzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QI16hS5p2K32kOARcJY4U5qZzr/nURVhy0QyzYCTJXUQXPD8KUGgXpG9D43dn5VaI
	 uHGZThhPRLPSFEcoiRtADny90917JhMhlzS7nDbWsPwhVsKp9yqKS7MVgggkTQKr6P
	 hq+JKVbYVlEAaGHU36BMZdv3Aq5gVdusoTuKLH9UNV7YJvdjUWSvs5ECfEZJEgW1FD
	 lRJncGopPZWKEQ0hzEn+ScG6ukRRhasOypADiNy+CDNl4THgTEGP/ycD5pHZls6u+N
	 EUIIe2E+PEOqKfZxYTkdELndweZzZ3ZAZb3/qmeUUdKL3YbF/wHL0qn2eXKl2LBh2C
	 v4zEH7FUMTeKw==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: venkataprasad.potturu@amd.com, Vijendar.Mukunda@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250127083422.20406-1-daniel.baluta@nxp.com>
References: <20250127083422.20406-1-daniel.baluta@nxp.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix possible deadlock
Message-Id: <173800452052.222763.16368934710114224095.b4-ty@kernel.org>
Date: Mon, 27 Jan 2025 19:02:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 27 Jan 2025 10:34:22 +0200, Daniel Baluta wrote:
> On error path, function acp_i2s_set_tdm_slot returns without releasing
> the lock and this could result in potential deadlocks in the future.
> 
> Error reported by sparse:
> sound/soc/amd/acp/acp-i2s.c:95:12: error: context imbalance in
> 'acp_i2s_set_tdm_slot' - different lock contexts for basic block
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix possible deadlock
      commit: 3ff53862c322aa7bb115d84348d5a641dc905d87

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

