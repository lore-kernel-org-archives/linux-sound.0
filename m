Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675FD21CFFA;
	Tue,  6 Jan 2026 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728548; cv=none; b=CCATAEWh3Kc9PZc/VN6t4EEb/GS5q9QKpy7mzMNEESoKt+YEW7yLeGEvkRqJnzONFZr0tAeVMV5mKx9NKbT20iLKZVUPbgiSXFKVQ6E2TBZKgnDulN5yLj3fxw9C/tpVbYYKgEJzl+p96cVrqxEfvb2/eLrwsjQeJkx/XjOIZ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728548; c=relaxed/simple;
	bh=4+qi1T6iHYnj38tCsTiRRCMQUeU6Q+qfiEL8Q+Wtls4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=llhcub7XyZ/eslzhyGkJQcJ23MRI8CsWexLSG+80faTPEPdM4IFDqFBHVf5UhpjIj9YFg4luP+008gD1B2dnx4l3e86KbQL+XYwSrGrJH7ITPKeaF5QEfZR4nNGxqdCP1AT7VWugG45HrMMRtCbDXT93ajXwGMoAUI18jTh/E5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSYG3Pzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSYG3Pzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82E0C19422;
	Tue,  6 Jan 2026 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767728547;
	bh=4+qi1T6iHYnj38tCsTiRRCMQUeU6Q+qfiEL8Q+Wtls4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XSYG3PzdJVxpVm5EAGXUF/MyPbRpaC7LSFpbN7LNPeo/1Sdg61rBG4AT0SV2nNRIt
	 sHVjuh3YUsqmZfVgUPHtkwkISFlUQRsPR1E1zbHpS3zqk1+UDHaVM9qOF4AxpO42Iu
	 Jx/M9XUTVGpnjKWYuM9mrN0wVIkgv7I7MlU1OZnUHt49K+lTlJ8FlcO6KURMIuI3DR
	 fEp3FLEM6Pgr0r2yTmCmODMWc/D3TbKWsw61iX4Cpl8byCYsioPkPO0uy0qJq8Tc6h
	 JN50OzFClbsUnhGtJSYeh0mntcVUOhT+Q8iADOl2Ikgw+jqIc1iIKuZl08hUW1j5iq
	 R2grLe1WsFzEQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Oder Chiou <oder_chiou@realtek.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, flove@realtek.com, shumingf@realtek.com, 
 jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20251121084112.743518-1-oder_chiou@realtek.com>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
Subject: Re: [PATCH v7 1/2] ASoC: rt5575: Add the codec driver for the
 ALC5575
Message-Id: <176772854544.328192.17132767077968717258.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 19:42:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 21 Nov 2025 16:41:11 +0800, Oder Chiou wrote:
> The ALC5575 integrates an audio DSP that typically loads its firmware
> from an external flash via its own SPI host interface. In certain
> hardware configurations, the firmware can alternatively be loaded
> through the SPI client interface. The driver provides basic mute and
> volume control functions. When the SPI client interface is enabled,
> firmware loading is handled by the SPI driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5575: Add the codec driver for the ALC5575
      commit: c7ac7499ac5bb50ab3e00add121822c5c904bc91
[2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for ALC5575
      (no commit info)

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

