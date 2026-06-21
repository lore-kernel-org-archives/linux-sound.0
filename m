Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF6C2ED141;
	Sun, 21 Jun 2026 17:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782062870; cv=none; b=fOET5WWnzTkU3rKEFhmMSdt653pn3MYrSTion2FwcnjVvUIAExFsvsoHhbCPcC4hyvVwPyHDRrn8R3aSCU9PqO8ELu7EHhk7xVGFyCMAdIFnV2IlqSCk7Fnd9IajmhxXNDIc/5l4wmjQ8HQYLWns9M7HMDxLFAdbBW4qyi2IVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782062870; c=relaxed/simple;
	bh=n1fpOCZA1vq8xQB3fT14kB5w28yVzE/65b8ESzFkqnE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BD0+33umsYC59DbZjztAdAtD/a2LaBjb70dZTkvoQf+em4mJB8TeOQYc9OVorwWrY/k15eHxY/yDgJDg5eU1Yxag23EenEE7n2erlOqDZ6huSc434cz3bVh1Qj6iQfZwy+45awLG/T7aR//C0mUkWOQ3orBpzg8wtBAcsHNfFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrBMccGx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrBMccGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250A31F000E9;
	Sun, 21 Jun 2026 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782062869;
	bh=EmhM6/YTxI3J3Zz0c3JkLoMlYxGfM/Abvs2YFSud88I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OrBMccGxsE56+3f2w+dD1/9ndFM9gpgt5g/Ro8iGiyPeWWvNL+zqyipSClH96HEEz
	 03wyCXkrJmG/U6qsRyCbQqcRmsm7v4dSe74U8GXRRUuz4vd0nVIox8pDA98NDVVguk
	 k8CRxQVeJ/+dYQgqye1J7GycXDAp+PUYrXCGXgWBdZTmk2frOlXS6UZe6uB2q5W+7b
	 XuEfvPQVjggsyEzqCtc3H7JNjXX4CPL3yAmSHLMBEZVkSdfSHCDkdX+cWpO767iIWR
	 uSjPQNe/ZnJIyrRdKGC5RVtBnkxt6jghq79Ux069djFIOJKJ4oY4OZ+awzB4NKi5tI
	 tempZbAFrZdrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A813AAA6E4;
	Sun, 21 Jun 2026 17:27:41 +0000 (UTC)
Subject: Re: [GIT PULL] firewire updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260620081047.GA304347@sakamocchi.jp>
References: <20260620081047.GA304347@sakamocchi.jp>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260620081047.GA304347@sakamocchi.jp>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.2
X-PR-Tracked-Commit-Id: e954726de56963754c8ac9d9e76b3f59d12fef17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aff3ca32f39d5e64619eef10e1daef3a0ba76b25
Message-Id: <178206286035.447873.4612276926600227163.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jun 2026 17:27:40 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Jun 2026 17:10:47 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aff3ca32f39d5e64619eef10e1daef3a0ba76b25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
