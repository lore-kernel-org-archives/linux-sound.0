Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A04265298
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 06:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174264; cv=none; b=IF0qGP6GKvNlmw7bXDB0KIybJU8ZQM6JHREr4JB4E5pWe3JhToobp1YrPUlOibHyBqjXVkkdQL36W4b4i8twe9jedrs2jkGS1TFPuRCCc0leTzLwNpxKPq38TphU9NAR4EJ4u7likBvi/qinwht0UlvpGeTESrwd8Ej2HQHb+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174264; c=relaxed/simple;
	bh=J5KH16Mdq4vuiDiXJIyoeFyltYbNInxMgV2XLUhparM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T2htls/8381j9IWcZRWhjWoJoJ3o+pOUXXJ4GHmTPWF/7DiTrB8Rs3kTCEj7YBK0reU677rlQxtYsZ+9eBd+AnrEpWYxhqsKOPcbYsmrFkNMTVyz6VislI20K4O+eaxyIKQCyenUWx41t+BOsMUvKvKME+kuN09EZdbhAcpFWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THe1sS8Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THe1sS8Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB30C19422;
	Fri, 27 Feb 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772174264;
	bh=J5KH16Mdq4vuiDiXJIyoeFyltYbNInxMgV2XLUhparM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=THe1sS8Yyjoz7JIcVYOrbJxAyqKuhvgN9fUs6r7hLcTxqFGD54wo730lpOs08kbhv
	 0DFvXWckspuXDXrCG56+y8WXjS+1z8rlU0lAKcwnyHStvCCHddsmz9jza9y5ZGEOfy
	 7i9fkafkkAgEqNSSfMDyzRHaeyYSnG4QNPJvuZCAcEA9nhVxtqfUfNXjrkjxMl4P89
	 oqRHgrzvqd8MXZUKEqjqrEFCFQypztokhh4mimSigakmjhk7mjlo+02cFq4vx4QwBh
	 t316w1FQT/vMFMMVBroQYeT80xvBlLn3B/lq5F6EkP2KLDXPD+XMfZBLGOKCqnY/QK
	 YD6UPNefzSWNA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
References: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] SDCA Improvements
Message-Id: <177217426324.28674.4204621642385459066.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 06:37:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 25 Feb 2026 14:01:14 +0000, Charles Keepax wrote:
> Another fairly mixed bag of small SDCA fixes/improvements. Fix one DisCo
> property that was treated as mandatory but is actually not present in
> the first version of the specification. Fix the counting of routes for
> SU/GE DAPM widgets, this currently makes assumptions that are not
> guaranteed to be true which can result in too many/few DAPM routes.
> 
> Then finally a couple improvements to the volume controls, simplify the
> mapping between ALSA and SDCA volumes and pull the volume stuff back
> into the SDCA code. It just wasn't sitting right with me that it was
> being handled in the ASoC core given it is unlikely to ever see any
> reuse outside of SDCA.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
      commit: 1bbbda5b178a1399339139eb3c326300008b72d6
[2/4] ASoC: SDCA: Update counting of SU/GE DAPM routes
      commit: 1fb720d33eecdb9a90ee340b3000ba378d49f5ca
[3/4] ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
      commit: d4f7d5a9a0f963dc895c18084425ce332a80d3a8
[4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops
      commit: 501efdcb3b3ab099fc0ce2f6e668b1c4095dd476

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

