Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBE1C5D77;
	Mon, 13 Jan 2025 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784009; cv=none; b=JEjp/S5pkIJJ89vpY/3zVDXUWZJoqvsrmENnwgQsNLeoJoFrYd97caTqKyhIA/0eekDBcqUknRLBafhQ4t0CCDpPsTWbd5exvzGznwyoPczVnDe0wClZj1tIEVvHl+Qo7AnXxAtHCX0CoaZEwmrEL44XyRPUgifNIw6rmcN5/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784009; c=relaxed/simple;
	bh=cCvqcU1wkfrJQonhs6eSmdzS7re4uFck5vMlDacw75k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=anF3GMLmVR6jct4MA29r3XVyo22B6HZ06SE1WabRjUGa5TYJ7xJRxl2/IexZiKTTZiVTBtPU5cEJAoVa1p5XuDDLkQlBP9aAPPwmtjfu1ToFzEgotYFVNFIeTZL6/aRDFM6PqNCC5DEAyebYPdt9be0B45mseSctcu6IRhTa6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0Nd31CN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0Nd31CN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEA6C4CEE1;
	Mon, 13 Jan 2025 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736784009;
	bh=cCvqcU1wkfrJQonhs6eSmdzS7re4uFck5vMlDacw75k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y0Nd31CNtZZrROGhOfLT+lz9i2aCDJ4ZTP3PVNLI8RpDsqbj90wpdOJW3zRxoYVTP
	 UL/xs41nHrBELREt2QwLWCkAgCDhuT449TOT9KQIAJRPn+ebaZCAUjo0wa2ZV2CQzZ
	 qNCET4qcrBwbT0MWOIuhHOfeumhfuHGZ59ABnAslBIs/rf7s/WqH8REMsi12pGWufU
	 CNdu7sUDY/SiJtrbEvU60jpvshC3sWe4c0aux2vW+FMBQHp1A4TyAt/q15tFI2y8MT
	 Wp/VKl/yc8xSlLP/xj1KVNeAVZDxzjhUNKMtHblAC8MYk8P4VMP4gi9cUcedjYBVCB
	 DJm36MYRioEyg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250109182202.3971965-2-robh@kernel.org>
References: <20250109182202.3971965-2-robh@kernel.org>
Subject: Re: [PATCH] ASoC: simple-card: Drop unnecessary
 "dai-tdm-slot-width-map" property presence check
Message-Id: <173678400663.55486.1485118696430886210.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 16:00:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 12:22:02 -0600, Rob Herring (Arm) wrote:
> It doesn't matter whether "dai-tdm-slot-width-map" is not present or
> there is some other issue parsing it in of_property_count_elems_of_size()
> causing an error. Drop the presence check and rely on
> of_property_count_elems_of_size() error return if not present.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card: Drop unnecessary "dai-tdm-slot-width-map" property presence check
      commit: abea0cbfba5848d11b6364e82df4864fd0bfa683

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

