Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18E419D06E;
	Mon, 30 Sep 2024 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697904; cv=none; b=BuIkDLXqLplrwaGRXZ4II0PmSWx1nyhmBcov3ccq7xoVLSlUmtgBe/Bz2PlRtmzf5wvJcwe4Cxv4BL5ixTwpD/jGw6Kr+0ZEEcgkK7jc4zoEpdjQ9GiiU/Cg5QFTO4zIXnbkm5tXy9sS6cY/jxtNye0y+sCmDIRLk465qN4buTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697904; c=relaxed/simple;
	bh=3h4q3O3nZWF4pcTjxsmhFX9tmFa7J4/gtzBFBjRIyyA=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=PDJQrNT/Me6uBuNXq18pD5YYa+6mkB8DAOxz+gFOsaWRc68stfMff7Hz7rSfoCSBz0D8ifCZLoDYU0l4PSlpxlN33f5mPwY9IZRrIf3+i8TGPn/AZgQDKdBzuiKooi3bttOjYjIPB/KhcrwEORoXxOQ8V8WP/cs6A62RobMRs+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7ZwDjAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7ZwDjAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E995C4CEC7;
	Mon, 30 Sep 2024 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727697904;
	bh=3h4q3O3nZWF4pcTjxsmhFX9tmFa7J4/gtzBFBjRIyyA=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=R7ZwDjAopFewbDxTLm8UhXRWXRusqNDAR0p1k2hspkSTNCJZ0O6BpxtduXcnpFjdx
	 1a/m3paVgRpDDrFRih7wrGC5ZVFz2b1ZH9WjM1+Ghl03Jx8QfVcLlgyju+9gujZ5iE
	 +p6RMGqOJFqSLfzTgXSLPe8Ox9zlsEs6MOWxQ2eUXTLTEI35EdHOr2iv8EDnbzxbdv
	 RZ4rGmyTlrXVuPZwpyLggJ8orjivwvThGhBri5RgTG5bZxKBWkCvXxXDxTBeGwX0v4
	 qVxzKb7YZM6Q/nVO6UbwCy1Co0Zc//gRVuQFwdXEjy/r8j+abc8jx1wl7Az4ZkYq7H
	 ZMBUMF5wzTC4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3F7953804CB9;
	Mon, 30 Sep 2024 12:05:08 +0000 (UTC)
From: gfrank227 via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 30 Sep 2024 12:05:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, 
 bugs@lists.linux.dev
Message-ID: <20240930-b219303c7-eed76af13c8d@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

gfrank227 writes via Kernel.org Bugzilla:

thanks. Do you think it'll make it into 6.12?

View: https://bugzilla.kernel.org/show_bug.cgi?id=219303#c7
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

