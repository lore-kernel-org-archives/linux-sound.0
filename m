Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B6A1F5834
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616379; cv=none; b=eVEEp3I0oByChwgFNfMqifSbJ7K0r37w0o9RTvHkHGixhGtpKO2AFguk5qKOKqw3EXliKqsdlR6vyEc7izJkb9Uo7ysYvCm7AmRjhFZtfD/edX0ajpSjEcWYZqyFqhlyZKZsCvPiSy05P19BzUSlaERmZgrx1tWkred6GPQblW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616379; c=relaxed/simple;
	bh=gCAfBy6ipAySzOKJ6lmhuTniF+KV0ywkzrk9DEtV52w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j7ouh5p/D9iBvFces/PY7fZ6qoHqzKyfPx9lrlK9UYtqC4i1A4//UKtR9q9nyGRGsI63gidjWaiFdGTKT8D9d+XCT7MWZkIDYQ0Sx/8+vh070LfUjCmkQwfUZCcYd37jZr4v0bHDrvXBkJPlNOU/RjeEHHJxgpvEPAcqtUx7cwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHFFX5Dx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHFFX5Dx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE59CC4CEEB;
	Wed,  7 May 2025 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746616378;
	bh=gCAfBy6ipAySzOKJ6lmhuTniF+KV0ywkzrk9DEtV52w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JHFFX5DxIzrmfI7aZ6A168QwjHPflyJNWW4PFbnz9dbqJ2xzYr5b3h+VtCdNCIFMo
	 xoQlgAFHhgXKjYLvmYT05ozeKAPw+6cI/ONAHfu1+InOUw1G7a44+bVeeOyMRsaE2x
	 EjVuCR4mrY51P3GoNBLkzegmvyJneqTlgddTtgAd8v1TqZETz+Jkbhw1Oh7//Kjjve
	 i/mPr0MddvWVxlp2Lq5S9o89+r+j//6klNUymWl3i0zjrHTvCnFhmYaL/V28pzD0fe
	 McyGW5n7TlqkRpHZCXVthcB9TBLB2oUNAcx47tmKjtBhDbOe9LFDsvOzEggX79lClc
	 PvRERwU0EcX0Q==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
References: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] Minor bug fix and tidy up for sof_sdw
Message-Id: <174661637555.4174662.6662619469038232233.b4-ty@kernel.org>
Date: Wed, 07 May 2025 20:12:55 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 05 May 2025 15:14:07 +0100, Charles Keepax wrote:
> Fix a small bug that can cause the sof_sdw machine driver to fail probe
> after the first time it has probed. Also do some minor tidy up on the
> handling of the platform_component of the dai links.
> 
> Thanks,
> Charles
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sdw_utils: Remove num_platforms from simple DAI helper
      commit: 8ce5ace8e279d39f249fd5ead33895d04263ea36
[2/2] ASoC: Intel: sof_sdw: Avoid NULL check fail when re-probing
      commit: 6c965d39af98a8b79668898b3a2af40d11179ff4

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

