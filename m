Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F31DA0EB;
	Mon,  7 Oct 2024 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317321; cv=none; b=Vkc+je7EdeFpyqTVSBpraMB9WLF1l7wDZCSiBzzwMEBbOEANX97yiI7i7YO5oibzd77OI+8RFM9gG40iUGbmW5qrYOVwiCIrjO0Ovb3ERoKoir8gWu/9l2VJuT7X0zeWoGOzsHJglW8HjfwhfCMfSHowJM6tAx4pADSpv0QdQJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317321; c=relaxed/simple;
	bh=q7x+MeMH8NJaMP+kd5LXA06qF1b7dWCfxGXmKfmhnT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gD7Ayu5dEO9cFdrYYeYpbV6azn+K/Q8V00HgPWLGmhCYqKbOqQD5jdsiIW4Q6EMir6xY+hNziObi3NDoaVRUbOZEro7MR/PtzSz3gp8nYtlLE0bQBr6S+TEfl7jQClEHx84TczVa8J/1Aj+2J4esSbs0azJ4RPSGTIZvPrHofmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpBXoWTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpBXoWTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632A6C4CEC7;
	Mon,  7 Oct 2024 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728317320;
	bh=q7x+MeMH8NJaMP+kd5LXA06qF1b7dWCfxGXmKfmhnT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EpBXoWTceQzbIWr1IfCpRcqJGZutVJ6eN3LyBE1bV+sR4F0ydMo8T6uvM9AyZnbkU
	 RfTVL4bTEKjXOCEGCp9Wf2ZXSJjXW6gPNN8aXIktRwnnEMBFNaCePmDc7e/4+/N4C/
	 Ff8LzGfQ25mr0x37+1qNmFaC9dO1nBQCjrifHz9S0vyY/kSrX1sHn/OPu6YHAOH0Ui
	 HxZ7L9sWBeWFgHN+0zMQxIqxUlwOdK0B7q/h4z3dekFEb0HkDJaEMIwu45hUBcYAHj
	 Q2bek9BHpETsBHGf3NcI111JDPkRwGUjPkzzIY9T7e790djRbJYqsna0/GgCGuDo+r
	 Faos5R8O/Cb3A==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241003083611.461894-1-miquel.raynal@bootlin.com>
References: <20241003083611.461894-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupt
 properties
Message-Id: <172831731707.2397838.6276980264553281279.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 17:08:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 03 Oct 2024 10:36:11 +0200, Miquel Raynal wrote:
> Combinations of "tx" alone, "rx" alone and "tx", "rx" together are
> supposedly valid (see link below), which is not the case today as "rx"
> alone is not accepted by the current binding.
> 
> Let's rework the two interrupt properties to expose all correct
> possibilities.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: davinci-mcasp: Fix interrupt properties
      commit: 8380dbf1b9ef66e3ce6c1d660fd7259637c2a929

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

