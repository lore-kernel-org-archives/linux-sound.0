Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362D23EA89
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625159; cv=none; b=BnSZjzFfea+efuFMynb+fcI0/tBMNi17kVNRIRzHaQXQMhxezzhxXmLKccfzmZRH77jMKUbPA6fvLnmvMSF/83lQbyld+8PltPddEHsxHE06kLMdUEjB5/tBiSRnuqnjgwqpt2MNe6ALUVP0lgA/3E4Fkde6nUyzEe2Lcb6KEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625159; c=relaxed/simple;
	bh=yG5UJ3ZtQkD23AG+xjDR/pYZK/46vg6UZI4DXDhAvOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YEqefe1Zlbvxki6UDp+I8E2G9T4qYDsNzbBcoR+p2zg5bpX2HZmtSZKEiBEzUhPQlyAJxAgAhrsFgN7krjiMuFxe2CDo7Ouz9oFOgqTnMh11WpwAqzH3RRHyOt0XPnq3JeFeZ7STWbfLNtHbuGgdupakmh7EEX93F4frtWD0U+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2g8DyEh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2g8DyEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3443DC4CEF7;
	Mon, 16 Mar 2026 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625159;
	bh=yG5UJ3ZtQkD23AG+xjDR/pYZK/46vg6UZI4DXDhAvOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S2g8DyEh3LuXnhbc8JHZ6S2rp0f85tenPjBE11HVK2pw+I7FhydztJH3W7e+0y9rZ
	 aE5fAzQCbWWpICEsVtv0rKzZRGVPUqNNsEL3df/906cW6d8ty8h3Swv5r/jhyPKL4A
	 c3LAPPHms7ytuA7d0NlcCc2UxHZToX2FeyxB6aODp+qMP5FsqEJcXqT+MJ4xQTWEjm
	 KTDJDzsILmMRpS8Q68muzeW7ns0LD78zq7i+Fi5wz4C1zc766YHW4w9lzzeBBX4tfW
	 aoKUOepGOpjza9CODgxUAN1tlEygGer8DQgSbFCTVFLUHFAXY3/MmZ1ZiaVMDsLBRg
	 dZ3GkGb41Hwyg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
References: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: amd: Move to GPIO descriptors
Message-Id: <177362349334.208027.10753270249924598182.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 01:11:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yG5UJ3ZtQkD23AG+xjDR/pYZK/46vg6UZI4DXDhAvOE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt19FHDukevGJQm4Ddmi09Qz2QOHndorZRjhQg
 VGrjfiDDQ+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfRQAKCRAk1otyXVSH
 0GSzB/9vHwUg+8YDKFi5ZJyN3Ff+r9N27Rkpb8AYi5gTlSjChCOedw/V+zDn9xfxawSzf9kqhNh
 88O/UfVSCbwlnBtxXCdAGHyGYViDPjs5UtBTCaZApUIjt1Ma2vgyAieHw+wXSq40sMsFW84tl1p
 7PxzAD17Wm8d17T/gOq6TG39I4d4y416zcS9a/F8Ka/oOZyKdmifNVlGvi4zz5flSgSLiKPAJtl
 /FqmEwCRRjWY5A7W7bzhi+gXyerekplV93UfvzNVe3oWjHNCu2Ri9cOBYf/CLnUW3z6sjQzstkk
 kr9E+ZE2vp56TPw36MmO8gx9lYfMxPXOYOYbPpA0EdzJxUDv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 14 Mar 2026 21:06:19 +0100, Linus Walleij wrote:
> ASoC: amd: Move to GPIO descriptors
> 
> After a quick look and test-compile I can determine that
> all of these drivers include <linux/gpio.h> for no reason
> whatsoever, so fixing it is low hanging fruit.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/5] ASoC: amd: acp-da7291-max98357a: Drop unused include
      https://git.kernel.org/broonie/sound/c/6d841b46ec05
[2/5] ASoC: amd: acp-es8336: Drop unused include
      https://git.kernel.org/broonie/sound/c/0a80eff3f53c
[3/5] ASoC: amd: acp-rt5645: Drop unused include
      https://git.kernel.org/broonie/sound/c/d63b722361b8
[4/5] ASoC: amd: acp3x-es83x: Drop unused include
      https://git.kernel.org/broonie/sound/c/70f0a90e718d
[5/5] ASoC: amd: acp3x-rt5682-max9836: Drop unused include
      https://git.kernel.org/broonie/sound/c/c43988dfe25b

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

