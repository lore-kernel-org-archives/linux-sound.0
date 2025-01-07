Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E431F75B5;
	Tue,  7 Jan 2025 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263922; cv=none; b=J3IZyYcPwCM1nvuA7WD3N9ro1W/gkvtlgLs3RNFbxFnCfW4SP4qTDJr+au49nnrWTDRtBqXI1BimFweJfdV7+cV8cI4GxHfv75W50ViryKkppH3vSjHfHYk9Mvr3sRpQW/AbmBEqOclg24sD3rLVF9EvURs/EccCbdwkz9t1ArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263922; c=relaxed/simple;
	bh=rmppKVmlM5jQDxLcaabRhJHMM/jp6NqK9tcqaoFB7yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kXV4XMRtZXUwehAvZws7y0vw4SGGbXbTrQ/RzrfkyJoOZrRmtgtO9qudWxd6lXQ0cZpxmHtXtvDJLDT1u6YkEeRYTC+TcgKJzn41dAMGpWVXj2Iv5nXFsKrrZIVwHhgtQyoNH8D2tCtRBznrEfKcmMsu1SisIl12SKCqPiLZDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc3eH96F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc3eH96F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C63C4CEDE;
	Tue,  7 Jan 2025 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263922;
	bh=rmppKVmlM5jQDxLcaabRhJHMM/jp6NqK9tcqaoFB7yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tc3eH96Fk8BoTvx//RzwMjRur49I/EK+4dtswoLTBS+bzAsFpZtcmXoic/D8Db2eY
	 JYMr5DAa/Zj1m7fo0azlhMdo+NdpHEpTFHcx/sqb8kN7+5selJcyybxp1iqQNxNXmM
	 88oUVVxO/6OtO67Kn1QX+Gsa2CYtjcC81lvwRMgVvRLU+andTGDUsQQfhkMtRR5Sxf
	 56wpca/kTboMSsrKK4B9QGQo6r1HniyyxHyOCCbb6AM2tTrsIdZyXTkpbwll7M9a1P
	 yFFI8O1NVQziScEHExrxBElRCrBEfF2AHknDuFUMow2m5RQhWmqNd2bxx4QX7Nzl7A
	 uAG490NFreNBg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marian Postevca <posteuca@mutex.one>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20241227202751.244954-1-posteuca@mutex.one>
References: <20241227202751.244954-1-posteuca@mutex.one>
Subject: Re: [PATCH RESEND] ASoC: codecs: es8316: Fix HW rate calculation
 for 48Mhz MCLK
Message-Id: <173626392060.92253.14506796479428762280.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 15:32:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 27 Dec 2024 22:27:51 +0200, Marian Postevca wrote:
> For 48Mhz MCLK systems the calculation of the HW rate is broken,
> and will not produce even one sane rate. Since es83xx supports
> the option to halve MCLK, calculate also rates with MCLK/2.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK
      commit: 85c9ac7a56f731ecd59317c822cb6295464444cc

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

