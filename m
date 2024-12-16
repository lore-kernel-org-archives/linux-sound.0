Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8687114830A
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361950; cv=none; b=fXmbMHUdzoiHxXEZ7FeFhmLPEJvrIPEZlBPEsTvhkuy4IUCnet4lGxZR8si7K71r5MV8Jhj5qyRqrlFjFvGwKZ3C5XE+PrIvWyRZx5KNO3RhuGsYo/ijXs7J+RyhKQWKVkWbr5Lu+t2ubAiqj1a6KAYtNbvEGt5Md/7ZBKKyQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361950; c=relaxed/simple;
	bh=8zP9kAbZneEWZtbnQRw8v12kHQQy/srYPekx6AFK7FA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ndKHLrBP47FrX29oAnSS+zFdYQ2vmCZyNqS1t3LDyQvrsbPEAOFb/SPL3s8RVjaYFhvXy4wmD8HElG/dYxT+XNNQvv4FzNkf6eD+a4YlMnkthz5cRMTk2TFzIrd1q+7Khhn8TVp4EsFdMBAzENF2CpiUnrrG2eaWJF4vpqe1aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHwPp5pw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHwPp5pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CEEC4CEDF;
	Mon, 16 Dec 2024 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361950;
	bh=8zP9kAbZneEWZtbnQRw8v12kHQQy/srYPekx6AFK7FA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uHwPp5pwURyd2UKiDcNNxdNU4RtjkicEYHMprQC/SRWnEqHiv2OR6nglpFO3reG2Y
	 ksJn6boCHrB0Q/dd+sbQi7eBS4IytFAEqJrZE6sp7vIFDWvdEE+7tRRt4vBNOWGZoI
	 fQr2CYapZBLJMcLsmQUJISZnLU9gf4CDecUTldGRJ31HSWQg4uH7uai+/6Jlx7KPWX
	 ljHJMIaviBKzT437C8Xr5HJQVJXhHWS1ar+K6DeZBV5ws370uWFNOQQvZKM6OsYVJL
	 hKkajttxzBqcBlEsgucCQagGT17+No0h0JIRBTmbNL9kJKv4d1gFR6EQFI3mi2bcuc
	 czBzShKXmIVHA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87wmg5tzra.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg5tzra.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: tidyup ret handling for
 card->disable_route_checks
Message-Id: <173436194886.77772.9538672594045167921.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 15:12:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 12 Dec 2024 02:13:13 +0000, Kuninori Morimoto wrote:
> commit a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy
> devices") added card->disable_route_checks to disable route checks
> for legacy devices at soc_probe_component() and snd_soc_bind_card().
> 
> And commit 6974857c2b2c ("ASoC: topology: Do not ignore route checks
> when parsing graphs") tidyup soc-topology for same reason.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: tidyup ret handling for card->disable_route_checks
      commit: abf594ce914172e3bb640d02fc6e79569fa25b8e

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

