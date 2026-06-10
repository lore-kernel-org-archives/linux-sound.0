Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6058356759;
	Thu, 11 Jun 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169857; cv=none; b=X5F3BZMJ9v40d+EJjFMFde7OjlbwivJtrfT+0LRpiU1xm2p1AyqIQO1TzV+eKdI7tFVeoN92ozJEtD0Nm8Deihqc/UPZI8LlfYEcyqGvpj9ghZQaaE/fnyHOTuYvAceWP7iuy+LLjlxTMP+lWbJem9r9pH0Dx9G6E27uPJDqsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169857; c=relaxed/simple;
	bh=5lD0xvlCx/UgbvTDuHONjwurbZrJWF5vtslIkEydUyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jtme/1sJ2+blBeGoqd6DgfNlvxpgBjJosJ2O+fNU90C/2UJEmHsZ38rc9mNADyt3WcTCwBtqfBXc21Lpq7LgO5kQifG0yrL9VVJ01x3j8SwzqV0QMM3aO2l9tm6Otwaa+8n5V73ZCetnKz0isbe3l/8lFO3QVHpMA46vBDsER4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZtDae+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZtDae+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF761F00893;
	Thu, 11 Jun 2026 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169856;
	bh=D1898Ep3mEqkd7xbKIhWDoolzPZcxEF/q6NJ5X7TsJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BZtDae+CUMD6qA3ZjQKdXhjWMkhAyzrSu9ot5tCEmMEB5XNrsnT4IqjJeKpIkbXqm
	 2zLNbw53ERrXUKYeLwKuab2qI1RId+JCRg0u+vUM8we+ci8kCQ5aHfrVilF31oukn2
	 kciHmur+KOKNkwwM3FHfvWTkRLPwoxgrPF7GXS8cNSCAX7Arnlg8FxSeTV9KncHkAq
	 7qCDtLJNqNke+7LoNVtstVsTndTLa42iFTCII+2YDlvGSP2j4gAnJZLJaFCICJzvuQ
	 6vBLg+ouF1ukwXcy62AyAsK4pqGQYw8CTORGri2fKUfLaA2zFgmAYSVvK4P8Ww+oYr
	 C3Wnj6DZrkJrg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260610093432.557375-1-rf@opensource.cirrus.com>
References: <20260610093432.557375-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] ASoC: cs35l56: Fix some cleanup memory leaks
Message-Id: <178108709087.232889.2383937614253167965.b4-ty@b4>
Date: Wed, 10 Jun 2026 11:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5lD0xvlCx/UgbvTDuHONjwurbZrJWF5vtslIkEydUyc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn6+dDnck982S8rFRGYDwI+iNE0lncHyOA/8z
 NNCZ/QQH+mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+vgAKCRAk1otyXVSH
 0AbRB/9vwyBTCB5bW3JKt/+baVLLX19dOJ3kJtvqqlvY3Ykl9EhggxeOn1odpvirnFRR2NIoaPf
 2WX9HIPTuWw1tqzmyXcqYsAHYriTn8m5ew8SXa8vktylL2Rayc80UP1nVn6Dmo30E4rpKOZoR7o
 3IgF9PJTyECkrx3+W7ZZkAD3EjiMijx/ywK5ImhdCDqrNzDPd3rmmXZelwOp6vcuATy7j1HjZzf
 bWZm0/5nh7CIVDvpP2pUeGYCzhEYh+DdOKS42sZZf1/0Vn7/0OhlIRUYXLdsNtcgpXwxzpj5fZi
 yQ0WeUSN+OopxYEGY9uqIpkTWrOk+VaJStudSyDTp/3zwmEj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 10:34:29 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix some cleanup memory leaks
> 
> These are for-next.
> 
> They are not urgent because it only leaks memory if the driver failed to
> component_probe or is removed, which wouldn't happen in normal use.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
      https://git.kernel.org/broonie/sound/c/85f7bf03632b
[2/3] ASoC: cs35l56: Prevent double-free of debugfs
      https://git.kernel.org/broonie/sound/c/344a12ca7ba6
[3/3] ASoC: cs35l56: Cleanup if component_probe fails
      https://git.kernel.org/broonie/sound/c/a0df7522dfb0

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

