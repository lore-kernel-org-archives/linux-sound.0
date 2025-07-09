Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB785EEA8
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075355; cv=none; b=qGGBKtuarhy0XmHjAOE+G45XSvh29CnuXpRh0A+WKUanNjCC7aa2fVl77tpaYEe+n+lFc/vQKOEzl+/+I5RdIj4O9BvNNZAJ4liTPbRfG3pCV9PSRnlTUjuf4bkr4QwUwIuDpZ7Kd3Bg/00LtVNLcRdECdIx6WKuOF5OuDi7bI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075355; c=relaxed/simple;
	bh=byobXKnYiY1xH59Pq4WOEvE/L7VVSU3x7jnvl+tAXbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pvEaUznINyCMlMNKpQzyCHeSd5s9cTUMlNSN1Wuj1ELrlzUGMiqhduEcBUeHVzIIiIjuwI2IiZTZCLxLR21OFgFbvT3sZj1TrpdlT7aCuaZ5Ns5JBxprv88E4/VeRz4UjjXoqiHXDR6uLkDUjf6be/4jSuzdifC6dXIaAlgVvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGz2/9g0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGz2/9g0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AB8C4CEEF;
	Wed,  9 Jul 2025 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752075355;
	bh=byobXKnYiY1xH59Pq4WOEvE/L7VVSU3x7jnvl+tAXbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jGz2/9g0nastLi+fUeB0+kvYToyvyTqhuL8DYIIKvAEFufn6O2zNVtBC7cOJz0Qta
	 LA8wDtEHr3T6UYIAUYGXZ9XD4gcpQHP41K+HK/+dhlF6U+Fika63VKxT398QY1AMpa
	 0z/EwIg/4J/Bwnm8P9hArrplQybIaq/DPkQlzKcwARAr3U0XLep2WjqL5wfR5NTL2Y
	 l8bfUsGDhXWBiw5S7DQ3x9PjjgWrl2tu2uWvYgpePgrE8IZkBJNxR50fEmm3Hl0Wfg
	 A4hfrj03KI+TizrblOnkOP2uIuol+mU4c960ksLz+FojEe2XdDofBtLp0zISsXEuFj
	 xVWHZP5xj3kZg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
References: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: add support for new devices
Message-Id: <175207535307.695799.3047474583652207034.b4-ty@kernel.org>
Date: Wed, 09 Jul 2025 16:35:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Tue, 08 Jul 2025 16:00:25 +0800, Bard Liao wrote:
> Add support for new devices on Intel platforms.
> 
> Balamurugan C (2):
>   ASoC: Intel: soc-acpi: Add entry for sof_es8336 in PTL match table.
>   ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in PTL
>     match table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in PTL match table.
      commit: 2813f535b5847771d9e56df678c523a7e64f860e
[2/4] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in PTL match table
      commit: fb00ab1f39369e49d25c74f0d41e4c1ec2f12576
[3/4] ASoC: Intel: soc-acpi-intel-ptl-match: add support ptl-rt721-l0
      commit: e149d870687a5cfd702b700d81ae75ec6f41dd57
[4/4] ASoC: Intel: soc-acpi-intel-lnl-match: add rt1320_l12_rt714_l0 support
      commit: 86ccd4d3e8bc9eeb5dde4080fcc67e0505d1d2c6

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

