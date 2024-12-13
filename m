Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3611EBA0B
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734114421; cv=none; b=RLvrS91x5u4/d30CxIpE7Z6loztmWtOIYeo8dLUnZ7M4yCmFWjpPeWwXqrgpo3hKWoDmnZvAoXE1ILB5b1kbk2rww9TDXfVhAWAgxtUZCcxy3mvA6CvgAwhw4i8f7dMmA4sVAwoEYF+hVJJH5OjpRW05hIB3MYKJQxJcOkFy1Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734114421; c=relaxed/simple;
	bh=o1fCUwwDI6pJsXY+F1zRJ78+JtvxeaBqMFr9ouWrjcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VFbxutNMy/ZS6I2d7YU82sh/c40viXG5RgVfPouZXZVCsVlK2iWba69Cv47shz/uQBUIfzKke02P4H1Mb+XJpm44p7vwLa1eULFfvlW0dHx6VaG+5oGpyrqBuU4/i6M25FIzfdtV1Mdldpyzv/90ZdLzpWsQTegdK4/YRA+yHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCKlvham; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCKlvham"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC5BC4CEDE;
	Fri, 13 Dec 2024 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734114421;
	bh=o1fCUwwDI6pJsXY+F1zRJ78+JtvxeaBqMFr9ouWrjcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rCKlvhambe9yCYraNCJdI9KvSrpHBolDaYYygoX/T6k8LtcBy0RET7dgjXJpcVMpp
	 br4iXkGOY4d51r9SnUfNehyo9kOe09Px5CGTDuGIDlVCtE1HqU/ldDSCmRD3qCrLA6
	 i9X7ZLsF4WValshOkLzdQ6KIbn73AGbeax7EYbvo6k5zeQMz/z7CAgVRrGr2dEAGC9
	 rU6wYe5ulp7fYRF9E1ABkkOkIib5rWDAO8J2rWRU5zRYFy3ZTFCFEJk5tTiK3khn0/
	 pEVkfeLLKZOCZ5gavGx0tBeaLV/cAyN+w5mUz2tYOX/fCQ/9N8GenkOhHxcEp0nejc
	 fa3faOkSwfDBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
References: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: core/Intel: Handle pause supported
 token from topology
Message-Id: <173411441925.280424.15313309611130818222.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 18:26:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 13 Dec 2024 12:11:21 +0200, Peter Ujfalusi wrote:
> A new set of tokens have been added to SOF topology to indicate that the pause
> operation is supported or not on the given PCM device.
> Pause is an optional feature that depends on pipeline, topology and modules
> used by the PCM.
> 
> Add a pause_supported flag to snd_sof_pcm_stream and use this flag in Intel
> platform code to keep the pause support enabled or to disable it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Add support for pause supported tokens from topology
      commit: 70a667d70cce338ab8552dd762ae114a5ab96500
[2/2] ASoC: SOF: Intel: hda-pcm: Follow the pause_supported flag to drop PAUSE support
      commit: 3a47319d2d910291f4c09c0f1fec4e86a2e03696

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

