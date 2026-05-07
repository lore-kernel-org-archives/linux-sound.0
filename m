Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6AD4218AF;
	Thu,  7 May 2026 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164951; cv=none; b=W9pvE+QUczqewBOolZMMwPoqpf5FpA76xfN6ubJMuUsPbNbQ0rainRuVX2V/rPX7URFu94vEORCEQ91in5+vOMUoAMX+xzKu8c8pputyUTaKtCnOYnl9OgRRv9/n7vspqBHuW4Cxhnd8cwgBsf1A9XnmgQD/aqq1B025mLM8cSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164951; c=relaxed/simple;
	bh=OiM48Fg1O60H/jDY2aSQRVbG0YHXySgF3JRXtKETUSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pIEP3aN/r9hqKl1NYK9Fm5wiCluevgRDGanpf0jbpG796HQEMnujYLsbMBp50lfiu5N9CxwvqIu/WRLDlPCYNeUiKcf6Cjzp11SJKi06V/WiFrhnSZn1/xEfaqw5fe/ijHSdL5wM65pJkvzQ3MLgxO55mVtMzAvu4iZ3eXAkz2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJiJXYJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJiJXYJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89EDC2BCB8;
	Thu,  7 May 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164951;
	bh=OiM48Fg1O60H/jDY2aSQRVbG0YHXySgF3JRXtKETUSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oJiJXYJPc3IyEL6kF32gnC1OdIpKqtFSDWYaXmkywIqQMwKpL0clk7Nz9H33LAGtY
	 WLHd3Gz2ndmBglOhJ9SCWcoR85Luoi16GgIYCAAHlmvWyekYVo+vFfKxmdKktUtGj2
	 TjiDpV+Ejd45EMr+pb2mxE+bZLWbtMbZ/cksMo0cJ962FDEzk7FGFEAaVCakScbRei
	 ek1T2qxJRpq0qyvrhWUlScrjkLZZlqrWVZSpvCHmkNCUNBEiaCX1aoJ+LeyQwWhrRO
	 hUw9GuuNqhcBGQTuIUjCvAAvoBiXOAUbP+HMFsmGpEZJamYo1zb3LLUzi1efUYCHgH
	 HPgTDTwF+S8xw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
In-Reply-To: <20260505111806.2280-1-niranjan.hy@ti.com>
References: <20260505111806.2280-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v16 0/4] ASoC: Add TI TAC5XX2 SoundWire codec driver
 support
Message-Id: <177814192414.749715.4327246028574683296.b4-ty@b4>
Date: Thu, 07 May 2026 17:18:44 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OiM48Fg1O60H/jDY2aSQRVbG0YHXySgF3JRXtKETUSU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp/KTS0Cw8vmSPq3Nn7kVCl4k66hiRSvqfXYD2c
 1JjoGBWSBeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafyk0gAKCRAk1otyXVSH
 0HcfB/0QB46IuZCbPzN9e4oP8mhkPaVi3oDMHnbZ8ILjcGByyYK8mk55yRY9cQQS8U7/jADdyeQ
 IxAItl66F6bmNaUA+KSWnMHGQWJa17y4/MxM54lIQkZ2RQf7w4QUs0W1gFwu4bJkQWJdO/tqUy4
 z9MbKz3+VtEhLTmbAKIem+yIEsEFjZoKt3w4y6b7kOdE1a1mkERcyoxzm/+wNu9JwO4MEphdayN
 7OXVATh9aeFNV2EoL2jYHTe1OZUfbpwlNTTIon6W3OzeOsD/FuGb3glxOamwvwVWK9jpgIvTHhu
 lLJ8VJSxrMHSrZ8oUGvL+u5S4S4YnBB5utOUd4K8O4H6nXGW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 16:48:02 +0530, Niranjan H Y wrote:
> ASoC: Add TI TAC5XX2 SoundWire codec driver support
> 
> This patch series adds support for Texas Instruments TAC5XX2 family of
> SoundWire smart amplifiers, including TAC5572, TAC5672, TAC5682, and
> TAS2883 devices.
> 
> The series includes:
> - SDCA power state management helper for PDE verification
> - New codec driver for TAC5XX2 family with SmartAmp, SmartMic,
>   UAJ, and HID support
> - Machine driver integration for Intel SoundWire platforms
> - ACPI match entries for Intel MTL platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: SDCA: Add PDE verification reusable helper
      https://git.kernel.org/broonie/sound/c/cdff2e6ab890
[2/4] ASoC: tac5xx2-sdw: add soundwire based codec driver
      https://git.kernel.org/broonie/sound/c/38c89fededd5
[3/4] ASoC: sdw_utils: TI amp utility for tac5xx2 family
      https://git.kernel.org/broonie/sound/c/e812de61e9a0
[4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
      https://git.kernel.org/broonie/sound/c/c4e19a93df81

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

