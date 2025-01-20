Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A214830F;
	Mon, 20 Jan 2025 22:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737411285; cv=none; b=iHveHNv8HrF2osA+YQJrL+ngIYLRCyDKqBEjizwWZsXisWhb5VsV+VMGpbWccgWyu1bi9wcLIIRnPL2DX1GXMdmy/6DZvzq/uWMsljc8r/B3XvlNLTSzS3bvNZxxVuyfsSWHgBgLcFO2Q8xfyP7Hx/2TEtMsLOFc+TzSbaMrEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737411285; c=relaxed/simple;
	bh=FPNR7tBW/dPlzjn1OZcp8VhyZfjwqjwr5bADwiGv0vM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KG7CwyyoaL0G46BmrOssp+1nwUwDYXSL9wl5vC9+ZY6qmXrcJHpMh/Y0bkP0A1hpVyz0Z495DeyOIVOn4OtWPWgrVWjYiBc1PJw4g5lkcmUx1w0lt25nlci41ilsR853j1Ov9FUqG+EZ6/KPq4qIYG8aRq2ZYQKcidmPV8WudpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J23hoFOp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J23hoFOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6028C4CEDD;
	Mon, 20 Jan 2025 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737411280;
	bh=FPNR7tBW/dPlzjn1OZcp8VhyZfjwqjwr5bADwiGv0vM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=J23hoFOpXnJW3Ax/iwnUpZkyP6q6VTHnrgJJCu324qbNYib3JnCs0IqP/qrRCoNtc
	 wn5vel0GGLtCx1PJJ5RLJ4JZoou+/lOjKa2oUo4JTcQ1aCTyvXebQa7IXPiOYH8t4x
	 YIt7slaS/k15AiEd947QUDEWoyV5y/TTMIJxuSazcbYIz4n/S4sGtlRTGdakYum7IH
	 SpoVRr2vuQPPNPDbpz0z4SZ6DAxvMmN8u//TpeYRpzz56yMk1h95txFlfigbQ9pnh+
	 zMlF9DcGAe6xZFu6XRoIE3l9cmuRAagUc/C2TsuJeBb3QuTKVZfNiRaq4xa3fVvjJp
	 J9bBnYZ4kTFzA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: two fixes for asrc memory to memory
Message-Id: <173741127845.104623.1779188125305683967.b4-ty@kernel.org>
Date: Mon, 20 Jan 2025 22:14:38 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 20 Jan 2025 16:19:36 +0800, Shengjiu Wang wrote:
> 1. Fix the suspend failure for memory to peripheral function.
> 2. Return error value for processing function.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
>   ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
      commit: d12ca6d4c31bf974ecc80e36761488f41d05d18b
[2/2] ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
      commit: abe01a78bfc8be9cc025a73b991c4e77431de9de

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

