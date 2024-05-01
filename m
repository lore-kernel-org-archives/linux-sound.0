Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676E12F373
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570999; cv=none; b=pYJRwFx8aHZsG3ErmXvcWeVi87jz0aal694gCj/9c99XFk6sR6p8wjm3V5pLNsp+pSuDYJjrfNlLgPplSm2G1AmUvQPfMhVdy0bEwhBi666B2p0Hvg+yT2EfV400PXixqQbjn86cb3PWgqqUF8b40b3cH8m/tM7xhnIdSvb9tig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570999; c=relaxed/simple;
	bh=TkInIQ2LBuICjPUJzoUZLuS/i0Pe8RU9a1IrIQyiQTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MerXxlS4rXKauCQXIeSWTfVFLLaPOscEM3mIgWrEPHsKalQKZNwizbuFayeh63EMuLXZq3jNrO2uSBrEsLtV/ERXqYaSUbv+AbLzXVsgHphtAjPkMfGRiGlPnh42f3SH6G4sOYYOBgyYu3+ntBLPx4aCTSfd7ndr0CTzBQZRTCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxeuHYro; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxeuHYro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7132C4AF14;
	Wed,  1 May 2024 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714570998;
	bh=TkInIQ2LBuICjPUJzoUZLuS/i0Pe8RU9a1IrIQyiQTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TxeuHYrosur0Zzw3zWeNT1Nm/4di2ITwb9K5PtUyKT49Le1lDVn5t3zoV9hWB5uU6
	 GH6TWN9pzGyjDH2MmvCS3ptSxKF6voJFKPftOJhCYt/yJOY9xqz53eAzn06U6yzVWo
	 zXu6+XPajtP4zdzxnVGpmM8nDLfDey29PD5g4AyVYASZ7YIAzA38Y3Wgt3+f8BxDAl
	 KY3THJan+y7+ZpCOHvqSZGxSEZFOaqvl73w3QlXNrSVyi4rUVZUi+ClmVI9nb0veB8
	 0zKBS9ezpVWsz+S42fFkZsnGNcwrYy0YaPDZaKgPKIV+r6bWcf0Jw1UFz1QL++WI7q
	 ugAqyg2qk0kEg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: avs: PCM code cleanup
Message-Id: <171457099714.1888704.1435214977574502288.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:17 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 26 Apr 2024 11:57:25 +0200, Cezary Rojewski wrote:
> A set of changes that aims to improve readability of cohesiveness of the
> pcm code for the avs-driver.
> 
> Start off with a change that synchronizes DAI open/close - DAIs are
> started up in ascending order yet their shutdown does not follow the
> scheme - it is done in the ascending order too, rather than desceding
> one. This patch is a dependency for the next one in line.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: pcm: Reverse iterate DAIs when shutting them down
      commit: 31a70a71b3a730aa703bbd05713d21115dd6d33a
[2/8] ASoC: Intel: avs: Relocate HDA BE DAI specific operations
      commit: 140df6d4d5f541e950a35cad2e3dffb49186ed74
[3/8] ASoC: Intel: avs: Remove redundancy around DAI shutdown
      commit: b9d59f970ea7772957f6da02ca1ba272ef4495b8
[4/8] ASoC: Intel: avs: Store pointer to adev in DAI dma_data
      commit: c303a994e5d0f7d297cb6ac56052dce8f412ee67
[5/8] ASoC: Intel: avs: Remove redundancy around DAI startup
      commit: 3a48d146aa761bc591272bc453eda64743128a31
[6/8] ASoC: Intel: avs: Remove redundancy around DAI prepare
      commit: 0f8843ca4f6cbf0efb8c2d5516a3b92fb2771a04
[7/8] ASoC: Intel: avs: Store pointer to link_stream in dma_data
      commit: cdcb770a60e8e6b9fbb737ebe21b2daadaba1744
[8/8] ASoC: Intel: avs: Clean up hw constraints initialization
      commit: e85e75b67993c1fb0c80306783c31266261170d4

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

