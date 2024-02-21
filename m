Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C853816
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520280; cv=none; b=X4kj5j+jEv1j6/QX1s7APVugaYbqSbgFuwOoy5YX5R6F1goavkMSPmeD4eIB0rmd0l4td3vgMoUl67jNOsf+9U0oYXqXAnrFYRO1qFQP1ay6BFgJPWWd8v7f6YET+LgoJXvN5HW/FMQ+Jp5Z3KiW3CujWlilkfHy99q2HexVuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520280; c=relaxed/simple;
	bh=0l94LClWCS65r5oy7U7YKWgl/b0d8KFwWoVT4NfHAWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PqirvPciTzDRDTxt+8+0n6f1a6LBmlUUwYX49bqCpcI1TRDE3htBzCQLoIhTrlDYfmkXVCZ6up/HM9aHt1KBm7DDplFl2vyoOhEsvQ7al/YKPKJxMA1G+UUc76LTL/y3mr4ObsQzQM/W/r412NkaZySpWSQI1QWX8FngEWgiNPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap5NNRvj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap5NNRvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E99DC433F1;
	Wed, 21 Feb 2024 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708520279;
	bh=0l94LClWCS65r5oy7U7YKWgl/b0d8KFwWoVT4NfHAWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ap5NNRvjrM0zMKqMHhSPK0SHQA4HfvJ7FXDP8s+NDfl/QYpy4BvErlw+FmLAd/E0N
	 FFcj/wLGzd9k448GiqxLGbPjtoEJyLzvjHWHtBGMPMYDhUDIHDFS0Iny9SgXazgHh0
	 zAKgqMEHPTLtaivN2ANlgBgsJtaDJs3QcRRQHX9drrZ/Z5zJw5YNwZxA3UZ4ZTeomx
	 YS8eD61ZItQqiBeufG8PIjurKUbAEiXUJjpt2a8rRO2p0xX3Y7EiJYst3q19DfP85n
	 toqg1STBMPvxFqbPughiTMyQqIN3xuQQJ440pGAZG7yvtbMYQ9cYuewtB/2C7wfdPs
	 oQCieRqc0/Pvw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: avs: Fixes and new platforms
 support
Message-Id: <170852027811.29200.13690058951183581212.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 12:57:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 20 Feb 2024 12:50:25 +0100, Cezary Rojewski wrote:
> The avs-driver continues to be utilized on more recent Intel machines.
> As TGL-based (cAVS 2.5) e.g.: RPL, inherit most of the functionality
> from previous platforms:
> 
> SKL <- APL <- CNL <- ICL <- TGL
> 
> rather than putting everything into a single file, the platform-specific
> bits are split into cnl/icl/tgl.c files instead. Makes the division clear
> and code easier to maintain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: avs: L1SEN reference counted
        commit: 1b72943ab1159ad27c11a302644fabb8bc2881bb
[02/10] ASoC: Intel: avs: Fix sound clipping in single capture scenario
        commit: e1a0cbae52d0bf3cb350eba5c95c46c14a5bcda4
[03/10] ASoC: Intel: avs: Prefix SKL/APL-specific members
        commit: a8f858d98f016a0209edaf1518fd45a5e5c62d47
[04/10] ASoC: Intel: avs: Abstract IPC handling
        commit: 7576e2f4d99df6efabb77f52b9539fd345233aee
[05/10] ASoC: Intel: avs: Abstract IRQ handling
        commit: 97bd565ff5a2fc89d302f9919fde37fadf51b645
[06/10] ASoC: Intel: avs: CNL-based platforms support
        commit: 8a6502ade116bc4b8293f094f8d74059c67c3f27
[07/10] ASoC: Intel: avs: ICL-based platforms support
        commit: 275b583d047a23c48d01b0c45fb5d95618c1da2d
[08/10] ASoC: Intel: avs: TGL-based platforms support
        commit: 5acb19ecd1982bd1578912473b33df75a23fefc2
[09/10] ASoC: Intel: avs: ICCMAX recommendations for ICL+ platforms
        commit: 36478a74c7ddaf58d80da5cef9c5ddb5beed5a2e
[10/10] ASoC: Intel: avs: Populate board selection with new I2S entries
        commit: 5b417fe0cded0b5917683398e6519aae8045cd40

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

