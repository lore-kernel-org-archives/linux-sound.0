Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0A187541
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082477; cv=none; b=C4D279IA9ubcpeQlcJL204PmWyjTIR9UbGQMNTo61j6QvgGcEjLnouh0+sjS1Swf37Qz7g7HwRWkKUYkdVvn8hzP9rQZvfzYJhJ47S9t/u41tbleeQqhWE2XrfjAZ6vukJKJya1wF5rkEJ00pGh0HH1LHPI5nvdkKwk+ymrMKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082477; c=relaxed/simple;
	bh=FDOOIwd6DUDG7B4bwxr7tBM3QyYdoA3uhgBpLZk3QSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o783xxEotKA1YLy3muxgujPBP7L+QZ3bSo0TJrU4PJB7z8XYgWtyQ3zBMpbSckQB35pgYl27uUeHgiKQdyQdR+5yGN1XC3C/Zk1eBcYV2vb/fpUlYh4lYMPtjMaV9B3fd0rAuzuCEmKIHM3EmBJZSFSPT27RbMat228XIa6M0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3RBf9cx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3RBf9cx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4487AC32782;
	Thu, 30 May 2024 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717082477;
	bh=FDOOIwd6DUDG7B4bwxr7tBM3QyYdoA3uhgBpLZk3QSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l3RBf9cxh75+gTVMWEcfIeuI+Tn5OkdSN5idXVrdER/dcsUf5R8eXnLJq5CdTtYc5
	 SQSON7MZYxkfIvfl5v42y7y4Eei+++BtdPm5RyN21Smp7QIJNUHDYdrHLebCocrBgJ
	 rn3P/yWCi5tdxtrKs7FWHmgPlsTaw0bKbmyyYmAjmEs6QiwXFDFw947etl6ZUM4Ugl
	 DpY30g604ni3jraP7qCW8J0C214h5w8qqa4weL1BiCeIweuJS9ucDESKY80I3LSHLB
	 3bWHpnrsSD90tPIHytCz9r4C+njaMwWtFl1lbYUc8Ibl3FVqrspdbF0/nbuwHDWVyI
	 LjXDdhXhV2Mlw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 seppo.ingalsuo@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
References: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 6.10 0/5] ASoC: SOF: ipc4-topology: Fix nhlt
 configuration blob selection
Message-Id: <171708247483.919445.4701136727803681717.b4-ty@kernel.org>
Date: Thu, 30 May 2024 16:21:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f

On Thu, 30 May 2024 14:19:13 +0300, Peter Ujfalusi wrote:
> the existing logic to pick a DMIC blob is based on several historical assumptions
> that the NHLT in BIOS always contains 32-bits per sample type (first patch, [1]).
> 
> The other issue with the existing logic is that it was designed to care only
> about the bit depth of the format and fails to find the existing and correct
> blob when rate/channels are different on the FE side compared to what we should
> be using on the DAI side (we have components in path which can change
> rate/channel count).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob
      commit: 49cb894d567980235b6e64d5e69950ff77debd8c
[2/5] ASoC: SOF: ipc4-topology: Print out the channel count in sof_ipc4_dbg_audio_format
      commit: 2a865c9c3fb0289a95f1cb51b42d248736ff45cb
[3/5] ASoC: SOF: ipc4-topology/pcm: Rename sof_ipc4_copier_is_single_format()
      commit: 3b64fd2f83f203f5a34faed3dadf6464313f827d
[4/5] ASoC: SOF: ipc4-topology: Improve readability of sof_ipc4_prepare_dai_copier()
      commit: 2fcad03eaba1b86e6b829f73a9e75e681b7f3106
[5/5] ASoC: SOF: ipc4-topology: Adjust the params based on DAI formats
      commit: b65456b7b379e20ab225a4e906dc4a0c98fddd7a

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

