Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365C4611C7;
	Tue, 30 Jun 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834508; cv=none; b=Cg/cxA352GhiaPutdNpAN+cNVcp3kj4NPNv9gqscTFIqbvTT51bkGJoatdqAuWekp1Rv35C+OBINkJ2yt2wiG02gFvMXC3nkgNlBk6l6ZVdvUGptLLm2hZ3owxBpLCSxZfvHPTjCn/GP55iXo4/oU5sliKzL1EDRO54Us3EPimE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834508; c=relaxed/simple;
	bh=Si+E3s4qppWTB6ni9DSp/tjVMvC93mvOM5rCE7Utk4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WQ5QlNnNPVesGY4i7G41EMe5QAzFi9zMD6XHo+jMsPnBx2VD+00rz+iOOdO8ey1frQCyo5YZyco1OJX6nJBHd/EIQ10SFWxSyzoYp4gCEIP/iQg519Jf7tbo5coJW74WC58ldBQWHzmHU3da9UUE2VWGutpUXvDDxCdh/Br1AtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+Ms0C2b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+Ms0C2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D77C1F000E9;
	Tue, 30 Jun 2026 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834506;
	bh=JQQWytKMqO5uSXbWa5w5Wy3w3EiEBtUO5hKFXhyNXV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W+Ms0C2byRfA+1+AtN2ozjrmC61dFMYOhCAJSVUbmtJqRNJTE/1qtSVNHF6HAd03m
	 ZKmFAxqHZjnkWaA9ylV1KGUEWs5JYPGbWFGURCJaBrR2xblGK81/GK5xoAMPfzEMlR
	 AYYhAPmXL5bg+0JHySwxu7+W2MxDpwGXLIUIpfcSLTWCL9Jo1YugvSaQ4PYk6lq73p
	 TiyonAlcem5E8QLU8CLvr6ieSvN5asegvAFLrf+MZSUNH9fY+7Zw36Zb4Q9jWfwDRE
	 DGBRcWJamf0IQFdsrgOQP3uL5E54lBazRj5Iw1yLYstrFuRikmUgfyoYh6Z/4Qt1d7
	 KD6Xk0DN1tlEQ==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
Subject: Re: [PATCH v2 0/4] ASoC: meson: aiu: align I2S design to the AXG
 one
Message-Id: <178281883580.79320.9513861965919531043.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:27:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Si+E3s4qppWTB6ni9DSp/tjVMvC93mvOM5rCE7Utk4A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+VHrVGJt3FuRWmbHlIMPXlTBW1uLgpfBBIEw
 CRjy3kMvEmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlRwAKCRAk1otyXVSH
 0NJ/B/oDh9A0+VrQUsPuCDcGmHS6Zd7L0jpIaKl70smdU2Mlhwi5fdWRQrHaXUZrgc0tlFYlk99
 897m+31GfKXo+EacHNNohQsMgv2mhFrCHE/fFjn3aGlIhfnCgMVdQ6Vder9f6WGa42IZ1Sz3Sfx
 UBUezbMLTgvpspl+swflaDFuP3w9ZFHQm0JOs4pXcCJtLCd7t7LjTxCDjTUBNfxflCWxdgjKDCJ
 PKzmSxPwyVSM6FlNyfTixfTBe9UxGOMAhexR+LM3snVMZvND+nJdznqEuo8juFTn8VwjSxfwUKg
 iVnONIjgALLc1jL/QmxAWwzsftwWcLa8e6KQSrsadEdWO1bq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 23:29:24 +0200, Valerio Setti wrote:
> ASoC: meson: aiu: align I2S design to the AXG one
> 
> The goal of this series is to reshape Amlogic GX's AIU implementation for
> I2S to let it follow the same design as in AXG's TDM. Keeping the same
> design allows for unifying the two platform implementations in the future
> and it also allows for an easy addition of I2S input.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: meson: gx: add gx-formatter and gx-interface
      https://git.kernel.org/broonie/sound/c/a295be8d6210
[2/4] ASoC: meson: aiu-encoder-i2s: prepare for multiple streams
      https://git.kernel.org/broonie/sound/c/9335117a221a
[3/4] ASoC: meson: aiu: introduce I2S output formatter
      https://git.kernel.org/broonie/sound/c/2cbb32d8dce0
[4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
      https://git.kernel.org/broonie/sound/c/83b83024cdbf

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

