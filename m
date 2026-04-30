Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD53B47DA;
	Thu, 30 Apr 2026 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593078; cv=none; b=d/7s5L5FQjLktgt0U7Nji2cAgHPWaT9YM0eyu2H5OQXRffunM8PUTcDJxnsJ+1W4aX1vnDZvaiZ7wCsMbnJyonaYSGignIV5NhmYPKqOxAHICJT0xrBesOe1ln6pJc0T57J3aDOPXPjt4eFqptlKbOm0e8c3BLX+l5IMrrRVjz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593078; c=relaxed/simple;
	bh=JvafTrDOUTNbsv8vnx7ex86phNvggiWY6OT9/LP5/Nc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qnD1WrSVfsuoFvPpM64tFrUmR9PhjSABCuPnrOTT3Ycz3zMDbz8LWh6ZM6cUbyMfwDJM8CBLqeppo442MgVXsEGwqb6HPLYdTNeI/OPFbiRHFKttWC0bqZe/Izt2ngabrCez7UM+lcgj2ropZc7dgKB+CfNG7PpdIyJjbDAMtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db15ui54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db15ui54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA70C2BCB3;
	Thu, 30 Apr 2026 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777593078;
	bh=JvafTrDOUTNbsv8vnx7ex86phNvggiWY6OT9/LP5/Nc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Db15ui54483FZjnBZlbUr3eO8etE/4h3okqw9prbMX+bIHls1vUacTn4a5hB2AS1p
	 V+CdHi9+VEsGUJ5hlEeeFYdWiMRMiCko9HT047XU0DjCNu1zv23TOaHiBAoeyne19c
	 WoQy6qm+pRZ13rOvszGCBVNCAjeXizo+lerdRKhy/pypuEUuSMdeRwW2aFzfsrjbcV
	 GttKP0ZmRGoAsq0Aa89wHducoGxsa5KfOzt+JuoGJcbnxy9ihW2/ePliHpMldwUjPH
	 Pd2+lnx+Hgp74Ia6lbuWza2XRDuq5xgjLnl4ALkasLRruTVQIKxQ/gUyUhpIWkb/5O
	 cE8+WkgY1nSZw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260429100028.2739711-1-shengjiu.wang@nxp.com>
References: <20260429100028.2739711-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/5] ASoC: fsl-asoc-card: Add some improvements
Message-Id: <177755089814.458539.1076703312564291362.b4-ty@b4>
Date: Thu, 30 Apr 2026 21:08:18 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JvafTrDOUTNbsv8vnx7ex86phNvggiWY6OT9/LP5/Nc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8+ry5p1Ma8K+HKR46uX6X8vXt0kIWBUXHkhhY
 KgGK69uXYOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafPq8gAKCRAk1otyXVSH
 0NYYB/9uhp3a0I/QRWCOUBDCuS5nPeizCw0iU4HnFAUasL/nl8C7Bsz/LlLkaLndjl7Csw3gvBC
 snPLnSziSlAm8eLfBtY9cv2hZCEpFth22hreez6ipJGeosvgzbGizrk9zG1vDJAPzzUJvT+KIUT
 adzso8aIy6AzOQ7RPBFTZpDjXYtZ+edyByLPx80o9DWzb01nCB3Ohkl82+mvSSU72jJFfWXOa7Z
 JAFlx3MVfvg298MNFLdj51W3ibocimdAf6xpELUQAKsBTpsDkVjtyIZM/IPKrwtZhlBMwBHfDRU
 c8OoJoa3M/j0Oz2M0Kyjwj0K9EwM3MJix9i4nwHzpbyvhWXq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 18:00:22 +0800, Shengjiu Wang wrote:
> ASoC: fsl-asoc-card: Add some improvements
> 
> This patch series addresses several issues in the Freescale Generic ASoC
> Sound Card driver related to hardware limitations, DPCM path switching,
> and codec-specific constraints.
> 
> The fsl-asoc-card driver provides a generic machine driver for i.MX SoCs,
> supporting various codecs and optional ASRC (Asynchronous Sample Rate
> Converter) for sample rate conversion. During testing several issues were
> identified:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/5] ASoC: fsl-asoc-card: enable dpcm_merged_chan flag for ASRC frontend
      https://git.kernel.org/broonie/sound/c/3b9c088aeabf
[2/5] ASoC: fsl-asoc-card: enable ignore_pmdown_time for ASRC case
      https://git.kernel.org/broonie/sound/c/d611feb52de8
[3/5] ASoC: fsl-asoc-card: add channel and rate constraints for CS42888
      https://git.kernel.org/broonie/sound/c/e78abe395d30
[4/5] ASoC: fsl-asoc-card: exclude S20_3LE format for WM8960/WM8962 + SAI
      https://git.kernel.org/broonie/sound/c/fa7d8ea56c58
[5/5] ASoC: fsl-asoc-card: reduce WM8904 PLL ratio to meet frequency limit
      https://git.kernel.org/broonie/sound/c/99b5316f08f3

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

