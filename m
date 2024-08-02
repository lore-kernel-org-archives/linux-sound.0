Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7C91757D
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722637709; cv=none; b=Em3xRCci6ajdXgvReSB+bZAvXCx2Z2gq2IDuGqTD4uBqWNdiv82vPb93s2uYL/QRXMmG2//m9W3GQ8rTuxV6tknGh86CHDWEL3J5mUKtWV1mLFLK5Vdo3/kO+nsdIzPAcHbLglggfAhIDqLyV2HA8SdEm/2fDa97SBU2D763t+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722637709; c=relaxed/simple;
	bh=WHN1h7KzVZiSt7ckWJFDefAjYkEnMrlDR2WxF8xT4lc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XdzVRdZ6Ox5bORtUImPLGmUWb99v2hu5yN18lwYFGiffeCd4+fnUU1xQ46MatOke0JBu0GVqHyWVU53jBpFE5YWOGN7WkHf0WhIwcihyeknf3p8IGSjfbUiUXj1D+//8tTnB0adwdN74VmrxeH8G2xRNMQ2uvSUuTozRr9HjgS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmt4BXDv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmt4BXDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AC1C4AF09;
	Fri,  2 Aug 2024 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722637708;
	bh=WHN1h7KzVZiSt7ckWJFDefAjYkEnMrlDR2WxF8xT4lc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hmt4BXDvYZJNPVjeAaoUOLYIRLJthwN8xsEFvEmakcGeJyPb339/U+CotcQYBZfEN
	 G4erDJM3ju/79xTBnEdpMbGcLDYbj4jdD6j1xzO+UWKxVcCFO+u7tVUFX+cnZBJ/Tq
	 h9mf2KOAQNf6yjb+0GnoTESGRmHRsV5Zhg+V7yDta8wKWxsDL95hjDt7jpKTDZuFgS
	 NaVXGhm++VUEzMO7h81OSCnKtaF2M1T6oUDq/WkcoN2xsS6/wJRF49b+BCJz1Po/fV
	 lV5BYl+huw5/DSzQvAwaptVyoS6AorbDoZ4cDK9YFYf2+6aNpbAwoQQuKjrX6e+jnM
	 egAk+yPeBKcAw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
References: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/4] Fix IRQ mutex inversion on cs42l43
Message-Id: <172263770706.147512.10216685266646816700.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 23:28:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 02 Aug 2024 11:57:30 +0100, Charles Keepax wrote:
> Fix a mutex inversion in the IRQ handling for the speaker shutters on
> cs42l43. Do this by adding some new helper functions to get kcontrol
> pointers and caching those in the driver rather than directly acquiring
> them in the IRQ handler.
> 
> Changes in v4:
>  - Add the missing helper that was causing problems the cs35l45 update.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs42l43: Remove redundant semi-colon at end of function
      commit: becfa08bfefa2cbb22c84d9e583e81387f2f3bf2
[2/4] ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helpers
      commit: c8a132e2e032b00828d51141ab34f9aeb24f44ae
[3/4] ASoC: cs35l45: Use new snd_soc_component_get_kcontrol_locked() helper
      commit: 4791c422981350d0de4ad02a14a08b99c766d06f
[4/4] ASoC: cs42l43: Cache shutter IRQ control pointers
      commit: 93afd028fb5f06a46a32375fd1f0473451eb1c5a

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

