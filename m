Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B9D218D8F
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 21:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016343; cv=none; b=Y1H23cRR9U/uXr+tO70MP+fKB1hOgEZvx/ccJXx3kS4F+sABKy2GoCSIG6//3bm8YoBXxvkwIdJVIdS5m4DbVlipV0fk8WfkKlqqpeE6cAdladlhF2LX/afNGMKyWzq5wh6D42hSXdy2vhj2qsT2EI4tvKrWl5QMBKJRi10H758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016343; c=relaxed/simple;
	bh=WMCG0BmwEIO/0kd4ZJG+TXtPUZgK6+7/JN0E6LJzOc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d/IBrjKsm/jMT+874Y/FKfhJPcxg2kQx/Q44GA6vKJAmYK18TqSL3hsKurw4GIKZuwGqy+TiG04k/zGOURWG4e4CDYFJuc7Bfy8YNbSuTn9fYkrA+gHmcpM7N30OWO2Z1IIK2Se2CxBBdu5ymTb1Km4YSO0mX4EvoyjkHoKGolM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5vXNXPo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5vXNXPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A658FC4CECE;
	Thu,  7 Nov 2024 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731016343;
	bh=WMCG0BmwEIO/0kd4ZJG+TXtPUZgK6+7/JN0E6LJzOc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L5vXNXPoQrlBriGtUj7q1V3B3YGVe81darLWH98amGwmCARtCsBFSkB/4ImYQH7CV
	 ie6OSwr7U5n+v149U/iGA7eB0I45xZwkZtuuMkszOqh3fpk6/tauR/g6zmqAv5+elw
	 5hS+QX2K3lpbyMI88TC6SST5eS5Q+e9LJhmWZOU+gZO+Z/GyUTupdknIy/7up0Jj2m
	 2UA4IoQnUVi2NjMpeZvdineGl2QMB4XwyoSxE34CQ4MhW2OGg+IbMaACtaVV1xYTp2
	 9gIKHXq4Q1iRMiGjALuBLxdrXN1LkTZHDVnzIQrE99a/NH5C9QUub83LtRE+E+Hi9+
	 v/xe2qa/k+dWg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
References: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc3-loader: Handle PROBE_INFO
 ext_manifest type
Message-Id: <173101634141.271800.11661104850516524282.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 21:52:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 14:03:04 +0200, Peter Ujfalusi wrote:
> The PROBE_INFO (ext_manifest type 3) is not used by the kernel, but
> at every tiem the firmware is loaded the following is printed in
> info level (user visible):
> unknown sof_ext_man header type 3 size 0x30
> 
> The type is known, but it is not handled, the print is misleading.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ext_manifest: Add missing ext_manifest type for PROBE_INFO
      commit: 7f4eb7672b1785119b29a4dff50aeef13368e813
[2/2] ASoC: SOF: ipc3-loader: 'Handle' PROBE_INFO ext_manifest type when parsing
      commit: 83e367c1a178045bf3675646aa9582a0c5a4e566

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

