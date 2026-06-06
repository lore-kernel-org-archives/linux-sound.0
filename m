Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3142DD5E2;
	Sat,  6 Jun 2026 23:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780787347; cv=none; b=WEucAa+hQLLhvfd+9NDjof5WLwoNaoJd9w945OJv02x8218+pqu+1ARB3km/MflYlTg+PZSqijhDZEXhpeigXRd2wagmhBHvVp+PpDKD4PyjaLQ4KNc63gNTlquSKU7vzIOkR0CzbOzOY41Z8f8m4rb0BAsVuC3UKSImZS1wA8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780787347; c=relaxed/simple;
	bh=xM2SOj8/ybCuweYpZmANKlg8dACghc00pjBMuPyNNQY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VWFhcwYaRwv9uq1MjerqynxdVp8ico9xABrtI/l9VILSPiYkDfusE33v5O1Z7DKTzMJtM+snZAVkE5tcklHMtGBr6IkrbYEN7wY5a5XzLrIJfAUUswA746+/SFYFVE1wbPQhkynRT1udyHk+5rHwcQUd7RXFB4tG7LsjbfR3kWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZGUsPIV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZGUsPIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D861F00893;
	Sat,  6 Jun 2026 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780787345;
	bh=NnGkcBKqpRFKcSKhStSFiBRzqX6gIdyZGKqVg7kB2ZY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UZGUsPIVFSI4ChCRJHnDDoy7Eb9etZSOzdxE3WptZ/iW7UjsDMv28g0aYEbqBoC8T
	 iqYIt8nNuYsejLIbqyEd1ZFRanG5TRf76rhj9r7Y0PcUXlMEf0tSsx5I/SpeGTNSss
	 7N+r1hEAD6KYqLAXNbDUBqvvS08VB8/o5bSQh34H+3/7jZvPQuhBzsmuZP9yhKdMOP
	 TzvMUs2eW/FJQRYlWlT6M8N/ewYbWiBVhr63oL/lCF0eLveb/Uuu1zn17OXrD/jzZK
	 LFYe3FldegxJ6zQU0k2EfOfpGkhkT5tYitlgMDEzuXzPr0nFSYqPTD9jfh6fPMmdc+
	 bXxSeTf3G2wXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AE23930C37;
	Sat,  6 Jun 2026 23:09:06 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wlwbsl9l.wl-tiwai@suse.de>
References: <87wlwbsl9l.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87wlwbsl9l.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc7
X-PR-Tracked-Commit-Id: 2b5ff4db5d7aa5b981d966df02e687f79ad7b311
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6086121dc424b6906602617449f0445aeab00277
Message-Id: <178078734487.53577.8923417700812260263.pr-tracker-bot@kernel.org>
Date: Sat, 06 Jun 2026 23:09:04 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 06 Jun 2026 18:09:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6086121dc424b6906602617449f0445aeab00277

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
