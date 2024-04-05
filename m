Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685A22EF8
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 23:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712359202; cv=none; b=EonegVtmDk/Gdf22MlhtLbKI7jWpUkG1acrBPyHvmmx+3swuywosp5EB8ZeCkuyPhFZsNUHUurLK/1UMQUWw1uLGJXLjjth9P9D6XX8uQ+aAxmXLmY2atgr/Fh5dgh6FFsCkc5yxxLX1HN56z6EN1wpNO9iCHBUchXPHmfoV+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712359202; c=relaxed/simple;
	bh=WFv3K3AVVst1IxY787Ht1CDI+a4URo9vofeIU0fesY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oEwBrXSEskZVv+fl6Hq++vvXPU9NcZPExMwPwdeiVUYH5XpiuDebhO7g0lSM77718DDIb6chfH5yCI6PD3EmUgKBGdkLfPcB2LCf6FjLl37Rttc/61Qm+/oYJMZFMWmYjNqdOfgivIrrph/BXBmJLwbkjTQWz5XEU6sZNFcmbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqcSDBN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqcSDBN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22278C433C7;
	Fri,  5 Apr 2024 23:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712359202;
	bh=WFv3K3AVVst1IxY787Ht1CDI+a4URo9vofeIU0fesY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eqcSDBN2EGwvJYBRmeR1UTLWP/yiRWDKTvITpMsEDRQmUph5RAPwenRVWqmh7J0GH
	 3l38jZdTj1CLQiSb97OYOtGYrFcMQZl5uH0vtU+AFsK0TZfZeySPLnaxuDAEnJgf2Z
	 NOKdppWFod0+mzd4Ov3i2nXNvwPuHfVfEWMBE0gwmxXzPPcEjMmp/UPr/ZF+R1j70+
	 uLQwOq/uor3nRpcnqolnlgR4Mg/ck8R5k96H/uWqlvOMwX+czL+/EYJ613qhhnag3N
	 ojoohMOaptHUryR3JIPuXrFxBWyyH1CX9IpAsRyjMej0pPvbcaBbrUQcVG+DVKxTSI
	 yf0w8502F65UA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: extend hda-loader for BTP/BRA
 transfers
Message-Id: <171235920085.198289.10612737509087722960.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 00:20:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Thu, 04 Apr 2024 13:54:44 -0500, Pierre-Louis Bossart wrote:
> For SoundWire BPT/BRA transfers, we need to reuse the HDaudio DMA
> infrastructure. This patchset extends the code used by the code
> loader. The BPT/BRA functionality will be provided in a follow-up
> contribution.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
>   ASoC: SOF: Intel: hda-loader: change signature of code loader helpers
>   ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
>   ASoC: SOF: Intel: hda-stream: clarify comment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
      commit: e9ae5adce99e27ef29ea9ccb01afe260bf1c1408
[2/4] ASoC: SOF: Intel: hda-loader: change signature of code loader helpers
      commit: 6cbf086143cf9674c7f029e1cf435c65a537066a
[3/4] ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
      commit: d5263dbbd8af026159b16a08a94bedfe51b5f67b
[4/4] ASoC: SOF: Intel: hda-stream: clarify comment
      commit: 716778b3d71fe1c799a4f5cf84faf4979f80b267

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

