Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D633D6D6;
	Thu, 30 Apr 2026 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548614; cv=none; b=BZWkHGvkuTKGPPebHHLGut07DwGq8ySMN92lOshArxZtf519H4OY3TY+2vH7cULNo+B6R+rFl0SwzCuKJXARVXWakWPzXgaEcA1eRtVbfOippPLPeyNXdgBLB9eRW5VLOP7AHZl2Ph/0KlVjfx28toyL5lbEhFqQQdwaxwGo8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548614; c=relaxed/simple;
	bh=b86bH23+GuhFID3UR25HfkevqFLG14H5TZzEQOgor+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nBfp4d1pQXrUKS8gmympmSXik0beyheoYXTj9kuE/snKsgM+2ojEFTqHfovDU7xPQQc4MiTQzRO6DrIffd6orxzvBKcBkxJBT1N5SerIsyXIsDbPhxeYo4/s0d9p+PoLopd7jCoFVpcPIwnWoyokpbj8830E+I1Wk74WBayAdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVoAQ4Gg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVoAQ4Gg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B3DC2BCB4;
	Thu, 30 Apr 2026 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777548614;
	bh=b86bH23+GuhFID3UR25HfkevqFLG14H5TZzEQOgor+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NVoAQ4GgPLhqJHzl4zA0VJHibZkCD+kQAwciVNz2wOAfcbpVoG9X7e8lYIZXDqrjl
	 Lu/ox5F4oZ83BAk0NwSdzDmahjR7gyOHACSB1Ami8RFlcR67bIO5XH5Vc+wF8jaA6O
	 rQMvWnd9FADo+EePBIGwMrrrnhx8GHbT0fTcuGCq5/sBLMrr1rRdPrGI5l01jNQkYP
	 nO1bTS9KtPy01aPW0lQyA1YaabsBWV+6X9vJrNwu/+5RjdIeh8oxpVKVY3pQLt+rZ/
	 GbdHLCW+E3jXL+WAv5jSZHyTLTBPT8GbOXRDLTdN6cMM71VhpDSqyS2WhvVIxvircA
	 qsSMdUY0qaNtg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260429225751.1995224-1-rdunlap@infradead.org>
References: <20260429225751.1995224-1-rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: sound: fix TAS675x doc build warnings
Message-Id: <177752911135.458539.1402933279454782869.b4-ty@b4>
Date: Thu, 30 Apr 2026 15:05:11 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b86bH23+GuhFID3UR25HfkevqFLG14H5TZzEQOgor+E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8z0/BrVVZXUqxa18CMAnwJW1S8Ti4JMi3iH2I
 RRraH2pHKKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafM9PwAKCRAk1otyXVSH
 0NttB/46ysDkxrvt32a/pcSeCPrQt5nd+s34pD/2vYvV85jvpXtGNeq4Cq4xm3fLwZpDJrOU3P9
 rcmmOikcKNnnxj03asNFIq4gbx6MFIF7uCcRw1VS58d+qiH+FlSS9RGM9LuO7ACor7aHih7ZrQO
 xpxxlMg2Lfjrjwjh4FZKJoPwUCUiFfz/0UyMK6vAj0WUloYQblRtvFTXNDi332oX0RgqsXwUMRP
 O0MQcLG5hqt5RLyUOMThgRrFwdm7DEuRUrwDucx/ZpaXKeZWdvXplO7mPr1Hv32eIHKrIM/oEl1
 UtOAHUPqgCvSKB2mUapMIkK8cgv1P7B356bJ8iSW+O3eJqFf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 15:57:51 -0700, Randy Dunlap wrote:
> Documentation: sound: fix TAS675x doc build warnings

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] Documentation: sound: fix TAS675x doc build warnings
      https://git.kernel.org/broonie/sound/c/e82c19d6a508

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

