Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D940F24EA85
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694425; cv=none; b=K4QPMW5CanyXQ8AeCeXUjcs0Gngy3oz88MN0i7dPyQPPY5coVlhdKuMh0fasH+rlJ67opVQOaf3+jd0YRwmsOJTLnqpyMDnHuavBRw5az00erqu+WkWZvGxUfVJpFzPKgPVnOJ8I0a9H3lxkVclYTUK+Ro4dIaWiz8AIi8nCDME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694425; c=relaxed/simple;
	bh=oC9N9F3dFIQtVTK4p1j4vZmfgyr6MMVmklQ4XvfLVJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HHm3C+BtPHb54Id6fATuksi98oNWPWmIcwD1YpGL/BOb5RowaAFflNk5pRP43UQYWYxxfSlqCiKG5MLuxIvDaA9xZ8qf9MElAP9D0IK67ko//YUmr9QK2eps4frirxpgkCyt2SwdH2Au9ExsF0d2niqecqhUlMAvhyKFa3Aiw+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlEp2Eu9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlEp2Eu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E1BC4CEEF;
	Mon, 23 Jun 2025 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694425;
	bh=oC9N9F3dFIQtVTK4p1j4vZmfgyr6MMVmklQ4XvfLVJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tlEp2Eu9y+k4BQ13SqAbNvmVywMHLkQ9Tb0Esdzrs2rgV5tHpgm7qXU2qUWI4wZ4H
	 +pt/5Nqbqyfcow2dhBBqxGnLdKIZ9+VXOgSipov2XEXSav5HF2jPeIRAjn65uCXSzU
	 jrgmC3tQZPumsJdQhA1nga8MHG2EqRA3HQyj3VoxI5GuTgEXo0Sv6vL3epD9ggK3RW
	 FOBgPe9+UcbOppwI+6IXLqHhV90/P9S9793dZejxtp20ST3FkO3xpX9Yz5HtVEXJDg
	 J5DlqiqV7KmNgKrqTf9amH5EdH5ARNs69ZHwWTVGKajwV9HQvQztZ3LHUGchXoNd8C
	 xmz2fLt3SZCxw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, jikos@kernel.org, bentiss@kernel.org, 
 shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com, bard.liao@intel.com
In-Reply-To: <20250616114907.855452-1-shumingf@realtek.com>
References: <20250616114907.855452-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 2/3] HID: core: Add bus define for SoundWire bus
Message-Id: <175069442212.140181.12329124132151911808.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 19:49:07 +0800, shumingf@realtek.com wrote:
> SDCA (SoundWire Device Class for Audio) uses HID to convey
> input events from peripheral devices. Add a bus define for the
> SoundWire bus to prepare support for this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] HID: core: Add bus define for SoundWire bus
      commit: 3421d46440ebe0865bec71dbd2330b4e17a425ab

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

