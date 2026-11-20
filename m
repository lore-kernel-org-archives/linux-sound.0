Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209231;
	b=2U6RCYmU4LOehzvs0hSD5l4UaqdtH+aeFsxJUi02Eor3802SjUP45ZRyw5VfgWyb8VNB
	 JXy1LIOHy9mCU+ILSNDUKELLg8DYi8imsphUu6LtiJUEsYVoHNuQmYsPnsurz+HnF75us
	 0xwSAmW/cNo7GyjFhDW3AMmBQ8FQl35WcCP/vzgq51hC4Weot/f/5vz0xRZLxwd7mo4XQ
	 4QpbB0XxkVUs6UjmxnIdEW6bDMepSl2iP4BguyMUdvi6999ZaFLLuCpiKwS6xn3t4606T
	 EzJCX5BxPhYSVq961Wid4roWzQIMHmYyie+jejBlKHZEKl6yo91yT2rhg/0pWgZ7lNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209231;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ENkoqBT1k3MGqGDhF6jjfV7WJrNRVQrGvYB7HXLPxRo=;
	b=gCHwFw+O86It4GEUwgiyV5qNnFACpRIOZvV//fzHGjWCKutQju9uhWlF6WplHME1rUBr
	 LNjJTH2nko81QTEu2m9QHKqcc/Rg/eiu4+lpL36qVWT7S9pfjNMzpzCLrBSNt8dscuX+l
	 l/d80Q2rly26MvOJv3NXKF8gwHeBsqJl/dvzcvqVFQkLizaozHyGa+yC9uKi7creQAw/h
	 JqoxeiFy/bsUAkQURBp3WWNajRCpQrxCiu17TnzsmBhY6R5qfL8DHllrpub8GdwolUKnH
	 NwiFxbI3iSoBxX9Hkyke8T9X5szRfXdAACiNr8gGgVIfE5ApmwZF0PXmuWUXvNh71Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bycC3Jfs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14CE606A69D;
	Fri, 20 Nov 2026 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bycC3Jfs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1DA1F000C4;
	Fri, 20 Nov 2026 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209230;
	bh=ENkoqBT1k3MGqGDhF6jjfV7WJrNRVQrGvYB7HXLPxRo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bycC3JfsgW4EdKy+465ZBtFaFOmbu+WCNroNtogT8PbOM0NV7G7B7WkPFpZe28cdE
	 9fF8mDZTv0AZ/UDiM55yqpkuZ3RE74FMymlzZTk9GtuepxI7uE11aThy3gHK/oCNqn
	 xf2tsvVPxU4GFuEw78LWE1iKIhshhFUtwOB7p/TPK+LOB6hNoBxJHLtaYnUcuPE/kp
	 jGAgxs5DT+UvXUItxoz5FPLQGPq6oiQFHXCIU19XXIwC3ojQT3nsxMuyzxGsnGIHd2
	 P5hH6lQAVjyCBU/pxMnWktl7BFEFQ6uqEHPh7NPgFZJHJKVciWi8waruoZJSsGIpIR
	 WksXBW8cob+KA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4440380A964;
	Fri, 20 Nov 2026 21:13:50 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pkvzmxe5.wl-tiwai@suse.de>
References: <87pkvzmxe5.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pkvzmxe5.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc4
X-PR-Tracked-Commit-Id: 3c3db0de2aa937e80ef96e21da940dc8816d3c16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d25709ac3c005279d36fd0e9623889433b49f20
Message-Id: <179520922933.792202.14860501215965688226.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2026 21:13:49 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 20 Nov 2026 14:43:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d25709ac3c005279d36fd0e9623889433b49f20

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
