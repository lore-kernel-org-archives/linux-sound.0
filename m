Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F0238166;
	Tue,  6 Jan 2026 19:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728551; cv=none; b=dI9V4kLKqy5EL5lcBjdJ0tfwGbsVeAofLIccY442twC1I4nxvqtiUHxCoUPInqRE3u/zqzFUPgClIsA+p2SjjP0ZLnwUFV70VMFdl5lCvIMLGbazHU4wZsQPg1cxkcirnizYc5uHAQm64gpfZ4lOZQzyHNnNnNG4O8FJBDdbqGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728551; c=relaxed/simple;
	bh=HE9RQs51x9jbDKVj07ks+Wx7nx/fLpx8Th87Dm2I4d4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QxFL1IVwDfMECHxpaYtfW0jSsF1zluAJgfON1XI5W0m35T+JlDwyFNYQYDQhzc3SXKjLnN12sCzFSsdw2DPW6HfSZbWcn7uzA2g50uXndjevf57JYrZ0BN9ngy+qYM893/5nJp+X1W/ZjOKn12Gbl/bquOg/ZULOEVHE6TerCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAtuU7e8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAtuU7e8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62415C116C6;
	Tue,  6 Jan 2026 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767728550;
	bh=HE9RQs51x9jbDKVj07ks+Wx7nx/fLpx8Th87Dm2I4d4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VAtuU7e8FmvXpLcY6N+yLFEbZOiLaoZ2uLas6QR09wmS4HxLZ2KzJVZzAqtoJX089
	 rqTz9qQfQRylr+LBLcyo4joJTfK6pz7BTZrih9izY5dUY6F4KmczZBUIMFxX6SDoiJ
	 FUUdZr4ygBxwidl/hFCAmTcwMJ+bTt3GoRvoyXGjdhav41yXs728RtqFGrkZ2+L/R+
	 qV46fi1PqtLjQ+seIR8zxkqYFsS/GCy9s/fb3vT23WJHeLvUGdPMzUvYZkce4nJ1ro
	 DGFnaBUNw/Y58mkdPxsJ+7mhAVXCF4zEWKrYlKrVkR3Sb1DqUSbjLIEdui4xgLy0+P
	 HXYAalQWp4bKw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, krzk+dt@kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
In-Reply-To: <20260105091548.4196-1-zhangyi@everest-semi.com>
References: <20260105091548.4196-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH 0/5] ASoC: ES8389: Add some members and update
 configuration
Message-Id: <176772854815.328192.14832187375626924982.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 19:42:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 05 Jan 2026 17:15:43 +0800, Zhang Yi wrote:
> To improve the codec's performance, add members related to power and version,
> and modify the configuration.
> 
> Zhang Yi (5):
>   ASoC: dt-bindings: ES8389: Add property about power supply
>   ASoC: codecs: ES8389: Add members related to power supply
>   ASoC: codecs: ES8389: Adjust wakeup configuration
>   ASoC: codecs: ES8389: Add members about the version
>   ASoC: codecs: ES8389: Update clock configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: ES8389: Add property about power supply
      commit: 163eb876a275e6139fcc81122c5d34fa521db25a
[2/5] ASoC: codecs: ES8389: Add members related to power supply
      commit: 59e447ca608bf869fed23a9bba8fcb513852f02b
[3/5] ASoC: codecs: ES8389: Adjust wakeup configuration
      commit: b35340e997e0809e045692949a88adf56b0d1ea0
[4/5] ASoC: codecs: ES8389: Add members about the version
      commit: e5077facc770a9348d653dd9f1dbafb747a87e38
[5/5] ASoC: codecs: ES8389: Update clock configuration
      commit: 4c5e6d5b31bc623d89185d551681ab91cfd037c9

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

