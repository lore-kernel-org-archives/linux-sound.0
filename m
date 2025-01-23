Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0251B78E7
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654572; cv=none; b=gHcAW22LtoWN9TrWa9VG5rAWthM6EsCGkA1TZXyXhXOQBXmnaQ89NI1J4L1C/ogeycrnBWwL4sTm1Z1eeA5FNkMUXj9eSCrZ8NCZluP1zkx0xZA9J+tOa5hBb4s8LIvrG7N4ZD4f+HH6LaYalpaQ8AFo8EEEyTXwwEW5UI/vFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654572; c=relaxed/simple;
	bh=6pkpaBFGGR8CWkXpbDrvdRISq5+bdU5CtX6i4AueP3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=seuPdjO4qMy2+SakCG7NB0z6/wPBANQOuLdO0Nh6+KyjU8tkWPMkmiejcNukTpqdrlTelmOPJCtwJUrFDXjWG6I0dL5Tq53vpaO+ptV/HITv7JnslsLP8P2IH4gKJecpHWz6LOlaWNa6cQwZO/KZkls/Sk+5rNkNtJwdr1f7U5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWlVPB+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWlVPB+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B6CC4CEE0;
	Thu, 23 Jan 2025 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737654571;
	bh=6pkpaBFGGR8CWkXpbDrvdRISq5+bdU5CtX6i4AueP3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nWlVPB+V4Sk56MPyNJtSlj+zDkhU8vHTHpQgPaMbV5GiSRrcowv7Ckbj53bPAbXml
	 RnW+5E3IoJz8GynQgYz6mBAggqhY9rn0gRYf9jX0iJPuUB1F9xGN28h9xfeXenUGlh
	 JIlrUARPvedw00sCh5oK+i+Zb3gda/Wkiw9a3rd3uQGeEQZB56EBCLcmvyPp/HqcYO
	 oO8K4IwjQhaTffcmtckG2ffOpbfH2ip8jl0GKy82WCsVSL95+SuFKUJ51PaqDQK+gc
	 kxR+DukdaVc8HIa52BcHD4mPaju4pVjU6J9DWCz5eOQPEgu7omiV+hgwkab/L/Q3V4
	 FEUmTkrkEWDsw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, linux-sound@vger.kernel.org
In-Reply-To: <20250123132507.18434-1-hdegoede@redhat.com>
References: <20250123132507.18434-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu
 Atla 10 tablet 5V
Message-Id: <173765457036.97658.13681342549019391596.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 17:49:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 23 Jan 2025 14:25:07 +0100, Hans de Goede wrote:
> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
> significantly different mainboards. The only outward difference is that
> the charging barrel on one is marked 5V and the other is marked 9V.
> 
> The 5V version mostly works with the BYTCR defaults, except that it is
> missing a CHAN package in its ACPI tables and the default of using
> SSP0-AIF2 is wrong, instead SSP0-AIF1 must be used. That and its jack
> detect signal is not inverted as it usually is.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V
      commit: 6917192378c1ce17ba31df51c4e0d8b1c97a453b

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

