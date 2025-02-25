Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD741991C9
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503033; cv=none; b=kJYHbK9Cuj8A9DbgNWfLMlpteKT8Cg7gC5O9hBS/e+Vk4AnpemVv736mAuMSKPRxyFTfVt7zVvGgsVvTFU4wlYpjltQf62GCsSeAjhutLx5DIINb9aseXyNQzmpxF3WpL71ZT7EaN42YZXgZrbj2JB/upOOX8mqnJuLTRtgIlHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503033; c=relaxed/simple;
	bh=pvJNH/c0buve8nqoCe7NxeMNwR2qQkMU1E0lE9vjpsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N3eNBDlgv+ZTehJvmk7H6XH3T5P0lS0Ncqsn8vKtaN+PeCHNa24T5X5AOtheMNDbOQcAJSU/Bqyp4D0YXZ/g2uvppam88o310GxTPlkQIiLfNh7iLUnABR5vziYfaqz37nXcGUH/8p1TC0E1lei/hGgxy/Vb6n00FRaXjbwuJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoLo1lsf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoLo1lsf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07450C4CEDD;
	Tue, 25 Feb 2025 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503032;
	bh=pvJNH/c0buve8nqoCe7NxeMNwR2qQkMU1E0lE9vjpsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XoLo1lsftGKrRd33p81OEXkXp4hBapJneUpM+VUSCLko8miU4DQ2abkHBSyw7cPDV
	 IYHgbAMYkMvbk3s38W3AlMvLWrY2sTExW3kt0bqY+ICYI9i1ascIz/cp8/tC6qZtL/
	 B0D62xYYWWkTD4nrKMi9YEyuhvw9n09bw4DhYfiDikRJggCZEiY83OIYrixuPmy45X
	 z88hAtJ/QPRpEHO3QfLVzIFmQZgdr/ZYpgssGqFYKHJAgJe84mu9FwOdBMhUQtyN36
	 NAwVssuTHnZi3LulmSj0CNyO6K/W9ETmRSqyS5B+4yFeVmqImBtYDLTPy74SnSCDAi
	 fvFcep9B+PiHw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: avs: Mute and multi-channel
 controls support
Message-Id: <174050303073.104078.1162956157654528539.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 17:03:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 17 Feb 2025 11:21:05 +0100, Cezary Rojewski wrote:
> Note: the patchset DOES provide functional changes to the ASoC
> framework.
> 
> Current kcontrols loaded with ASoC topology allow for mono or stereo
> configuration only. To expand this and provide support to up to 8
> channels, first address the limitations found within the ASoC core and
> then update the user (avs-driver) so that it can utilize these new
> functionality. The 8 channels max stems from SND_SOC_TPLG_MAX_CHAN
> constant which is part of UAPI - asoc.h.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: topology: Create kcontrols based on their type
        commit: 758beab0252912395efb79f34095c5ae7e3e58b1
[02/10] ASoC: topology: Save num_channels value for mixer controls
        commit: 81eb3a2bd273b84fa9808e6b13b533f9c55e16eb
[03/10] ASoC: Intel: avs: Make PEAKVOL configurable from topology
        commit: 28feec15fa285e561c626b3490bc5a10f5d177c8
[04/10] ASoC: Intel: avs: Add volume control for GAIN module
        commit: 4c43a930e3e165ca6890147a309508ccb6768faf
[05/10] ASoC: Intel: avs: Update VOLUME and add MUTE IPCs
        commit: 10188a25c9b5944c0a912482011b484b7c2e22d4
[06/10] ASoC: Intel: avs: New volume control operations
        commit: c321a4d705a31a50d7580516422aaa5b853e7602
[07/10] ASoC: Intel: avs: Move to the new control operations
        commit: 4c32ebcc8650ce506632a32136993c85537fb01a
[08/10] ASoC: Intel: avs: Add support for mute for PEAKVOL and GAIN
        commit: a4217a03686989c4a79530fe54fa17576aff7330
[09/10] ASoC: Intel: avs: Honor the invert flag for mixer controls
        commit: 76e013152891a69dfe68a28706a51a7df9ed4c42
[10/10] ASoC: Intel: avs: Support multi-channel PEAKVOL instantiation
        commit: a9409fcb979eaff401837b955b234ca1ee05fdbd

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

