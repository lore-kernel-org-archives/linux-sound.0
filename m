Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16177316904;
	Wed, 26 Nov 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191631; cv=none; b=hRnP1bbpZwrZJ+LYIpot1PGNDjHIaRDs0JA9xxFH4ZQkQU4BGjEo3czZuoCFsny12JMIeNETj4/RBFmFeOFmmTb5HBHKkYAeJGxB2xEGY4GmD3imnb7SXGs7ct3bj0LjIMpPCQIlfKvfoND9Bj/2EuLthSl5i4dyMTuG1nj08sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191631; c=relaxed/simple;
	bh=pc6wzzWiPbsbptplNv9ZYWCTaXC/uFJvY8JPzKsY76k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WC59qQpS6LFYPSXlcsqYlzmLg3jh0++ZCicNzIKc3fG3lMKFmP43beIm7vnhDn1lkaNOStMWTtrdYhNEDlX3I1yXjVvINjr0oUu1JVpi/2K4JNDjykIXzff4N9Unt6lUl0DcDWC5jaqgxzycD8ll5KiGrkvYMtCC3Qzb04w733U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvNv32gE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvNv32gE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA86AC4CEF7;
	Wed, 26 Nov 2025 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764191631;
	bh=pc6wzzWiPbsbptplNv9ZYWCTaXC/uFJvY8JPzKsY76k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qvNv32gEyTo2+LmUDyzb18y9rJh+ndNzVkhhyZ4GgavoaQ9WLC0YK93GtjSSrpRku
	 vkov7z3YiFKtZXXriwcE62SwSV7cp1fiR80aR9cdkJfwP8yQqUiblmIoGXnpSyQr+6
	 J6ovBhvgtmTV+9skSaSq/QpBifjpjsGidZ6NwPmNSvB3oX0pUtfVTpC/+sRCrK8dD6
	 PaVuALUZrIQWDI8Iwjiiy3pvm80vFKX7BPSUfjj4u88nhzUc0lH5q7whchjhIqBQ7u
	 RXCW7LmnKt3HZSjfA+jUT+AwgNCrHPWbJvmyloIH7OQU116y83OLaMuLgeqxy0txUV
	 /PCDeSIjRCSUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF1E380CEF4;
	Wed, 26 Nov 2025 21:13:13 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zf899bzo.wl-tiwai@suse.de>
References: <87zf899bzo.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zf899bzo.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18
X-PR-Tracked-Commit-Id: d041e5e748f926398ad96436a86667dea8b591e0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 430c89fe3a523fe24faaad25ccc76cc9ff8034d6
Message-Id: <176419159252.1847725.16374144037783815365.pr-tracker-bot@kernel.org>
Date: Wed, 26 Nov 2025 21:13:12 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Nov 2025 14:09:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/430c89fe3a523fe24faaad25ccc76cc9ff8034d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
