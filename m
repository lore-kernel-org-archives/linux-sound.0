Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43903C128
	for <linux-sound@vger.kernel.org>; Sat,  2 Dec 2023 00:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ0+fuEI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B834BC433BB;
	Sat,  2 Dec 2023 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701475549;
	bh=7pquxYZI2/C6+eoctSMlVDFoYCOM1lj2mR9TGmlZ5gk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cZ0+fuEIFf1nsscy6hkG19ExYCeb6Tr3+tTLZuUM+Jov9BivaPx9oapY+5P1f2Wrq
	 TOSRKZk06rqrzrqwGfe0C6Sg2JvFtrMnTTJgfPmS9ZocYONaWfe0q0SK4r88bUT/ee
	 qMIShzOZ4nYQliUDRe4ITCPV229CY7mFGHnzfqclMV3yQZqHbq3ibjTITtZi4qNN49
	 a3QwQ2i+mJgo4sZ5IT+uFVvwfg5fBO5F6oyYeidHkJwWMEWLJMXUqQjXY8uXQtrOsb
	 ULOJUAKSFlhir17yiEChA4bMGKCNBi6G9xX/aYUIDZYT05kIb84TsLwnnS1J4scKDS
	 5eATw3QUl/Uig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A43AAC395DC;
	Sat,  2 Dec 2023 00:05:49 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.7-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87edg6b2wj.wl-tiwai@suse.de>
References: <87edg6b2wj.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87edg6b2wj.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.7-rc4
X-PR-Tracked-Commit-Id: a337c355719c42a6c5b67e985ad753590ed844fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06a3c59f9cf4f550facf16a2f1e48ba364deb293
Message-Id: <170147554966.9445.13918661403705394203.pr-tracker-bot@kernel.org>
Date: Sat, 02 Dec 2023 00:05:49 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 01 Dec 2023 12:03:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.7-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06a3c59f9cf4f550facf16a2f1e48ba364deb293

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
