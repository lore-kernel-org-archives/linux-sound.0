Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6383DA5BB;
	Thu, 12 Mar 2026 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336880; cv=none; b=dwV3DX30OywCRBNeWsOY+GAIeWfiQz26Gcl4U13Wg8sxrKhjXu2W7wf0W/SVYAZdyBASzn0Vtad0uzz/EzXKFheC9NWm1/KIUzYzYxWyE+MKIGIOAf7xklAT/srJNo/6HKfBsjhXoyOYLFurkw3C1T6xyE4exAHPUTPVytDzybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336880; c=relaxed/simple;
	bh=z6Fq0etMM8i2YpRnzMdU0704l0z3mVS1tUc4Te05Uug=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GgX4QZm81dK+iL+B3cPlI4zKS9AZ9XmRtYHfKScjJiFlzruX7b5fb3mRUR4ZXo237Ippy61pYMgozDlGJayMG/gZxWsu+IZiRJTyMu30b5hJAjaOPS42ubkR5tjHQpSf5wFAWugPlbDuwImKvAxcRj+hG47t1XIIJlOk7NFFLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNVL1ATb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNVL1ATb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A52C116C6;
	Thu, 12 Mar 2026 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336879;
	bh=z6Fq0etMM8i2YpRnzMdU0704l0z3mVS1tUc4Te05Uug=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=oNVL1ATbmTIdlOOGC0UgD1s6/IC+H09jQHpw/gsAInCpnp/fVVlo2LFrxAEKaIGha
	 cjPO58Vcqe3ke5xaarbpsvlKQsto3MS3Xilbnr7+jd8/x2PCAlmfe+P/FwQFFRstLJ
	 cEw22itZRzTJyXSXA76N/CYYvT/zJWO17f13nRqJj2gfHW0LTTdOObdG1fjqMzc15T
	 qvq8lAeH8Vzp1oGGgtoyJvJVmvDegcS4bR/bRsUP7tARNvptOTRYNvPCTRv+0zAZ5C
	 csJK5q2YTNlqRtYY7XAIB+IZfk7P5iWRVKDFoJV/KQaCpoQJxqJzX+9DYCouNsBtmd
	 V/VHjFBdJvS6Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: fsl: add bitcount and timestamp controls
Message-Id: <177333687761.302961.14700206340087655757.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Thu, 12 Feb 2026 15:22:27 +0800, Shengjiu Wang wrote:
> The SAI and XCVR have the timestamp counters and bit counters, which can
> be used by software to track the progress of the transmitter and receiver.
> They can also be used to calculate the relative frequency of the bit clock
> against the bus interface clock.
> 
> Changes in v2:
> - remove arrays of enums, define transmit_tstmp_enum and receive_tstmp_enum
>   separately.
> - remove __bf_shf(), define the XXX_SHIFT macros.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_sai: add bitcount and timestamp controls
      commit: 8e27987a208029c39da7a787bd9f1217d42011a5
[2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
      commit: 7b3f8db159f710d432c4edc024fcefa9e62e8b4b

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

