Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2A495FD
	for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwK9XLtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7130AC433C7;
	Thu, 30 Nov 2023 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353989;
	bh=LZrrb0dSxcKPDCoczLls1B8hAHeLjnKbhR6+KrSQFGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nwK9XLtPOrsXulwkIaIy8cdaHVrX14gqAOWVMC1Y3UK6i8TTKR+MuF11pPEzQlhhv
	 GJ41S3c52aYfq2EK++b0FCr6I0OjNLddOKfP7ufwh5CBzJnyTgfsVi37dIJRLCQawi
	 cxi/dkov1/Uu6CNkvbxtdnlxwHNIzcP5vCt6Pc4ga1gVl4sz8LY7Nq7tkakk94evqR
	 ncrSu/eulLg6zedL6lRI5/b3W1kRJ/r56x322vqBuo5/c7HGDK/ldIWHPXaOxFoGqw
	 lpT/klSjAnXB29t7CD2LZPy9+L4ehdcQmjY2Jr797YsbdYhiEIN16YfkYijg3T5vXy
	 VHcnpfjQ7Ymmg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/13] ASoC: SOF: IPC path handling and fallback
 support
Message-Id: <170135398817.77760.17003442252565744150.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 14:19:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 29 Nov 2023 14:53:14 +0200, Peter Ujfalusi wrote:
> The main aim of the series is to provide a mechanism to fallback to 'older' IPC
> versions in case the desired one is missing either a firmware or topology file.
> It is going to make the life of users and distributions if we are going to
> start transition existing IPC3 platforms to IPC4 (CAVS2.5) and we might have
> missed some topology file to convert for example.
> In that case the kernel will fallback to IPC3 without audio regression.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from sof-audio.c
        commit: 014fdeb0d747304111cfecf93df4407c1a0c80db
[02/13] ASoC: SOF: Move sof_machine_* functions from sof-audio.c to core.c
        commit: 3bc3477915587440035f192c89a1bf9a4360abb3
[03/13] ASoC: SOF: Add placeholder for platform IPC type and path overrides
        commit: 1162d267eabd6392d0d07bc88b75056e88042fc0
[04/13] ASoC: SOF: sof-acpi-dev: Save the default IPC type and path overrides
        commit: a07625dcaf994ab3c5a6a456624719df05ed8ad6
[05/13] ASoC: SOF: sof-of-dev: Save the default IPC type and path overrides
        commit: 396016d56da4ad30fe9ff736e44d9e1457484805
[06/13] ASoC: SOF: sof-pci-dev: Save the default IPC type and path overrides
        commit: 59ddeae037b81303063bcf62b70fb33841b3f89e
[07/13] ASoC: SOF: core: Implement firmware, topology path setup in core
        commit: b1a4ee9fd5a2dfb0f23abe58377f816915ec14ba
[08/13] ASoC: SOF: sof-acpi-dev: Rely on core to create the file paths
        commit: b2b0bba36f0a81743e7143a8801ca75d2238bdac
[09/13] ASoC: SOF: sof-of-dev: Rely on core to create the file paths
        commit: 8616168928f278723fdc3f4d7cd3d611dcdae8f8
[10/13] ASoC: SOF: sof-pci-dev: Rely on core to create the file paths
        commit: 8a83f180abb5b95f524fc9b5eb2291f0e39bed30
[11/13] ASoC: SOF: core: Add helper for initialization of paths, ops
        commit: a5a65437b02df8b842c4620b0b776bcd91ce200a
[12/13] ASoC: SOF: Intel: Do not use resource managed allocation for ipc4_data
        commit: 9b6896538ea71b7c24da1ecb38738a311176f6a8
[13/13] ASoC: SOF: core: Implement IPC version fallback if firmware files are missing
        commit: 6c393ebbd74ad341bcfb4e2d0091b2655fad45d0

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

