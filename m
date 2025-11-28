Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA414F125
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 21:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764365713; cv=none; b=Pj5NMzW+PKvX+0cW2cyKN8ILPPTJ2eiMoS5q4xo+6e/VpDmYU0+It3/fzukl40EHAzY2dLMtRr2XuoMsGzbgCRp0yB9V0biL7TA3czMeh0DjemE7zamj1m7oDpISsM/udCI9mpLtMO1GWrv5qO8jar6einRQfs7q8KMlfoNZQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764365713; c=relaxed/simple;
	bh=8xD1YlZhol2LK0HyAzCOLGO4pI92AT1oNhKi0hX2tTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NhCZxcXaDpr/EXs/RT0r4zzH/kvVlsNpk372xQGlPNhVjMRbbo9gDUeF59pXd6JzQV4TN/reZgxMKZhgpepEKI3SwXUHOh7+i+zp67WmfL/GVQ0HHvNckFGbYNeoVw3y98JsiS43SUWh8K+GhrJ5OU9U24jpkjey0Yrl0u76ckA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTkuLH9B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTkuLH9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC8BC4CEF1;
	Fri, 28 Nov 2025 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764365713;
	bh=8xD1YlZhol2LK0HyAzCOLGO4pI92AT1oNhKi0hX2tTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dTkuLH9BoYMoqTSKo8thNwlhVgOcWFivHl6reA9skD7D0Q9jXDqqkMgIRySvKVDqD
	 pbnDa7Gs+FyyJujTwTwdOY6M1WPR1+DQPfsI98fkQMlYyeItnW2+BmGsInHz4qZcSc
	 8f3/OgmXMRxMyEmTPi28pcO3SsXDUjqFL8Q0vphZ2BV+9ML7fR34FovHwfRWQivY+F
	 NYAdbEuwrwTGLFWtSFzC5F4LCYdY7VpsKq+NV/B6VRhXQPBsKOv/hVCroEuiiWrHsK
	 JX73dwkPDRm/DrebarmgfTbM4Qu6fPt8VfpLFcy/5WTP5SZ8WwdHVnHV6V0auMq4Pp
	 OqfHFENf5ymvg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20251128102841.2930808-1-ckeepax@opensource.cirrus.com>
References: <20251128102841.2930808-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Fixup some more Kconfig issues
Message-Id: <176436571162.232510.5122928087921804733.b4-ty@kernel.org>
Date: Fri, 28 Nov 2025 21:35:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 28 Nov 2025 10:28:41 +0000, Charles Keepax wrote:
> As the class driver is manually selectable, it needs to depend on
> SOUNDWIRE, which is obviously necessary. Also the depends on in
> SND_SOC_SDCA_HID needs to be pulled into SND_SOC_SDCA_CLASS as well,
> since HID is selected by the class driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Fixup some more Kconfig issues
      commit: b025f01ee952593d583716505764f116a9d578e0

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

