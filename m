Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91783A14
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754609; cv=none; b=jnlhOXrtXQlB6EgXIEVQLFBaMQ3aifI1T7PVClJHEQnwEDL+749m0lRIdlAK8ZxArtawi00+pJc9neKEz4jRfE0ymisOzBbE3+z3nFVzoqpE8kLKG25fHHT9PUMlQNss/CSNWc0EtyU/8F4UsYuiNNGlEdh7zOVE3gbhDIzSv1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754609; c=relaxed/simple;
	bh=ORVmZnLHc+E9zxiN6lUz41CM6+S+9Ho+kIyCPQMWlK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=opznilHCYlokPDWde8KmuDm8tymtk6LDeyRnY/lcIppiR/9WzMRdKQwnyledHQq1lI4G6BcBkaUlsODJTS2Cck9LEfCBq+jp1I+VA9Hj55NXtrh1lVDKLjWsa2gL9UM8zoZjIyTSUDvKmWfqPpUujnvcCuIhKM7xZyJTOK0L5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjz7U8yE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjz7U8yE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76289C4CEE7;
	Fri,  9 May 2025 01:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746754609;
	bh=ORVmZnLHc+E9zxiN6lUz41CM6+S+9Ho+kIyCPQMWlK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hjz7U8yEq30oJkDFvPG6qq3CUKVzHFyGRLC6+7r0H/lB6f8SEneLthHlvr7WC1esp
	 CqDxXKXLKST5Z8ViwzcVwnnUZo9WD/tw70cU4nQ2aCvc0Ww1aLPDRF7juqkrcMQYvG
	 XR/iaN8XjGO2oU3DRIElHvfNptnOchsB9Y1x0HbTUgVzvxLa0C69Dan5f2T2isXjuD
	 81GcydaSIdNpcnCLmRirQupMkex4RS7IHZ3tXeJD1xj2hnxei77OPyw+ldWGJyHCum
	 6g4HtR9s4fT0io47nMXTWy5+zw4b6WB8IEKN6Afcks+kmNpUPcU5P14nkjv2midl3W
	 Us6VOYg9N8Cqw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250507062812.46401-1-yung-chuan.liao@linux.intel.com>
References: <20250507062812.46401-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Add
 rt713_vb_l3_rt1320_l3 support
Message-Id: <174675460825.17552.12055211381171964684.b4-ty@kernel.org>
Date: Fri, 09 May 2025 10:36:48 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 07 May 2025 14:28:10 +0800, Bard Liao wrote:
> The series simplify the variable name and add rt713_vb_l3_rt1320_l3
> support.
> 
> Mac Chiang (2):
>   ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
>   ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3
>     support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
      commit: e79cc43b4833d9f5651d64ca313edf598df50053
[2/2] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3 support
      commit: 62a5897607747e63c64a8b7a7fc212b9b29c2a7a

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

