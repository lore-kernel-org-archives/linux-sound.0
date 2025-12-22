Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA986348
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426572; cv=none; b=HngxG8QirtHxqeJw9r/UweE2PxG5yoJm17veWz1kWzrSzOtxyB09dh9Rv0ieXQL7gRKSuda2gcj6o/Co0MlcTF+IjZit5qeLjNTL5URXuiir3jiqA1JjMqk1u38K1aNJbqSWyEhRpnFCNesetd/bSjb+CKWgtFTvc1kmH/aU9Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426572; c=relaxed/simple;
	bh=uUuG3b9GVEH9qbtvX7Ynr/H3FqRCV8AYX5ntSw2PDgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YLTVoIqDg46Sbbr4GLyTs2OXL+NZCneFPolSycpWqhRB1eqR7B0VwDUERNX5d1B0Oc8CLEAGIeQsvhPATg8qKhMh/02xTEazg891Vrw+LpYMdlHitTBUCUg23SAj0ic6ttJYUxh0lsax9GGQ+deSzA9f6dKFCjCDGCNuETIp7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFkKZx6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFkKZx6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFDFC4CEF1;
	Mon, 22 Dec 2025 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766426572;
	bh=uUuG3b9GVEH9qbtvX7Ynr/H3FqRCV8AYX5ntSw2PDgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tFkKZx6ECc7Ll9rd90Pnd+fM+57eILpr9bFOmvF0PArvJkvQHDYKTEGv/qoNIc2+5
	 wsdqjYCjqlB3E32+xjsrqnGmLb6RD1L7Ssw/WSwi9E5wakwZOUajiG5NcSsnVm+uOX
	 KSkWl6F0xYfrOdkr1xdBaeBLRmqWzhT+ha+ixLmuGSdtcxWdYai1ISkp4RkDMx8iBP
	 VuQWgq4ZnXwD7pO1g/8nUvC/LRddb/hWiLxYVSsCChMEkR17D8qUeMNPC4VgREdiMM
	 D93hQp6pXH/uDb3LqmETNKuLb1YKBj462xvOpKwDCOEZkLkwlKf0LgQYAFBe6ZskAS
	 /PPIfFABaZcgA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20251219034902.3630537-1-yung-chuan.liao@linux.intel.com>
References: <20251219034902.3630537-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: shift SSP BT mask bits.
Message-Id: <176642657050.929385.5085067636600725123.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 18:02:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773

On Fri, 19 Dec 2025 11:49:02 +0800, Bard Liao wrote:
> The SSP BT mask bits overlapped with SOC_SDW_CODEC_SPKR,
> SOC_SDW_SIDECAR_AMPS, and SOC_SDW_CODEC_MIC BIT[15–17] in
> sdw_utils.h. Shift the SSP BT mask bits to a higher range to
> eliminate the conflict.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: shift SSP BT mask bits.
      commit: e4ca5ecc3c411f2fe970369f55bb72ac96adea85

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

