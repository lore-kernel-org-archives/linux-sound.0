Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C69224898
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419157; cv=none; b=W6GsF4Pe+EOEJV+CqLMWhxRtiN7a3ZIPY59M5bsxj5YPN5USaFvZoYsrPEFcwi0GNit1DvBH7sxlzPb2PNsfm7eBbYU/8eEe7trUQdrp6gMswSvFU+qFn23Xx6PFl6L2JsW4AwlSuLTOGY/aarcFeXFgPwtbWYWacie0hpwabJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419157; c=relaxed/simple;
	bh=Wmw3UJvoLkWNeOFwQbjejAsPCQ/a+Wi5YBCgWtzdEyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bg5uaMMzJRN44y/nSYsmWNfHnu7miSLUWpDyqXJYXOeby3AQFGCHt8Crje2CX5Pmk64NRCwEbAdf+ZWiX3j7wKCmH6k3Fw8uaAlR5Mjrjgg2NCmtB04QQPzU0DMe/M6pmuA5r0eifVtwudoW79KX1C3/rfX1eTRxIRtIKWozoGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/ZVQY6D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/ZVQY6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286F8C4CEE3;
	Fri, 20 Jun 2025 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750419156;
	bh=Wmw3UJvoLkWNeOFwQbjejAsPCQ/a+Wi5YBCgWtzdEyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N/ZVQY6Dk5YpamATzQBmjcM9cDrBQXQ8crxg6gYDAZMdL1ylWW90IafKrJyaTnm4l
	 KOZ9e9+awTgT0v3vKm4TGQ/+3FFcoeYE+zcFnXdwhUvtNAWg24FFFrj8a5ilgCksxU
	 xK1xU1WeaHqlf+zeMBKyAUMNX7DZ6RQtlRL802E3AAijCXJ00oe37fJVKrcBzmeYYt
	 qL+w3HfKgAowLNJFuCJBiq5nDU5Vhb1yx09rOJ/UyyRR51BYkQtUWp3x7rNpXQMkDh
	 lBpRy4wMxFCqexcRfTKsU2fSiFP2JjxZgM3h74Qlw6mbMwCT2xRAeE/jalB6SOLTM8
	 z4lZpqQwzGwtQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, guennadi.liakhovetski@linux.intel.com, 
 liam.r.girdwood@intel.com, jyri.sarha@linux.intel.com
In-Reply-To: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
References: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4-pcm: Harmonize set pipeline state
 dbg prints
Message-Id: <175041915490.41098.8722633097184612026.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 12:32:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 15:11:18 +0300, Peter Ujfalusi wrote:
> The series harmonizes the debug prints for pipeline state changes.
> 
> Currently we only print readable state change for single pipeline
> changes but when multiple pipeline's state is changed, it is omitted.
> 
> Use human readable information in both cases in a harmonized way to aid
> debugging.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: ipc4: Add sof_ipc4_pipeline_state_str() for debugging
      commit: ecd41e0e2581d60f5268ad662065d17e0f049539
[2/3] ASoC: SOF: ipc4-pcm: Pipe instances to dev_dbg in multi_pipeline_state()
      commit: 0e57fa20678d2d2dc0f047f052bb509c8f3ebc3b
[3/3] ASoC: SOF: ipc4-pcm: Harmonize sof_ipc4_set_pipeline_state() dbg print
      commit: 2756b7f08ff6ca7c68c8c7dd61c8dc6895c9de34

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

