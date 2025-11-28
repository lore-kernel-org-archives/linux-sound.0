Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4621770A
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352890; cv=none; b=FwOraFy6OdbZUnE1FP9khlskEuET5wXHqNIsOJHCZ3hTX7JFqJ9MdIN7uumclrXtRzBTKrPdtBEA/cprfooeh+JD5fxX8oJD7cfP6Cg1fsmZaA08GbnOh9AcAT+C2wGwJlMClp/fGdbjRPMJj0dJk+ktLmKi5gNMQMNEQ6QrTQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352890; c=relaxed/simple;
	bh=RIJpNIi6duvsfLX/4fgLqBN2RHJ+I6L86K25H4TjTFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LE5bmjaeImbgHd09R7aOxkIPaxBIBiefvqAShhvFKBOwu5vqKeLpwef9jJjhFAr95B+fWGj8UN0ct+zuzPVLKw0eicvoaqFLlXCNqy8AOPOVBZSBn0vpAs3PAb3ChJKyBYfybpRGxf3cM9R33TcDT8vFO0aQkA8Q/hVLPMzwXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HF14/O4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HF14/O4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A4FC4CEFB;
	Fri, 28 Nov 2025 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764352890;
	bh=RIJpNIi6duvsfLX/4fgLqBN2RHJ+I6L86K25H4TjTFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HF14/O4QInukNpHDRNfRrB4CGxC5lcm2iu/hQc1EcFdv7DepB/+mlLkeVWP8Z5YIg
	 M+5AcgU7GbwxrDN23WiQhiJFDY180qj95nxn9ShoSEas7E4AFISsfb8TEfu9ZKPkiY
	 vWpQ70UDMBD52AbupsQcNU1kJEFl41uP5vQRS4+fh4UKswwUV8Rf32YUx0BpfmPPjE
	 fN+H719HaBXmzQlsplcI1TLbvpPTUoz7QaZ0YZSgUO7gZPAN2UcrLFHsaw44b+Ey58
	 UQP9YtMv4w182t7Rz6EvURWOc+mhqHHFSXx86lJgHPj3ecLPvOzhW697LdulTf7iVf
	 O234Fb0cz5z7w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/7] Add support for cs42l45 into the Intel machine
 driver
Message-Id: <176435288836.113594.5643530676682511363.b4-ty@kernel.org>
Date: Fri, 28 Nov 2025 18:01:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 27 Nov 2025 16:34:19 +0000, Charles Keepax wrote:
> Now that the full class driver is in place we can add support to the
> Intel machine driver for Cirrus's new SDCA audio CODEC the cs42l45. This
> makes some minor tweaks to the machine driver itself to support SDCA
> devices, and then adds the necessary tables etc. to define the device.
> 
> Note, this series shouldn't have any dependencies on the other series of
> improvements to the class driver that is already on the list. So either
> can be merged first.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SDCA: Align mute controls to ALSA expectations
      commit: 5fee9edf791a50182382fae23f30690c93e16cec
[2/7] ASoC: SDCA: Add terminal type into input/output widget name
      commit: 48fa77af2f4a55ab961520f2a0e50560dc0baca8
[3/7] ASoC: sdw_utils: Add codec_conf for every DAI
      commit: 26ee34d2f5c7fba968fcc2f1fd94110e1c1660db
[4/7] ASoC: sdw_utils: Move codec_name to dai info
      commit: 2ae4659533d8e2b5e06e8f570e2b4b7b88ae0716
[5/7] ASoC: intel: sof_sdw: Add ability to have auxiliary devices
      commit: c66297d09e1a5813eb743bae8cda4e115b8a5c56
[6/7] ASoC: sdw_utils: Add cs42l45 support functions
      commit: 3f6b562f2107ab2467908fa1543e1a6ea8442bd1
[7/7] ASoC: intel: sof_sdw: Add codec_info for cs42l45
      commit: 1e645bca9d1e4c5970778114d2d9fc247fe12e7b

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

