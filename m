Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6344E386C38;
	Mon,  6 Apr 2026 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488987; cv=none; b=J3mPbXvtlmDGltrdZGjL1TsLlodrFuicZdc3eRBo6kSAXN96yWZBvxn04GuTc9cvnUDX43ZFM52Ib3QX9fwgcS3Jw883/qMr6L1NFfrxrubd1CyeqoHjpD9AFZlT8O6kYIThmfD2HgT6VQm634JD0q2dMz2V/DiPshi0mPOXF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488987; c=relaxed/simple;
	bh=zgZCSkB5aJYlh3LHp3sDNJxAwg4YvS7v75HOdj+bCs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M3UmCmSiEYo/AxQIfwVFHzlSUmCPpIbw8zJXaCBjFI5fjynVEFEgaABgR755Cr7C9Q1dSMnJ0/NtcsjMRU7GjjMsIMT28M4DS/BLcnXR8wJ0qx9jEocdHMAgGjSz+u0ZSm7wj948+yMU6TgK/13g1bF7r9AvvkgoyRQCKKdpsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCNtxa/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCNtxa/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F27C2BCB0;
	Mon,  6 Apr 2026 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488987;
	bh=zgZCSkB5aJYlh3LHp3sDNJxAwg4YvS7v75HOdj+bCs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CCNtxa/4cKGMnBYT5HtIqDuaV1V+uThhruADOeXo2DpFZj403ForByc/eVR+JTnuk
	 wVKTkd+FEBRinPVC5DRmZpiDnQVDNFlvTS1mYCrb7GQPXFHrylEtYNdiUT3pyEtb5z
	 vOmxG7wDlPtZVaX2nsoMsoAcRCUpTz75DTtbYYdHqzoy73UYmYCUvveDGNmpn/wlKw
	 SfNvL7384TqcUXtAsWIU4eNIm1D1NPlpYp8L+kKlO8MF237QGnT4zFA+EmY9gML3rU
	 bAQoFFu5DX0uSfwY97B+LOtSaDL1dycUgVnAmHtYFBIaf/8dLzUwF60mK5WpZFgjQR
	 CveHvJG/oXB4A==
From: Mark Brown <broonie@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260403010336.1223078-1-mpearson-lenovo@squebb.ca>
References: <20260403010336.1223078-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for
 legacy SDW machine
Message-Id: <177547746630.46304.11552848355240705769.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:11:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zgZCSkB5aJYlh3LHp3sDNJxAwg4YvS7v75HOdj+bCs0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/YBOa7yvTk2+FcFAEtZkfYlAoDE7nTxi8Gu
 5DPMocWfH2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPP2AAKCRAk1otyXVSH
 0AmTB/9ReTlnApeAo86wruadeh66C5TZk9XFyyfAZ/rH8vs4fH/ks9fEsE0oAsig/QR71qssZQ5
 QxoKd14xwUaEnf99YmZweMCPC95U7TyIqfcl1FJpIe7VhekGiiHpNEoo/Mw6eFITO/FItf8ElMl
 ysqa6OO0Wqbpr+Smu13U4chSmrNsrSxeQhFmj8MCQ/2FYT8yrHdVUIWDZ002MkwbNVyuIC3hNnT
 z1ayARvuqrTPzZNc4jIZb8N6h4/ycsQVQ+lUWe26Z81Mpdh3vrwYZLWP9aSFmAdp11g1y8HJXFG
 VCZFCfDSH16Ka6NIuHJ9uZyUMFA8h+S+hHhJCvcpi203SBJG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Apr 2026 21:03:25 -0400, Mark Pearson wrote:
> ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine
      https://git.kernel.org/broonie/sound/c/80a7916ca2d9

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

