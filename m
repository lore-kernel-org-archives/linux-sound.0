Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC70D295
	for <linux-sound@vger.kernel.org>; Sat, 25 Nov 2023 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqhQgZDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998F7C433C8;
	Sat, 25 Nov 2023 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912235;
	bh=VR4ONSoi1dmZbqcHJA4iDAY9ZBVgqaWvZJaqGayNkjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VqhQgZDjeKId25XdzOcwQiqFcpFDswmnOr7Be++RTCecGNzuXGiZBEq9f/+NdVNFV
	 GylX8ra562wzhxOBQXwVc/9qxyktIX+UTp4VXLbDY2n35JKMFiBxm0xtDqQ9ttOoCa
	 nVWq7yusIC5PxxUlPAGPNGKYFKC87Nrhyd3kG5bh/fnkvcQBeLhB4eO7YaCQ2VMxVe
	 NxWU+brVpsYBYpAA0sS+G1LLkBvlRaeXKXIgV7HWbPM9SaFX26MT6yxJI0suJSe3WA
	 RHAZKByUIOMpuqu2eEz/HLyQdJHvayNG1JQgX5MX3k+7bS7exVWCFrDGebenqX6mBX
	 Nk19bULOYD56A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: ipc4: Add support for control change
 notification
Message-Id: <170091223327.2632109.13826831302853487867.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 24 Nov 2023 17:08:49 +0200, Peter Ujfalusi wrote:
> This series adds support for handling control (switch/enum) change notifications
> sent by the firmware.
> The use case is similar to what is already used by IPC3 version: the firmware
> can update the value of an enum or switch and sends notification to the kernel,
> which in turn will notify the user space of a change.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4-topology: Helper to find an swidget by module/instance id
      commit: 5980bda0a998a6ee6afd83b97a482a40c1c68076
[2/4] ASoC: SOF: ipc4: Add data struct for module notification message from firmware
      commit: 1a307538c9cc274b3191b9a1380bbceece262626
[3/4] ASoC: SOF: ipc4-control: Implement control update for switch/enum controls
      commit: f5eb9945cf9c17eb016aa64c7de13875f259ea07
[4/4] ASoC: SOF: ipc4: Handle ALSA kcontrol change notification from firmware
      commit: 0ff23d460718641c80c8054425256391dca1ac7d

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

