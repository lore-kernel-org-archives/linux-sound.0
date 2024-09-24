Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15D139CE9;
	Tue, 24 Sep 2024 19:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206217; cv=none; b=MVM0Rh4S9J7kRgKUxm1TFgf7TMWc8LQpucwHahi2EKOGWp7MvNPI/S5JtpDmBDqqu5RFYNpaTow4BRG+E1Rrb4er6ux0VzBwMybUY0pvh+NUq23IuyQQ+iWCWabinSsrZQ0ArlFBmaXYTTxg+/8/JGSRAuFYDr+xJ36cfwo3nAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206217; c=relaxed/simple;
	bh=v47Bvjoe610f24LOpjaYw5B1xmjPdEOWX/uhevYqotg=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=W9Wh3PJW1LtpDXmSDeKtyT8Dk+gwJubs4MgXsTfL0AYMhjA9DIseNr95LjfUkt2KfQ1lc337N3HBi+std5dMd9CAaBwRZFiHZCsFznlm4aWmtkVinyOHa0p83LFp7Y98pfXuQ3NOFimTNdGpMckI/LRDxPCTB54fNeS4yge3iEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uR1wrzY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uR1wrzY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7012C4CEC4;
	Tue, 24 Sep 2024 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727206216;
	bh=v47Bvjoe610f24LOpjaYw5B1xmjPdEOWX/uhevYqotg=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=uR1wrzY8aP2XSGkdy+ST8JDu4VE+//08cCmDgJeP+UxehqkaVHrA5dbryT7tlIB15
	 oA2NRDWrTCDoK2Y7OlwdPyzHLpu1OHbFrGRMEAz2uNxvQbdB7UaiHhj8StztkCLP4g
	 X3TY7AJlFAQfeYrmS/9bDuMgDSwuhQiJmz3PfP+q24kip8Xgx575fnV7Cj36PTcXgY
	 Z+7A/zNPFxhOsRvAzsGOMlFsgscG75Lgd4AzIs72MbPNlSFvJ2sdym+HDOIfXwQPHH
	 k9MPPrL6dwltVQ5C3jiaKBsOO0qJnbjF3EHpc0pOZQcXAIv5KpqBpB5YpPTwXtAEIl
	 /xChKH1dPZCSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 714F33806656;
	Tue, 24 Sep 2024 19:30:20 +0000 (UTC)
From: gfrank227 via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 24 Sep 2024 19:30:14 +0000
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
Message-ID: <20240924-b219303c2-4b15de8a871d@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

gfrank227 added an attachment on Kernel.org Bugzilla:

Created attachment 306915
alsa info with light on

File: alsa-info.txt.1mKG55Txy2 (text/plain)
Size: 43.43 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=306915
---
alsa info with light on

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

