Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E821D3C0;
	Thu,  4 Dec 2025 18:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764873214; cv=none; b=LCGdYyVnq6OXUcMrbwDcenwEgW+FKVN2LzsiUDq5kZMkvYNiUYbgWmzf10nkullmBG986pdWKu7XyXrPYZO6QRC0xQCeYekMZrEl8/LfvbZzV0NGEj98q0AZ/65BOXtvWBaGOqIFfK7rBK8x8b5cYbRelNBlpqmOYiEYs6dAlj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764873214; c=relaxed/simple;
	bh=ItSUv3L/eZ3FweFXq6wiYADgs4bT7mF/+lDL9uU3+IQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KQfyhi/DSJxeQJba8zM1EU+z4oPLUGjMhszJzv+oqfFtMY0vk2grNcR7Bo7ggV5oBKQ0lDwK7uttej+bJMMUNX861dk0sVyMn9RLgIUBKnHi/dgt1hu1lRr7pQEh+78KawkX8/LoDKboBqbagrhhsR/8UlaoBJGZv98HriM2JRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCugqYMh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCugqYMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB3C116B1;
	Thu,  4 Dec 2025 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764873212;
	bh=ItSUv3L/eZ3FweFXq6wiYADgs4bT7mF/+lDL9uU3+IQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FCugqYMh4LJVJ05dL1264x9FVh9z6KuS1PKH053LMuyKN3dR2cBfqfa/yygQzjjTV
	 ga+/npqXA0wD/DjpanTpaspGZFYMh03v832KyPM+xfOZn+8kBdfbXl76UpixOr7Sl6
	 FrgTizvxbdcGMp2RiaVIKZbkE2hccVVsqQhsz3Mutvv6h/aab+/wTF/lbOI+hY8oDC
	 sSLNMCZ18n93jfgpYO6i2fN4MkI//Uxm9Ecv4KBgQm9GK783QtmDphvMWil9yCs/Kx
	 DIZWpAUGfzLfyBX2jLZsEWF0UfyFCZhkEggwbwEUTKvRePdbYpsIbNhXZG/nAe8dyV
	 +FeMCFsoV7hRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 435623AA9F47;
	Thu,  4 Dec 2025 18:30:32 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ms3zslqp.wl-tiwai@suse.de>
References: <87ms3zslqp.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ms3zslqp.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc1
X-PR-Tracked-Commit-Id: eaf526cfa4e537af86543d77f402b9ae803f606e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2aa680df68062e4e0c356ec2aa7100c13654907b
Message-Id: <176487303116.916504.10799422804415010244.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 18:30:31 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 03 Dec 2025 15:06:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2aa680df68062e4e0c356ec2aa7100c13654907b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
