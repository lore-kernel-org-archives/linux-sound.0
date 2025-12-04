Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3746634253B;
	Thu,  4 Dec 2025 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853463; cv=none; b=Ln4eQx9U+YBFzTokFAtXUzbBBZkP9S44We54OqP5DtDJSrS1oPj8BOEnWZT5ygQWPlgAoNUj082+mEXY/QZc8xfnhevUv2Vxddd9yd5zaqmhvv5kH/JZ7voBFntTzCuYgbpZx7tOzJ8q8Hwr2bMTQw1u5LjugnBl27zK99ukHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853463; c=relaxed/simple;
	bh=UkezYrldvBWpMBXQgYTOIDKnjL5rpScuV0gm6TSwnR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IDw3SUHBj9dwPWU0H5E+BFx8tbFaffjJraRLA3hUM5ESTSRa9sMVdaJbj6L2jt6J2ntng5LbJwEQHIZfn94HNJJvOQ4fzHdgIRCH9dSUrkKSvePOE0cJebJeDSypy4RTZOpBiobj6OrOfeB8E71/y4mhDtcnR2guqABN2Fr4T7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbv/nBvt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbv/nBvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E5CC16AAE;
	Thu,  4 Dec 2025 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764853463;
	bh=UkezYrldvBWpMBXQgYTOIDKnjL5rpScuV0gm6TSwnR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sbv/nBvtMr42nNECiikdYbz8Vz50JFSS1dF/skJuw2evkhbAKpkFyloCq2W92ToYX
	 NMtd9aHqsFuL0c5er/JTXnoVpBiSelDi/W6BG68zyq9pIY6bz/kF6BKRd+uVfqZN4P
	 iTN2fAbaoJed9wZeo3gu9/esDQ6iDWu+gNT+KpIR3TW4+SZMj7eX4lhBU/cZUDnqFE
	 4+Ne1qHwIJOcGudP5ijhtSqAD5jTvXz2m65hnTfYfs8FfgQbwXsSfajNLGyLFigKz9
	 B7Q0J6KEvRQHop06vBVCzCfJfJ0oaXHcNf9C82VH483dysYLq5nB4Ac3iq2p327bTB
	 8ZcLkPIo/SAZQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251203105542.24765-1-johan@kernel.org>
References: <20251203105542.24765-1-johan@kernel.org>
Subject: Re: (subset) [PATCH 0/2] ASoc: qcom: q6afe: fix bad guard
 conversion
Message-Id: <176485346150.29556.2121625462499232336.b4-ty@kernel.org>
Date: Thu, 04 Dec 2025 13:04:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 11:55:40 +0100, Johan Hovold wrote:
> This series fixes a bad guard conversion in one of the Qualcomm drivers.
> 
> Included is also a related cleanup.
> 
> Johan
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoc: qcom: q6afe: fix bad guard conversion
      commit: 39191ce5dbfd65fededb4f0d408d6232c45766ba

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

