Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43D2ED14C
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996710; cv=none; b=LUt5cNOxtb9f31X/TzyTJpq/8iyOAkGslfzcesq/FxvMSKPvtNzCaGbO7qLI2W8SbD10hXweaZ/dKcjtIx+IKcq0R/hQTJU7UAYDLNRw5tLBr3zoAgNOdRoN/FpYJca/qQIr0FyOfjMaLut9sU8R+2cFNeO0jKO+BKNmsxT4v9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996710; c=relaxed/simple;
	bh=/ckE2xFCoIZijcVW4StTbbW5K4SQrp+u6qzoFYf0haU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lgW8qRm2KxSBP0Y7Q7VkmvK8Fq1iMjtXwbFeejOx5TY+KQ25TpSwOUgaocAZFTJHEcdpAbFQxHzlAXUvYU2Pvl4OlJ7Xk95BkPwGGrRdV2NvCfPYfGqx5WKqWCQQat6dXUo3G7VsTYZMQti2k0ybpR6zGWIh4YkFKZX+5CFMZ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1jeJblC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1jeJblC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880D6C4CEF0;
	Tue, 12 Aug 2025 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996710;
	bh=/ckE2xFCoIZijcVW4StTbbW5K4SQrp+u6qzoFYf0haU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q1jeJblCa4Xl/LvyQ2inweq0n11KxDiLhS6b59SFLPDy23cFGTm8nAOTqaPtMiXQw
	 QBqClXw9oZlexCxMubQCFl7YnVDY81ktSUg3DAOlK0JNj5rPWi1I+oZJzQ50VmF3uo
	 dQecBQJcDPk/wXcpXYc1d8JHdPUyn16dm5YdDJhj2wkYkgwCK5QI8CAozprJVKtLtN
	 W+zsrCIoMMqOuXQbY5hmzBfRZElu6IHJ6Ang+tm9d2f3qekSWpBkDdgIOeuy0X7qOh
	 3X+9GyewCEqPtzc7qu8AEYRRcoBspzI6JcnJrnLdZG5X9hvPNMN+t1IJRNT5vunFDR
	 e+Q1/TSHjGN4w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250807092432.997989-1-shumingf@realtek.com>
References: <20250807092432.997989-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix random cycle mute issue
Message-Id: <175499670829.16031.12493544997779229173.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 07 Aug 2025 17:24:32 +0800, shumingf@realtek.com wrote:
> This patch fixed the random cycle mute issue that occurs during long-time playback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix random cycle mute issue
      commit: f48d7a1b0bf11d16d8c9f77a5b9c80a82272f625

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

