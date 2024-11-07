Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB678212EE0
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730992995; cv=none; b=cEdaT/D/rSNJR0W5eqITBXxSSl9MXIwv/JYssUxO/NpJnD2vkBQXbrKuSf9O1YZ2OpOn5FCwrOMwDRn6x8ruANgqLkcHQDU5U9mVlVE+BAUs4+6hXDEOYAXDc/Wvx+zzasFV1KoYfmBWvrMTYoCwfffHgdXudPWuwDj/hGPCf0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730992995; c=relaxed/simple;
	bh=LxDZKN9ZYDCxh3qEZlhxQBBVJWzNYuq4lQ+03arbSbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JC8FPsCkYiP2UNZLvnL5gcRPowOuuz6sOOG4Ek5hFzrZlqstk4G4KKu5zuB9urSRwh39e+1Tf5uGNLoYsY0RVJ1QEezQlL0izW0f0ZXyMNn2oQqngGADzz8uOJUTGt2ihf3JaKMl1+eFLzPXOK3NFWA1DHXKfmmGn9m/9+HmkZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FE1hNys8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FE1hNys8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5999C4CECC;
	Thu,  7 Nov 2024 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730992995;
	bh=LxDZKN9ZYDCxh3qEZlhxQBBVJWzNYuq4lQ+03arbSbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FE1hNys8/3m/uS5NK9XvjY2JwfMGWxs1QuYvl8AbTrLW+xU2u7H0ZGDfmoFmQLZMB
	 TDpHPGbXmSAOkJpyWOHQWxeJB/CjMJx4VEuy2mUSr0BzMQgq5lpfuPhPsH7nIQi4UB
	 1RgQcN+yLYhl6e1SAw+c9sy5L48SJs1jimIFmhkNyhfq+x8By9cs98yOWxA1bbrJc1
	 tmKsiX5q+JD8DO6uClK4QJlIgQX8T1+7umsweqjE2+l/5EwGoNMYjEFg3w+291B8fm
	 JravCbyX4iPEqwVKPQMJj5E2rSwlv2Xiu99Ll2GUaMoAnIx9mvBoZp7QdAblS+f9jo
	 E0zFpIBtSzNfw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20241107121440.1472-1-peter.ujfalusi@linux.intel.com>
References: <20241107121440.1472-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Add support for persistent Code
 Loader DMA buffers
Message-Id: <173099299340.140347.1690242369965058188.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 15:23:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 14:14:40 +0200, Peter Ujfalusi wrote:
> It has been reported that the DMA memory allocation for firmware download
> can fail after extended period of uptime on systems with relatively small
> amount of RAM when the system memory becomes fragmented.
> 
> The issue primarily happens  when the system is waking up from system
> suspend, swap might not be available and the MM system cannot move things
> around to allow for successful allocation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Add support for persistent Code Loader DMA buffers
      commit: 1862e847bf115a3ccbf38dd035ea0118be57f2e2

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

