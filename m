Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2223184F
	for <linux-sound@vger.kernel.org>; Wed, 14 Jan 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419511; cv=none; b=hHaOFDl3pCd765cQVy33R7e3jcsREOIVspvQ6sCbHjAmp/mDnPXVpl3SyDwn3UPAszGlxyx8atIRSbzDMhBUmZBV+kzG5+uiYi61rSSXWi9R2tmrO5RXcdQ5A8Kplnmumxryq74FXabQ1kh6AXFKZbAyQx8uad4t/M9PJMa4Uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419511; c=relaxed/simple;
	bh=asU0UdiK8q/hHVTZKgJmwRTYVNWr29fS4im4oGwMI14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wqd7ArkHY1P5bf1ZAEspme8zZ+pOmv/Ffge/evFKv7nfWx20NKriqvzWOrGHbRmr/TIWpEMHKPypPIUmAYVowmOVKlVNZCkfBs3lsiKU2MPQjLrfZ00QdtBASV3zGbLuJ8ztj2solNX/UufzTpF0LlawWmdB7sirZO3QzvSijWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZZMULkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZZMULkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A763BC4CEF7;
	Wed, 14 Jan 2026 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768419510;
	bh=asU0UdiK8q/hHVTZKgJmwRTYVNWr29fS4im4oGwMI14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dZZMULkJXvn6bBx1nvWr1ryqSUREsVQgSGLCnRO9P36jc0PVJd2oKiNk39Oif3xHb
	 Rsb/HL/i+JJDV7i4NQf/7Mtw20FrG+/oG99ohpJXfMFfMBq31Q2RShcpkSUSmU7EJs
	 TY0pSFhHLUSC8cojylhrAnsi53pDwwSXI4aH0kPFVDkQ465Vn2JvCxTb34Ro+w7YTX
	 3dQH2o0DWGReR2JDYjn7iWnK7noOH4f7lYfoeA2K1xOSvWaU/Ple2INKFMHrhw9xDQ
	 w6u74e1Wb5JeA3IRuWgA4FyhnOLMykZZhTyn/zIh8DBTMtP2/SaU3+WGOOpfjjXM0C
	 rxP93qEZYD7aw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Cole Leavitt <cole@unwrap.rs>
Cc: ckeepax@opensource.cirrus.com, sbinding@opensource.cirrus.com, 
 patches@opensource.cirrus.com
In-Reply-To: <20260114025518.28519-1-cole@unwrap.rs>
References: <20260114025518.28519-1-cole@unwrap.rs>
Subject: Re: [PATCH v2] ASoC: sdw_utils: cs42l43: Enable Headphone pin for
 LINEOUT jack type
Message-Id: <176841950943.209803.10644730456429181708.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:38:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 13 Jan 2026 19:55:18 -0700, Cole Leavitt wrote:
> The CS42L43 codec's load detection can return different impedance values
> that map to either HEADPHONE or LINEOUT jack types. However, the
> soc_jack_pins array only maps SND_JACK_HEADPHONE to the "Headphone" DAPM
> pin, not SND_JACK_LINEOUT.
> 
> When headphones are detected with an impedance that maps to LINEOUT
> (such as impedance value 0x2), the driver reports SND_JACK_LINEOUT.
> Since this doesn't match the jack pin mask, the "Headphone" DAPM pin
> is not activated, and no audio is routed to the headphone outputs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type
      commit: 390caeed0897fcac75f3c414dbdd85d593183d9c

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

