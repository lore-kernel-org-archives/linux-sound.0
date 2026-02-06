Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656330DECE;
	Fri,  6 Feb 2026 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419392; cv=none; b=HX1WHDIo5ygg/v+TdyPDNCVLKWgjlnvNEJyu/W+1n1tuoFnNr9MRT6kSQpAkor0dZV7KiYiI4ZGuKZbS1Pzm4uDE9b3GjA7qztQXvFgXiNCp3F0qwK9FJkE9/7KwrVe310r70XI6/0AK7hbaQF1QFpKHRFVx5MgdkT1HFYGJpjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419392; c=relaxed/simple;
	bh=SZ99dtIxOVBOlRWO16UlLLjAJ3OKNP/m+PK2cmlPQFU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GZMoAlDy+ZYesNRAQnp7aiZj95G1g8ycQxeUM7b7+B49JZy//CT5ghJQPEStpoDW7hGF/DBc1gSTIHinautAq4RF7yKNb9RwotNod1w2PxG8n9EtZpbSpCEFVonQBjB1EzsjJ60lyje18dW0la35W+M9+DcVw5E9cP+NfvU6yk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHB9J5Gb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHB9J5Gb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2223C16AAE;
	Fri,  6 Feb 2026 23:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770419391;
	bh=SZ99dtIxOVBOlRWO16UlLLjAJ3OKNP/m+PK2cmlPQFU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EHB9J5GbbK9704caRHoOmG3nJslJfVBSqEY7tlA/7XuRaPnNGIgp9d28B+0gS8pSF
	 PWOgMtIIUeK/gnLLEsiP+XhMDnw6pCELf98tJlrj8Mgp69WFw9hHurmxb6FP13WANs
	 K1yMWWNl/FQRHOvC9SkMxwiBHatXHgeQDcoMtnc54K2GYYenar/O9zMSemGGBV2SE/
	 2G1W4xKL0i7O+QcxPb6mg4J20MrWcapGnijaCScuv5k8iaG4hdROc+dGxTva5l6i8X
	 KPc4OtXgk+0mEolM1MBzy3w2+EiIIxFnF34va7uNSVDlvxPr2j2muVcvytCYkG1KBa
	 rA5UB9OtsxTtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 483193809A17;
	Fri,  6 Feb 2026 23:09:50 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h5rub3yr.wl-tiwai@suse.de>
References: <87h5rub3yr.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87h5rub3yr.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19
X-PR-Tracked-Commit-Id: 51db05283f7c9c95a3e6853a3044cd04226551bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8770bd8f91749dfd05714447dfbd511147cb9576
Message-Id: <177041938874.1109628.11238105590753401520.pr-tracker-bot@kernel.org>
Date: Fri, 06 Feb 2026 23:09:48 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 06 Feb 2026 10:45:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8770bd8f91749dfd05714447dfbd511147cb9576

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
