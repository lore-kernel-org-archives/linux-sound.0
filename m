Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314816D9B4
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977247; cv=none; b=Cm0vjVNMgLLNRTwpC3lt5aJF7k5q+jYDRo57/dMqZyaPsp98BRWAMhrhgtFtZmMYwtQxbi0uguHixgB9H98XrmLHxRaemuXs/rRpSa6IcZAQOjKwUMCX6P2CnFQolZDR0DkLPQtQKoth6zwXzrQfiiR/5D7U7SDgPduiFZuAD6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977247; c=relaxed/simple;
	bh=QPKAQyCPa4YyIaYilzjEPz/LBGpOpReDpVFxdmuve9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I1ohy81g7tElA9sLcAzUPTiy2xZ16w39N8i8HBgmhSysRTbjk7M1xUk1UC3RPMGqvi9MjhARiNghGUsdkoharSMqhNXT5c8kkl3uCPJSyq9YcCfgOsiqx4CkDafjk1VI5TLdV84H8T3ejk8K6ifjFAilvoG28Gr7G42HteC+Ekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4GtS+e8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4GtS+e8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DA5C2BD10;
	Wed, 29 May 2024 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716977246;
	bh=QPKAQyCPa4YyIaYilzjEPz/LBGpOpReDpVFxdmuve9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N4GtS+e8BRAhajDo1rhFR+HvKixAvtSNr4uSLKqZIEGIK1qqne6vJplujutQ9vYJE
	 +5TbRJvJRBpZ13tx6//xiT9JIpesWeuUMVT1bWuXKDcNscWUSy/UOquNELQNdvAgKL
	 gw/HLeijYo9wOCLELln/x94lfgRaDKUDfQVQKnpLIK+hZVvNJHsSZkptbIVmyDD0g+
	 smWltN5lFtMHxQljB3JZfcUZTgmhuhifK9pMI2ZMpO4KyQXEd5N89PF3SPDCbvC2oL
	 xjrU62P7IskClr8qOL7qHBPWOuNF6Q4BlLNa+e3w6q5uwdnETOZCsKTuwBo0Jy8PGZ
	 mBrZsVb0SpfLg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20240527100237.430240-1-ckeepax@opensource.cirrus.com>
References: <20240527100237.430240-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Add missing MODULE_DESCRIPTION()
Message-Id: <171697724320.23184.5920962700393086840.b4-ty@kernel.org>
Date: Wed, 29 May 2024 11:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f

On Mon, 27 May 2024 11:02:37 +0100, Charles Keepax wrote:
> wm_adsp is built as a separate module and as such should include a
> MODULE_DESCRIPTION() macro.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Add missing MODULE_DESCRIPTION()
      commit: 8d34c12e8751fe180157fbb34a758ed4eede3806

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

