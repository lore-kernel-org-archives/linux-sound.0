Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CC712F39A
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714571004; cv=none; b=Ra3ySNxVNK8Xwa5OmV6rx+JIRzBld3xHiOj0peq6cwVppP+3oq2FsvayBnFgaRRl5N2kBlI7vlq4/hM1x89ff87i1PQ2d8d3aD+QQtLIjTxP5ZRDHPV0tLHdXJJSwlKYflMsksGg2i9qYLFifv+1P6Dki2vBdmbxx2Ok4bPG8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714571004; c=relaxed/simple;
	bh=z2VFJH9/TTaHh5ejO6dlfSh3KL6ufSg57ZzswSlInCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p4AuCjeSOMusTB9Sta1DQ1hyBpm4kj76Cpburb7116vn/PlW5X0sYmTySFbpG8c5W0shUccJnKBU/P17KLBOzoYIMRySjwZpnMQfjeJAOgLhaMuOo4VhVM5A/yyoTqCXrmo4R8D58Q74hYmXGzA1nOn+rx85DTRpSlI1JoPYdoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdCJnQdv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdCJnQdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D20C4AF18;
	Wed,  1 May 2024 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571004;
	bh=z2VFJH9/TTaHh5ejO6dlfSh3KL6ufSg57ZzswSlInCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MdCJnQdv/gUcZN1c5Yyf/QFREAwgMxKWcx/RZBt/53Gv87EGHiRpZwKLIYVTDEyQK
	 PVae/futdrj/8WA1LpqUiViYnBPJj1ibq6tllvIGAPd1d3j+rblbxnBbazeKemOdAn
	 ZoKDy/GWqVGqW16FAa9XEuKpqfcRATcwxYu0Wmh/XEaXH/QQ0REKIW+3pDoXN0QhbC
	 OmUIQ08CpkeQDpabv4IWnRMKbq18tEWLQDzcoxg6ZcDgNP0YkAo6Uu59pY1dA9R5di
	 ZlF6KwU/yJuB3TWgkesra5mCtWRKYSnVnCRLZd4vhV4AQpUOWZvCF8W6cDOboWp0A/
	 GrZF6bFJA57tQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoc: SOF: misc updates for 6.10
Message-Id: <171457100276.1888704.18305360939038421630.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:22 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 26 Apr 2024 10:38:57 -0500, Pierre-Louis Bossart wrote:
> Fixes when fw_lib_prefix is not set, updated error messages, improved
> dmesg logs to SoundWire configurations not supported by ACPI
> tables/topology and support for IEC61937 passthrough.
> 
> Peter Ujfalusi (2):
>   ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
>   ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using
>     ChainDMA)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
      commit: b32487ca7b51ce430f15ec785269f11c25a6a560
[2/5] ASoC: SOF: topology: remove incorrect widget id in error message
      commit: 490e6c9b81e0c22087d250246717aee26ac5002e
[3/5] ASoC: SOF: Intel: hda: simplify and reduce indentation for hda_sdw_machine_select()
      commit: 5d4788b2647fabeaeeaf331e53451e0ed6241252
[4/5] ASoC: SOF: Intel: hda: list SoundWire peripherals on mismatch
      commit: 7ff01ca730f240811c13d9c3f8f8030211b3c911
[5/5] ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using ChainDMA)
      commit: eed4872a4220f30de37aeca695d2881630410b66

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

