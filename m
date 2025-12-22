Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F28332EB8
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 20:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766437129; cv=none; b=rsND9n883hkYsTnP8TvwEwC2RmqV4d5+qtzbyx4UHnI0o3cNGi6f31UCBgqyzgdjlXzgc730DYZz/QmQ0M2FJhX7p6ym0/UTr+CWrezn43c7So+j7WMqF4pmROBi2ay129eYZpyY/yevI3xXrIOD6Xw94xEOW+kTQ3x783n2O+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766437129; c=relaxed/simple;
	bh=Js8h3ih4VOAkEmADUc9kyi471W1R7SYhPzJogr/WpsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JS2awhNbLhN2dFRPJ6tpUnAC/YhXOvSXc2XVEOiM90rNwH0EipgBydwvkk7bpxkX7gQhe6ngf/NxmC0XXc/HMvF4TikdDCpWBnMVNpkYkcKA4edSNQ6Dc5iQ+m1kLSUUQ2GDpnEePRmp87c6lEbj4fdlZsDEKHi0ZcovxApH++I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NydT9nhG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NydT9nhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6530C16AAE;
	Mon, 22 Dec 2025 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766437127;
	bh=Js8h3ih4VOAkEmADUc9kyi471W1R7SYhPzJogr/WpsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NydT9nhG7foVAsiFnIcYptq9ASVTbfLGE1njhj2zPe97jsJs2mMyu25jp512U+fTv
	 iXZkJ6iHIJU9eTqLAgWs9vte9o2lMmi09NhoBt8IBWmL0sp8gOZNtDb8MVgMalswPJ
	 e5fa/zzIjGSKHP5oFfN0fbY5BJmYDfmILvirLWw+DkpBednzUdobAuCyztQzdLjM9V
	 w53JOfYHAqJFw6VhLp8SVFb0xIROEeODzwkuchqadkw1MCLrzmp0q46P539LWtaq/D
	 mPIr817wq2RD8n2sdd9fuyFiYE0G75y5KN8hOydELdjasuMzEq99/3ZQzegiRIrJXH
	 hJNGkc1NAJVEQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
References: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] SDCA Jack Fixups
Message-Id: <176643712543.2127897.15726604656127454281.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 20:58:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 15:36:46 +0000, Charles Keepax wrote:
> Some fixups to the jack handling, adding some necessary hooks to connect
> things with the machine driver. I have split these out from the system
> suspend chain as that has been generating a fair amount of discussion
> and getting these 3 merged is far more important to get basic
> functionality working smoothly. I will do a spin of the system suspend
> stuff soon, if either no new comments pop up, or we reach some consensus
> on how to proceed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SDCA: Factor out jack handling into new c file
      commit: 3addd63d1fba8d9013e00b06d9420e39271c0c4e
[2/3] ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
      commit: 82e12800f563baf663277ef0017f40a335b8e84c
[3/3] ASoC: SDCA: Add ASoC jack hookup in class driver
      commit: 99a3ef1e81cd1775bc1f8cc2ad188b1fc755d5cd

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

