Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA94392C39;
	Mon,  9 Mar 2026 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098535; cv=none; b=Bw8seU1yl0/9TDvRxYYiLZKyrV1xnh90WjsvPP21WlBoIQ5JFW2/pGHfK9iUlPYXI8gQcirl9qdd/0emAAt/a57/ymflwu1+5x6nIJZVwyYAtdk9gbKLVz4V9KTooTpgU7vs986e3KEHGALHHXC/TtRQojzt0pw4diPDAnoOoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098535; c=relaxed/simple;
	bh=3wBsIglRVS2Z7lLF91UUM4ivbzTh1kenyYebv67va3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gBYVZgZlHCFxYfLHQ8c+QHE0xHf1g0Gr9hBbj7CwOOGUDKSiJI5y5M46HZ1kUGnW0h+qAkpBQLuxHvQjXjm0Tc0ygB46YnltVF4aEuo7OhLMClXjfITrbvd0kQ99XoqvetVmI+o0W/A6AXr1Wv0CIDx4B0uWAFL3/7jZcgX7XAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aK1//uXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aK1//uXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9A7C2BC86;
	Mon,  9 Mar 2026 23:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773098534;
	bh=3wBsIglRVS2Z7lLF91UUM4ivbzTh1kenyYebv67va3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aK1//uXoSpwC2Jlv2TkxiE/3kV3G+nKIEiNWmVETXAJHEwrB+ZxHWQaMbgwhdKTdC
	 WSweT051hFSS02mWgPe47N8wXhy/7Lig3IaOz/QmkKqIgqtaakELyZx7O+K5cy3Kv7
	 +13U0IgCMX/4etmqhrirsi9BKrP5o6mAygFv70OeT2z4yZ1mv4RSQEbDpH2sz7z/bC
	 ioPBqWZGnZN4XF89RleJ2q9tTF9Ari9Ba6Sf+RaTcwLkbNuScGU7oELuSOzOf2iUYz
	 FZ3RA8ZutY4bMzRGJeyGZt+vyDFENWjBJFvCf7FdbmSJJZnAfJ2zhHXDvEVVstZn0J
	 ha41uRNdJRd1g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org
In-Reply-To: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
References: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v5 0/4] Add support for CS42L43B codec to CS42L43
 driver
Message-Id: <177309853251.332178.10976607511521199811.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 23:22:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Fri, 06 Mar 2026 15:28:07 +0000, Maciej Strozek wrote:
> Introducing CS42L43B, a variant of the CS42L43 codec with changes to
> PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
> ports and ISRCs, and can be supported by the existing CS42L43 driver
> with some modifications.
> Support is split into four commits:
>  1. Add CS42L43B codec info to SoundWire utils
>  2. Add dt binding for the new variant
>  3. MFD driver part 1/2
>  4. ASoC codec driver part 2/2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: sdw_utils: Add CS42L43B codec info
      commit: 3e314fde2304b328929c471a70906bc5968f9dcf
[2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
      commit: 301db523173236829974c7add540baa470ac8761
[3/4] mfd: cs42l43: Add support for the B variant
      commit: a6fe20d67dc7d512f9b5dc11c5777fb1e1ff70ce
[4/4] ASoC: cs42l43: Add support for the B variant
      commit: 0a208adefecb287d22321054470d4619cb303839

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

