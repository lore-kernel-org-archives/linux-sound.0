Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3AE1C01;
	Thu, 24 Oct 2024 05:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729746617; cv=none; b=Bmlvqlkttq6vVhtN9Y0G0KbtRS7FDTaGy+SFcfTZ/uVb1eJE8/r63xpinXcO0i45KVBGqEa9KYY7QJ3iFBbTvucyTLPNYTHNhDmI8xQ1YRnNBTxShM8RCXxwr/neQQ5xVY50jcf9dqbIXkJec8naqwQhCkOylXZWR32u+kczv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729746617; c=relaxed/simple;
	bh=9llLyxkvS+EySBZErkt7Naf6JGKQIn9u6dOkL76R5/s=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=Z5SSwH4trcPuAJ8qpEnHn/XjYCT5gZQVkU1/V9OcWHeMMpKSFs/H1SgLEjWa7gcHepWDpgVC4jC3jwE6YC+tPvqrRf8y2rCfhwNqqitUj3Ki2e9h8CluzxqwWkeey1lJmQN4F/KwCYc7JzQrHPPPSPa1Mxnf+ErmWJZfMn4BdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix9lyjUl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix9lyjUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC7DC4CEC7;
	Thu, 24 Oct 2024 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729746616;
	bh=9llLyxkvS+EySBZErkt7Naf6JGKQIn9u6dOkL76R5/s=;
	h=From:Date:To:Subject:From;
	b=ix9lyjUlOsqZpV3tAfjijNUFo4vO3+JUaBFAUeP07A3zSaR8pj9/ba3/cxkFp89Sa
	 UHFFCcnO3zGumUJ3v0XriAqjtpoRS3l+KtHPOYi1ddbAV5EDmU1kkAMrfE/TAwUxEO
	 JpzqzOHvZs7k6Zj7YrFNMAtiUEQ0OjozHlXXVeRGMjG+BxZsg57t25e0KJQnvBG1jU
	 f0l2izT6TTzCCT0mEhPcMjawgWkFC1jJLjmHtIBHl2zPsswof1FDwfgbt8kU903oeG
	 WWQPwg8KEAv26LIsFQ2GPckV0F4CnkgqZUukar87/DcpMmbl45+p5Xuy92eJ+h5djX
	 MbPSRpIM6Ld4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7952A3809A8A;
	Thu, 24 Oct 2024 05:10:24 +0000 (UTC)
From: Rick Harris via Bugspray Bot <bugbot@kernel.org>
Date: Thu, 24 Oct 2024 05:10:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, bugs@lists.linux.dev, perex@perex.cz, 
 tiwai@suse.com
Message-ID: <20241024-b219415c0-97f5f4764ddb@bugzilla.kernel.org>
Subject: ASUS Zenbook UX461FN [1043:170e] ALC294 not fully initialised
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Rick Harris added an attachment on Kernel.org Bugzilla:

Created attachment 307033
alsa-info.txt

Hi there,

This is the same bug found and fixed in https://bugzilla.kernel.org/show_bug.cgi?id=207553 but for a slightly different model ASUS Zenbook.

After dual-booting from Windows, sound in Linux plays briefly for a few seconds then quickly degrades with a sound effect similar to that of a cassette tape being chewed up.

Fortunately all the hard work has already been done on the above bug report so all that was needed was to update the kernel to recognise this laptop's PCI ID to apply the same 'ALC294_FIXUP_ASUS_COEF_1B' fix in sound/pci/hda/patch_realtek.c


Thanks :)

File: alsa-info.txt.yAusLmZ8V7_WORKS (text/plain)
Size: 43.16 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=307033
---
alsa-info.txt

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

