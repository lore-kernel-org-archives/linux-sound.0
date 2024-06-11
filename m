Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A9178371
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718101172; cv=none; b=KUC5Pf+qMiDrGdQlxisTtJSlYI3gXOirlQpLneZpEDEg4jdBN5uvPdIFriiLKOC5Uy31tdDt0w56Th6NmU+8y2xLoZxRBD3R92IiB2SltyRymF2oSq8Bja913FnsS53jNNaf1TH7LgrTaWdImmQiEtzTrzxKs3ZgxCo/CsYOF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718101172; c=relaxed/simple;
	bh=ObekRkrSe+EOUnd7QDGCxutmXFSACDEnV0vZ5NWpVeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WiL1fM8XJJVxrI/T5t1jGqXjfsLfqX2GaZU3xv7sOba+Wayp9hG0FM2IO8gm7QlMgWPhsr1vl+UtoNKQ/aRZOYcjrzhD2iS/GLXE77Ybb1kJ2j1/LaYsZddV8xyVxOn1TB1ZkIw1v/97TqZHNrFfoP0caAdxdGD0JlHf9OtUMhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLykSCqG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLykSCqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B92FC4AF49;
	Tue, 11 Jun 2024 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718101172;
	bh=ObekRkrSe+EOUnd7QDGCxutmXFSACDEnV0vZ5NWpVeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dLykSCqGe3xH86nN9q+DmRwCYXkBbeYMSYAXpxblzRQi2rMOm9WqSqEpQm30HR3a6
	 iYFCVtn24t6yMkkTji0QPmi3aox9b7cTeTEPn8kVqKrcZOTg7BD14/nV63AF+RhBRX
	 +1c63asOGFAx9dnXj6xk3U+cOUYUzJ/yXfz5ZtuHlwATAdvak/ZqFXJ17mTWiWFebg
	 C7krFPmUAd77WPwTqCdRDsEAQYX6SbkVKcTFzgnAjcueI0ClQGYHpW4zP/fZZkRlLy
	 GkcmQl3X+aUrvRjn+PGqfV6652N/uSCNm/LnT6gjuSUcsr0frd2WPsxEVmqccbX7vl
	 GOtHzHWtXjDNw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, rafael@kernel.org, 
 vkoul@kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ACPI/ALSA/soundwire: add
 acpi_get_local_u64_address() helper
Message-Id: <171810117047.177725.11786144644878657909.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 11:19:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370

On Tue, 28 May 2024 14:29:32 -0500, Pierre-Louis Bossart wrote:
> The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
> we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
> extension where the native 64-bits are used. This patchset suggests a
> new helper, acpi_get_local_address() may be renamed if desired in a
> folow-up patch.
> 
> The path of least resistance would be to merge this patchset in the
> ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
> Device Class) that depend on the new helper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ACPI: utils: introduce acpi_get_local_u64_address()
      commit: 0b7e448119428e1dcb854abb5855f66966fb82dc
[2/3] soundwire: slave: simplify code with acpi_get_local_u64_address()
      commit: b6212f9bf489daf9716aed0e8c4dc6a807ce839f
[3/3] ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()
      commit: 9b7dc68eeba04d20f4a1733e791bc71355423612

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

