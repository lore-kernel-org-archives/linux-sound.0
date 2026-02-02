Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349F35A936;
	Mon,  2 Feb 2026 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770075192; cv=none; b=uNgAKaRp65yggpZhZzr09pMz5OgU6oL+hqbOJZ/kIB6sup3E9tby9sfYHzi/3HvJN8Q3++WFeIWgG972y4YAqnbW0JaZaWTedIZP4zGUtQVw3XcNird1H+HdocQnHYtFK26DqFWi63zRC0dLV0HkK28Nm8bINFpsV6ci9LXG4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770075192; c=relaxed/simple;
	bh=R+zvFWyGY8u/rq+aP4fP5Dz8VgfUlSwukLKLtFfHKrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Awx8pHX40l9cdokpLEUuedbpDXf7Aj6oxjVucRUqXIKCdtlA+vC/7Y6VZVLXL+ztJggVqdIu8AMFu5fvaleZXVPHN3rJ2CW0NSywkskxETA2KjAHE/besmM72XpIbPRiVqZFcYHkhFkOmBB17pzrcIQ2oCdg/7Or6zofjqrFJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1OubHCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1OubHCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B06C19425;
	Mon,  2 Feb 2026 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770075191;
	bh=R+zvFWyGY8u/rq+aP4fP5Dz8VgfUlSwukLKLtFfHKrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l1OubHCNGqttE/2IBoD5lD/d0RoqKunPT2pjsFhrwKx401TuQlCYOB1EIpKH2IMp8
	 I8u89q+EXFfFJIYwtXqJIPZ3vltIXOL9oi2n60P6eSoIifTKAHfCMXwkqZ6Li+l++B
	 Hsr5it7TCMM3+8oHkO5aOZqfHtflagI6twq3epAE5oG0YgyHS/c6oN0jGdMqCz1o3Z
	 REDjz8li7MAvPzZIuVdrVtn62K/QMQt3+MnuXrb6NT4RsnlWHx3nAEl35H34EIHuD9
	 fKfitA1U41vkp9pN0iUYa8UObOGILKo39r38gb11NIW0TjNMXyP77o49srmFEEVdkP
	 fFB91y7N5K0yQ==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, 
 =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260102215225.609166-1-cedric.bellegarde@adishatz.org>
References: <20260102215225.609166-1-cedric.bellegarde@adishatz.org>
Subject: Re: [PATCH] ASoC: qcom: q6asm: drop DSP responses for closed data
 streams
Message-Id: <177007519035.976577.8405290688594066065.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 23:33:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773

On Fri, 02 Jan 2026 22:52:25 +0100, Cédric Bellegarde wrote:
> 'Commit a354f030dbce ("ASoC: qcom: q6asm: handle the responses
> after closing")' attempted to ignore DSP responses arriving
> after a stream had been closed.
> 
> However, those responses were still handled, causing lockups.
> 
> Fix this by unconditionally dropping all DSP responses associated with
> closed data streams.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6asm: drop DSP responses for closed data streams
      commit: 8a066a81ee0c1b6cdbd81393536c3b2d19ccef25

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

