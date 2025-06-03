Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ED03D3B8
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973801; cv=none; b=n2HL5FSz0sdInW5gTTWLYa6aYzUIKvSmzXEOCP1LmlHcOCncNLRgDEAY9wtu5JsEIrjhlpY0GEJ8SeOh2zfz0N8iKHBWCxMv1F6iuIaXdbYgkw83TWgJ6Spn2uE5SxaT1S9poRB7wJo2pcB/vYz3/RIMlxDFds7/nMLGhH7dlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973801; c=relaxed/simple;
	bh=5pkuk6xalY9P1WfC5M7aPw3S2a8CKDOZDdb1jSf1atY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VTlTQF8TTJwxqjKKs4VetjEqoi0pOdOo0qfdE9E/tOrB9aiBPhqsjSH8Pwz/pfJtGZ5aZ02khtlyDKBz61OyTZBvqGqOwJ4SwicMc3FBVLdiKTdllkjfYmZ11vaNpjh4byhmZ8ur2Dk00EQrNsDq5e0N/CX9lE6G6eLcgVkgIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNBtOBEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNBtOBEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FDCC4CEED;
	Tue,  3 Jun 2025 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748973800;
	bh=5pkuk6xalY9P1WfC5M7aPw3S2a8CKDOZDdb1jSf1atY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UNBtOBEUV7YdJqvo0+Yr501tCAGzZTUg2nTrW6RK8lO5TtcuU40RALkBlqmJy91oC
	 Y8A7TyGQJiRtrS/QjsmdcrBgWHrloriGTjvuxm0xd9qWTiZfsKoNDyFG6aufJU9/0g
	 XyfPJXWdRiCrgcaP8CgfxSPp1I2KU9afgzO2EyVOHjmZ07ux4Pu2vV1ZfNWSWu6lZk
	 gXjQJ85q+k6L3KpP6h/Mke6/Ozf0BKt1CP/LDHTE7yiW0y0tcViWMFuP38SxAURKuS
	 RVc8dXLD+w98B6dMv2rB1mqjJAsuiUyDrusRR0raKbCoooDz8irwakGeAJ6BmsWLpM
	 7Bf20yMOICTGw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250603145244.871239-1-amadeuszx.slawinski@linux.intel.com>
References: <20250603145244.871239-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: boards: Fix rt5663 front end name
Message-Id: <174897379960.81086.4163649770899479781.b4-ty@kernel.org>
Date: Tue, 03 Jun 2025 19:03:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 03 Jun 2025 16:52:44 +0200, Amadeusz Sławiński wrote:
> Fix copy paste mistake in board name.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: boards: Fix rt5663 front end name
      commit: b7188a1c0d2d7b04f4558e10293651d49fcb2398

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

