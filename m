Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294F1369BB;
	Tue, 24 Sep 2024 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206215; cv=none; b=b+jiYswiOI/fI59k+dlJlihmLiDnyQG6CG6WqldUIR9wUKmLdqh4A8rlp4s8s5VFSj0zS1BvDIATRFpkXcFFjH44tcvSSgzJ7VR7UBCqW35ZedlUeUgU8jYjkmwZMbq0YAdEmHBabOP7L4EVNmfrXFFsizYWMF98XmBxIgD3F/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206215; c=relaxed/simple;
	bh=+D7LNhl+/eEc49dvF4SeQl+LgSHL2DeQOCpm1l6mvtU=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=lPnpDv7zL875NRWUh353yterg2qZRU3AeRlJH2KpFbH2JvMswVIVgWa/C4SiAlmzFvTTZtqRCFiyU/AGnfoQd7PONhWSZJrMv+MPE2nY7MhZr3w5ge4pYeAjoN+uCJtYjF82CHJ4UKSdIgbiO6CbaJ2a/aLfP66G//iv1pNKrLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhvqVcuK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhvqVcuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B43DC4CEC5;
	Tue, 24 Sep 2024 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727206214;
	bh=+D7LNhl+/eEc49dvF4SeQl+LgSHL2DeQOCpm1l6mvtU=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=HhvqVcuKOwUVuWSQUcDcSz8Ju8F14ngxgfrsTP9MVQtobvttrrKivLcS/fu9RXLtr
	 QCKmW46AQkgPkpoMOwdj+zXCmsKu+xpS/FA+HKtZdpDmC7py+phJfzpRjkYmmPN9G7
	 z/nSZPJOyQVFzTZ0YrGj6mITYxNRyJdQedFZ7yfu2LcINSJfol6uZlV4w4wSA6gMCV
	 PHZ6CyT04LikeexbwThYGz+3Eg35+9cluNg6Dv1sbsmbIitYQlqDfW3a5vh429vq4B
	 nhUEDdqNpol+7pnZ+D/d5g4p/frW0Pwonz7qB4QcYSIvqNl1v0NdKoFku8CJYOGG9g
	 epwarO+5x5kHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC5BA3806656;
	Tue, 24 Sep 2024 19:30:17 +0000 (UTC)
From: gfrank227 via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 24 Sep 2024 19:30:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
 bugs@lists.linux.dev
Message-ID: <20240924-b219303c1-3c62a86dc7ff@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

gfrank227 added an attachment on Kernel.org Bugzilla:

Created attachment 306914
Alsa info with light off

File: alsa-info.txt.55iv64ruBq (text/plain)
Size: 43.43 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=306914
---
Alsa info with light off

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

