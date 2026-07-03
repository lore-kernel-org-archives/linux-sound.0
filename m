Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4063264EA;
	Fri,  3 Jul 2026 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106353; cv=none; b=K8BNK4DNbg3ZsbDLtBzyIKslP6PPg1//dCd5EAsG0xAx0cR7fF3Y1UObDlif/lCCeym0PNeFRtr/sFuFu5RHOIpkJdKrzNBMprSE/GO3CHUMJG/kXRwa/xZwpEJ9sMoUbt/FeJZpWfZsyCE30wlN0M+cBLiqh0spVl8h6BZhqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106353; c=relaxed/simple;
	bh=5bnoL34Fc+g4Q3ymM94IRJxC/h39tYJqWKB0c4xGYfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ckvVHC5qdGORk2FqlohubC2x7WTG0ixn9nIsdUh2cv0y5O7LBI/GpZJV1RN/lykzUhlykfk4QiAOX2raJ9RNtvqk6gdRwhnShITXlqi3JIOC36vVgUhzQPtTe0TK7P90M1XWb21H6jeCb4SEj4XkwlVucOXEerzlXSRJ80FWFBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jq/Wr5hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jq/Wr5hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032F41F000E9;
	Fri,  3 Jul 2026 19:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106352;
	bh=RzJyimwNUF1dVrJv+JdJbcLPCQubYPOuUrKjB+T3LK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jq/Wr5hhbiA3Zgsumy6vf8k7tBr3t62wth79bRvqldMuKedcnR6Ik7Aqna7hyGigT
	 vLmf7muKXhNDF8Kvz0EgFz897ssMb7iEiLPJbhYqml4GKbD14Bn6JXAVeDcm93plGI
	 Nm327Kl9WLIIcMZFJ3IAnk/1Ke7leqhnCcQ4m70uaIViupMse8ys3WwOzmUr5eo5vx
	 aPp3MRClD3q+tOo+318w+qoi2NlmudS8gUQJ6zNZtq/nwdmPGYSsWxmgLFhsIGR/33
	 orTzlq8NQ6oG1K2Ml9CQAi+dTu9Ku26OdFh1WE8TzBv4cJPSRxHS2k55P3xLBRXA9Z
	 g6Sk1q+UeqRpA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 00/16] ASoC: SOF: amd: add support for ACP7.B/7.F
 platforms
Message-Id: <178309681808.182374.1529641210373313366.b4-ty@b4>
Date: Fri, 03 Jul 2026 17:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3370; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5bnoL34Fc+g4Q3ymM94IRJxC/h39tYJqWKB0c4xGYfY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqSAssZJdllMoR5fxZ5/TdvrSwiQzyGEBeEc9t0
 3du6WZttniJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakgLLAAKCRAk1otyXVSH
 0OuqB/9H72aDhwaI1Sf0jagwXDz9SsaKDUJdAmTslBgD7luIxNT5cigQSEl5zg66zjr3xUgELyF
 RmoeZs4P4GkDY7O9trzfLDRzbjuoTMm6LhIykSpnN1OXoF1myV/2Z1Px/LeSXXUgyF/StFjngeu
 O/bIw62m/HHyWf3bCwY8aX+7DuUvXGwOZH6vjBgK8H0y0QXsvsZwajBZcDfGxWEEsxZqJ27ZBRd
 JooE6AvakPpRjohBzr0aixB1mt4CTkm0AXrhwKQuJMvEHQc6nc1VlGHkwvmEVY97HF6Muv40I8M
 4Pxucjtpq2RvjHIVIRPHGt9ds4+FwIk+OhYlzDCV/3CwUuGD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 15:25:01 +0530, Vijendar Mukunda wrote:
> ASoC: SOF: amd: add support for ACP7.B/7.F platforms
> 
> This patch series adds Sound Open Firmware (SOF) enablement for AMD
> ACP7.B/ACP7.F platforms by introducing a dedicated ACP7x PCI driver/ops
> layer built on the existing ACP SOF infrastructure, plus required IPC3
> topology/token extensions for ACP7x I2S/TDM.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/16] ASoC: amd: acp: add ACPI machine table for ACP7.B/7.F SOF driver
        https://git.kernel.org/broonie/sound/c/ec2332472f58
[02/16] ASoC: SOF: amd: add base platform support for ACP7.B/7.F
        https://git.kernel.org/broonie/sound/c/0ec5afad9d31
[03/16] ASoC: SOF: amd: mask ACP7x PGFSM status poll
        https://git.kernel.org/broonie/sound/c/237efba38c4f
[04/16] ASoC: SOF: amd: refactor SW1 I2S error reason clear in acp_irq_handler
        https://git.kernel.org/broonie/sound/c/571464f543f6
[05/16] ASoC: SOF: amd: add ACP7x probe and remove
        https://git.kernel.org/broonie/sound/c/78d99c2c5eee
[06/16] ASoC: SOF: amd: add ACP7x IRQ handler for DSP IPC
        https://git.kernel.org/broonie/sound/c/a3674345f902
[07/16] ASoC: SOF: amd: extend signed firmware pre-run for ACP7x
        https://git.kernel.org/broonie/sound/c/cbdafd2acdee
[08/16] ASoC: SOF: amd: require full ACP header for ACP7 signed firmware
        https://git.kernel.org/broonie/sound/c/d6869ae07d21
[09/16] ASoC: SOF: amd: validate SizeFWSigned before signed FW length on ACP7x
        https://git.kernel.org/broonie/sound/c/c04de2d88c0b
[10/16] ASoC: SOF: amd: add post-firmware-run delay for ACP7x
        https://git.kernel.org/broonie/sound/c/7a81f54a0483
[11/16] ASoC: SOF: amd: extend configure_and_run_sha_dma for ACPI signed FW flag
        https://git.kernel.org/broonie/sound/c/d0c32fdc1907
[12/16] ASoC: SOF: amd: wire signed firmware load callback for ACP7x via ACPI
        https://git.kernel.org/broonie/sound/c/7af6ac41cd47
[13/16] ASoC: SOF: amd: load ACP7.B/7.F signed data firmware to SRAM
        https://git.kernel.org/broonie/sound/c/deb631c3f387
[14/16] ASoC: SOF: amd: add ACP I2S format field and topology token
        https://git.kernel.org/broonie/sound/c/08c5e98b7b5f
[15/16] ASoC: SOF: amd: add ACP7x I2S DAI type and topology support
        https://git.kernel.org/broonie/sound/c/3805b8e6f932
[16/16] ASoC: SOF: amd: add system and runtime PM ops for ACP7x
        https://git.kernel.org/broonie/sound/c/1c9646f3180e

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

