Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199A4A11
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 01:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715045744; cv=none; b=RXwcBOpuXH7iZ4FjuEMr6dbcGnbkvuIP4MDlD1J9abYED9V/BH/SgCWVpMAf0UOiaa0vB4yDHhl6aGiKXmuj0sYNq54aOt/JdoIE4qrA4PQrcEgEgNzXy3dUoZRU94XImm/z67v9l8Ict7ug1Oxu9Z3e3t7hny3W0nX5mwMxiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715045744; c=relaxed/simple;
	bh=scqSW2Anwhvts9TAPdy3z3Adauarm0lADgbT3agoOes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s71Ak6nq0meGImojR2TIEdv4NTFI7qKwl96merMx0xCSjZCDFHU0d8bi9T9uHDMog/40AZgboQZdA3+udx8vHIjRqAWCrbafIMhcmaIOBE8XYXkAlHKb1fwfoH0nj3S3oH6MaSood1IbOAVOsqOtM/iHcRJeqZdbwTQDsGKezNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoeMWsDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoeMWsDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10FEC3277B;
	Tue,  7 May 2024 01:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715045743;
	bh=scqSW2Anwhvts9TAPdy3z3Adauarm0lADgbT3agoOes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YoeMWsDM1yBk0/AqLbXOJ5jlN6Nm6Hcp7983s020I7liphxhh9Df8CTaRv7JIY6Xi
	 qBMunpRIoXS/1zuGc3T8mOAvNeF3bPOHnvkCCsCjDQ86Nf30u8ryyZMgZCjAeoYT4g
	 chCZkFkW9ciWoF4RoiZFwOdtEExISuF/OtrNw5AyJ80cCCJOQfzOhf4IqLuUsSkxjR
	 4DgbCsPs5J/GG/Kvfo1I42Ks+zBscn9MlOjE35jGOQoP9hSGqGh0oZ5x8+4Wg7Mpt4
	 xBKlkgbXsRsn50ESNLPeqW9nfxZ7SidK8JdJZMYDtvaSeMeX5PrQ+IXn/diOU3a3Iq
	 E+hV4chOcrEqw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: Intel: remove circular dependency for
 SoundWire BPT
Message-Id: <171504574287.1980570.11050044716970904039.b4-ty@kernel.org>
Date: Tue, 07 May 2024 10:35:42 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 03 May 2024 08:52:14 -0500, Pierre-Louis Bossart wrote:
> The SoundWire BPT support will rely on the HDaudio DMA. This exposes a
> circular dependency module dependency which has to be resolved by
> splitting common parts used by HDaudio and SoundWire parts, and
> 'generic' parts used by HDaudio only.
> 
> This patchset does not change any functionality, it just moves code
> around, exposes symbols that are used in the new module. The code has
> been in use for more than one kernel cycle already so it really
> shouldn't break any existing platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Intel: hda-stream: export stream_get_position() helper
      commit: 9e7fd21ab03e6fadc4856f4c06e642daa9ccf7c6
[2/7] ASoC: SOF: Intel: regroup all SoundWire/Intel functions in hda.c
      commit: e4c6eba86d9618d99ba9892bc5d6e47715038530
[3/7] ASoC: SOF: Intel: start splitting top-level from common parts
      commit: 456644cbeab14394fff1308ffdaf87d4e0e6fb01
[4/7] ASoC: SOF: Intel: move common code from hda.c
      commit: 0bfbe91a2dbba31d41add146ab173721dee85ab3
[5/7] ASoC: SOF: Intel: move tracepoint creation
      commit: 136b37369cc4f044139b886133f3b9a721ecacd1
[6/7] ASoC: SOF: Intel: remove circular dependency on hda_sdw_process_wakeen()
      commit: 3b7bd0c139849e95981961525b7f6dd20097a563
[7/7] ASoC: SOF: Intel: move hda.c to different module
      commit: 6fe61f31eab1ec84c385786cd052415d966e5235

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

