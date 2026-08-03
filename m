Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F93A9623;
	Mon,  3 Aug 2026 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786532; cv=none; b=k60aNXeql49mLQI3zhox8E0eNo0ShYa4CkpsYxCOKRKPJaySDC2ZuG2O8PdYgaz02seDq4GM42F9Wuxo8bTNOFl1icrWuwHP+mFGuOUT7puydGm58MB/rTswZ4U0lw1QYMcwDwm1ZMJsUNuA4qZg2TiXdgP7BPJ9+3oUSRkifzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786532; c=relaxed/simple;
	bh=BMU8m3G0CzQ7r/UHgsjtaV7XbVgRF26RkLmkRPIw7Ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rdss2r6BPKq96O/Xh6xtGsXY4UtoFcNYEHEc/5KNKTN8rRySqNpvaj0/aA3QHcHeL4PIKafqXLUaNRZwVoRYBUsJ83OL1aikkAIFz4v1xJnDOgSsbJ8PMr2Y7c66+D8LOwvN+UH+l4dP3/Fabt2gqGekjStY4hQmWj2VpMW8ktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rpl0512/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rpl0512/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B291F000E9;
	Mon,  3 Aug 2026 19:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786531;
	bh=gRKD3Yms4UmL1R70kEb/16Lt+YdAmM6DsCMChqeyD+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rpl0512/f7uVlPUuE9zwt2MLYmXdRZX1KjLmHF7w6wrNt747+ktKc5ZMnwSLWIL0k
	 rVOei68WDTk69drAr7I9KlM7DMduTh0Pnb9bLBD9V5RwjL4KY4z+yhOyj+7rCopQM7
	 5BD/cj2zIhO4RAJgYSRZfSIaFpxkZL1EWjHDvgnRp3glcyz9p8P3qy3K0kL9bSgety
	 V+/HFoplEgMI0SvDikV/eYpWA2cYo5XKnwFrnm4jOmQ4TOC8KxYPOPwSXs6ELVAbG9
	 dpR1UUn8+xDngp5TECnbjtLeMSO/zwhCB+D+bNtm2mBDvVrRGNeJU0qD37V4v61VSZ
	 NQO41DE6voEHw==
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Goko Mell <goku.sonxin626@gmail.com>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: spacemit: Drop redundant error
 messages
Message-Id: <178578223883.255647.15164633437477017509.b4-ty@b4>
Date: Mon, 03 Aug 2026 19:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BMU8m3G0CzQ7r/UHgsjtaV7XbVgRF26RkLmkRPIw7Ps=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcPCfrOivxgmMibuM26PL4ZckDkgUboZa7X5qP
 6ItXy4E4y2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanDwnwAKCRAk1otyXVSH
 0EpfB/9KYDAOOEThhQgaerB9e2bpfLq1GQLe2mXmP49OGUBL2wJvbhyA8Yrd8SUneG5qqdmk1qI
 pl1tRDu8T8z2CWPZjXfHQ/Ahc+Rk5GPFAyD8v2CRglNEGB9WfjDLgAP+85TWBGynlxEF9j9PA5H
 ZN6j66rag14ZDQz9yr2lLo/N+rm7VCAVhcYNrH0mW8htfFo0YVM8tjgV3pW27bh8vOh4r/h+VdK
 +QDYrujg2jeRvcgVzCPkmcb0l9iK8P1Fbf3GPq7DAkA2IppqHIxKsmu8nXiCXRfllzCoKOGSJyD
 nsTcFkIxPSotXtOqlbKbtBiKVSvcUReRaGVMkbpu9LaFQK1m
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 31 Jul 2026 17:15:38 +0700, phucduc.bui@gmail.com wrote:
> ASoC: spacemit: Drop redundant error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: spacemit: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/a6604d9fb216

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

