Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2223644CF
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116922; cv=none; b=GMnO/gWPftquAI0UJh8j75Uq6/qu4fDLeCvTg3xeWLJcUkkLOm9o4+dgOUHNTjJ5VJxeoxuPwmIGGZoRrfPmBAYCJgm038+GevcYB9L1FeTowNouj8LMlfhHpKjc0FzCbJ0YcEaO/jOoUgFMEprg0mfDeEgJS24m3WQ5InN+ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116922; c=relaxed/simple;
	bh=OIdOo1haBh6lOQR2qbj3NKKmW4XuzL7PzuD3rve/5ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gbD9PW/nGcXS5RuyrfVoSHi1gxDkPtfUHUUQh9SkfwWdKfa9xBMl0UkIM2rHxXGp6hrQ4zSHavYSaysw48yj7ML4Ko2q3Nmjot949I6C2fnWZVRi3VjWH30we3rTPcGQaEKqIJU3lwmxUMrmC+sianT9RDF/7kRFzQfPYut6IO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H329sfCf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H329sfCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C41C2BCB7;
	Mon, 18 May 2026 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116921;
	bh=OIdOo1haBh6lOQR2qbj3NKKmW4XuzL7PzuD3rve/5ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H329sfCfhp3lgz05t3caXINEMCV9bJmNzs5Qgxl1aAsUIMITo+UzJupQ2Tvetx/UI
	 k5F6A5OVe9Qf/oT4zFtMRR53O8UMpOIeMNP8VzTk1MkoT0c0hvvZrovy220bdDe5V3
	 EhPlM9UAzAy70qA17zLajGTJsEaZ8HzvQ/0DyobkK10+fqd967ztT2jg01K+yaucPd
	 CMPSp9sMUFUJ5rla2gzGuTQbr405yqnjKPyKB3nYmyOq44MTGsiqeljuWtUsg3Yn4r
	 538J02StUK1cRP2JR+O0/AWBEtE3SI+OVapqWGXEMeBq1IFA3iPZGRk4miCBidj0IP
	 B8H/c9MOKn8tg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, linux-sound@vger.kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <20260203052406.28562-1-zhangyi@everest-semi.com>
References: <20260203052406.28562-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH 0/6] Add es9356 focused SoundWire CODEC
Message-Id: <177911692033.295433.5929709886207952847.b4-ty@b4>
Date: Mon, 18 May 2026 16:08:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 03 Feb 2026 13:24:00 +0800, Zhang Yi wrote:
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.
> 
> Zhang Yi (6):
>   ASoC: sdw_utils: Add ES9356 support functions
>   ASoC: sdw_utils: add ES9356 in codec_info_list
>   ASoC: sdw_utils: add soc_sdw_es9356
>   ASoC: es9356-sdca: Add ES9356 SDCA driver
>   ASoC: Intel: soc-acpi: arl: Add es9356 support
>   ASoC: Intel: sof_sdw: add es9356 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: sdw_utils: Add ES9356 support functions
      (no commit info)
[2/6] ASoC: sdw_utils: add ES9356 in codec_info_list
      https://git.kernel.org/broonie/misc/c/4ff4fc6fea57
[3/6] ASoC: sdw_utils: add soc_sdw_es9356
      https://git.kernel.org/broonie/misc/c/5d03a4f35710
[4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
      https://git.kernel.org/broonie/misc/c/5d9cb740cd38
[5/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
      https://git.kernel.org/broonie/misc/c/25b905940832
[6/6] ASoC: Intel: sof_sdw: add es9356 support
      https://git.kernel.org/broonie/misc/c/f1e35606d618

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

