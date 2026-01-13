Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C5038E121;
	Tue, 13 Jan 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305303; cv=none; b=IU1/rVuZHOzY6bdWElwPlqZlvpnB8wEu5Rjnd0FdDflcGFB2iIFv56RGxfD7Qyt4kt6U8rkVDH7Hyoxz+geWGsHEEbLHNrP0aKCmYhaYiybJAeby9jKqDygrsCk5Q9qYCUlxlIPWUWhCC25NftifpGQYBHJTjm8xGZnyYpXvHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305303; c=relaxed/simple;
	bh=1A1NElpFwRfas98hum57Zz1hhHk4n/ks0M8UBIUrtl0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C2WV3bF/ca4WDc8Zm8ZwoIrSL7HfQfwkqLSOGFRTuYCbBlmtNsV1jyD7pNoXMUITIeZEzVj33bQoT9VYM7ThIJNQZEpZ5/h2Eruz11EbilDC138EQ8SZHiPaqMjGrOd3oJznEteI56DjmgRke6W4aQAydS4bdZ7F/Geh1ajEL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFi5/BGm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFi5/BGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254B2C16AAE;
	Tue, 13 Jan 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305301;
	bh=1A1NElpFwRfas98hum57Zz1hhHk4n/ks0M8UBIUrtl0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vFi5/BGmiKelO5woyJgR6+wU+G77nUNci4gciKFuCJ9IyMhrv/kZrZhvzLJklBdZx
	 Azqu8hl7oDshqJ4ByWAJbGxOGOnH8Gy3fcrIrti8NYzst3jDI3y8rVlxcUH4rjfKhO
	 pQImv5wGFbry9ztJxIWRT9z4Imupz636YnjyYaPWfdEcmUJGdyQW1Tbd2Oc2txrBYR
	 L0QHyjadRkGNuaHvMZAgdFNC+FKls5BgQht5IG2F3fC9/BT7d10ZQ7gGYBjgCjTuoV
	 RMydmaunPkJaitJRi0s8SnpoyyfYfUHdmkwdoH1bNOErfzVR2aF9zLrU4YIUbyNHiB
	 dGNIwi0IGHZEA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, 
 simont@opensource.cirrus.com, Sunil-kumar.Dommati@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb()
 helper
Message-Id: <176830529888.30686.15997534667463868299.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:54:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 10 Jan 2026 12:14:14 +0530, Vijendar Mukunda wrote:
> Add a filter to skip the RT172 VB configuration if a SmartMic Function
> is not found in the SDCA descriptors.
> 
> If the ACPI information is incorrect this can only be quirked further
> with DMI information.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
      commit: e7c30ac379b429d439eb62ae1bb69720a6701e26

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

