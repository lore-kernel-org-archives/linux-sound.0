Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284DF355046;
	Fri, 14 Nov 2025 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155550; cv=none; b=VtvFoFiC9PzyN4DzJZ6OV16CoOXfM7nkSAavL0zej4FB1h+g1Ork9wmfdIWdHtmVt3WFWtDj3tXX9oC2Ov1IrRcsfrxw9BnneaQpFHDdWItsPB2HdZBtziGfx3pYwICmawyA/ghJ80x7FuJaO037cjEbba/Zp/ZLeQt362KVOmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155550; c=relaxed/simple;
	bh=YPhFIB+9+x9xkf8xthyspWQ+fBnuXCua8GnaVEi5qUA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L0oHXEB1xEvjItEJh11K/mJXHJWDgAyZU+xTIhvDhhpyO4V5TRKV1/+wY1FwD71doNqHZvtL+rFRSAbfkIJKxMFnxoyIva9tHE/OFzDG3vvnWGfFIkDv/7dxUAW32YphOG7zFyGpMJpgUatSvznsfmifyxNcYgvmFkDcpEFFCHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgdfllTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgdfllTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5F8C4CEF8;
	Fri, 14 Nov 2025 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763155550;
	bh=YPhFIB+9+x9xkf8xthyspWQ+fBnuXCua8GnaVEi5qUA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XgdfllTcwne9M+cWMbUi09J8TlLGrW6NtRGRFNydJ5LHAceY5Vvd6bnU1zhWe8dp4
	 A2TkZPqNwiA4ghjZ7NVTGJBwOLNDHQ5+bTNakhOE4E7WlZuzvOtYfmW1lvh1t74yp0
	 nc7jqMjf07UhoulgKvjFarNFH3fTknOXTjpZ0aX7DDO658zAaJt6/wmSfCFvqkC9yy
	 OUjcYEod4AOt1sbTWqUuVwmMaMupfWo+qsdXp9HjmCvXoVpSSiGbtHRCJJR1lIhR9S
	 moXl4dVdqxZ7IDWyYZE3gQYSui+Rl3KVnhEizS/ghnAEWhyNiwbNGkAc8HUGsNyFSl
	 5cr2orzV3Ew4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFE13A78A5E;
	Fri, 14 Nov 2025 21:25:19 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fragit3c.wl-tiwai@suse.de>
References: <87fragit3c.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87fragit3c.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18-rc6
X-PR-Tracked-Commit-Id: 21a9ab5b90b3716a631d559e62818029b4e7f5b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27f518609e585d28a82119ce77f6c7085b61da50
Message-Id: <176315551835.1840076.3736634363648921050.pr-tracker-bot@kernel.org>
Date: Fri, 14 Nov 2025 21:25:18 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Nov 2025 15:31:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27f518609e585d28a82119ce77f6c7085b61da50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
