Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D921C3C10;
	Fri,  3 Jan 2025 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735946516; cv=none; b=e3c5nbybS5ALKgECBlM53hjnBz0QhSxRRtrsoySAT4h+MdC3p3eK493FNXryurquw3j2zHBw6hJyAGuddc/ojAYjk/EiiK6o1sYSPJrQELPV8Rbhus3EZktBzc4SERqQFD9XniGUG7N58TG65bhzepCSoTtrESqumB9MvDkVG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735946516; c=relaxed/simple;
	bh=TLaGBZBQnuZm6IqTUeriwcJIbGtUlrGE5ujfVUGSMAE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XiFGTQ/RGz7hokEg+iA7q3C9Cg6DbDLCtZf0jBWO6avEOvQnh9u48PLwzcCBalSiW+AUjDM3dbdJ4Bgpvn8sELCEcXKEQzPZdTibn/rEDIThdUJPbzTqweqxy6xZG1qAsxBhNkZNUxhj9YqBo7QwiCu+w0vE8cqhNN6JNqpUN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4mBF6TF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4mBF6TF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54267C4CEDE;
	Fri,  3 Jan 2025 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735946516;
	bh=TLaGBZBQnuZm6IqTUeriwcJIbGtUlrGE5ujfVUGSMAE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=d4mBF6TFaLcHKmgrqwe7iXIJpXawPOTUOdC4skCXeBGJOCYlYJT2A2OxQgR030Ri9
	 PZdioK5GsOzGE3PHcEDY5mMUj2d8RhnVXf3SygONc7VhEG901PGZRDwzKAooE0FMJY
	 lIWb3d8+GWXHkzmQCKBgxDEnHGk/FGUcGnUGX9mp8DLwU20n2jn14Q68yvCtNjXt8p
	 YcMxTqZUZRESZPRJcguDfVK77KhjsCSOBpazje+tZCKibbTISak4MQRE+GaoQnvbx3
	 +/+c3uF6iFVlvo2fYHnI14WCvoTYYSczWmARzyxkbIEvyl6Tx1JIEcr/Rlw3lg4dRx
	 B6d4Dp0QDc6Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D51380A974;
	Fri,  3 Jan 2025 23:22:18 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ttagymih.wl-tiwai@suse.de>
References: <87ttagymih.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ttagymih.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13-rc6
X-PR-Tracked-Commit-Id: 8765429279e7d3d68d39ace5f84af2815174bb1e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4f5d3da619fdc78c1de2765e2e47a44ee9aba98d
Message-Id: <173594653666.2324745.13054978758530085580.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jan 2025 23:22:16 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 03 Jan 2025 15:56:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4f5d3da619fdc78c1de2765e2e47a44ee9aba98d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
