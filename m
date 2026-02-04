Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F06325738
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206445; cv=none; b=nN0czpf8VRCl8HCIr/ArV+wKHQOHO0S08lLGRoOidqhaaPFBoUQhwnY5Gm8OL1fpjdrEx7iVLVXLFnrG2lj3BdYZbteVKXcTgMuCyDXrSv4atAbDtqrhi5k/J/tZ6W5BAv4RTgl0nrDmz4zuE6uAzq7bl/h34puMIyc4shJTgfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206445; c=relaxed/simple;
	bh=GzKupIB/klnLG//KNHtt/vqrpDbS+Oohl9lnQ1MSETg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t5E1sRxkIzCojL4pnztP5F9g7PkDUR0nXep1pIadGssukchAEQ9AW5RQIyXnQc69JVY+6L1flhLKKv9dUHnhHa/6eAH5B9XL6uP2fM2WHvIo1nUQa/KFaNGxdsyyj0k04GrMVskJTgceJu4xmA7rO1M+/wJJTZG3KmUgblPYkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8ekU55Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8ekU55Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE08EC4CEF7;
	Wed,  4 Feb 2026 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206445;
	bh=GzKupIB/klnLG//KNHtt/vqrpDbS+Oohl9lnQ1MSETg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J8ekU55Qd5ZdSuRk4ku6z2FFO4XRQz+/xiaP9Bd1AJ/sb46sFPj+OpWgEXZWtN5RL
	 NRvQWCKdru7quPuYohCuqzz65hS7zez5TqkYOuhmKBhXm2sC9DIW9Pv85bE0oCxmcN
	 Lhb9B6hz7ZgQ0tg2KXQkjsZq7yPihfJBenDuFtPBgJWsjVHUTI82wx2H1geJJ9jx45
	 Zns5caR0mu/R/ebDQAn0rpo+cf5RQfGdsVMil0YEXNwKkUe/OyZ81P5Q28yg1j5e67
	 Rt7FaaL1HcwALNEnU9/CEpBKwaROtkzOic/ORScpX4MxKDsWliIbQg7kop03BSMJbF
	 qzg5XybDnn2Nw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
References: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3]ASoC: SOF: Intel: reserve link DMA for sdw bpt
 stream
Message-Id: <177020644369.60772.352343538855127165.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 12:00:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 19:40:24 +0800, Bard Liao wrote:
> Currently, hda_sdw_bpt_dma_prepare() get a HDA stream and use the link
> DMA but doesn't reserve it. It works fine because we assume the
> SwoundWire BPT will not run with audio streams simultaneously. Create
> and use the new helpers to reserve the link DMA and allow running BPT
> and audio stream simultaneously.
> 
> Bard Liao (3):
>   ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
>   ASoC: SOF: Intel: add hda_dma_prepare/cleanup helpers
>   ASoC: SOF: Intel: hda-sdw-bpt: support simultaneous audio and BPT
>     streams
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
      commit: 89e1d632bb29e0915d801629d4a842ff609514e2
[2/3] ASoC: SOF: Intel: add hda_dma_prepare/cleanup helpers
      commit: 8834ae896bfe10f239d49adb9cc76bb6a57c431c
[3/3] ASoC: SOF: Intel: hda-sdw-bpt: support simultaneous audio and BPT streams
      commit: 330d1deb410fe75f7f79bd1e5025f2827365eb83

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

