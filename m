Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878336AB43;
	Mon,  9 Mar 2026 23:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098532; cv=none; b=Y+ga3MncJsIiupijDuB0UWhSc3c0RBJY7LRidHHUZEKIDPHMAa7P3Zc6TlTqOxHidNajJCcogdGWxulWFgo1YbLH/FE+MMgkoGj1ZuPh+hmeF/+cUn5xjKEqLGrx0J+fGnum7MqeLuO5GK1FZg7zwLDyNQ5jJzrRunmAGNMozzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098532; c=relaxed/simple;
	bh=y9ANMg+f3/yHzixBiC6hVOCotGxKM9ROn+VrlINuGqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EtjF0D6awNueNRkK/Z+XppAdSyjDqRPPtZm7uZVGMXvFF/hL1Qu6V1DfaMAhq7cf7RVjfEY9WwYyYmeZUPi8CAYvpM5wG8zzjSLofVjIsmdNACzs46qW6wg/jayj4eNJZJ5gST5ofkboHIuB2a+DHO4j2uHG3x8zxBT04sUFRLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXgljIcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXgljIcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44617C4CEF7;
	Mon,  9 Mar 2026 23:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773098532;
	bh=y9ANMg+f3/yHzixBiC6hVOCotGxKM9ROn+VrlINuGqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IXgljIcAoyv6VEL5LIHROPmDTCeYBoK/4AoJyKAYUvVwV1NtzKsQ/hLmZjEShyymU
	 6gLt+l165tgddjH8TNtCDzBgVTVX99zfw/uP+kA9RTqY/H4n4Jp57kEdSqsCpp/m4v
	 4IJqdQ8VKK11faXjnG3FmVpbddvmUXo6bGIYU/O4TtCmwP6BzDOKMCb9Ojn80Fjl7S
	 ZxA4EwmSLhrSiMNqbdsqTI/AP066oveR1NNeV3n9RyiWCpe9Zr3kOE+2GDhUkXICws
	 8Bcd3B1sTHLd+ZyB9mfcY5LzGuPqx0zP8AS1861iKg4SS8wdxqOpYniL8cqTvYiMqn
	 4PTf4TL5F+3/w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org
In-Reply-To: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v4 RESEND 0/4] Add support for CS42L43B codec to
 CS42L43 driver
Message-Id: <177309853000.332178.4026460155937292587.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 23:22:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Fri, 27 Feb 2026 13:00:57 +0000, Maciej Strozek wrote:
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

