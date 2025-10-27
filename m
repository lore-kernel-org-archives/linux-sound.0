Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1630DED8
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568628; cv=none; b=MM4xsvX+9OEMkv371Vt4n+uk/GMclAe0Rdmemw5kp0zHFalSQGFVDcEr0CA0vBExfzqpD7ZD6nMq7V5MV196/mgmBaz0mEjwp8JcqHiWzFxwuvcpVU7EjWQo3tB1cFRzMyvSVJHGeqwh1sTKyj39nmj98nlKFp16XMKIcD0mdew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568628; c=relaxed/simple;
	bh=qCO0j2nEFIQzj427hOpYlFTkCxqqtt6AEA+PaLWtpug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BIErUdJtURNBVFqyoa6xMK+GzovgnTCABO99aVp03jsb8C7cn61ou05g1CP3MdT0u7IajU2+Qcbj0Ecxw/0m2vZyE5x2ZXSoHzJD7vJcbovkcp8IqSledFY4fgH4wEk3TkOnlEsI5TRMssSGo1n+HWI15WGb6KyVHSfgp0KISmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nc1rSK1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nc1rSK1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4084DC4CEFF;
	Mon, 27 Oct 2025 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761568625;
	bh=qCO0j2nEFIQzj427hOpYlFTkCxqqtt6AEA+PaLWtpug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nc1rSK1E+aN4Vog/KL07Tpm8bN1O4n7aVnuYCjowR/WnddQ9W99yEU9UpES0Jh1Or
	 uVuKsaRklJyjr9XJ3eAnFmknGIzza9DqMh4vvgujWVc1t0XhUdex1TFqVRgi7BikhU
	 tFHAKl7TXGWfEMWZIlGJWhNmCJdOWzn+7y6f4pXqwOoFe9G4LE58wseLZCZ21nb1Jc
	 vjpwvA0qkgmrCDDUgG4C/8YNwuoLWrsjAiJ07MvVmnBq6T0WSBcq0THCqro4ZlI3zz
	 EfI3ojnWZFX25HuJMZ/YxHD4LxBRHQUB3btjQNZpZKQsXiluKPdQKYrRuObbkD0nE8
	 En8E0Uhd3pQEA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeusz.slawinski@gmail.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20251023092348.3119313-1-cezary.rojewski@intel.com>
References: <20251023092348.3119313-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: avs: Set of streaming fixes
Message-Id: <176156862398.24382.11924777676621413706.b4-ty@kernel.org>
Date: Mon, 27 Oct 2025 12:37:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 23 Oct 2025 11:23:45 +0200, Cezary Rojewski wrote:
> Small set of patches two of which fix problems observed during shutdown
> and XRUN scenarios for PCM streaming. These ensure HDAudio HOST stream
> is reset and re-setup during XRUNs and synchronize avs_dai_fe_shutdown()
> and period-elapsed work (thread) so that no slab-use-after-free panics
> occur.
> 
> The last change makes the 'format' parameter provided by a
> compress-application taken into account - currently its ignored. Such
> approach helps us increase the coverage of data probing (debug)
> functionality.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: avs: Unprepare a stream when XRUN occurs
      commit: cfca1637bc2b6b1e4f191d2f0b25f12402fbbb26
[2/3] ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
      commit: 845f716dc5f354c719f6fda35048b6c2eca99331
[3/3] ASoC: Intel: avs: Use snd_codec format when initializing probe
      commit: 64007ad3e2a0e0a0ded8b2c6a72c0bb7883d3a33

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

