Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55AE218580
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549932; cv=none; b=jT9cGMWF08Y9NtRu7hCoTMG+N/8ho69ye2rGuuNwzBCoJfwi3MQntk1q5f4efGDnajC3DnetVI9HBv2tY4UbhLtialAFL3dcFgPCJfr/Ugk0goEoPEEBc89E9HfbziTfKnVTuzvy3Y2IVEk8+FrMmP07eVPHbpbjil4P8fgTZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549932; c=relaxed/simple;
	bh=s4blqqx3E3tugGJTCpyOT6SgfxNEzLIP/BXjao/DJn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BMS4j4XcrlGoMBYLRHP8LllYiQYaR6lcoq3B8POrRf6MYQFeuAsRBsOokr4ILdhBV1MFa6VtUmB3SNSLxljPFT18Gz/hb1Ein0oN0psbDizAw45xrZDmVbWdVjhEWLSuoKHOjQyW/BoYcPdfjdEILhZFRjY6+GvINuUxXWQ5n/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfwbdwUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfwbdwUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D746CC4CEF6;
	Sat, 30 Aug 2025 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756549931;
	bh=s4blqqx3E3tugGJTCpyOT6SgfxNEzLIP/BXjao/DJn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GfwbdwUTkXapHnAqmXlL/yLxjf0sJb0f0hv1mRCgZOhUS96qjX6+DjMutr3oP+7Pv
	 yL4P9rRpfwhI8wdfkkOL6Qau4gLoj6Jfw4XUE6bZ9sF8E+HcIVRLbSnimraMxtbeU6
	 isD+aKDYtVXhEfTcUDohnCvL+g9AuJ+wWfUzsLvLxB4pL1C44lmJE/Xr+toBUN+O9f
	 K48NwsHKSxy/MECTaZtnUfVzWV5PhqsCbBVgN/6LmfIL4WTrfZN/MTlqlb3Z73FJ47
	 Euci0KC6YwMdUV4SAlx/p/F19jSE0xXlEfctYe6/P5bYxGLjV6L4KMRVMVzUC4TOBY
	 vCYMoUl0voBxg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
References: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: only detect codecs when HDA DSP
 probe
Message-Id: <175654992818.400773.11273772902303981028.b4-ty@kernel.org>
Date: Sat, 30 Aug 2025 11:32:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 29 Aug 2025 11:29:06 +0300, Peter Ujfalusi wrote:
> SDW codecs use the global HDaudio WAKEEN/STS to detect wakes since LNL. But
> the wakeen is handled in the SDW driver. We should filter the bus->codec_mask
> to only include HDA and IDISP codecs to avoid clearing the wakeen status
> before it is handled.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: split codec mask detect and programming UNSOL
      commit: 6158a321c051095024e8306c8996b79e5f7f79b6
[2/2] ASoC: SOF: Intel: only detect codecs when HDA DSP probe
      commit: 5c39bc498f5ff7ef016abf3f16698f3e8db79677

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

