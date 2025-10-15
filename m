Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49056275864
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545328; cv=none; b=i0Jxk8wtEYxwqZpOW5VKOukH8PhugO88CLLKiQm1aI8FwzcK29CL31qnJfb0zHnpSFFigpSt9lj9+7NOtWtpuenppRUajzmbrL00r42+Nkm6WBD8SvVWAlvHF5qleiWpUkr0QsXK9XwFKCjFIPzH4cp43P+KxOhddp+C/iiBfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545328; c=relaxed/simple;
	bh=Pk3kk+nMryuU9acpIJRwKDJWcWrdHc1LIgJines2e4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QkLOsdZHcFTDP+xEOjAf3lUXWy9RYIdSjQK33+JXyT2PX4dKH587oKBz7le3BVz4YZ0yMmwaveGUJHYNgIci4kcufyanissARLWopqLzA8fA6o3u580PSIIO37aZGCcKaMjxQCf3F9v7qpYuEbQndy2XVRxf6iwK28KXIrGywhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q613dlCa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q613dlCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD784C4CEF8;
	Wed, 15 Oct 2025 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545326;
	bh=Pk3kk+nMryuU9acpIJRwKDJWcWrdHc1LIgJines2e4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q613dlCa88N04mB/2uMbMJkJYeCduJvvhTHIxKFCeHzTDW6b8Ow3FpnLfCkn0Tu3E
	 2tXFA4CC6+CylMuHU2ONQxXh6PrqtV+gaL1cEdsoY+CNwH24fNtIEAw1X6Ya+ICVVp
	 5KbgFKTCFkVkapojfZgVL8ZPQH3+rOMmGsqwYtxfYHhPAKjJCSDaCvSjbCKdf+8PiY
	 yRbjlhzIcnQOPg//d1SQn0IbeIwd3ZAAKMnN3YiVRQO9bKno5psRX75N+XAT1oN5R1
	 AAjd/bzQhpPsKfUYUZfIh8L8eTC5M+HiQGblH+EK0Z6aneDJlhTx+O20aFyKpg6V8H
	 r94jluBhnsAOw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: use sof_sdw as default Intel SOF SDW machine
 driver
Message-Id: <176054532543.196625.2706141821270995708.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 17:22:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Thu, 09 Oct 2025 17:40:14 +0800, Bard Liao wrote:
> Currently, we create a ACPI mach table for every new audio
> configuration. And all Intel SOF SoundWire configurations point to the
> same sof_sdw machine driver. Also, we don't need a specific topology for
> a coufguration, we can use the function topology instead. That give us a
> change to generate an ACPI mach table based on the SoundWire codec
> information reported by the ACPI table and use the sof_sdw machine
> driver as the default machine driver.
> This will reduce the effort to support a new Intel SOF SoundWire audio
> configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Don't print the monolithic topology name if function topology may be used
      commit: 2b92b98cc4765fbb0748742e7e0dd94d15d6f178
[2/9] ASoC: soc-acpi: make some variables of acpi adr and link adr non-const
      commit: d25de16477657f9eddd4be9abd409515edcc3b9e
[3/9] ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_info struct
      commit: aa1ee85ce3576defd29f2a389d7508d2036af977
[4/9] ASoC: Intel: export sof_sdw_get_tplg_files
      commit: 7196fc4e482928a276da853e2687f31cd8ea2611
[5/9] ASoC: soc_sdw_utils: export asoc_sdw_get_dai_type
      commit: 5ed60e45c59d66e61586a10433e2b5527d4d72b5
[6/9] ASoC: SOF: add platform name into sof_intel_dsp_desc
      commit: 6937ff42f28a13ffdbe2d1f5b9a51a35f626e93a
[7/9] ASoC: SOF: don't check the existence of dummy topology
      commit: 99c159279c6dfa2c4867c7f76875f58263f8f43b
[8/9] ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
      commit: 5226d19d4cae5398caeb93a6052bfb614e0099c7
[9/9] ASoC: sof-function-topology-lib: escalate the log when missing function topoplogy
      commit: 9797329220a2c6622411eb9ecf6a35b24ce09d04

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

