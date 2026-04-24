Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D653FB7FF;
	Fri, 24 Apr 2026 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063066; cv=none; b=BbKax96H7sR4xSKmkmoYBttuURpJrqrf08/NY8pBe5AD+kwHL3DpFrawk1pcj9F3+T9YEIa0hLIMISvJlUEai4Bi+musM91vCHESa0VIW/uCUh6YAqxB2PSfBs6FoBdsC3HyJ/sK8TzIImm8wHQaCzm827JxcwrQoRM7BbrKnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063066; c=relaxed/simple;
	bh=ugCEAWZTCIV47+Tn+dNfuVwNTlUQedKUpOSSRcA4DXM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=A340SZAB83JdjAEY6UxvemTXhY7JhrYy4DwihRAON7yRcR3JEhZkbgUCKKNgK5Jw9BqRigKQENsSSSy2veb0IqHjZLq6uBx6OTxrAIgpAu+Nff6O7Dzj09sJsK5aoAbOjsBYWYW1L1cHRN0QsT0Wpz1LBW5yhX64jmQbXEpEcZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P87QSn51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P87QSn51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB2C2BCB0;
	Fri, 24 Apr 2026 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063066;
	bh=ugCEAWZTCIV47+Tn+dNfuVwNTlUQedKUpOSSRcA4DXM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=P87QSn518qE8AvqRJGN9ZjtAZmUBMeJ15q2XUxjwnnEQI1DxavxfvkGxDbfzl+I2y
	 1FdML7JUxw3S3zcFDi6YWcpBIY3dtOb2LFrM5PLuPuAWGK47ZcElRgVsEabdf26mIB
	 s7fJZaOtBo03e+mQJjz/lj+oJGCOKsBBCmKYFvsnWNKbbSgv1sLBnebt8dk/VaB9Gu
	 oYwmLXz4mLTkvuWfWvo8wTjppx35AwR5t+Ftl8V4s6/p9kzPlw259K/SG5ZEt8tmds
	 ZcHHmQ45fWO414nPboVbPj+5PTlJ7k/huOXgtTyZbOm5h3SAjgferU+/IptRmfePgm
	 tl4NOzx4p+pzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400C838119C3;
	Fri, 24 Apr 2026 20:37:08 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y0ic1vd9.wl-tiwai@suse.de>
References: <87y0ic1vd9.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y0ic1vd9.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.1-rc1
X-PR-Tracked-Commit-Id: 2724fbc90e5c133fbbd030e72fe8a3869a20df08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fe93b2a2ace9bba2cb90920f9300834e537665c
Message-Id: <177706302698.1703875.12538812482577823577.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2026 20:37:06 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 24 Apr 2026 12:54:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fe93b2a2ace9bba2cb90920f9300834e537665c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
