Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E7022EF8
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 23:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712359203; cv=none; b=f4yR7PiuXq4xu4nrf2XNQVV814UwhGj+KB0oE5oyeylh7MfGik33SOru8eGX8xgRTz1Gi0stQcda1/aijSw4AT5LK46lk2aMStPr8o48boN/0yCFW5TFDrXgiM/ZPx6Ce0lxyq7NXD1DUInHkEHFL1xuRNNQ3ZoC8bBRmmMrvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712359203; c=relaxed/simple;
	bh=g/rg8hX2kW3QsCPiDjAfOeFUbjgmiQ/na7CgdZOszU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EI8HDbPf9ZYlq/m65gBrnsOJqI8Hd+KoMm50TJchA0N3E3n1Kr32FfwEHotlMGVNZmG9tQx3eTaRTGJR/siUAeORWY5GWdjUbwukcm3kHvJqT++rG9UWKyGBBqKU2mPVbY4qYRARTJGMG0eEtwqNAMMN6yuHDS0eoiE+47ILG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBvlOjTV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBvlOjTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F9BC43390;
	Fri,  5 Apr 2024 23:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712359203;
	bh=g/rg8hX2kW3QsCPiDjAfOeFUbjgmiQ/na7CgdZOszU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LBvlOjTVksE+FjM4+dIKfd8jdbcMpZiLqoUd+uGX3xq9apvFvo8oZsCBeDqC85FW1
	 /KC3QH6GsAEdDDmgaPG31M8PJiAUJSws7yP9kovAKmjJK/i/MVZDP1vJLCBMS6U6kp
	 j28fAzC5X1AT0qhDjBq+Jip12NOCEoFtkn14Fpn7jHLw73YAtSVPJ7JvTXuns/KcsC
	 UnKeIUN786gONCpr8E3OP+nwH0xzru1E4tdsdKs5n0dqSdUiXW8UOUhlkI+SnHNpvs
	 fv37O6i+v9pMpbeUmqq5CCNn7I1inPo/pcaknP9Kz5nrKnJhcxlma/VC1iCjL9ntyG
	 YjBQl7IjPaG+w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: improve and extend HDaudio-based
 wakes
Message-Id: <171235920219.198289.1128617567514278392.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 00:20:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Thu, 04 Apr 2024 14:03:53 -0500, Pierre-Louis Bossart wrote:
> For LunarLake, the SoundWire in-band wake detection is reported with
> the HDAudio WAKE_EN/WAKE_STS registers. In the existing code, these
> registers are only handled for HDaudio codecs. Now the same registers
> have to be handled with care as shared resources.
> 
> The in-band wake detection mainly used for jack detection. Without
> this patchset, the SoundWire headset codecs signal an event that would
> be ignored and not reported.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda-ctrl: add missing WAKE_STS clear
      commit: bd5863f9ef12e26c2cfdce9c0adbf0222c731a3c
[2/4] ASoC: SOF: Intel: lnl: add helper to detect SoundWire wakes
      commit: ab9182441ee5a94dd6f47743ed1b7b6b07b63cb2
[3/4] ASoC: SOF: Intel: hda-codec: preserve WAKEEN values
      commit: b69480edf4eb71c6f754e3c4020e8dd72a330558
[4/4] ASoC: SOF: Intel: hda-ctrl: only clear WAKESTS for HDaudio codecs
      commit: 35b5806e2edee1741f6bd2de2a5c149a876c4a60

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

