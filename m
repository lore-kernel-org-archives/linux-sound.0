Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308B2264AB;
	Mon, 16 Mar 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773697965; cv=none; b=PrUsFj+aHrvrC5I4UfIawuCI8vxZnyUh4O23s+QZWDLWwimXC895aHvy2HZP46PYmPbdBb+UEWC79PHnX6O1BrNRXQtbE26JMhFnS62nhJQatM/NXNh6yS7z+cNF/i6hy2EBP2kB2htGpXLz2QnkL6kA+KxAg5XysXPa83x/jNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773697965; c=relaxed/simple;
	bh=Hf3ptVHHm6wjAGUPr/MchsVO9sY2kg6t6o9OKhcopA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qUN+cScSkEUXwdGRzJDlo6MSAjqatSxQV0nN0WxqpgqRiiB7QlLGO1u/m0iFjVESudVzAgFwNldHr1rgITUSWz4J+bCE1Tr0j83xiKvmxqZjAOML48LxKQW8HwPiehuWnus2OKBHj5H9S8iS44CAbLg3YJr6YsMKlhIrWrmBztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5xteh2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5xteh2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0951C2BC9E;
	Mon, 16 Mar 2026 21:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773697964;
	bh=Hf3ptVHHm6wjAGUPr/MchsVO9sY2kg6t6o9OKhcopA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P5xteh2KfFnfpDcZfj3kgNrmoW9Ve8Oc6bzdVqC0v/fx5E9qSGs0g0gnNYnYsj8ti
	 OePtFlFJGA+d/1hMBOCO4sXs8BTy3LIIPpeavpNwjd0ciilE1Ui5nUTSowKmBa3TMY
	 JhHgiKX8/Iju7HEORujpuCTjQnD/uVM80qH07uCroIGGxNVVsqV+805vHzyRavYM4C
	 pHOQT9d0x/Ds2A3t8pGpmqC0smcUcYS3LDK5yXyNqwkU8SIMAeT5NghdI2qj1Y+xRT
	 Vh66JAo+8bLyhJrd6AtCwhmFXXFQBR9FK55PTjCBTZ9vDMIdjZECYf4gOrsWW7LQTn
	 YRvbd5C2jbJDw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Joseph Salisbury <joseph.salisbury@oracle.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316180545.144032-1-joseph.salisbury@oracle.com>
References: <20260316180545.144032-1-joseph.salisbury@oracle.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: fix comment typo
Message-Id: <177369796246.303411.7440078882832498896.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 21:52:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f420f

On Mon, 16 Mar 2026 14:05:45 -0400, Joseph Salisbury wrote:
> The file contains a spelling error in a source comment (funciton).
> 
> Typos in comments reduce readability and make text searches less reliable
> for developers and maintainers.
> 
> Replace 'funciton' with 'function' in the affected comment. This is a
> comment-only cleanup and does not change behavior.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_easrc: fix comment typo
      https://git.kernel.org/broonie/misc/c/804dce6c73fd

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

