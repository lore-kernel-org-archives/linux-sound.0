Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAF33CEBB;
	Mon, 16 Mar 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683552; cv=none; b=SJZ4956qyoH3vt2oN+2ih85BEwIZ08Zc2cMFmR0J4VhhNKgc4m3cAtMlKdaHOeQfc8PJhKiGJVp4ywj+eIcyEIbE6HbnEBEzuPVwvc4Wdx3wqibue+kIYaQ+GHYjk7Hq91f6Cesd27SNyJHFS3HjZK44Ytox4Dn24wz7MyoopI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683552; c=relaxed/simple;
	bh=eHOT+tFj396RJk8G216Gyy0Ah6CVsgIlGUX9qfn3DMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X8KyqdZn3B9LeoTLmiQygjeFc5ackUX3AV+6UZnBCfvAbqXZQJ4OwmQ5sSFTe2yhiZYs9ffXvA6VKJR68Ina/QhaBOCcCHKdlha7ASB6Lt2bN6mOMb+AYKo/mWUbJhrB4Elpx4f6GF7cbHMnPzkWgtR6XJkMVaQxCRDZPNjF4nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVZUamA0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVZUamA0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F21EC2BC87;
	Mon, 16 Mar 2026 17:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683552;
	bh=eHOT+tFj396RJk8G216Gyy0Ah6CVsgIlGUX9qfn3DMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pVZUamA0RySwu4qemCbD+QTj/tudSMGtJyNoOplrKsZ8o3AsMC3Pyegemt0mMHzI4
	 mWaqi39w6cYtEEGFffRg92BkVoPTTw8z9slRg4918ygTYYShZM2yCPlRpjtvQTLJxp
	 dZYo8KNz0OZS8RCHcksNsCjDGsu3dkTokispNc5Cy5IiWUA4SATrp037+DWM6I+7Xf
	 CFnABF6hJNNh8irgiaQTanaIYvYDRVwlo2qHSa8iiMExqCXD65XLx13qpl+XuGsC2f
	 63bsFdCZMUOgYga6ZOK8gOx/BYgt7g4lXlMORL9pXdRwAb1Al9vmZYzIc0G1oW9EEj
	 e30qA5TIO0+Yw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, hasunpark@gmail.com
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308151654.29059-1-hasunpark@gmail.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: amd: acp: PX13 ACP70 config and
 machine quirks
Message-Id: <177368355032.146755.16042252981851453258.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c

On Mon, 09 Mar 2026 00:16:51 +0900, hasunpark@gmail.com wrote:
> This series adds ACP70 platform quirks for ASUS ProArt PX13
> (HN7306EA/HN7306EAC).
> 
> The goal is to keep platform selection on the expected SoundWire path and
> add the required ACP70 machine/quirk entries for this board family.
> 
> Baseline (without this series):
>   $ cat /proc/asound/cards
>    0 [Generic        ]: HDA-Intel - HD-Audio Generic
>                         HD-Audio Generic at 0xa0440000 irq 160
>    1 [acppdmmach     ]: acp-pdm-mach - acp-pdm-mach
>                         ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: add DMI override for ACP70 flag
      https://git.kernel.org/broonie/misc/c/d0426510a9e1
[2/3] ASoC: amd: acp: add PX13 SoundWire machine link for rt721+tas2783x2
      https://git.kernel.org/broonie/misc/c/399b6fd37a10

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

