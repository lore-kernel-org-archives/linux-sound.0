Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC720492D
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 17:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273421; cv=none; b=nNdQ6ClO9hYHhO3r9RSTZwTO+PtWZOtGbgDUx2bY7ftaZWy6ASYJySvbmD67y/JfAlnboyGlO3vN6LLwJiOsQJi6He0xAiSC9fTrFEXxERp4oz8Al8kOshzRoK9R5pJfKtpnFlfDaQpPnnHi6vfYiTd3e9Hn8Lmf+L4o3GUJReg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273421; c=relaxed/simple;
	bh=HyeGNbYbo0G5w/r6GKmNEqY1OEKarSkxrOIC3cOb7tA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FiVhSgSNfMK2abWpjRqJSkU4bAQ6VliEp7kAV0ILlT0nBbU3gsel8cRMtYU30En0kV4Js3m7y9ZQ3VIv7myFX804irbptCU1Rss9aRDoXbcrJcA95g9cBGNiSxBJ5btaYg+0mbMmIaJvlHN6B4FRTimqYENZ75S05ezXg2UeYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ay5mg0du; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ay5mg0du"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2854C4CED2;
	Fri, 18 Oct 2024 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729273420;
	bh=HyeGNbYbo0G5w/r6GKmNEqY1OEKarSkxrOIC3cOb7tA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ay5mg0du4gvnzHSkommhN72ZZSJqIBo1o2qYLBEQUe+cXUGEMFqQiOigH6bkvcLlu
	 ovAV32FumWVSdnnZ9lvkB5thDKe+UpDVVTjGvGFRfaiTIM0GKXA1+lNUBL7cQaElqe
	 6dLBCrbvLHU/yLDlnUDOO8nSyi3ZLEx4HmKwSRVdlovdVvccI0nYNj+d1gA1g7KMpW
	 gxNBy8qWEsLWFgx+1bi9dhc32K5vryMm88kZAk9KSxG1ldV3/Y4kab0/zj1q5O/8xi
	 /veRR0h93aEFk0YO2CZMjwFAHkErUBXHDTiQjYgafcF2W7RSUFdDuMQ2WJBQp2yx3v
	 XQsCL822n+ByA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241016030703.13669-1-yung-chuan.liao@linux.intel.com>
References: <20241016030703.13669-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: lnl: Add match entry for TM2
 laptops
Message-Id: <172927341939.163659.1291274120277251016.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 18:43:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 16 Oct 2024 11:07:03 +0800, Bard Liao wrote:
> Add a new match table entry on Lunarlake for the TM2 laptops
> with rt713 and rt1318.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: lnl: Add match entry for TM2 laptops
      commit: 6924565a04e5f424c95e6d894584e3059f257373

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

