Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685FC36B07B;
	Wed, 11 Feb 2026 20:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841721; cv=none; b=qMBX8tzDSoGLl9TYo1ILzotZMTI+gvP/+NRGsiVsLNecdaFjkql/F2jwj5aVTG+Ii4Cl/8Zy+fe+HXHhuwk+s5lz2AD41s7hhk6OUQF6Da23iYnLcWXPacgommX7Rhu9DCwiWkOcW3Oa/qQuTFNudm2M3YEc2b8vafj8AxOI1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841721; c=relaxed/simple;
	bh=Ou6BdmLGIrZ9bX04vPkSkiX3x1ZE+QJug34tDXYtmck=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UXzjs7SCm2syu9qu1D/bQUjMz4O8SFBfDrjkptBpQ3/sl+WLlt7Jg2SoxIbM4O4Ertl6Tt90XT46Dr1TCb+KNje7tzfpmlKy7E9qZMyLOexXcnUOFWNv62tyFBvIQVAg7FX3qyV9Pvgi7xENFOboIIRuJnIJsxjJ0Wh9PabR9WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNqY0ECu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNqY0ECu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CBFC19425;
	Wed, 11 Feb 2026 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841721;
	bh=Ou6BdmLGIrZ9bX04vPkSkiX3x1ZE+QJug34tDXYtmck=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FNqY0ECuI7XQLuRmBgf4SitssPBkPwSLKouhtGmDr0OHoOR5ggHX5NOuz0WKex//u
	 wuoZ5hJKmO2nmlNwvMtz3NvXUWpXhSP9m5DxbOh1aiCtFEYshkac2tkMAUOFr2kKDr
	 k8zqtf2EyDhqylzoOriYmoFEggBEJ0U/dInYP1PjWK4o9odvW6W9By8Bd4BXP/41+D
	 WZSrKpDMJVpsLzNOfN3DM6zT8z/yxaAnk4hwoW64oYJpoQ1NdK7wuzgg5w5SIwPUvm
	 H6+mLLmO6tYpNOjRzAonPIfaZ5r6hLukpG8F5HrZ4+ZB+l2yHPUT+pS+GRVQVNynfA
	 t3L9v52b5Y9zQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4817A39EF964;
	Wed, 11 Feb 2026 20:28:37 +0000 (UTC)
Subject: Re: Re: [GIT PULL] sound updates for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87seb8hal7.wl-tiwai@suse.de>
References: <87tsvohaxx.wl-tiwai@suse.de> <87seb8hal7.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87seb8hal7.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc1
X-PR-Tracked-Commit-Id: dd03dd60e8cdd5ef0f0cbc18276c45009bcc51f4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d061251387903e8502843ac983553f0b2e098ef8
Message-Id: <177084171576.710910.1420725889507497204.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:35 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 10 Feb 2026 16:39:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d061251387903e8502843ac983553f0b2e098ef8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
