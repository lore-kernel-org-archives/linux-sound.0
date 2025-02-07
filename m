Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CB6221DB3
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936959; cv=none; b=CcCLSw3IxQRbLGvO6AdJUlamDo2FDdRRmtzbRRhb18sdzWwDAJkB3iiG+qWpxceeXL+4rKMZg0fpK6rHWJSoPm05CeasGjkUQAWpQxcDBMMIER0mwmPMRAtWI+MGW1D2WSi+JzlM9IViZb/V+XilF9e/ZrEsw0xeADSyqX2JWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936959; c=relaxed/simple;
	bh=noAZlhCpyOtyPSyzRoFuoCK6gFSL3DIwATi/+5ylJi8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O+wjBzkJxllVCF0QiiZEmPMPlG8KT8pvWn6c74xTmZGD29nkojZdKn9RD80/tY4zXLUlnHBIJ2A232Gjl0KYRr0aOEoBAZmiW0O7WW8SU68ChcanPg16ZIybjayQ9o1EBOtOlzkVdBnIPG4l9PdYq/kHLgjfJjifJBKOVoEAuaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjCtS9sK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjCtS9sK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BABC4CEE6;
	Fri,  7 Feb 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936959;
	bh=noAZlhCpyOtyPSyzRoFuoCK6gFSL3DIwATi/+5ylJi8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tjCtS9sK5VVJjqJQugZh0Luf6xma2W+vEb+hifVLEZWZStw4lMEPEVsu18yWjd5U/
	 o+VJdu9PDnDMaKWUNdMSdS96yBAJg7KPabMConHTHRoqEJoDvnxDd5TCp7BHIv6jcR
	 UYgkn6x14iqNq3j/TWpn3ZYiChrzemvrPVh96Jcnz/JFX82jyv7evuQLkVy2IsSv2i
	 VxqzGLLjvK7ht9U9UjaNGLQOSbTg+GR3PMRutfI94cwZ5pJWIhUI+tVE7VREZNqPBs
	 KMop54Rgb4QiOohjctgZY7dnzQ+Gf0PMZKJID1ndbIJj9EqV4sU43pFwYEizy3gxAo
	 egt52TKgi1mvQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 00/11] ASoC: Intel: avs: Add support for MalibouLake
 configuration
Message-Id: <173893695751.35212.11015643179208852850.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Feb 2025 15:10:40 +0100, Cezary Rojewski wrote:
> The avs-driver is the go-to driver for Intel Automotive. MalibouLake
> (MBL) and RedondoLake (RDL) are representatives of the project. These
> inherit majority of the featureset from RaptorLake-M (RPL-M) and
> AlderLake-N (ADL-N) respectively. The onboard codec for these is TI's
> pcm3168a.
> 
> In summary, the patchset:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: codecs: pcm3168a: Add ACPI match table
        commit: dc561ab16d8be9cbe8f07a49a7b2f5428fbcfeea
[02/11] ASoC: codecs: pcm3168a: Relax probing conditions
        commit: e92f042642aed6f6206caace892d9df2d0166841
[03/11] ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
        commit: 7d92a38d67e5d937b64b20aa4fd14451ee1772f3
[04/11] ASoC: Intel: avs: Add pcm3168a machine board
        commit: 79ebb596201c86712fe38b0ef73d25d07b932664
[05/11] ASoC: Intel: avs: pcm3168a board selection
        commit: b9fb91692af881736f8fa1741fa0dbadf07d99ee
[06/11] ASoC: Intel: avs: Move DSP-boot steps into individual functions
        commit: e995c51903384be1c7aead246dc30cb5244179ac
[07/11] ASoC: Intel: avs: Configure basefw on TGL-based platforms
        commit: cbe37a4d2b3c25d2e2a94097e09b6d87461b8833
[08/11] ASoC: Intel: avs: New gateway configuration mechanism
        commit: f0173cbe7fa79eafbdf32eed32337209f84ddacd
[09/11] ASoC: Intel: avs: Remove unused gateway configuration code
        commit: 320155a61f7fc810a915644e9e2a451bdcea90b1
[10/11] ASoC: Intel: avs: Add WHM module support
        commit: 4343af66b8e1df1d3a2e6f1f8612506cb45b2afd
[11/11] ALSA: hda: Select avs-driver by default on MBL
        commit: 856366dc924a9561dae39f252b45dfd6cc6895ce

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

