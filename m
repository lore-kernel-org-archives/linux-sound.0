Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5D3D090D
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445376; cv=none; b=opriguZOb0WoO+RUdD4Q0A3w64B8uQEQlDdcm/r0vyX3cELtAKkgIiSL2gaOOuKYj5uBcCmvA4gWu5vSAaxfquKzqln98CO/fGgyAGwEhz3NlLeh6tMw28Yb60Tp7LU29UVKq0x9HpxhYcjhEY17SJi35T95ZgrzJ2revEyXeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445376; c=relaxed/simple;
	bh=nr7u8ppUmrWm1BQWA9KapK/dk43vFlaAEhQJhIEz8kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FJ8EGPXyGm8O4zdhyN0XyGhH7K3NsAm0Ffp+71XDD5H3LRw4xFudPWoygvNfOO1P7EME3Ae8NTKQEWu+hSUpc5AMp/jAlrHaWtfHpVuTb6OaeMYkQmj5PlvDoMBchoTP0nQBiKN9Ospv/+klIZEOad+T0TK8iUfo859YEZRQc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXVkeYpx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXVkeYpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC061F000E9;
	Fri, 22 May 2026 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445375;
	bh=aa0Jix9JZpDoEpzoyPsWOcqg7mIKNBRzxNk7vSwKEd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FXVkeYpx1AeZf3bp/kMZLmpEE/eiOHCTTsWv+zHoeLB1Gd/5wME8O3zOXl1XMpIps
	 VQd9MMTB7G1bmUjp3FBuCEwGXjPCLQGWrHPBUXNccY0MyJZlhr8M4DrovOOq450Ff2
	 IbA9XLYxAX5O29ewDteH3r+bJo7OuWwuojjT250xJEjaj6goDnbIfBAaL0AhJa/nxM
	 9kpNiL9Tlu4QuAXkjN0i9E6yOIBrJN8oYUfrKNx+TY8TDY1iwSY4uePN3PSHvx4mzA
	 C502pp+6wXUgf82Luv3Hd52NUlVFu+HbN9S8qAyH6laeU0ANKLzNOvsXHCIMV/Y+OR
	 nRu0cjxRg8TQA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@intel.com
In-Reply-To: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
References: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: DSP core count handling updates
Message-Id: <177935913074.58022.18148252979771248294.b4-ty@b4>
Date: Thu, 21 May 2026 11:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nr7u8ppUmrWm1BQWA9KapK/dk43vFlaAEhQJhIEz8kM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC58NGZJANTRnUc0AiJVI5l6Gvt1yhGC6bWHo
 1iNGq91Z3yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAufAAKCRAk1otyXVSH
 0Nr4B/46jeKwi6OeNsvM/xxdL3tGQudm+f0hgicEXEQtYC6spFgBPw4GllQUBCPkKA95yvl5YxW
 vPN16uLghAex6GSf/Haqx1khv0e005Ri95a+cwfh1iAvpVCV/ifu03cNt5JLy8VcHzlgLT+Hu29
 Tl2H6LdhxheOP5xSwUtrL5Pg3H0prqXt04dRuiaPK8WFNPdRVfg9IodCy1VLupiU14CtErdX+0/
 9wggBqWceV4YrNFc249NuwRe7A8U0qZuoQbeLESWfoIXLEgCVuWtPgbHCd1ucqn7c/BChqoJk3e
 3FtprEzYuufyG6WzpVJHrx0ZfgT5L+Fud4qEHlp2ta1tvEmv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 16:55:12 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: DSP core count handling updates
> 
> Hi,
> 
> The series address developer facing issues regarding to how the DSP core
> count is handled:
> IPC4 code ignored the DISABLE_MULTICORE flag, fixed by the first patch.
> The second patch does a validation of the core index from topology
> against the number of DSP cores available on the booted device, which makes
> generic development topologies usable among different DSP variants without
> failure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Handle SOF_DBG_DISABLE_MULTICORE flag for pipelines
      https://git.kernel.org/broonie/sound/c/3d1b78a6119f
[2/2] ASoC: SOF: Validate and correct the core id against the number of cores of the DSP
      https://git.kernel.org/broonie/sound/c/d9265a36f4be

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

