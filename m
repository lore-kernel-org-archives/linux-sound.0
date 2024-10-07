Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAF18C351
	for <linux-sound@vger.kernel.org>; Mon,  7 Oct 2024 21:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336616; cv=none; b=mUZdgP0Jxo83gEcDkokwqvFp6Qz5/UDDHLL1Pei5KmxXkg+GKJRjplEyELvBled3mHsPUmhnny59ZFnmktqOQmOBjkW+wmMv7SjpJIQzDMoKK7R5I6kZVxtjQh/y5UkvI2xQbzeEPko760fQtZn6WyFMwzzhERZqgCOYEKHzHmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336616; c=relaxed/simple;
	bh=wxcNsQhfpVVjCTG2Y6aqnNdRk6QxyFRik6umuzgPWW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ssJ+qLlaNzlvWlRQtxdU2BT2w1anNyMYUWiCQlk9QyJpRdXa9Na+axh3JlPibOt8UsUPTZ3DtbXLxZu55hj6xyEfJaV9qd0yizo2sM3lZxxN3vYv7KDqCIsJzO3XmECmYxa1OCL+ZA8gXiQewHLR1UItWmnAiy+zj7Rxlo+yEQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGGIFmAT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGGIFmAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF299C4CECD;
	Mon,  7 Oct 2024 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728336616;
	bh=wxcNsQhfpVVjCTG2Y6aqnNdRk6QxyFRik6umuzgPWW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oGGIFmATkjM5pe/Jzy595mf44P2lknRt6MrDAADkYW2ZdrjnwLbAhNX8GXdVdQAe6
	 IjI7zvzhagk+zSMeymeJIoRU48sNYXGwQnGopTxW4aAcGgrOfMXU6DuOG9RPJ88TV4
	 bKHiqJ1FKYev8S1woiqPI+zYMvpx7US/cjXVbVZspJYlWd863hDVOiPYwDd+jiYGsm
	 SsJm9lRPNe41dK2AmSc2DWqjd/rIcEuuIjZ5zVquArrRBYVi9wzSpLA/JZwv5yJxyo
	 kJ1CVtRp7xj/x7hva/JSHxzzXp1CYscly8mP8/4ikjTdltiR6nkxXjwOsg83hraXEi
	 d3lQbRba1mI1A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
References: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: add rt722/rt721 support for PTL
 platform
Message-Id: <172833661459.2566981.16500783307779939186.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 22:30:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 07 Oct 2024 15:59:52 +0800, Bard Liao wrote:
> Rt722, rt721 and rt712 codecs are quite similar. Refactor the existing
> spk_rtd_init() to support Realtek common multifunction SDCA codecs.
> 
> Dharageswari R (1):
>   ASoC: intel: sof_sdw: add RT722 SDCA card for PTL platform
> 
> Naveen Manohar (2):
>   ASoC: intel/sdw_utils: refactor RT multifunction sdca speaker codecs
>   ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: intel: sof_sdw: add RT722 SDCA card for PTL platform
      commit: 69a5d2d0d913cc0190899be7a835a48b0808a5ec
[2/3] ASoC: intel/sdw_utils: refactor RT multifunction sdca speaker codecs
      commit: 10488630e1072cc5feebf25d1be04505fafb59a5
[3/3] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721 support
      commit: 846a8d3cf3bace9f235c38caf1d8d853c323dbd4

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

