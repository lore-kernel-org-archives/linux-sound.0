Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DAE1ADC7D
	for <linux-sound@vger.kernel.org>; Tue, 11 Mar 2025 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699113; cv=none; b=ub2ho8UouWS6EEaM/yREdYMVjevdXHx+E6/pcGf9D9XzKErptgvt0v7p/WG5RGqwAiXeSe1WaDi6SiUPuvMwIYxgzahkoxL7etTn8wLld/BRpJJFLgQ7+YV0j9ORrGIOSe2JnllLQ6eJV5W7xBlaIChpxZ2mwmnefTREoz8lAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699113; c=relaxed/simple;
	bh=Z/Oy78S1Ui4o8abvFMNMTBmPa+3ZmL0wmB4+0BFe51I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TuZY0L2XL1sxTh7aqYJ/5AGZ18+KkmjzpvMmj98/sJ+EQbjYEugXt9N2J5FBqfKpmZ6MPc3XJ3TRoff1yJcjc9i6WqcFYKA80tZjXQ4Qow5TQ4PFo9N90Vo+ItkvSRsShqgnNxuw2q0M7025V0gRt/sr//ACRdBExKE/ODq+vUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfeRg1CN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfeRg1CN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF06C4CEEC;
	Tue, 11 Mar 2025 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741699113;
	bh=Z/Oy78S1Ui4o8abvFMNMTBmPa+3ZmL0wmB4+0BFe51I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZfeRg1CNL/WHwP4EWNQmGOKd2hHQ/8/WWndFo4AgAlhZdvUj+XC2moHg+a4LoOHXV
	 zeRxaBDbT9A7ra64A+UyB9gbia40pnUTd9vNir6HYf1R+IEE6AWW3oBx+Do+EdnEkJ
	 J4blppPpqfR6CG4/cxFYtZuKrH4Hh2lo4+5t67DjcupGKsWV75hh8Dv0h+h2xuYhlT
	 qFz9qmdP8v/rI4+nBAIp+xSjnGSquIc0Kto70UnLa9t+nWgCHRwo3oAPPNl+1Zf12c
	 JZN0c8Q0rY+/LzLEXVJswe58Jp0cfM9zPfA3OdlpuUBe3um4YLw0g1fklGoGWz2uAN
	 fjTDy53ghqslQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250310080440.58797-1-yung-chuan.liao@linux.intel.com>
References: <20250310080440.58797-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: add missing readable registers
Message-Id: <174169911190.27942.6295877056083152629.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 13:18:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Mar 2025 16:04:40 +0800, Bard Liao wrote:
> SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_FU15,
> RT722_SDCA_CTL_FU_CH_GAIN, CH_01) ... SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY,
> RT722_SDCA_ENT_FU15, RT722_SDCA_CTL_FU_CH_GAIN, CH_04) are used by the
> "FU15 Boost Volume" control, but not marked as readable.
> And the mbq size are 2 for those registers.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca: add missing readable registers
      commit: 247fba13416af65b155949bae582d55c310f58b6

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

