Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9C36D504
	for <linux-sound@vger.kernel.org>; Wed, 14 Jan 2026 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426599; cv=none; b=OuQPcoT0DiUQRu0+uKxQziLAppXw9wlz5StRHv+dvNm4Mc5VkvPQfw1/K1pggNLLhNmNzaateXrpXmln9xs3g7J3wMTvUoQWHj6azDRxEOpzCfnvtZvLQPe1zVrwZZkb8/VqJBBwhrkwcPFNF+gHSKxkDrbaiOP8ck/WldKfG4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426599; c=relaxed/simple;
	bh=A+isppos2uBF4pvtaTywHRKhFz9WurWBsbCY7SlGuVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IRT05DPFNU91GUHfHfmwWigJWZFGW/CzPez00BJjUM8dIE8nKkHigGy7y+Vs8EjoT+AUMZMkxwRNrOM0KujI+hN2UCvCCI+BysudtLv+LCp2bJLun+2OTUp/SZ3CW/Dhl27zY6k6x5tntQKXc/dDoWNE3+JXlo2y6BQg4Hyv3bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBLbCVzO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBLbCVzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA2FC19423;
	Wed, 14 Jan 2026 21:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768426598;
	bh=A+isppos2uBF4pvtaTywHRKhFz9WurWBsbCY7SlGuVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RBLbCVzOBN9yX/feaPUgjPWvQS8hxJb4Uw+98WO6pW9SvocXWgK2X5r+F0067rcCf
	 TZRjdV/B5FMPwhxQk0QRQF59Hg8gQeuv1pXDJcVFfTM4/ZoDOOAZ2myucxUNq8Gy+m
	 z9q6GEPG0iuNxdrHDQEvk787XihcS6ajHOMi2/Mvey8aJWF6BOfhEehqZ0dY1eQpGJ
	 C6kReDaULShwCwphgqM7+ViS/UE0WVq2ZM/zYGE81LMtVU9K4e5hadjQCcPlrFjIpC
	 1FmPdJaz/rhhkMHRZcVodp9UBhepvEyAL2RCloif79ZqJJjNXn+/BuvE48ckgEOAt3
	 Rqxp6EA0yIR+Q==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
References: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/4] SDCA System Suspend Support
Message-Id: <176842659682.229619.1192096125878474929.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 21:36:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 09 Jan 2026 14:52:02 +0000, Charles Keepax wrote:
> Add support for system suspend into the class driver, now split
> out into a separate patch chain.
> 
> Where we got to on the previous discussion, was we don't currently
> have any parts requiring download on runtime resume, doing so
> will add noticeable delay to the runtime resume, and we are not
> blocking someone from adding support for firmware download on
> runtime resume in the future. Also as runtime resume is really
> a kernel concept and power rails are primarily controlled by
> ACPI it is quite unlikely anyone will actually power down the
> part on a runtime suspend anyway. So this version of the chain
> still only downloads firmware on probe and system resume.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
      commit: 9e3d4f794cbe9a4e286b3052cb97908005807aee
[2/4] ASoC: SDCA: Add basic system suspend support
      commit: 7a5214f769c7c953c58971027a762f2e191057d4
[3/4] ASoC: SDCA: Device boot into the system suspend process
      commit: ffd7e8a101110cba86925a2906d925e0db7102f3
[4/4] ASoC: SDCA: Add lock to serialise the Function initialisation
      commit: da7afdc79cba00f952df12cd579e44832d829c0a

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

