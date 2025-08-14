Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C17215766
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181119; cv=none; b=Ae+7CD+zrw9nYuTWMhoZABln1jLoYXmDtlK5i+4kJ9720zJjgt6GF8ZIksP/IYHxFubRe4t7VXXEsfNQhS5W6Wvig3D6ojI1QveIOwQCz3D6a414qYrEaDRbuubt7SHiySt9chDnYyeUHP8Kb5vdz9cMJS0Rz04V1BtbF4o6+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181119; c=relaxed/simple;
	bh=cgv5yKStYQLhMJhBN5tjMMaOnr8l4vEjv8WrKeiQFE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MctKX0WAEoIPSwrW2MkDoYRzip3Qj3XDj2S9SpQiLhcCTABvshSnU+MAN8edTWLY7BFI4fojUKbla0Fqu5bFSjaKiYaISkhIK/DqF0IwJiPtbXIIoWr87Gb9KYpa9WpryJDllgC14n1VTHnpIaOubvSLtRqAugdH/+5vZGOWkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ge+QTtoD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ge+QTtoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9C4C4CEED;
	Thu, 14 Aug 2025 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755181118;
	bh=cgv5yKStYQLhMJhBN5tjMMaOnr8l4vEjv8WrKeiQFE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ge+QTtoDObLxCjws7PsaNgn3n7L4gGkwU8h227Vrpvdvae9fXutfABfKCOGk8SfUd
	 VRz1XC0qTQJ4ch9E4Uit0RY1KUu6ZQvRCKowi6lUIVv0o/1KzNCyCUNZALPirLHNIA
	 YVcTXgVczNaiT2YPXw0K0K9TY2E23QHC1upnc37ob7aLGYvAiiUjvTalOe//6rmQtD
	 C5RznI2oB+JRX5Gsb37CvvMQ5w8PJMCOnIHT8R5eekQQ16Z+QL1gyvdE6s3f3yhkib
	 cc145hdtmj2nITA66xITdJMM7Ank/YztlD9/xNW0JGw0GUJsRQ8/qIAUaGZU1FSf3z
	 T2CLARGnkZAMw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 Deep.Harsora@Dell.com
In-Reply-To: <20250814092153.2733592-1-shumingf@realtek.com>
References: <20250814092153.2733592-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1321: Add RT1321 amplifier support
Message-Id: <175518111685.47921.11181631875158461093.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 15:18:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 14 Aug 2025 17:21:53 +0800, shumingf@realtek.com wrote:
> This patch supported RT1321 amplifier.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1321: Add RT1321 amplifier support
      commit: 7bf9e646af9a0ceac57b27e62b71f750af096c2c

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

