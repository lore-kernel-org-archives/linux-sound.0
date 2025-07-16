Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFC726E143
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678052; cv=none; b=JMDkc8dzA9felYvoU+WU76ucIpDldby3nxH64NdWKd74hgIRvlUB/aQADOplwRRAuX4MBYRmpWpxar/YobTqEV1GrPw8oBQjX7tjOnh0mghgtBBnhXmOibqrQIT5bcPu1fv94orbGaEVSaIeze+FcV3cgvkMo6UCH68Tf4gJZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678052; c=relaxed/simple;
	bh=iILkUzm1sMG2IaM5VlZGcGPTNupBY6yjaKO8Dkac6R8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hlTRhhrQXPMRho7Jy9Jinur57H3ynU694kgdez75XfSaS3IWvj35uylxXUakla1jZow32QYlMaMqqdc9UwiJNl2zsMQYguNeA9be96loEd9Ez3760F7ZxyL8GuI57iBLDNZIFi6/NRIXxAu4u7/UeTfjfTKGNPL/yZGRCjO4heM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIEin56e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIEin56e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89965C4CEF8;
	Wed, 16 Jul 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752678051;
	bh=iILkUzm1sMG2IaM5VlZGcGPTNupBY6yjaKO8Dkac6R8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IIEin56eZIkgPqOhxhBpVjX2LeFroTK95zv7Ej/S7emB3wcHDSseDWtNKbFHz3eQW
	 DCYs7iXrD9zqz8fdlI6jRudExfV50chIaTRvHR1Se0t2LidcYl9Wz5hWMKNZgzYgnj
	 gZ3+RXrV80YmFjylACLEpvrnqWtq4oUnTXWvMBXov5/JE7xOyQdAH0krvTOH4biwCl
	 GZlBw+mtGdE7UkjRykwTJrtwehgbcNYVpyZ5RSyx2L69wRxYjBUmrNrTWnE3ZJCWNS
	 jCj54u/59E+r5UciPa1s3S+s9vepdRJkev6EZT4NYWpQP69jCGNn//K4leoDphdmiy
	 JpUH2ltCej8yg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mario.limonciello@amd.com, venkataprasad.potturu@amd.com, 
 Lane Odenbach <laodenbach@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20250715182038.10048-1-laodenbach@gmail.com>
References: <20250715182038.10048-1-laodenbach@gmail.com>
Subject: Re: [PATCH] Signed-off-by: Lane Odenbach <laodenbach@gmail.com>
Message-Id: <175267805030.649282.9329948857295413188.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 16:00:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 15 Jul 2025 13:20:38 -0500, Lane Odenbach wrote:
> ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx
> 
> This fixes the internal microphone in the stated device
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Signed-off-by: Lane Odenbach <laodenbach@gmail.com>
      commit: 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d

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

