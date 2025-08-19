Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3AC2BD029
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632817; cv=none; b=YMu+7XmzrHMWneARg+ZH/Z4BzMF8FypblqthLFu/RA8xEsTey1foHI5M1Oq4NEFwr7Yjui9sDckuTrRtbdkD4bfEbQ8Riynk0a+E34Kh5XzUu0cvYIk6l9yC4ByX0yUNZewWDLMEVfnb9Ph5CPjFvEbEt4W8V9Yc09qmOhpDVCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632817; c=relaxed/simple;
	bh=moay/SuwDtTg5hzwNVyU+ZZcVbTE9eaFWgnDITu2Euo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RewecaIcTMbSzEBZ7oIJsvsgD5j3/BU/Ostlets5YZQ4NOi5YG5tk5cu4JQ8vCnZcpP5fJNDvJgDzeHwzdHFHBPL8W++CwhEHkkbAwOMHJgpeUDyFU8y8k0o85qSVX9dDzn/a6txV+YONJ4AE/uYZk0ZftdVIH1fb0+I4mALPI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNGNZ4DI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNGNZ4DI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52864C113D0;
	Tue, 19 Aug 2025 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632817;
	bh=moay/SuwDtTg5hzwNVyU+ZZcVbTE9eaFWgnDITu2Euo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lNGNZ4DIWwXSaAxqwy4QjmzSmvVLkFO2jjD8YrLCTOjjFkWF3ZWReAk/XLgGOLpLG
	 aUtSbjDP9lq3e8OXxcKDlhppK2AyeM1Duk62U6ULVq0g7TBKMSI6umnqMUkj0X+DlE
	 R+xOI4J7G7e8v9XBNgh35t8ctfo/ltJPihcLXjDynf23kcKemGJHs0ku55i22nwlAN
	 L437rmDFNZDTiGfz3FDahpto9b5a4pCiGfRDYKSgM5kk/oRYoX5ucDNZko7rmVdjiZ
	 yogDMAQgLbADfSiMf2A3ocDYLNUz/VAt0eMU1fe8fIHg/FyCO+hu40lbWnEO+akaO2
	 RcbfIeOfJhbHg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250818104126.526442-1-cezary.rojewski@intel.com>
References: <20250818104126.526442-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: avs: Code cleanups and separation
Message-Id: <175563281607.270039.2315792155577877323.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 20:46:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 18 Aug 2025 12:41:22 +0200, Cezary Rojewski wrote:
> Set of patches that brings no new functionality but makes it easier to
> maintain and read the avs-driver code. There is one 'fix' among them -
> the third patch, described below.
> 
> First, debug-related code - mainly the data-probing feature - is mixed
> with non-debug PCM code. Separate it into debug.h and update the pcm.c
> file.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: avs: Separate debug symbols
      commit: 62dc545be11d956419a21724de3810930db20d43
[2/4] ASoC: Intel: avs: Drop pcm.h dependency for probes
      commit: df36e5c197f31a105b8c8a70f13ebdf3a4c019d5
[3/4] ASoC: Intel: avs: Do not share the name pointer between components
      commit: 4dee5c1cc439b0d5ef87f741518268ad6a95b23d
[4/4] ASoC: Intel: avs: Streamline register-component function names
      commit: 2a55135201d5e24b80b7624880ff42eafd8e320c

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

