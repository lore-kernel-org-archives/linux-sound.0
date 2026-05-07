Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A642E000;
	Thu,  7 May 2026 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164944; cv=none; b=m0X9GfeGQiQ6fyr1ID5ciSQgoigIptGCZVTTenw06ME+7wXiU+V7v9wW7yLyswxWUP2SL51mmSSVvS7xvdHVvG6TkyZapEq5dmsxUP/sz8FEtmbHcDTYwQ35W+uwoWOjNmyRHNpseS7UnM2rqkjDg+qPm93xsfc/CxJe3lysGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164944; c=relaxed/simple;
	bh=F8FUsBTChhbtW+jnaf3SGaaLyHcHa6Wt7MPWu0qm170=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dEWuz3oS1+ADsRJYIXmQBVxqIF0fRUPg0T4UH3cmN5qLDi1u0YqDAbQMjYXi4DCc+Hpz9TQgN9XzDcnIj1PjNDa2MyXKg7JA+6uC7l0ea0cRbBrPOdipHUe5hyO14zfR9jO431gSk/5ZvETPlJUK5iXfI5L80sIzIN1XOv5fUKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjahGCcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjahGCcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECFEC2BCB8;
	Thu,  7 May 2026 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164944;
	bh=F8FUsBTChhbtW+jnaf3SGaaLyHcHa6Wt7MPWu0qm170=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TjahGCcyW1Kc+Vb69KfomUhqOexwGa3PHitkNCSg7HlyCgPHPtoRMS3qng5RH76Ex
	 I+JS4ig9PIpWcUZIU/d4DZrnMHDVp3Ha1iVFvNuVtT6qPmp2QQDIqesJqFe/41Xv2N
	 mkM5m2yW7oQLG6JCUFT5xKzDEQQKY/qhkUpB3YqRLAuM44QU3K+pAI7VJNW5GUQpf4
	 irtbGJkzgWW6I2LAJshzBmCLlnpPy+CQg6jpQeBd+itDRFLR7PyK4BuLI5WDmuBD9+
	 xUHpWJRhn+DFW3jlJMXavhmhlNmT0LvIkIahP7SvLLo/zNJMNh8Ui3L7wBLbibj4xW
	 o32GHLxLQe49w==
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
Message-Id: <177811863743.749715.7117742151070769797.b4-ty@b4>
Date: Thu, 07 May 2026 10:50:37 +0900
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
 h=from:subject:message-id; bh=F8FUsBTChhbtW+jnaf3SGaaLyHcHa6Wt7MPWu0qm170=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp/KTMVm9nihyBieNgZRUMiwOCoR5WLaWos3KvI
 HFXU8YxZNGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafykzAAKCRAk1otyXVSH
 0Gr9CACCj6X8LHNMyjXU4KLvuLUjJrCt1zQ0YBFnQWeKn0ooNy5wKPYPJ6AVSyNAn7S5qY/mTBZ
 KU1hxUAJqtqtYcEToy+jqt/xPaaxejlRZebDbvJ8/0Dz52mYAlIt/rjjrMWxHrV4Zp/8iQwi06K
 SwGzP0I1lZlz/zcvIdd48AYrP+P1fes98SqfKrYkqsm/C1X2KzaUIHKFFa6lt6xyZ3cyjzlebFG
 Mgx62dwhip+G2m4MUX6knWA+3NBNRd1zbAbDeA41ymSsWVaWDf4Gy2Yxljelwu7+8qhuC5QNOgt
 A53mHKBBPWWaFoP4Yj2mpKr9mXxE1gr0MlfA6lCTNc4HRRdI
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
      https://git.kernel.org/broonie/sound/c/ad1d77ef21be
[2/4] ASoC: tac5xx2-sdw: add soundwire based codec driver
      https://git.kernel.org/broonie/sound/c/6138388fab2b
[3/4] ASoC: sdw_utils: TI amp utility for tac5xx2 family
      https://git.kernel.org/broonie/sound/c/de14cc57efcb
[4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
      https://git.kernel.org/broonie/sound/c/8f39fbbfb11f

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

