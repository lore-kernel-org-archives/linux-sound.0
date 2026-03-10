Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF08B40DFB3;
	Tue, 10 Mar 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158018; cv=none; b=jORePaONL/j3rO5/e79faEYEBhAUbALyBGLLAf+E40wuc10pllgAAJ/uJtl+yPQnyZPhAlGnBHx4KvjifMqtLJuqsbDQWmn4B4kqZSeA44jID5Eo8wFtntNnz/MlphF9cNZWThnx0jSgOX+XR3o0BmVaxsu1VsdkjkvhY66ar/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158018; c=relaxed/simple;
	bh=BEuGEJjciZkPIN/dbZ6ppaeVVxnQ26nr/5S8e9B080Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RTefAm+a6WNb/k6eH0A3tTTv+NRyD0ZUlSA9jdoWW18JUDv6H7xueA2pPFC7oYIcBuXCX0RJyqcUoI6LyVd4sbxIYI1QvBl5n5gqgJfpNMfRwxYRhfQAvx/scGpOQE0IjbHt4FGWYbRiMOD0QE/zmF2szsoLQUgaXz+cwGesbSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbRCXQ9v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbRCXQ9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA38C19423;
	Tue, 10 Mar 2026 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158018;
	bh=BEuGEJjciZkPIN/dbZ6ppaeVVxnQ26nr/5S8e9B080Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QbRCXQ9v0aWn3EgO92R0wNdLgIo4XmZCLdHYvVe+ABZQhoV80oPC26qh4dNbiDEV4
	 zKJ2INmx7d49kr+senwixTDgA9gPGq83l5/cF49PzrdLCqNvouE+Ha+WmiYLj8OrKC
	 dU+j9CdxVHZhQVKUH7O6kjJ+VhBIf79l+2ApxfqqzTxGv0BRJE5CAEagAn1trlkEMp
	 IINPxaPVm0ln2hcQtvskbJAXcyuql7ML1PdMEixjaAOt7PeSLzJnkCWSzIc2eM3CUN
	 jn3zwHUqy/VHYpOICDIObH19wIdYvRSAyq2Hbmxsbr7N/Bd7yL48J2E5IMhtAkS6Dw
	 Pcn93yG8+HVig==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sen Wang <sen@ti.com>
Cc: devarsht@ti.com, r-donadkar@ti.com, s-jain1@ti.com, m-shah@ti.com
In-Reply-To: <20260305195825.9998-1-sen@ti.com>
References: <20260305195825.9998-1-sen@ti.com>
Subject: Re: [PATCH 0/2] ASoC: ti: davinci-mcasp: McASP code cleanup and
 clk div fixes
Message-Id: <177315801605.195680.6424950053863150675.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 15:53:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-53144

On Thu, 05 Mar 2026 13:58:23 -0600, Sen Wang wrote:
> Just two minor patches that aim to tidy up the code a little bit,
> as well as fix the aux_div selection in davinci_mcasp_calc_clk_div()
> for mid-range dividers (33 <= div <= 4096).
> 
> Sen Wang (2):
>   ASoC: ti: davinci-mcasp: extract mcasp_is_auxclk_enabled() helper
>   ASoC: ti: davinci-mcasp: improve aux_div selection for mid-range dividers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ti: davinci-mcasp: extract mcasp_is_auxclk_enabled() helper
      commit: 5bebbfd64b879d1a7220233767be3274e7d442b8
[2/2] ASoC: ti: davinci-mcasp: improve aux_div selection for mid-range dividers
      commit: a8075ada4a341ce58ebf8bef0188cefe6c2f6487

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

