Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8929ACFD;
	Fri, 13 Mar 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423229; cv=none; b=iCTTg8JDi41WZxdatIwnL6o1/Xxp/w6qtR2RaVviOD7kcmVNm4EwqYR6LZ8W81ZurAk7w/d043f5W1HINGL5kfz2WAwNiPCIFbo3aJSo+YXcX1WjDFFclEnRPY2LvpeTuHEcMDwcTCjIIGNJD9QdGogfKUHXZb0aUJ7qU2sQ/qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423229; c=relaxed/simple;
	bh=ht/nVLwM4We7MFYQFjcASn46nUk6IQsJv2EQhgxXMfY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GKf2/KYxr4xmut9OCYzwuGW5UxVPEGM+fKebz2l4+A6QWZZoYqdUQACqE8bDj/6i4tOQkmkrrZLo/9THsUquE4LP4AzFsQfGlrbJzgxbhMCxCyxJZSYTWwOeKPXw1lWmFgfAvRyorb1hyw1q1InVgJAtQ35stdOPMUWG+Ei5CN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8wUnhnU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8wUnhnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0246C19421;
	Fri, 13 Mar 2026 17:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423228;
	bh=ht/nVLwM4We7MFYQFjcASn46nUk6IQsJv2EQhgxXMfY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=U8wUnhnUKHZsmezsaVja/PVblj9Z9ge7zG0tM66IPw6l3b/ghwLV0+ZgEntBLTpng
	 nAIZhQWCxoTqMP/EY7y1fLoEuMAqfKi4gXe3LhgT2b7mgXS3k8x0xTV4zONZ4ggY8c
	 zOh+Q7AnT9QgYYNowr1VBa6cVZh+aeTCqOaWFFV7iT1+cMiqwG4cEF+SUuLrGYVOXQ
	 CDGrBIP0E42V4xZ4PsExYJEloc61404X8zhZtu4qcxn1Jg+90BbjpOg8GjVjSD8TTi
	 9Jr0fx29G4ksFcUq0DgWwcH/r3KtJF8/PvMBL6pLCZ7hUkbaa60zYw9BhcMm+MgoEm
	 F7Q9fNpnMx+Iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0C43808200;
	Fri, 13 Mar 2026 17:33:44 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87cy17bwxz.wl-tiwai@suse.de>
References: <87cy17bwxz.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87cy17bwxz.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc4
X-PR-Tracked-Commit-Id: 9250673cf23572b08c51bcdbb2919e9982bfc36b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56cf10db2ae0bb90c69b644d639b559106d52a8d
Message-Id: <177342322339.1438840.10045618627804918846.pr-tracker-bot@kernel.org>
Date: Fri, 13 Mar 2026 17:33:43 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 13 Mar 2026 15:55:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56cf10db2ae0bb90c69b644d639b559106d52a8d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
