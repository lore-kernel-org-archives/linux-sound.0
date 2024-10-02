Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E91854;
	Wed,  2 Oct 2024 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727890673; cv=none; b=c+5pLZEC0B18l5GGlaAKgKAiMFb16LktIAcdaYXlW6df8mi13S/0wk2bLtWhq6w9rGaDgr2N9Ax/VAgURzgtTMYtHbc6/swiWcu+vGXAwejVDhoV9DZZwIFDtOBpTf52sm/LU2Q4ztZaMmXXO+ZMCrcCFI/dMAg9jz/0S+8QYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727890673; c=relaxed/simple;
	bh=Is+UGbRCPtv4WjnRWip81uNy+MDLQxFdDtBuMKE/U+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QsabyHSoOuw9Po76L/VsLqYAhAEajA0iPg2aKxEdPuRgb31lMG9k1sY4rBeqrQaNkOI1vNNbMAcr+0M0/xLpJ44YWmxARBwQWzSDeGXilqUTIlUVggdv8Dtppah9QUweHPqSs6+YxFXPlNxuk2ajqHAHBxTJPdfHdpUGUjXMSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJJ+I6Be; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJJ+I6Be"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56861C4CEC2;
	Wed,  2 Oct 2024 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727890673;
	bh=Is+UGbRCPtv4WjnRWip81uNy+MDLQxFdDtBuMKE/U+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MJJ+I6Be7MOG+JiYyakCjiecIE38iB3GwnXnr68osl1Y3qItMkHDVH4LLnMuGmBPd
	 pcZaFIGYQQYkUwNV8OMqJQ+Xuvih6Xk1WlzMTVgbttAFDFUc+vbaeKf12/cLi9YtpX
	 Cm7tyA/GPu8Y5XPkHo73IG4RTuchiauB2Hdj/CDydle7Fxw57qzDjNKWhwz9l/0Wb2
	 2ovuibX/3e5uJLLUBj4ipGRotkLRHQrOdg0b7K71SqAWESlBXm1NbN3yH4rAj9GUxD
	 KSdBbalVnvnTZOg8P8oIUnvKe262W22Hg6hCAeOTeFlOoXtLSdtiDo5/o8B/0EA7P9
	 m8umRK3ydwehg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241001204749.390054-1-miquel.raynal@bootlin.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-Id: <172789067103.163279.11797735685119883296.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 18:37:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8

On Tue, 01 Oct 2024 22:47:49 +0200, Miquel Raynal wrote:
> My understanding of the interrupts property is that it can either be:
> 1/ - TX
> 2/ - TX
>    - RX
> 3/ - Common/combined.
> 
> There are very little chances that either:
>    - TX
>    - Common/combined
> or even
>    - TX
>    - RX
>    - Common/combined
> could be a thing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
      commit: 17d8adc4cd5181c13c1041b197b76efc09eaf8a8

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

