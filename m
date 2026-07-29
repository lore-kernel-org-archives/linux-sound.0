Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770823B0AEF
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410691; cv=none; b=oKzoEB/SjHN83ZOQ1FudvBsSp6iVjUvMGI4KSdPBYGMZtKY2T7no6C93RylQ2URrLrHFmMSYP/Xup88QD7e07CBLeGDLNeCWkrI+mca5WaTA5+bp1WF6kf7OJBrfhI4dvCHNzCIVu9WmzMBdPuDZW/vLpyJGm3jQZwDBB7DP2nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410691; c=relaxed/simple;
	bh=rbp+RdOWaotZDC91WE5K1rW/oKD82I2SNXsE0H3gTBM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QsJGV+azwqB0h+qbFcDceUXJZ/+ONWVYkgtPClBFRrVHGhslIKXwO5ZvqOz6eqVqA/I7HDew/8qXu3eAQim11vDR3VMUKkb3EXFUfkCrX8ODsCA1wUIfLgyPUXTC60JjnSvVzTEEXNjZDXskb3IPcQJoEeeDb//7knhra4tYM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZapGlTRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZapGlTRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091651F00A3A;
	Thu, 30 Jul 2026 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410690;
	bh=3RTJl6Blh/2ZLSQZ3LeZwt57BeUhfFDNmK+fvAjIy/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZapGlTRQrebaqCiE7EzhZX3hw9OHHbrl2Jz+KtSZGiK/uDaMnCKeOQ1TPiIllTvXR
	 vdlqyPY+ZhPhfaZOUeMI7r5tx8MqDFqqJbv3z/sT9Ywn2VXKQU41FBXoPkXIQ2wU/Y
	 k6jorrCqxSFr7FvHU1VfyuFbHqEKMrHWCAyFQTqkJb3TGkqwrvG7M34B71K+wYNXXi
	 PogpAq3HmtWZ6CtrM0vEipPtVkLUAhkeHRpYoQ3+E8vu1w0F4oqtT22ZoxLxHLRcQZ
	 s1AmhqTHDoBFlEvgi8Y3OFKcIsWiFbJBuaDt+kDU5caphzh9g3iEqBBGC9qRh2ooZZ
	 e5W5tODXadftQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: ux500: preparation for Card capsuling
Message-Id: <178536744793.512962.1637654903512081263.b4-ty@b4>
Date: Thu, 30 Jul 2026 00:24:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 21 Jul 2026 01:45:44 +0000, Kuninori Morimoto wrote:
> ASoC: ux500: preparation for Card capsuling
> 
> Hi ux500 developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup its drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: ux500: mop500: tidyup mop500_of_probe() parameter
      https://git.kernel.org/broonie/sound/c/a14b50577898
[2/2] ASoC: ux500: mop500_ab8500: tidyup mop500_ab8500_remove()
      https://git.kernel.org/broonie/sound/c/1ed8d136f778

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

