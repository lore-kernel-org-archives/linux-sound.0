Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F82ECE92
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996723; cv=none; b=o+hG95woO1zOr3qdbDCzs2C0j2OPMgtE+Dht7v6MdFptmlbiywTg8BB078WNzAdxBLsWjV5fgyhPZJAf/xOOzvhszUPoZ/hnTDdJPUtkff6RpNVKgNVJTea5QxRo5tbDOZmzj7FMbErLGsdgl3WFnP986YJdwKx9/0C0FqDhI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996723; c=relaxed/simple;
	bh=3NY8EgJEitnGvKmo0I/Wr2zojnWYGxQv2e2I5F3QIBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LW4DYqfd7XGGCiHvQSaIxI515Fgm66pP+ZSPPl4RfPPvEt5RNkWzkK3e6c4IULxbSuEoNOQ2oPK846H/zkBoI/+3d36mXB47BitXVhBzmEyLfk4aFPjz4ux1p8Dpo62g22GWkf/oAo+X5McidlktGzNW5NxWOje9q//cNfEv3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbR4uPYa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbR4uPYa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C7DC4CEF6;
	Tue, 12 Aug 2025 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996722;
	bh=3NY8EgJEitnGvKmo0I/Wr2zojnWYGxQv2e2I5F3QIBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KbR4uPYamIwiCeKWZzlk/qL4+tN+ognt4YNQijDhAHG1AZ5V1X/ZiZC3cT+ahOvYd
	 FevyTPXYDhQ19CoiEjSYUboeeSG4DOUkJcrBkt75EZIqzPD4NH/c/H7oVpYjSss10H
	 VT6EXkOxnJcy+BlLQFIj2CMEPJK0ipoQqa/EP+yYbilOn9rmhtzaL4FLaRJEZ7X6by
	 So1aeyhDUECUDaROO26lzzlXOi+NNdw0FH3v5CSHYxCCMahV1I+Ch5EkNHgiJqpfF5
	 d6dPrFB8bJrhiZ0JT39VLsyf35WdTHOmw/UPTMSgt3M9b++8IcHMIgz68y6djFMu9s
	 Ai4H3vGmBA44Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250808055719.1110808-1-shumingf@realtek.com>
References: <20250808055719.1110808-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: rt721: add some vendor registers
Message-Id: <175499672102.16031.10403857802144414556.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 08 Aug 2025 13:57:19 +0800, shumingf@realtek.com wrote:
> This patch added some vendor registers to read for debugging.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: rt721: add some vendor registers
      commit: 2399f3bd31595adfbc9bf38d6699b0a2ff36aee0

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

