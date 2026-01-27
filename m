Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C234CFAF
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515745; cv=none; b=VYEoIPtpZl1ikz5OeiXx01gdD7VRTAaUTdsH2EUgIVI3QItRzelswAVNsmvw0tPmQx6nibP9VBSkpYEnnAonGwVbV3ktXQ/vIq+bzSFXwWCmT8pcFisdQ6jncVVk5QADD14PbG4gAhWpm4hTHqJ5kKws9LCp7RtRaDVOQuSKaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515745; c=relaxed/simple;
	bh=IdWrwv1dkl6JW/w4HcjGV3XEXk2EMYnTmpRGaSkbNCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g3ONGASolMWH+HoPcgjGfOebKVCHBDPRL8eDpQFSPqDvs1wUJpsKdoqjR38vEZcBhABXpZ0WRK58kCD1dyGO4Nvx8MYNDsBU0w2DCom9ZnaIZwUiD6c6qdKHCZTcwoAdM3b8yb0ua/H3sb6ujzYKCAZzwdmafDoJz51UVdn1eOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k03YRav4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k03YRav4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF1DC116C6;
	Tue, 27 Jan 2026 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769515745;
	bh=IdWrwv1dkl6JW/w4HcjGV3XEXk2EMYnTmpRGaSkbNCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k03YRav4x4FIr3LkILwpTloKiOT8GSDGUjYRgPf4uEpT8jPQmFrjgQ0HOjdMlv3nS
	 8QhtJcN6SqzvwxuGMZOBTWnUcAdwhTvKyvsjCDBQm0Mt1gBPn+hRB/cN/opfV6dZ9e
	 Fwhr19Mu+A0ndO7wGzNRJiqJ09j9VYtV9Z1+s3B4NuKLhKusaaJ4mxg9g/+gBIjvPg
	 W7xdb3vPN8PPgspK7XcMClg2mKMzBxiDLZqvY9IwnfwF9HPiO1lIBlf+nrq10DIxXP
	 Wv4hG+AsgLrwpuNGSNYqF84nJA+s6eN6UQ9fZ54ZmOeVETpvTkJ/69H2PkRAskl7DB
	 zg5LoLzgigktw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260125111837.2386530-1-yung-chuan.liao@linux.intel.com>
References: <20260125111837.2386530-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: Add quirk to ignore RT722 DMIC DAI
Message-Id: <176951574399.80702.14453770490451210215.b4-ty@kernel.org>
Date: Tue, 27 Jan 2026 12:09:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sun, 25 Jan 2026 19:18:37 +0800, Bard Liao wrote:
> When the device uses the host DMIC as the capture source, add CODEC_MIC
> quirk to exclude the RT722 codec DMIC DAI link.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: Add quirk to ignore RT722 DMIC DAI
      commit: 3febba217ea73ca86d5e331b8cde98bc6d08fcf5

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

