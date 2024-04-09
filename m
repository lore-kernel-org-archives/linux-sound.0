Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BF1158A28
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705650; cv=none; b=PQa4M+ij1gnfzOUKRRnSOqJcWjES/+bRNTN6ENio/SPMod4u4/vU6dz/vFTNnQGF9JxQI1+uhzRIH6jXJwssLrUDJmi6fQjK//Y64hpcbCpSl83eHrf6j5vN8kh6LuVk0xxqAH4rGnqa/y9mammNxnYtWKK4wuueoTPE52agDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705650; c=relaxed/simple;
	bh=vdm0R+f19uUxbs05f+bAWDWH2KSblO+9BtKcIj7ujg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TZihqBeiB0kNkBCHfVdp/p3TwsNAofolBguyWRKTwNw529YuAvTfjYvO0qwM5VaF5hQuT0Ti71nSof2jJODVSNHGRdG8mOs/6CsRDvc0cSpZJvUO5/2Og1uCWtodaweM5KtdXgFc2lBJB5UfKbjPugRVJruyXnqoInBZYuyAO6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc6X/zCs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc6X/zCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A918C433A6;
	Tue,  9 Apr 2024 23:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705649;
	bh=vdm0R+f19uUxbs05f+bAWDWH2KSblO+9BtKcIj7ujg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fc6X/zCsFZORdfgtO7ts5f9RHiKo+wT7pHwoDQK9GvLxxeTgju6O3vEyaCwMrgwY5
	 I5BDhW+Xkp3dM034oE/DRgo9ZI/DencTNCdM4zhoD6onzUo3wTNCM8PYmpoMJUAOCZ
	 OihwNsPPfGCtPu/uIhAx3O0uaEbyezgfzX6VGTT0ak9TkZDRLCU5O7qIXyauuiclSw
	 NW0gZLZovmhvkzJFOSWAbHqWlP0Js5ZHgdeg/6fmKuLCV1mAlJwqDy9q51A+Shwkrd
	 w7scKbE2DAyVSIc81dI/lfgAoGVz1wK3AVHt4dwUu/vWtLCleGCbCC9fEjfQ3Il6rL
	 J+AZCx9NIjnVA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
References: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: Add fw_regs area to debugfs map
 for IPC4
Message-Id: <171270564815.199334.13129775237817762538.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 00:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 09 Apr 2024 14:33:46 +0300, Peter Ujfalusi wrote:
> The beginning of the first SRAM window contains various fw registers and
> additional information which can be very beneficial to read to gather
> information on the current states to debug issues.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: tgl: Add fw_regs area to debugfs map for IPC4
      commit: 25ab9c40e77ed4d73995fb6eef514e2e9c421dab
[2/3] ASoC: SOF: Intel: mtl: Add fw_regs area to debugfs map
      commit: d33a369ddad522eff40c6b9687db1488e19729d6
[3/3] ASoC: SOF: Intel: lnl: Add fw_regs area to debugfs map
      commit: 61faefa220262de60d652dd6b91fdcb7ecae2258

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

