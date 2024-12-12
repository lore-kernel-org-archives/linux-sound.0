Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9048A2101A0
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734006615; cv=none; b=XqO7D09Z3FD4iyGAFnsGZkyWMl+7jwjg17rlzSR9nVORKDs+Fx1DsRHPTuhQ7WiNuCtY3vgqFkeA16UiQrAGnlfBHvOqzOiDR0Xc/m8gBuU3cTYz69+8x6PWAFGx9f305SpPN4cda5IzMhbC9PECClYQRiTR57SGB6sUqU00iqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734006615; c=relaxed/simple;
	bh=SD3PVEglaGxG59Rb+v0JXpSqYZUXMQS9XnsrLeH1sBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d0CDd/bVJ+Xtkg8ZjAjqbCexrSYy/g+AJEsKZ/NsDW9I2jDQrwNOmJkVJl1WlWxAkOjC5Q5ww7/EhHClHyVWjFfXbyu3wN1mjjQ9V0P5Aem69ec7KdxwPgnjX8RbJxcZH/Fb2zNOPBjIqkHmGPuE0XK5rUe9tFafMfGwInsIvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmKTNLj/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmKTNLj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B2AC4CECE;
	Thu, 12 Dec 2024 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734006615;
	bh=SD3PVEglaGxG59Rb+v0JXpSqYZUXMQS9XnsrLeH1sBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bmKTNLj/arz46eMUTNQCUcOEtMfsSYQ1wVRQO2aSZW8vCE8gnpLUPjevLbyQ2qvss
	 WN4w9/Ezz9NecXrhj0WFxBDynhxcHwHiUjkiVRNLrQQkVVHhrCzaMWe3tlKJdtZOgR
	 KzOG2YZx+mJZ3NEgAhmnzsXeS8fWp5nxHxHanSjmRnUzjWGrjGIU9dfOf+XPz4UtMc
	 fJgDcLhcp5nE9lxMN+vww6uvfRDqiRffbUhXW9NWlTGWKGZo8VIyJgvApR0V25WHVL
	 HHk6bFXj1clniZpgp8BnYHmRL0TJmDFb0DZSAZ+TivQWhCVv7ShWvUAR1mlY+2Rp/S
	 IzzHJwwYgCgIQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20241212105742.1508574-1-ckeepax@opensource.cirrus.com>
References: <20241212105742.1508574-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add space for a terminator into
 DAIs array
Message-Id: <173400661246.40234.12662545621891223111.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 12:30:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 12 Dec 2024 10:57:42 +0000, Charles Keepax wrote:
> The code uses the initialised member of the asoc_sdw_dailink struct to
> determine if a member of the array is in use. However in the case the
> array is completely full this will lead to an access 1 past the end of
> the array, expand the array by one entry to include a space for a
> terminator.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add space for a terminator into DAIs array
      commit: 255cc582e6e16191a20d54bcdbca6c91d3e90c5e

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

