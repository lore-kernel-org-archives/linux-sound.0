Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE046AF21;
	Thu, 30 Apr 2026 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566870; cv=none; b=C/wq4qtcsebqqY958JvqTnj99ryyb+82DlIFZWoPSoVKGm44BSFEpos7BgYnsnP7/r/yUJDudI7lsCpp+D4NBLc40KalVWwTqEwEGaBKPj86Gvf3yWl24f2fwJR+Wayi50tQ6muG29ZRYVPYsT1b4t6B//uG+FZub1fYF80ThLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566870; c=relaxed/simple;
	bh=5IB3WwjNT1Vb070c7VZ0ypv3QiBA47tvx/lL5H0cmlU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tiLKHz45WCvEgswsFlbFJO6lqWaP5F6YsSOUWlIkpcgSqtSRJ9wx8gQ74z39L5umHGg2nGJrRxn7tWxWm4UYt7wlNqjyyuAkBQhiIaT9DD7bc88uZxtqfx7yaWTi0MWs+Do3Uq0+m8I/GzHHSXMmlgYdDzz/QHv7lZe5cXlWe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf/PaaJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf/PaaJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA1CC2BCB8;
	Thu, 30 Apr 2026 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777566870;
	bh=5IB3WwjNT1Vb070c7VZ0ypv3QiBA47tvx/lL5H0cmlU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uf/PaaJk4+WOcnACuzd/sQAS9WSe8mz5lhbvgvckXQjepmULmum3JrxaYp3le0Tli
	 oJ8U8Hsr/SU4FDloFy42biaIuK0ky7OFgLtXB72pEmd/pdcORGGFVgoC8BNty3WhYg
	 izSgOq746Kb7l1wLRTT0xCcL1BhLUkndcJDRr3XDTaRLBb+COPvKBcOjz4s5PKKlm1
	 zKeFDLsATU0XBYxUUA/1NH/VfLkb8buQxWwL6hTM4CErcGEadAP6lWDw6iVmhOIRKp
	 lWVlSSDgk9zIzP4+8jp2cbFQ64Edyz3zYWH9EarSj6zOZpx1hP9YH5kmWtG6sGmkDM
	 lk4fovPmMwzVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE78380AA61;
	Thu, 30 Apr 2026 16:33:46 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ik99ndd8.wl-tiwai@suse.de>
References: <87ik99ndd8.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ik99ndd8.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc2
X-PR-Tracked-Commit-Id: e052a1f7199260eda4d6ca08a59c3b98738f8491
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2aa0a3691711257b888d6024a492eb9fd1e8f52a
Message-Id: <177756682508.3088538.10263561969063176324.pr-tracker-bot@kernel.org>
Date: Thu, 30 Apr 2026 16:33:45 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Apr 2026 08:58:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2aa0a3691711257b888d6024a492eb9fd1e8f52a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
