Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D91DACA1
	for <linux-sound@vger.kernel.org>; Mon,  7 Oct 2024 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317317; cv=none; b=Rr+c+Yns9kyGR4zlMS3GKHdDqDSQ4o3F1AcmDh5gROHPTTaiaR9VQzByYriErymIeKUXVQACCCJ9Z6s3DKYQj/lbnndCTxAqyGa1Sv3gif3Vy2PbnWwFduMPY0fHMpLZ+Mvuuair5MF98usYz/6Bh2DsA0teCNVry0dYt95R6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317317; c=relaxed/simple;
	bh=R4N9taiLk8988wcfvEgO/6xUaKhWwhASSEM6eFj4Y10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gr5bwZJHKvAz+G+4WXqeaqwmVTHcErqtSDJtguAODarjpFt9/Yga2TCShfynuHe/ZbCFUCM2sX0n8qeEoDghqQjpRX1WlbuSPtgpXxNaURct/dirLQjbkz7k1WxyECe65vyiDgtIcbBky2ydZwnf8+Q9rtrPBJobJGoI7QQCiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=De9nvJ8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="De9nvJ8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C1EC4CECC;
	Mon,  7 Oct 2024 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728317316;
	bh=R4N9taiLk8988wcfvEgO/6xUaKhWwhASSEM6eFj4Y10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=De9nvJ8m1cmBXHIFLYQlaLiTuHVUFOYA6RuTKw2HXxgtpILO8ucyWD01DkfgxjDnD
	 9wBuWPYEFaxFnfU91dISV/ssKesRb2zl5Qh4UqBqnt2yP6mFBX60il30jdu9uezTAo
	 wbiNZiTq/jxVaYHLqKnvHSPYaQOgay6hgf8S++qCQEg3APJCQ5e9V0czpwcg7PgEjG
	 xprVhwq5mvw2tMI4B1m7xxED8T7v685+3WP9kLIhxTAi111jUjUy9VkwNcSRiAR4p1
	 fwQY5gVouvwSL8aypRx5/buM3x+76Xh32bLQdvuV48CyVJ055E8zutZsuhNtBwyWdE
	 RFbQy6HzjKGrQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
References: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: sof_rt5682: add supports for new
Message-Id: <172831731530.2397838.15336863068198335598.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 17:08:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Fri, 04 Oct 2024 11:01:32 +0800, Bard Liao wrote:
> Add HDMI-In support for MTL and rt5682 support for PTL.
> 
> Balamurugan C (1):
>   ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
>     MTL.
> 
> Dharageswari R (1):
>   ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for MTL.
      commit: 0f5d2228a99a4733b2a6652e16255be9caf2616a
[2/2] ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682
      commit: 56d3705e4b36bf454965e66d8264356a23135aa7

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

