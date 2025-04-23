Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B487290BC1
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423675; cv=none; b=jppJD4DpdAiRjE4G4W223vzobDnLixjnhu5gT2eJrS3yESolQTN9OKhW6F8IxbbA0/kAcIi90x52dEen3jE5VZkmUyoVWFgjewDfmhUUAvnj22rRuh8TNHmb0Tcs9Mlsdwf4JJDLX1w0LN44eNdrYM2cuCasgydmItKSHqc/GDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423675; c=relaxed/simple;
	bh=BhpV7ys77Qt7vPkdoqL2QnuOT3jCCG7+o2n56ZNBz8U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UBzQjou//ndDhbC/13uj8CmhDgUakp2TR5rOGH6ySf2T2wdBTZrV9NgVjmwAYvAybMUj9xUmCx8Pt7yTdI7Xhc2N94IhP7oow6RpgFaP3kAUeCmJQog811Awgknep/+rLqIczp5rhfXFEvpaImKZ4yMK0/jGJWAKjl4sSsXcBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwxCsfeB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwxCsfeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1283C4CEE2;
	Wed, 23 Apr 2025 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423673;
	bh=BhpV7ys77Qt7vPkdoqL2QnuOT3jCCG7+o2n56ZNBz8U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LwxCsfeBAshsk7ENeffVyBhAVsTEbvJ3+pGSzhGP4ZRbpLNGNGFgYGsllA9tFwR/z
	 1Nztwh/tGFKogYLUjzznIQ6kJ+ccpmwUz2b0YzMgYeZqXIlWAJSG336z174Cfmlky9
	 eaZmb2wgsPYsGnYRJGy4Zeo0hWEjXGY/duOXYQQJDvyzYSbp2/RhWmyfSg67k+iDxu
	 heN+ciwVdOe5Koa0lgWJjJS1ZNgVCnRoLSenOxqACgrx2zG7G/Bvu5bP6okbjHvCOk
	 6zrXqLAyovyR4T84nI2ERwEbCJQgn+rjzVTzUz8Q8dNsNvNxpF4tLG7e4pPD9ofdh7
	 GfXO/BfNGIT9Q==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250423090944.1504538-1-ckeepax@opensource.cirrus.com>
References: <20250423090944.1504538-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Disable headphone clamps during type
 detection
Message-Id: <174542367251.859001.6865315555706220590.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 16:54:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 23 Apr 2025 10:09:44 +0100, Charles Keepax wrote:
> The headphone clamps cause fairly loud pops during type detect
> because they sink current from the detection process itself. Disable
> the clamps whilst the type detect runs, to improve the detection
> pop performance.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Disable headphone clamps during type detection
      commit: 70ad2e6bd180f94be030aef56e59693e36d945f3

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

