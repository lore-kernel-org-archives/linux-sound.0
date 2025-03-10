Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A37D2FB
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 01:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741569959; cv=none; b=ATlXt0uZxS6IS04MI3GxAovDjnDBr0i/GnLbLN6tBwmXJEPU6UdbYgJn5t0pmbwn/LYueQ8Mr9TZkdSZawXVKXP7+fEXN8KtlNc9F9gYyjaeWesQiiuECwVPLUbFTALiebj9+qy1XHYdVRHAlo/uWDKiwQXj38ggpeXmhB5Wmfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741569959; c=relaxed/simple;
	bh=810rfA+6BCrOmQ0+0/Y6pbtTD9P/VSQ6OkgL2wPX/x8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TyzRKdcqPyjMhY2waruNNnf22V6MRa0EiPRTqtuP872EfupuLGr/AWKp5Q79oNaTDBrKHdyI1DlUPQNmWCc3GVjVi5kYv7ogNPv77E6AJtggfl4+GczlnO+DE8d899MxGXnJ4FzC0t2A5NGuAOpmykrgA5Qy5bQc5gyPIaQjHrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Assnk+xS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Assnk+xS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95011C4CEE3;
	Mon, 10 Mar 2025 01:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741569958;
	bh=810rfA+6BCrOmQ0+0/Y6pbtTD9P/VSQ6OkgL2wPX/x8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Assnk+xSKyVQp/kli7VFmSFSJjdUubr7kEikalHFYDCCC9skmllaHl9yDNMoqUvon
	 NDXYzpL5Uq02IwY80wWbC92KQU2LUCC1LU+jgks0BGwf6aHwDEgD8/1qD9hjjEmtYI
	 zASYjrzeR2mLmIuwfonxnHezqWz2ya+tuUgFxhGzTF89NAc/PdGbsACmug4AZShgxV
	 JItKOZgHqz/s8jY2IYoWZiardT+ddsRhrwV8LIwileh16SxOpY2VcHfqNKFb6CFf/E
	 0QGZmgiYF+O9RgAVZzNKSHeu4TC2KZPO7pk/k1ylsYCWqX/b7DnOglTFxEfVCYokMP
	 W8OAvyvrferGw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com, 
 amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
References: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/8] ASoC: SOF: Intel: Add support for ACE3+ mic
 privacy
Message-Id: <174156995449.2353078.11385767126637673774.b4-ty@kernel.org>
Date: Mon, 10 Mar 2025 01:25:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535

On Fri, 07 Mar 2025 13:28:08 +0200, Peter Ujfalusi wrote:
> Changes since v1:
> - Use type aware condition checks for 'alt' in patch 8
> 
> Cover letter from v1:
> 
> ACE3 (Panther Lake) introduced support for microphone privacy feature which
> can - in hardware - mute incoming audio data based on a state of a physical
> switch.
> The change in the privacy state is delivered through interface IP blocks
> and can only be handled by the link owner.
> In Intel platforms Soundwire is for example host owned, so the interrupt
> can only be handled by the host.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: Intel: mtl: Split up dsp_ops setup code
      commit: 69823334200029767de785d30acf74e4872a11d3
[2/8] ASoC: SOF: Intel: lnl/ptl: Only set dsp_ops which differs from MTL
      commit: 0d2d276f53ea3ba1686619cde503d9748f58a834
[3/8] ASoC: SOF: Intel: mtl: Stop exporting dsp_ops callback functions
      commit: 80416226920c21e806f93bd0930d67557f41600f
[4/8] ASoC: SOF: Intel: Create ptl.c as placeholder for Panther Lake features
      commit: 8aeb7d2c3fc315e629d252cd601598a5af74bbb0
[5/8] ASoC: SOF: ipc4: Add support for Intel HW managed mic privacy messaging
      commit: eea84a7f0cdb693c261a7cf84bd4b3d81479c9a6
[6/8] ASoC: SOF: Intel: hda-mlink: Add support for mic privacy in VS SHIM registers
      commit: 0978e8207b61ac6d51280e5d28ccfff75d653363
[7/8] ASoC: SOF: hda/shim: Add callbacks to handle mic privacy change for sdw
      commit: a0db661e7d8e084e9cf3b9cdca7c6e4e66f2e849
[8/8] ASoC: SOF: Intel: ptl: Add support for mic privacy
      commit: 4a43c3241ec3465a501825ecaf051e5a1d85a60b

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

