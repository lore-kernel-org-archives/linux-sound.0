Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9E42741A0
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753807; cv=none; b=Gw0f0iq7F5nPIIXJQ3AaipySsXwAZbAX4PvpIlBlgFBUqwnIsKBLhr3OXBI2fwsyZB36Nygd8iY7lsuxp1wvlmVs7T+I2I48qGg24NYwuzJ3voPSKhFBcsBjk6W4+673zUnwqeTx+8+Ce3OWORhQ+IcYu9VagGrIwKMWcEgBS1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753807; c=relaxed/simple;
	bh=TM/icuH2w4v/8EjI016Ljail+drKJFzxUl6mFNEBoas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SDsAHFSZ+yMFuOq4ppCco0lX172vCJTzgOmy/K6bHp32LaXqFd/g30EXiYSh3U6eUI4tj2AFo7DbJ26eg/omlmzCLgRPakRKcTmGyTydqyO8bIKJ/sPLinMbufSgXINxKfYbv07JG12JY4UMsEaK497fYBfqesrI6UhufLabg5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0j5Wz2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0j5Wz2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94374C4CEF5;
	Tue, 15 Apr 2025 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753806;
	bh=TM/icuH2w4v/8EjI016Ljail+drKJFzxUl6mFNEBoas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y0j5Wz2SWEuw/OigkmU3K0M09ekUEaLLGy6eQt0z+2qqfYaoI7XpftIr2XQVgxEYO
	 zM0Tt0PcXirDArcH8Ne3jVi+zYknBjSuPENCJ8VO8QJndcumOSn4D04J+yjT8icnMX
	 ZtCI1rXaEZw5u3NzRaIek7RjnsKFT2mNu29VbWnSf7/E3RpF5VnbCNfMEL7xIcqK/T
	 EPmq+ggmr9a2v2jhk2mU0KjyMgmVDKTxnp8HoOJcq6FMO8dMkqq4eNTIdDvh4MVRvc
	 XEkoPL8sUbLaVTlM8H1RkKwGQBjeV6DjUIr59Os9cZ1n49sfNKiDVIU8S7BdkxQLR6
	 r3D/JlbdBWKug==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: skip the endpoint that doesn't present and
Message-Id: <174475380533.1274591.9143389598486463540.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 22:50:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 14:32:28 +0800, Bard Liao wrote:
> A codec endpoint may not be used. We could check the present SDCA
> functions to know if the endpoint is used or not. Skip the endpoint
> which is not used. And load the topology dynamically for each endpoint.
> With this feature, we don't need to use the quirk to determine the
> existence of the optional codec DAIs.
> 
> Bard Liao (11):
>   ASoC: SOF: topology: allocate string for tuples
>   ASoC: SOF: topology: don't convert error code
>   ASoC: soc-acpi: add get_function_tplg_files ops
>   ASoC: SOF: topology: load multiple topologies
>   ASoC: Intel: add sof_sdw_get_tplg_files ops
>   ASoC: Intel: soc-acpi-intel-lnl-match: set get_function_tplg_files ops
>   ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
>   ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
>   ASoC: Intel: soc-acpi-intel-mtl-match: add get_function_tplg_files ops
>   ASoC: sdw_utils: split asoc_sdw_get_codec_name
>   ASoC: soc_sdw_utils: skip the endpoint that doesn't present
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: SOF: topology: allocate string for tuples
        commit: 2c91f33c72db65a053e1aedfd662c1c984fb4c02
[02/11] ASoC: SOF: topology: don't convert error code
        commit: 18877fd3799575e0595d98d799b5509be234e50f
[03/11] ASoC: soc-acpi: add get_function_tplg_files ops
        commit: d1e70eed0b30bd2b15fc6c93b5701be564bbe353
[04/11] ASoC: SOF: topology: load multiple topologies
        commit: 6d5997c412cc4beb859b37cc4eaa61e54fc076a3
[05/11] ASoC: Intel: add sof_sdw_get_tplg_files ops
        commit: 2fbeff33381cf017facbf5f13d34693baa5a2296
[06/11] ASoC: Intel: soc-acpi-intel-lnl-match: set get_function_tplg_files ops
        commit: 143b7a87aa0f949f81e2e80d72f1455667a3d5de
[07/11] ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
        commit: d348b4181cd15ed432c2ae7eb33ef1bb7dfd7527
[08/11] ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
        commit: 5a0c4a0925f4525743ee08aa3930fdc256d920f0
[09/11] ASoC: Intel: soc-acpi-intel-mtl-match: add get_function_tplg_files ops
        commit: cf8a4ca84cbf52700beaa40850647040af06b749
[10/11] ASoC: sdw_utils: split asoc_sdw_get_codec_name
        commit: 6d893cfb3d399a9eae95a8c23041dc42dc6dc18f
[11/11] ASoC: soc_sdw_utils: skip the endpoint that doesn't present
        commit: 4f8ef33dd44a3d1136d3934609b8a43e62aaaa0d

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

