Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEB36BCFA;
	Wed, 11 Feb 2026 20:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841723; cv=none; b=ovtCL3Z34gq3KE4gIors1+AkDHQteyAE6OuqJebtx0vrIvUseUvqlpcxwHIRCOHgEz22pDBC4gIVQumcPIRRKiQTDiry+6hHO1E1h77qilquQWRT8UVm9zPJ5bgq6VJKeN/yCmKySaieG1lE1HltZcJER6rJU4xIfEgfmkaUHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841723; c=relaxed/simple;
	bh=2TIMPOxIAMHbDjfMd1taW694oi5no6OzNC0DFfGhElQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ekR4cczZkpRp4w0lSR+3Ss7xYYFSNPHDBY55rk9L67p24llRyTAppX2LgEMF4UB2T5SsdPg6RnjBJApvzfmS8pE4R1XkJyn331+p1bplx/HbnjmquK/ga0hIWF2DRnamuqvzE0+xiaSiV94r7GmL/aXwhFP3x8jAxU8mm3JC2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIiTvfRN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIiTvfRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A1AC19424;
	Wed, 11 Feb 2026 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841723;
	bh=2TIMPOxIAMHbDjfMd1taW694oi5no6OzNC0DFfGhElQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gIiTvfRNqi55BOYZmluewv+ECWGQbRakrPnQU2/f2QtlPdpK/np8U4nHguiSNR6py
	 BLXiqkwXfxaxEfmprcLwt3eVi62S5cW8ZnX9gpm7nFSqQxRXMPKMrDVlOtN8+w5Htn
	 WwoenB6vaoJpHqjYCzO17UAATfJofcYgU7Ue1vGPi6+qQCI82sUgjfTS+bCgHAH/KL
	 IBqVi2yPmbqq01om+npQXVjRHWVGeQKGK7eVpVWKyp6PpKHyf1jViOjIo4iwTrRo0H
	 3w+FNlgLs4St7zFPiDbkucYV+Kyi3me1eML2o1LFUY7e3u7tdD80Pu2JkO/6xQb8qm
	 2T6kV59+Pllyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0C63F39EF964;
	Wed, 11 Feb 2026 20:28:39 +0000 (UTC)
Subject: Re: [GIT PULL] firewire updates for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260211052845.GA155338@workstation.local>
References: <20260211052845.GA155338@workstation.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260211052845.GA155338@workstation.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.0
X-PR-Tracked-Commit-Id: 6b617317e5bc95e9962a712314ae0c4b7a4d5cc3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d6dd4738dbcc32b60c0c0c1388d41e171b76845
Message-Id: <177084171766.710910.2907457953327595894.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:37 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org, jens.wiklander@linaro.org, jgg@nvidia.com
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 11 Feb 2026 14:28:45 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d6dd4738dbcc32b60c0c0c1388d41e171b76845

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
