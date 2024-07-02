Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62621CB31A;
	Tue,  2 Jul 2024 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943396; cv=none; b=sgoiVGF6Bq0M9C5Oo9H9J3KlLtfODOb6098g/VNVpKUFLSN1ZOg/IZXocPI/WuhZoIqUvKXGGOWFw4ntNi582lFygcLlF/Enxq/FoGlXtfLmP8cY6BwkBqI7M0kKbMyKJFJnA48QjW6OHk3mIQaHksLppVG4w1I20t+7pnjqu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943396; c=relaxed/simple;
	bh=AGT5khCzgfJ8eOY1S/huSzXXO11htefvcgkKR96theQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NsQTeOkvwvxMaSRiD6IVnIGPamPFYKrI1jDZkIBMV4EJyI+6MamAgHaiqIKx9U1PzzaXt+Jp+tBHnbFnABt9xAOKNmnrpx5iKsaugxsEDsJFR+CSuj+/vZkaxeanLav7pu6qnXeBefGX9vvd23Qa2v5/vBmm45gMZihVN3snXPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEvTWqGz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEvTWqGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC24C4AF0A;
	Tue,  2 Jul 2024 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943395;
	bh=AGT5khCzgfJ8eOY1S/huSzXXO11htefvcgkKR96theQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lEvTWqGzTRrpSZekFEzvz8IY2D4ce8JHbcYq2Vb3W691AYDN+KVTLWiQBqpAQ5Tqz
	 QgISC4qLtPflSRCS3cB6iZquY/pMHiGffoZ3FqefiELtFFBfjOgu51Oa9MeS3YJ0OM
	 3x8/O+nClxmB7aepjGv89bZO0JYBjdqjbPzymgctT0NcULz000aRvtcIGB3oMrGfpE
	 Vc2PwkstI49IX1+yKOQj+oeKo9x9Ftv94+TA9GorolkMYh9NntDmbC0AMzbI0OtF1+
	 qJXVw9KUHj6dOhXofdtNuaxlk1ixMv2/sqREp7mSmh6CMMxd0cHpudasLABOeMLhm7
	 cp2qQ7rdzxuiw==
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
References: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 0/2] ASoC: simple-audio-mux: add state-labels
Message-Id: <171994339295.996226.14530039402051298924.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:03:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 01 Jul 2024 00:38:31 +0000, Kuninori Morimoto wrote:
> simple-audio-mux is designed to be used generally, thus "Input 1" or
> "Input 2" are used to selecting MUX input. This numbered inputs would work,
> but might be not user friendly in some case, for example in case of system
> hardware design has some clear labels.
> Adds new "state-labels" property and enable to select MUX by own state names.
> 
> Original
> 	> amixer set "MUX" "Input 1"
> 	> amixer set "MUX" "Input 2"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple-audio-mux: enable to select MUX names
      commit: 3913ecb38833e8926467a17f1f1679ccd25a7230
[2/2] ASoC: dt-bindings: simple-audio-mux: add state-labels property
      commit: 9337f15f4fd6ebd35d911225c4a88ec82d27b2a2

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

