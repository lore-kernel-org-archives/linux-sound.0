Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635E2B9B7
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863015; cv=none; b=XXedp0mTW75QVRIeZTy35H4v40az2kYzWC4fwPALCvacEbjg6RZJsf4Vr73JMYZwlzxwbn2H4kgEQX0/tmu/YPWMaCQQu5RpIfFZPoE8FXhfA9YFl1mzKjzo20Ao+m9e7mk7+Z+u1zYno93Z2c8S2JuqcSfKTRktZfqpzPDUnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863015; c=relaxed/simple;
	bh=UM5k/yIpBrTSJNA48BIkXPcIX4mO+25/9QxTryJu3xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OqBvVBN4FYIYBVNAcHs0sSMk9UpjYvEMBYZ3spp0n/ehwAKT8OtmwZaO8riK+2L87rhJupLQvyGtmDzOT4o/OBl+wR89chfxr0usk2pp1BFe7dlr1D68sUxlJjq4m/HFpKEQqzqt8w00sVEJ5g608hJhTavb2ERcynxUeUooLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPOxgBk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPOxgBk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABBAC4CEE6;
	Thu,  6 Feb 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863013;
	bh=UM5k/yIpBrTSJNA48BIkXPcIX4mO+25/9QxTryJu3xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bPOxgBk5EW+l5r4Zhn8cbevjNPKrWqtgBSsG51Y1KJRBWGGIDPOR9M3AYdJclJyau
	 kQmZ5Q4t4E0rGTaPIw2SafPVHxOzNj1KgWYdSmIPV6+p7FAH1JK0lEKweOV9pB33v8
	 EnUHqX+CsHDiB5Gn/ZNReflueDccdtMoKbHqjWlqmphyrI7AoKTQwG/blmwWUm41Gz
	 MsslzbRUyQLSgH9mrMKObTMhxNdkgIsWYiE47S4P+gCwNuhEBpOHRk82OejpDyYKBf
	 QzEFLJYaPFsywdj6u0aC+rGTTf316qVw6xRVfLzN27rajxgdaRSiQpdr0hGCZwqcVh
	 Nz8kQxTNJanTA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
References: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: sof_sdw: Add support for new devices
Message-Id: <173886301157.325569.18321581151990997965.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 13:39:40 +0800, Bard Liao wrote:
> This patch series adds support for Asus Zenbook S14 and Fatcat board.
> 
> Richard Fitzgerald (2):
>   ASoC: Intel: sof_sdw: Add lookup of quirk using PCI subsystem ID
>   ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S14
> 
> Uday M Bhat (1):
>   ASoC: Intel: sof_sdw: Add support for Fatcat board with BT offload
>     enabled in PTL platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: sof_sdw: Add lookup of quirk using PCI subsystem ID
      commit: fc016ef7da64fd473d73ee6c261ba1b0b47afe2b
[2/3] ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S14
      commit: 0843449708085c4fb45a3c325c2fbced556f6abf
[3/3] ASoC: Intel: sof_sdw: Add support for Fatcat board with BT offload enabled in PTL platform
      commit: d8989106287d3735c7e7fc6acb3811d62ebb666c

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

