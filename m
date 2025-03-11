Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614125EFBC
	for <linux-sound@vger.kernel.org>; Tue, 11 Mar 2025 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741709240; cv=none; b=TtzxLsf01c835cVkabHRy62A8nNCdJ+RmW5191mPCneEel+Rfx2cKHUYCEINkfLhkrAF6ZkfBzR+BscfDRDybZVc38yNjYowJRU/e3B8yBNSQuhdkeppuKqHXummiKjguoWsuz6pq55KhfynljAl8KEvUX6Hw81CbU97Rq3Gjns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741709240; c=relaxed/simple;
	bh=lyG8UQMA3Q8nd8M8E+yDaux29UXzQeLoMiEo/1EAN8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fvvtQAcfn2WwPRNIACtiOdf06/J4NLdWdhvh0i7u3OhMVbZONkPOW4opD//qj7v57T5WqiW6TFjxlhCV22fUtcAWCiu0s0EilFpT6qj52WKJn89YlJ/iWX9Y2a91u78pT2wwcw6H4DE3FPm9vJPKAMK38L+wTkBnqjhko6w+p2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAUsX6w4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAUsX6w4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0352FC4CEEC;
	Tue, 11 Mar 2025 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741709240;
	bh=lyG8UQMA3Q8nd8M8E+yDaux29UXzQeLoMiEo/1EAN8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mAUsX6w42qwffNc9879y1l4KU3DkAyRorSm9GVTpoHwimGc9oqmbP4lxj0JXvuziy
	 GaJqeoRVwI+nokq340pNfyVFot6zT/yHsjh4/7CBTqyM+5/NR064ktoWeiyx+FocBa
	 i6P5OvQt16LK7ixwVP2zLSZHS1XFy+os2M0TR7BlgyZBH5sn39PZqyLrnNWrNsqkZ5
	 mDDudMOGSCc+XPGXdIcHxzPPvTnVqBSVOTcWQOBbGjUSChQsPdxoND0N6AaHP0e+2v
	 PeKsRk3/v4wLktPh5nZP6w1z+1nYbZMCcYBIeVO81B+ZTj0wfuvLyEHAylwr6i+Vvd
	 e2h9GViE6DMUQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250311003101.80967-1-yung-chuan.liao@linux.intel.com>
References: <20250311003101.80967-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43
 support
Message-Id: <174170923876.156739.13743413256517732611.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 16:07:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 11 Mar 2025 08:31:01 +0800, Bard Liao wrote:
> Patch adds driver data & match table for cs42l43
> multi-function codec on PTL-RVP at sdw link3.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support
      commit: ac5b4a24f16f2f56b5cc5092969930b867274edc

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

