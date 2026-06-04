Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF08478E2B;
	Thu,  4 Jun 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579081; cv=none; b=p5/DLUF/D32C+5yldmdcKQK5fkf82R078BFvjd1MsD95P0LDDUWwKonpZQDRiCNAHMly3ZycX9xHF8bFoSPu++u40HJhrYgMDc29K2wjZQpBXck89f2XlTpxFUFDUovRmR9y4v6aiIr550BojUafTUMFvhuhstr+Lrr2q+AyMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579081; c=relaxed/simple;
	bh=bOEeXt7ZVX5SVa4qNwux/LXra/9PC00oPs68mshBqZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YEWdCgvZLfyiuelgp5uzqtzWnXOJdHwwp4yjiIexGOXML4DpjZmkQaa99mQE01VcBFz82B5Mk++yhtOd/S+70uLDNZWsg2xiixXYuHpjaXnYT/fjR0TJox4LvRHjEfCBugiIcJ+RlHj6p+l5xTtiK9a+BbInS+3p5Ao+HrKIfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEZd8S4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEZd8S4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA601F00893;
	Thu,  4 Jun 2026 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579079;
	bh=aAIuoY86etK9Irh/9l3Vr/YxhGmCvib8UOQvhQd+kYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GEZd8S4s/k5Uoiu2kPdcfHb7FuaqRiqTdcclWFdKJ4w5r2VdSD/3xKe0CRoW/9eg5
	 /azA+xMQ0KBdMF6QNxVoWgA8h8AmbjbQSFRR22ucb4vSnlbh5uHOMp0gPTrB4Clqkc
	 UusLUSviFLna+OrYQt4fYFG0tiQ9e1oskbuhdPw10my0NnlFKj9bYTEzor13TgCUCr
	 MjyQG+MYAExcd46ueszrz0w80YiSRuxnOslnKw/Adef/Czao27/1JwMsdrXPwTAk52
	 +YalSFg7g7Hgx5Xvmnzg9h6jXedgkkiBdoP/CL+91NezwsvXmHQIeTBI3pGYPnuHp3
	 +7HwH0zwvbbtg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Aleksander Pshenitsyn <brains.fatman@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260531101159.14241-1-brains.fatman@gmail.com>
References: <20260531101159.14241-1-brains.fatman@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp70: add standalone RT721 SoundWire
 machine
Message-Id: <178056931723.53724.12006967972521092404.b4-ty@b4>
Date: Thu, 04 Jun 2026 11:35:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bOEeXt7ZVX5SVa4qNwux/LXra/9PC00oPs68mshBqZ0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqIXsFOWeClJmY233sllEq6oiaaHxJxPqUDuo+S
 SSuWmhWlEaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiF7BQAKCRAk1otyXVSH
 0HztB/4zmvY4nT8DLBkuftfKJjzndL1/+C/34a2h9eoTq7jl1M0XO9iFrbQ702sD21T1dm6krmE
 5KOSeMpfie+Qidh+KBmA5bpV0jYF4NO+drDP0OxZ0xNB7mqQNPzdEqUoBCwaeZUWX/1qpCrO9mS
 PimCyO0kfhcNzR0XJviFnhsUlirXxKkTh4LlCYZEmsEUH7kMIbJ1B15WUbs5iihF1shd+vhAZag
 1AUKzcCQ61PPS2o0RPzKgewhXyHhVg8OBXSJzHmGmDfIJb4x2GTVd6rcGuX5yHbglrrmgot0z4I
 Qn+cAEDU95/I7/UQIWTdTWKJn34MaJhD1jT94WQi4mNEn5Ac
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 31 May 2026 13:11:59 +0300, Aleksander Pshenitsyn wrote:
> ASoC: amd: acp70: add standalone RT721 SoundWire machine

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: acp70: add standalone RT721 SoundWire machine
      https://git.kernel.org/broonie/sound/c/d2dcd85f9e09

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

