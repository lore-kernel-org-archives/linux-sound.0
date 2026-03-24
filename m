Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBE31F986;
	Tue, 24 Mar 2026 19:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381474; cv=none; b=kQXeSJqJ5hvAVpMIsIMyhYVeZqgVEoQLBarUl7dhltIttGa4qawtojL/DmSiHp3+TWtB+oASdlzXvWus4Mhpm27+69dQwtY3Cv/4+YGL522gC+TM9x8MDp8oUSZdqMFmCG50hDAd8PGWitEV1XnPsWWYQ0Qm11ydl5rVIWeFXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381474; c=relaxed/simple;
	bh=L6ksXNveAL1/fsX3j6R56f1e/RR+CeGVrEomR/rnAnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bUDvCUR/lpEpMqi9BG19WeI8EXUfoqomut9wdM5oIxDTpTeuNKJDEYHM08RhQsL4eJILp3ZooRKBppGThF9b2//5FWH4UD6/b9sgz4kkjaOIyL5T3E5Mxl4UVrRxWlxtacujchQn7TruKfMwTWf1qHCQWQoXB9Dnz4fsk7pBpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0seuBP9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0seuBP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4978C2BCB1;
	Tue, 24 Mar 2026 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381474;
	bh=L6ksXNveAL1/fsX3j6R56f1e/RR+CeGVrEomR/rnAnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s0seuBP9FgtSUZ6haNq1oeZQTk0tKtcuI+GIpxRiwgd9Zv8Ab5XtrwpVeoj4kKA14
	 0NNfzdnJUiebE//CHct3N2w/HnT4NinsxyG+F7400RKMlJTQz8i1Dfwy4YH2b7P4Fj
	 wYJ1GEpuDHoyve8Mu8rKsgLbNTBW7FejOIQlO852UqwJ6Reoj/rj1MpCmBCFnEr5UG
	 gH9EVXEYBoaDUhxjJ2JD4+pSyo9cfPL2KoNB7Z5UbXIz+w9UHr81ZgbSKA9e2BqeIH
	 KkZwbOCnOohdJVyq1LtHO6a6bYP21MmvRss1Ru8/ExejNoZ7q+fu2ABfY9YsfGTowm
	 5Q4OI3jPKgBRg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Wenyuan Li <2063309626@qq.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, gszhai@bjtu.edu.cn, 
 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_579D057AC557914CF739A2D9EAD045CE7306@qq.com>
References: <tencent_579D057AC557914CF739A2D9EAD045CE7306@qq.com>
Subject: Re: [PATCH v2 1/2] ASoC: uda1380: fix missing return value checks
 for I2C operations The driver currently ignores the return values of
 several I2C operations during register writes, which could lead to silent
 failures and inconsistent device state.
Message-Id: <177436466434.135609.14145459639527251030.b4-ty@b4>
Date: Tue, 24 Mar 2026 15:04:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=broonie@kernel.org;
 h=from:subject:message-id; bh=L6ksXNveAL1/fsX3j6R56f1e/RR+CeGVrEomR/rnAnw=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBpwumeI+3hOStfZcG97rr3fLx28AoD/8Dv2maa0
 o4vda26NN6JATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpngAKCRAk1otyXVSH
 0NzeB/dJiXTDVP2vsLPEa276xeg6ivHbLVjTEw76g0kyRfYHB3CjxuNMJzNTrhGFSXQ+FPXWRTj
 RdjyzgYJrIt/tyM2ptC0rrX7Agxlh+2KbcHkKwURyiFhggu9mCaAistb/Bi9Y4er0f86LJRVoAF
 UJjPltH8vBEunRoD3oLoNZ95pp1G2BSNnpQCZDddhUBLwwavS5i0OS7CC7kpsj448sQ+FeW/wkB
 u5mYu//W4t0H/jxuFDE4xqUT/qVhyfcof3xbs9vF5LUY2z9qzhcY3IZt+EjECutY2teukD9AJ0g
 zPnHIe2Uaghsseu+K1IUqlgUtzBhaIf0T26kDTLQHpXcmJY=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 16:36:05 +0800, Wenyuan Li wrote:
> ASoC: uda1380: fix missing return value checks for I2C operations The driver currently ignores the return values of several I2C operations during register writes, which could lead to silent failures and inconsistent device state.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: uda1380: fix missing return value checks for I2C operations The driver currently ignores the return values of several I2C operations during register writes, which could lead to silent failures and inconsistent device state.
      https://git.kernel.org/broonie/sound/c/071efde6b756
[2/2] ASoC: uda1380: use dev_err() and %pe for better error reporting
      https://git.kernel.org/broonie/sound/c/e5d5cc44791f

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

