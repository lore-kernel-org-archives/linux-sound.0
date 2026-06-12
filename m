Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9761D364EA6;
	Fri, 12 Jun 2026 22:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302763; cv=none; b=ed3iCcNIZ3JqqwjCmPSTSJSc1WrOR6mc5S4MTRFSJGdlfeffXjeSd5AZNEGrg5DMs2/HJMzNaLWtAI+3YXm6DELXcweyOMcvqk3SYN0kn59BdQV/VVW2vSVEVYoH4FuKcXhmlcWMhWM3VLuANxtlM4Js8oDg7djKxYxdgr6jZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302763; c=relaxed/simple;
	bh=UIS5/bSBpWr9oXWV3x8miY4uMycVEh3p20x6IH7NsF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ESENIb/FqyRYBT+LYkCywG0Nnds4XCogI5Xdfletv8V2+IKd2ks5o78kWmGEBj5E2mZK5cDdw5KzVe56f/AJpY3Eebqm4xvJinDRtAmkpPhbFKjMTlllzMm1iJFCe55CrnQNOFt2soKGKkQLJ1b/+jhNBuGGYRbPFYre4X2Dpj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdtxdo8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdtxdo8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA711F00A3D;
	Fri, 12 Jun 2026 22:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302762;
	bh=QKdyEB8VrLaIDqq9AQMaAVbF5WmKKiGdNNPTl9PfrcQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cdtxdo8bp0t1gcAxUDTAbvMgfzFU4v+b2t3r8Ii/nZIymTJ7fmcOGDCYeHOyO6P03
	 4yVXnX2HtI+0V8mJvm4CWgYmMyQWm/9j9IwTgfGDP2F53xxeMAjhCLsvfnCxXLdSA4
	 8dWELc2XWqsxY0WC7ZN2uEUxTDsfUmIwZG+Gr+0u2xnIg3pPuA1tbBUCVluRGfOZ0B
	 FKzDhbqDugy8+sG6NL63n66ejFONRm5Kc06kY+FppTxdaC8mRgjXK1SpkDHt9thadw
	 U7VmxJimTyMH+e8bTErW2CmSSXPjNqxrmB1ZOJu4p7xnEUtv1uZna0jNlgzlv4csKJ
	 SlbgAZaGD6qbw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Shuming Fan <shumingf@realtek.com>, Niranjan H Y <niranjan.hy@ti.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Mac Chiang <mac.chiang@intel.corp-partner.google.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Miaoqian Lin <linmq006@gmail.com>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260610041753.1151088-1-acelan.kao@canonical.com>
References: <20260610041753.1151088-1-acelan.kao@canonical.com>
Subject: Re: [PATCH] ASoC: sdw_utils: fix missing component_name for
 cs42l43 part_id 0x2A3B
Message-Id: <178127688584.48375.17454457885369484858.b4-ty@b4>
Date: Fri, 12 Jun 2026 16:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UIS5/bSBpWr9oXWV3x8miY4uMycVEh3p20x6IH7NsF4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiyd1icMHez5C1Ony20tWTe3hOt6Y4560MkpmkYGr5Zcm
 /j0W65VJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViawKVycAjAR5zPs/1R7CyqPrnS+zbLs
 w5tCC151u0s5XBxbz8ptCvUQuSIVkHLSdr31RMnjgVaqyaZ5KzvuBwsaLzrj+Obw8sNuN+SsG7e
 Z1mcdd5uxbsux2iz9I6lsS3tf75qYctr7Rlfp8jdfPnExH/4R9u2LzTbZC+Z9GW+sl67vVLp8/g
 lv8d/1j3hZ1c5+um+1NLy1a8npDMYGE2sth+CkRdEMHV5aaaXr0m7LL0x+uixuYvaPPs3mvZrd2
 tvDglaorH9lP9m4VVXr1pH058KplzLjTiwO9sm423c8U267otH6ddmZoZOWPK50vCTjnH56hmiM
 IZPiB8FFjB+nss3gTrUQcRW0rVWoe2vktpKf892ufumlAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 12:17:53 +0800, Chia-Lin Kao (AceLan) wrote:
> ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B
      https://git.kernel.org/broonie/sound/c/c429fbea6174

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

