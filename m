Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA01C01;
	Thu, 24 Oct 2024 05:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729746619; cv=none; b=V+IEcDD/SM67hjsVspFEOMD9qL7GBL0kgTnNjahv3KY/kG1hqFTtDHxhqo9kVRHdFrCeS8YfhWWOehp/aQdKc5w2Ksebwrx6fBRBfj5gBW2sXoCca7qpCPAemBQMOFF0NVKuc2CCcUWnhXphKbKQF6/iQ8Q2fU+1EejzvnwoBtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729746619; c=relaxed/simple;
	bh=/rhbN+H6b1KwxzkC6hktenHv0mYbvD9iBfa5Hy4zLCw=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=LeqMAyWC2YHoJJ1VhXi+NVxcidvJj5an3k2ml3wDa0VfNO9WYTm7NPU2MhhgRgV2BL9FQB6XZ/+0aBKmpLy2+mj0+sknYMaB2GJyT/TgnkGvUqHGTQfC1Ia/VYTCaI6q7RnjerQfjsNRtbnTqWzjvhMDw4lc4pevgy30TJs6lD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPHnpDJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPHnpDJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E137AC4CEC7;
	Thu, 24 Oct 2024 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729746617;
	bh=/rhbN+H6b1KwxzkC6hktenHv0mYbvD9iBfa5Hy4zLCw=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=bPHnpDJSpu8hw5TOCvFkfCBuXP9bz3FTuVePptuzyF/9ubBz3kQsOI1SljVRHEAaO
	 DysRkevUs7+KhKL2ai9llEII/eGVGOXK60CnbTLaihCPvKW/vAfYQHr9mLuSWn+Zey
	 qFpEUwyaauK/BhcSJ5i0sBTsF1irPnX/HWC2f+RgPu3rFfjCxhRmRCHX9IAyPCNVG7
	 x4dRIp5a7DIBrNIf4JS5NlgXfhqAaaiRpBu0zNg4GqR5bBgbxPipvsmS8iF2KQP9cP
	 WMO5EzMpDA8mEN9IVqSDCYD9ndNgQ82L5D3LJ3RL03XodjlUJZcLET3H7HMGTsZjmj
	 g4kIP4J5eSZOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AECBA3809A8A;
	Thu, 24 Oct 2024 05:10:25 +0000 (UTC)
From: Rick Harris via Bugspray Bot <bugbot@kernel.org>
Date: Thu, 24 Oct 2024 05:10:19 +0000
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
Message-ID: <20241024-b219415c1-d36f6ea03f6d@bugzilla.kernel.org>
In-Reply-To: <20241024-b219415c0-97f5f4764ddb@bugzilla.kernel.org>
References: <20241024-b219415c0-97f5f4764ddb@bugzilla.kernel.org>
Subject: Re: ASUS Zenbook UX461FN [1043:170e] ALC294 not fully initialised
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Rick Harris writes via Kernel.org Bugzilla:

Please scratch that previous post as a final fix!

Upon further testing while the patch fixes Windows breaking the soundcard on a warm boot into Linux, it also breaks the soundcard (no sound at all) on a cold boot into Linux :(

So with the patch enabled I need to first boot into Windows, then warm boot into Linux to have sound.

So some progress, but needs further work.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219415#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

