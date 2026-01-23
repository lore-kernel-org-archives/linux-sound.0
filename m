Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A982EC55A;
	Fri, 23 Jan 2026 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201218; cv=none; b=WxHNKi7Qlsns2uo9hjDnSOTjTnntWkxRzOwOVrEg1H16tfd8od7dXCkfk+ZqAUrgkzgIIcV3w3Bn19U8LaLVhqulomtxVP5zjyWpMDD8mYiFeQZB9QXKNy3mCMzqQFR53Lto3tHQDNSXulWuwrlq70VxhUqGc6rmfilfog8REBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201218; c=relaxed/simple;
	bh=uoUjIGCFCdnafbgKiWQoAD/Rb9+RMy+4dlid5LSXXdc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sCA+B2iaY/fOPiL5ZmwX89QY1/gTUx0ViFSzItcmqhzpx1j0j1lqnKxGrSuXNnKhsYaKmTQudoy58ptqxrHhiSOWYIRL2bXsAxa/ZTnwcwYIa0bOk5Af6iDgkqyo0v3XKwAGWhwOWJ8yYFkofZBm/SUmo8vjljQeifOh4Sw1iRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuI++Szj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuI++Szj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798EFC4CEF1;
	Fri, 23 Jan 2026 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769201218;
	bh=uoUjIGCFCdnafbgKiWQoAD/Rb9+RMy+4dlid5LSXXdc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kuI++SzjmccZG6SGomb0H8zpe43NBg71bQnj4ZzxpBrWM6Bg7tcWcFTKkF/Rh0rab
	 6Gr8Xzyy9GBQni72wlI50xA4KhPYKZ++0Bdgwx3WWFa94Hf8g2+SMxtxXRV5dcd2JJ
	 woPpvkZyw1IjBOA3wKQULKquL56Tllb1nv7OzFOeSmpN/IDr8lo4mbruooaNjGsdXh
	 Z4AhFKxTTCsX9cHiC9++avcHDnLnFYZ34erjEJzawABhZufnXMqPZ4MafEwSb2E1dn
	 AGIhTzt4mF80Q8dLR1ASuxSm5ZtwEPQzehGr9LCqbmJDsCu30ycRAbX3azuCkCyGHu
	 loodZ4ONgbr3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BADB3808200;
	Fri, 23 Jan 2026 20:46:55 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <878qdoft0i.wl-tiwai@suse.de>
References: <878qdoft0i.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <878qdoft0i.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc7
X-PR-Tracked-Commit-Id: 64e0924ed3b446fdd758dfab582e0e961863a116
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e49f9e05c528055c005bb42018a6b5a615b45b9
Message-Id: <176920121415.2710575.17718155513653935804.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 20:46:54 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Jan 2026 12:49:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e49f9e05c528055c005bb42018a6b5a615b45b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
