Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156702DCBEB
	for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 23:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762818003; cv=none; b=CgTj/+UDPx9cAWE8L81BNHVe/n/lVdLKM8v0A65klPHMcxMt+BMJm2rN26ZtlPSyGz06YtDd6q3cb8keHMTBbEwgTvfSAtOuNG4ejh+bMxmeg06eOxpF/59ZOWCTJaPGvwz5Io4fz1RWqSjxCK65LbbHCvl38Q8HHPIndBt8aVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762818003; c=relaxed/simple;
	bh=9B+SE1NBvAwJj+1rd+JsD2VDE6X24HWvD9uxanTA9WE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dSzseYQfxbKbmPCGuaPqlAqqASopBYfTAZgdTzgDXna/KlGtbCWIbWhSh0Pdbru7Aa7cEbu1kqJ/WG1QU75ihNamm9gC3Dq/FSY7zDaUHXA9L90BwbsqByvCBGC1psTHmI7XjVjH/ry6FeKEMoAs7BMtVz6DNCAtXtqTst1/1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiGop7J1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiGop7J1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74307C4CEFB;
	Mon, 10 Nov 2025 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762818002;
	bh=9B+SE1NBvAwJj+1rd+JsD2VDE6X24HWvD9uxanTA9WE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZiGop7J1GtISl35MNsme9e3xC6UiUBM6j5LvlaFSCdC7fbe8Nk9rMOEOQUkcSZR7w
	 219GK6+L8xYWt3CCOIIEhRbqpcI/GtvN+cbtI2HTSlh1yQdTWe760AOlM4MgNyCQuE
	 2XxcEBd98tGETJ1fI2bVYcHd65MgltpMRl5Cvs1idNluw72wQrw37HLlQehf4+DBTH
	 HdP7zOWLX/LLll+pY0ed4dtjMRen9stXkRe3YN8ZxdOWDPdKe3/pPVTPRll92um9VY
	 bbAgpy4+2wJCglCtHjLyMrIEzua7S9pyHu6MjGNK6FXMs33DZH+9BJJow0MtlsEj+O
	 MCpSrVcp2aBVw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com, 
 v-hampiholi@ti.com, baojun.xu@ti.com, dan.carpenter@linaro.org
In-Reply-To: <20251110152646.192-1-niranjan.hy@ti.com>
References: <20251110152646.192-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Message-Id: <176281799748.170742.16863257175809066570.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 23:39:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Mon, 10 Nov 2025 20:56:46 +0530, Niranjan H Y wrote:
> "struct sdca_control" declares "values" field as integer array.
> But the memory allocated to it is of char array. This causes
> crash for sdca_parse_function API. This patch addresses the
> issue by allocating correct data size.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: bug fix while parsing mipi-sdca-control-cn-list
      commit: eb2d6774cc0d9d6ab8f924825695a85c14b2e0c2

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

