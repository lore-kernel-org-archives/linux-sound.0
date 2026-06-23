Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0C22CBE6;
	Wed, 24 Jun 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302243; cv=none; b=Y4RWnN4a2RA33FrqTHwbInH8Gyjw0VbKNTsREcB/pJnfJ3X3X4gcmLn6flkFk8lyEDzmzrEzmXk6co8HWp9IVx8Ar3GHnp37LCOVs/VusA+fRpagT411fTs/lb4kIQ+0r72AH7lRMnh9CbPzH/1sI0m+FwZ7zHPvf4ZVE7YMH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302243; c=relaxed/simple;
	bh=lf3E6UequG5FgmKrvnHgFxwOPw75DTtm1SON/AJGkP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D3X1RB4Vkqu9c8xM4wkzziCmS9P8w5c9nTTOCfyFlOleNBsSOYVJjbZx4pp5pOSjfZOUOGzcn0gT1Vv5120C712tWGNY3toHfBSkgeYV6VLduR10uuEz28lg84vSWM84YsFLyiF4jKWP9CxrWSX2VJZv6qD8/oHQh1dDjenZFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGADCkv1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGADCkv1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3461F000E9;
	Wed, 24 Jun 2026 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782302242;
	bh=dY2/Ilz1M7gPLoR/ULjDm5+xmtKNwxZoqlJOos61R/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CGADCkv1SsZfNf141fEhZYBn299+4YlDfwf2Cvsn2WSMQy2nv+c4NAmOKn18uDhUD
	 XFVZDnwplSanWidV5yo6EeSnREKXeRRUd0njpcR5+PgiPAPh++t1he2vD3HYSqKGv6
	 A04e+rUJXgGjozW9EeXz28SXbpAVaWHPGKd8fHtCnxlV9N3XGCsui64iMubfQKRpTO
	 mOy9TOpFqP/CiWonrMaZTj55wED/Y4BXH1dGr5blx+Ut2OKwYtbnDbP+CVH56xqPkP
	 l73kZpZuO9rtJ4C5FAiwx/fNwefKsyuyK+GXA2AA08/LQe+qeRvo1P5g42IXOc2mPO
	 w4j5Rz9tjn60g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com, 
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com, jack.yu@realtek.com, 
 shumingf@realtek.com, niranjan.hy@ti.com, shenghao-ding@ti.com, 
 kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, zhangyi@everest-semi.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
References: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/5] Fix SoundWire randconfig issues
Message-Id: <178222245507.59996.14109233253281177602.b4-ty@b4>
Date: Tue, 23 Jun 2026 14:47:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lf3E6UequG5FgmKrvnHgFxwOPw75DTtm1SON/AJGkP0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO8Yd1txpmLi/ZAI6Y1dj/jnc88TA97LirV683
 7mnKOfZ8QiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajvGHQAKCRAk1otyXVSH
 0OqzCACFagur29xcGQJFMM1sfq6Nb061QUeukG29S1jdpVG++IfH6SWuUMHBPCtmEs/CpiUnjmX
 JWVp2P3jwVMEQz/M6vJ3LZRIl9an3zrOewsTWisU2BTT0N0T4D3HWZyrguUP3eGkJOUoDFHb24d
 Iu802JYrli3kT73H4p7mZgJzONpmsY4fGfo3p7mm7cYQZIFPI7q9My1G054hcRmbb7TAd9dZ33l
 VSew8n+ZnOdlnO8AloVXpAc3pQtbmDSKOr6fU9nG2UpWhjYWgDYNUjF7EQa4x36KYzNxqZmVYig
 2Otb/Tynp71GKUTYClk2+7xk/UU1GUe112xH3PyN8Mfc4i7d
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 23 Jun 2026 11:18:09 +0100, Charles Keepax wrote:
> Fix SoundWire randconfig issues
> 
> Moving all the waiting for soundwire devices to enumerate into the core
> code [1] has caused some randconfig issues. This is the second attempt
> to fix this after there were some short coming in [2].
> 
> Sorry for sending during the merge window, but people are keen to see
> a solution posted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/5] soundwire: Move wait for initialisation helper to header
      https://git.kernel.org/broonie/sound/c/5714c8359f4f
[2/5] ASoC: es9356: Add back local call to sdw_show_ping_status()
      https://git.kernel.org/broonie/sound/c/ce52450319fb
[3/5] ASoC: max98373: Add back local call to sdw_show_ping_status()
      https://git.kernel.org/broonie/sound/c/1921303a1d2f
[4/5] ASoC: ti: Add back local call to sdw_show_ping_status()
      https://git.kernel.org/broonie/sound/c/ea9ff3b7bcfb
[5/5] ASoC: realtek: Add back local call to sdw_show_ping_status()
      https://git.kernel.org/broonie/sound/c/6540b9d9ccc3

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

