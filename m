Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CB534FF66;
	Mon,  2 Feb 2026 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072517; cv=none; b=lPB7A0fDMl8po03ij3XaqvqgCfAA1v+o9IGyGEzPfKCTA8/Mi+jZZ9a64yskUXvLXzlI6K5PIAwOR5OKbohcT7Y9USIaNMCuv9vu7AE10vU2rXnAaUdKrIUds2FUcJr06Ovbw7Cyuv40M6PsiBQksoWrhkpKIR/MfwbDRIxqwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072517; c=relaxed/simple;
	bh=pNcmHHRXqCI/bIv55AJE1dBWGms0NiXRxeONTidxH4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=REB3F5A15FWjer3BrVquzXl7KpZ7ridShV5siF4Rx3RP9sLz+zMr+1tYAnXBKIdQs1ycD1mWax8jtK5tCjBw2sHmeNtpJVHGX4irwPNgxFyRShRjhTK2GTT0WmQIdbMp2tkPHqfXiE4aBWSJEfUV0abTV6IatO2AJIOQStWZbV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZpbJNuh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZpbJNuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E58CC19421;
	Mon,  2 Feb 2026 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770072517;
	bh=pNcmHHRXqCI/bIv55AJE1dBWGms0NiXRxeONTidxH4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZZpbJNuhG2TYTLR9r5EsmcRt9MuP5EQR/BcH6I7CbtzMiIDTc2TmkjfRLzgAHGH7n
	 PjoH+Cy7ixCb/XK6xRPTFTTXq8RK5x2TktlKMR7r4A2pfyoUp54HSnhkl0eqranW2N
	 o3AUq/65947ORf/eSHv7NoVEFeAIjlqtc6fUKl3m4JjcYjDEVYV/27JRncDWrR1pU0
	 zrFi1aR75bZZ87NF/+kVhuCQFaFJ4qvu25VE25OM7Ml1+4hC014bddybhyLLzwRZUP
	 K1DZPWWAQUNZiU0Xvg/NoYQjw+Cflycwcgqcz+2oZmsvliqA8O4mvr+FuxjmLpqSWa
	 Lu29MLFUtKx1Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260202095353.1233963-1-arnd@kernel.org>
References: <20260202095353.1233963-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_sai: add IMX_SCMI_MISC_DRV dependency
Message-Id: <177007251520.963821.9410383786768084086.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 22:48:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 02 Feb 2026 10:53:50 +0100, Arnd Bergmann wrote:
> The sai driver now links against the SCMI code directly, causing a
> link failure when that is in a loadable module:
> 
> aarch64-linux-ld: sound/soc/fsl/fsl_sai.o: in function `fsl_sai_probe':
> fsl_sai.c:(.text+0x1fe4): undefined reference to `scmi_imx_misc_ctrl_set'
> 
> Move the dependency from SND_SOC_FSL_MQS to SND_SOC_FSL_SAI. The MQS
> driver depends on the SAI one, so it still gets the same dependency
> indirectly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: add IMX_SCMI_MISC_DRV dependency
      commit: 742048f2e128c06d0ef89ffc334519cb8e991f66

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

