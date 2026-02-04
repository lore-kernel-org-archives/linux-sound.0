Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE003ECBEB
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206447; cv=none; b=YrgcHWJuVXWrMpSBdIhySYikbJvlSJxj0MX/TSVXDcLGvKy+5E37OgXLFbiZCEpahuZ753/y+Rsvlp+WS8b/j4ehvTZkTDdVEpIaTANDGdM0RdB1Sx6UWyr0uk5CPkp71/6pBM/yxgQY8x4inYixxL4wDqw+/gRVkYFnyjzqtY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206447; c=relaxed/simple;
	bh=sxJoE4HzPfJ2f6sxFYWyL228no7omcbztC9fMnRtaVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e6daIwFBitBb7vlsmw6ggXLaQE9S2YeFT4EsurQ3QTgGScl3KhVmAMXyeZtFRFe7x9STiQRUKNAS4jPoCQPS1zjmOccCNvefIVGbE5ZfknmicGm+yU5PCK/YKjvfqQVEj0RGdhN/irT1xuqhdm/leA/UsWO0lO3ngiZAWK3nXVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+QtTvJe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+QtTvJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB692C16AAE;
	Wed,  4 Feb 2026 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206446;
	bh=sxJoE4HzPfJ2f6sxFYWyL228no7omcbztC9fMnRtaVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l+QtTvJecUwLDSqPQCh7XHRGVqdeRAuwQ8BEOGlkq31uz2ijJLcUbOo1t68UFvPsY
	 lx96k+5v2WMLFsSdbPGfhqc6c93glXCoEx3T0qiV7H4zaPXdLYxHoIAPMfvxALhM5K
	 Ev0SMq5E6OjIVib1+7qcODIjCEWCbup1xvC8MmxmccmYyfsp3+Q5g0nV58TkJwntOb
	 3mvHOVxnJzzfO2Jy4pDe3d2p/jpH+ES65H7qF+2QbXaNBbpiK8Xz6Rg7PaVLMK+bXJ
	 xYdKehlZSSBmXwJpcK1TSeFofGU/AmCLiFRf1hNlZ/mjFZpqnihfLlrxQBXB42nX6U
	 7o5ZkcgurZ3xQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260203072405.3716307-1-yung-chuan.liao@linux.intel.com>
References: <20260203072405.3716307-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: use hdev->info.link_mask directly
Message-Id: <177020644549.60772.5939970794695010887.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 12:00:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 15:24:05 +0800, Bard Liao wrote:
> The link_mask variable is not changed after setting to
> hdev->info.link_mask until it is used for another purpose to get the
> used SoundWire links and set to mach->mach_params.links. Besides, the
> link_mask variable should be reset before any link id is added to the
> link_mask. To fix the issue above and avoid confusing, use the
> hdev->info.link_mask variable directly to check if the SoundWire link
> is enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: use hdev->info.link_mask directly
      commit: 284e70ace9ecdeb8644fbe65c5da12c90b377545

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

