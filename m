Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C1BAD2F;
	Sun, 29 Sep 2024 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727629807; cv=none; b=I25jKOHWkS58+SkBOmahbGurb9CTPlBMfv/KjYlpxFqmJlG8+9EfteqKhMPaREzV0hweAhHEWx1/lqptLY27rYKouDqgRtJfue46hhVKk9qT1BE1wi64KrNi30fFMsjQ1mgfkaVyUGo6o+C97bj4ZitXzKZ081WNpmLPgE4oFDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727629807; c=relaxed/simple;
	bh=Zhh9uCF0avFiMjGihbicWiaMk6JkEXxwz7cxcfcqe+4=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=l7D5zscUnICq5TCdgyG3eAO3JaL9j8Xw4p69pDJXvdnsvzIXLyW/+3SrKNmWPHbwdL4GOk2+Tl1t0L57RPvYx24XIcnzhy9mwTP0f5+FStrHw8LT/fXXOvFxWCWaK9ZFng+1Hjs5BZ7etHl0Px//CU3sMJ3JcPFGmV29wQ9R4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGLz73X4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGLz73X4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52149C4CEC5;
	Sun, 29 Sep 2024 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727629806;
	bh=Zhh9uCF0avFiMjGihbicWiaMk6JkEXxwz7cxcfcqe+4=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=FGLz73X4JQ7rDqTMfH3n8CR+5HCtybvPQP64QVOgpiXAdv0/1uqt+YCtnFdKOFPiV
	 xUSstz0RPnppIgvLEe0FLLZEtVlhrC/X27fPE2YnruMYKN29VxXGOKO9yYnoY2dgVY
	 RptaMfRwIjH2fZ56QrfCbwL0T5PMvVo2GeDE8QqFoQrqWTSdi4iTHzB2r4wF1eVSzk
	 Amh9ECsa5gSqlzfOrIeBDWLcWpO6fbwu5VP6P8jXKRkrJ6C6UzAhLRxssJy89aCDu1
	 H63hpxxHI3F6vbyD+uGLdka0mbCkOJhT8TDCxRDmQNQb5s5UIk9F7YKhtn+kVskPtu
	 t1F3o+6ejBZ7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3D0E93809A80;
	Sun, 29 Sep 2024 17:10:10 +0000 (UTC)
From: abhishek via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 29 Sep 2024 17:10:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
 bugs@lists.linux.dev
Message-ID: <20240929-b219303c6-101970f6d1ec@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

abhishek writes via Kernel.org Bugzilla:

It's Great to hear. 
I send the patch upstream too.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219303#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

