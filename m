Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FE1547E2;
	Thu, 16 Jan 2025 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054162; cv=none; b=IZDEm1nCo9ELdMl2AdS69yRe4V8l4IIRdjlPNkI8/r+99N+T4pURFVVdDlxttrW4oAmcsNsI6Vi5d63WOgLq/NCOW8PCPRlEtgo3lFqjv/YcoWF9ncyw4X1Kf2gYE0KA4pxAybxrMRC0WP0e8HU65Rz0ZZ/7Lqn6Yr3RFnGTuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054162; c=relaxed/simple;
	bh=J8ckeavHnnb0wC61NIEFo5/ycFAulZz4dh/ZOHgvypU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CAcJlLmYBeEdMDpLvjz0AouU+aj7Yrfok9Rt0qgZKPMc+sBLMNk5f815g2WJCmTO1XoQCXycbLlp5joyMrnPtka9DGCjIOAlufhLAHZNUl5UZRT27PIIMPIO+Wr4FhXxLphGcuL3iU3YDZ5jzqOllX23Esm7Ult2Svt7LdSIi14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ricFobGw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ricFobGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0FFC4CED6;
	Thu, 16 Jan 2025 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737054161;
	bh=J8ckeavHnnb0wC61NIEFo5/ycFAulZz4dh/ZOHgvypU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ricFobGwgxAa2jxKvfTbnaueKbSdrSbtvo/Lenf4SyN4/isL8HfXBDyzU+Vt2DI89
	 ze27rydlcRgs0IZ3N+tlJUZ+vWuXoV4kat2b1cIUzAJvrkg+blIqqZQN90hIa7dv1c
	 TNp6WGiSm7aeLJH3v1LFEOSDoQZzhMUpCjazx006ALiBGzTGD0epp0htujgYkj3HX1
	 4tkAPHyYZPV0NIfczEVJQrr7OoRRN5jKfFylV81RXWfCGjr3QHHNvUj1sfGDYbfnSD
	 UOun3CfX1RmBGMvZzomqP4v9Ql0uM6DpNC7PdE5nCEgXryBI40kqgm7lrwo9/9N8CA
	 ccCTkCcmSylZQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com, 
 Michal Simek <michal.simek@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
In-Reply-To: <90075f57ceff7cdf958d0d146f46f50661335236.1737039345.git.michal.simek@amd.com>
References: <90075f57ceff7cdf958d0d146f46f50661335236.1737039345.git.michal.simek@amd.com>
Subject: Re: [PATCH] ASoC: xilinx: xlnx_spdif: Simpify using
 devm_clk_get_enabled()
Message-Id: <173705415989.65379.6502252093560086955.b4-ty@kernel.org>
Date: Thu, 16 Jan 2025 19:02:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 16 Jan 2025 15:55:46 +0100, Michal Simek wrote:
> Clock handling can be very simlified with using devm_clk_get_enabled() as
> was done by commit 8d2aaf4382b7 ("gpio: zynq: Simplify using
> devm_clk_get_enabled()").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled()
      commit: fee89ddd76e45841a2b01d87b481bc02483f4572

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

