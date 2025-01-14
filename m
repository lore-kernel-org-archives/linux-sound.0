Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC42232458;
	Tue, 14 Jan 2025 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879159; cv=none; b=bEdvXyeLVqwurrabmgDJnJmjI6vPLQiKcC07E+JiWYrNLJ1Nt03W77vqYa/4obCPwSjI7XJJ1F4wwJxRt73TTAQJlCBo/++c+3rXluHl5LsVnIiP/S6Ok8NtEVZVWEMRanR+77cdUY3bWqDY7KA/ThiSCNbICkPpfmToemH3/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879159; c=relaxed/simple;
	bh=5vR6B8nHjKgyM6abA+VIu6i8Bw8W9k38NbJXVXwzK1Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ua+GUXCs0BDkdnbrTGlUw7laSio8Y4+dKYmlmOARK5fTY+VVzsLSKiEEiYNHgKZLVHC8ZDXWuDyoMah0CKBf4XhvctNtzZCFC3c/ZxCykC/mVOlgP7+/UMeZZO1zA0SpADzDUfPJX8dk1eUO8eAtCRfWDHRWRAsvnq397Ik+GoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MI9/FScL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI9/FScL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6569C4CEDD;
	Tue, 14 Jan 2025 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879158;
	bh=5vR6B8nHjKgyM6abA+VIu6i8Bw8W9k38NbJXVXwzK1Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MI9/FScLREAQ78tLH9mrnMIrDZ6gt30vbY3WCmxNW5pv8GO2An0jrefYhdY0k/nbo
	 G2wrzoa4NOidq977Qu+DmVjlYjVa/FP9rX0Yoz5tS+inbTg+Um6QzyiuIyKXLInzXO
	 POhYswhWvbWKRhxwcv/BU9ZwBGUwsfZIH0e22i7rnaRt5tkg0i0DdZ4/H10KAiTJ2o
	 yw2iK1Jhv3P692RHwI+l0Ib1YrgGDyEEtvppOQT2UtTX+6TxNAhGfcnoNMKTJf0Qwh
	 RllYfVEiQnHsh/tnc+TYSAOMTFhYYEAM2o8rs088DhZYFp/El+K9tzPEPNw0iR8y9J
	 X/0l+7AslCj6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE66E380AA5F;
	Tue, 14 Jan 2025 18:26:22 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.13-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <8734hl23h6.wl-tiwai@suse.de>
References: <8734hl23h6.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8734hl23h6.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13
X-PR-Tracked-Commit-Id: 34c8e74cd6667ef5da90d448a1af702c4b873bd3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79a1d390f879563119bf2848b621bc7eed228c7d
Message-Id: <173687918122.92072.11971276667369671482.pr-tracker-bot@kernel.org>
Date: Tue, 14 Jan 2025 18:26:21 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 14 Jan 2025 09:40:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79a1d390f879563119bf2848b621bc7eed228c7d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
