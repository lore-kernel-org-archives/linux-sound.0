Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199433F398
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188388; cv=none; b=pD6jxSD4+GtkmKoSY5uI5o8Pw/qV4+XQGKx/GOrezqL6Y+O0gzgplBjfTmfn/QIrktqi6b+NWcH8v7aUQ8lCnnjlbxx6LKGdoF7QP+YoqGLxvUUEwPcuKRnIXoq5bSkqNfNgTaRNLniSUcWqsu3xn3DKkd9+YEkYCZ2+IRANHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188388; c=relaxed/simple;
	bh=bgIOthVwdf2ZfwtZntFwnUKudEyfkmm9iTBHCcAua5Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nxLwa4kocs1OJ8pAF6+3cF+OstQaTxkg506flLfkefCLTv7SGMdAXgPp4cIJAQpGnqmr4imwgvE1X2K/f4AovHBwvzaE/1Hv8t1Gq9fQVdKuoyUuL5pWjHIyodzAp7pFI1N6QpI/bGBX91EMITcBIrMmW/pj0gvWhJBNE9AT3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oob7VN5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oob7VN5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E09C4CEF7;
	Wed, 26 Nov 2025 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764188388;
	bh=bgIOthVwdf2ZfwtZntFwnUKudEyfkmm9iTBHCcAua5Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Oob7VN5KL/dkqijRICbphFE8y/ROG+aANdTl+PK0lT+ccA2qgMTS/YxIZ8rVVuMYg
	 ZdelkKhu9XjEt4pqVnKuplCBfXhAU3MKVjpkLYHmu5myUXM3y7xeutBCxQq7iBrB0j
	 crXMlTPdLUYZ+Nb2VHfEae29mZ+XEREic2oxZEVHUYLJtPEjGgf0CBAyxe/ds4w48b
	 Vu4IJkhbiUvBo3p64KSzc1RhyTxxvLPHgfCQZnEpVvg2Myb4w1GnEGPA59dz46pkRx
	 /LVybEDwFw1ipiYgF078tWV/PG2hyjHb9+t90LcEf5HSRBRlkcvUj68OUqs4e1xtXx
	 0FHpO5b/TP7NA==
From: Mark Brown <broonie@kernel.org>
To: Linux Sound ML <linux-sound@vger.kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20251126091759.2490019-1-perex@perex.cz>
References: <20251126091759.2490019-1-perex@perex.cz>
Subject: Re: [PATCH 0/2] nau8325 build fixes
Message-Id: <176418838766.130553.16560622831660304438.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 20:19:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 10:16:33 +0100, Jaroslav Kysela wrote:
> Add missing build configuration and fix the i2c probe function to follow
> latest i2c core interface.
> 
> Jaroslav Kysela (2):
>   ASoC: nau8325: use simple i2c probe function
>   ASoC: nau8325: add missing build config
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: nau8325: use simple i2c probe function
      commit: b4d072c98e47c562834f2a050ca98a1c709ef4f9
[2/2] ASoC: nau8325: add missing build config
      commit: cd41d3420ef658b2ca902d7677536ec8e25b610a

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

