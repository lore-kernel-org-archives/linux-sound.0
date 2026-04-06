Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA96386541
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489004; cv=none; b=h+QAVQ9mc98+iIqywXtQdnWiTimRjkKq5R9yHY9nsELVTCDOcyJYGh8BrHoly47Kccyzn9vzXFPsAvCkuKQhAvpJ4zCMg2CTqWkprRVgKfzBSNZtgcWUGfXFMbZRNXtSrhY2VmK7AnOc9e+BVOt9RXCXhQyye8U0uN8Zw23QuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489004; c=relaxed/simple;
	bh=xcCSr+c/OJHDrSB8+/i+OrSFwe6c4dkwXTk5RxWVdYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AUM8lXNZOprSyJ9ZVCxtr5d2WcSsTlNFF0VTjpmZDVUVPTh/zi2D9662C7D2Eu/TuYspesivFfx/wKcU8d3sf9ILfDvRA6/M37oYvFyyuNbTNnrwsOU6u1wuZfjelmJEyHfbdoXNU12vbki6QZbGvKGdnRTnYP0G6cSLoIYg0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgGa5PgA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgGa5PgA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF24C19421;
	Mon,  6 Apr 2026 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489004;
	bh=xcCSr+c/OJHDrSB8+/i+OrSFwe6c4dkwXTk5RxWVdYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LgGa5PgAxoue+rpTEg9pCV9Yhy46i33E2bkG6MAtucaS2pqxadE9Ufs+qxb1ObG9X
	 OeudkaBY314qiEx1/ULTr/A/cVGWs7M3cIwm1QUkxf/nezK4WBWMA3JAk6fOpEE9IJ
	 11IMhK0FjCwSlAvL6TDVcD3U59EOFCp9Up7MuHOfcGyt3E3YroseMiUmROOKLR6TR4
	 bMLKdaAR/RkAhsNu8efYuzs3fOa544v6b0Oxsn/17oDhjMO6J6KD6uHmwY0ShqPEPP
	 AEO92jMtaY0zssG+e1btVsMCqzCWzt3GuJwfjolhgWGvRU3aG9wVoaPnl7E5s5Da8G
	 wLsqkU0VN8d7A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87eckstz49.wl-kuninori.morimoto.gx@renesas.com>
References: <87eckstz49.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc.h: remove unused card->pmdown_time
Message-Id: <177547959747.46304.2524908935699409151.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:46:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xcCSr+c/OJHDrSB8+/i+OrSFwe6c4dkwXTk5RxWVdYI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/q/x1F3k/dVcXkLXVAkNj5PXRIym0daczQe
 8b7OvFBYQ2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPP6gAKCRAk1otyXVSH
 0PMCB/4ye7OphrupijIMw1Fw5r0Kp768ZwXo7LvwBx4ND9cy76UP+sxQhwP8YrbK/0QABm7Hy7y
 1F6iNrlSD+fUziyef1b92+tqIsYfWhVVXeHr2VgHV7/alNSJIJnoSP2YIaTKVWi4K9NiXYti+2Q
 uEzxqwAQORmvcZEnnIEG37WB3Xf6E3PH89awBrSs/fDyvz6K2b4sp7t3nhudiJdSBzF/DPG4k7B
 k5zxEnxiNauLXz1ACFObOK+/1gXqP68SKAK6bQCIA+BNuIrm68LLwINfiyEWziUysQLnCw/cNnk
 41tdVcUxT6b40WvMIDA8tPuwhjV3aakBnQbKIjl9zX8V6AKk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 06 Apr 2026 05:51:51 +0000, Kuninori Morimoto wrote:
> ASoC: soc.h: remove unused card->pmdown_time

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc.h: remove unused card->pmdown_time
      https://git.kernel.org/broonie/sound/c/d78ddeb8938a

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

