Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C200A139D1B;
	Fri, 27 Sep 2024 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727464808; cv=none; b=Zq8qfPYYLVggUPWy5zletj1BFdhpRG8R9oAw18BK/0CLwb6AXwyuaWdl6utBqLs440NgX1xV0+CYB7wFZ3/Bx/OdCzLd+fWhu0H584Ho1b+WP2qDX1Ak5V50Dp8oTGPMSOs4EeJh4LBGkab0aPk3o2iXxjvHPQ/i3n0M+0VelMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727464808; c=relaxed/simple;
	bh=Uirr6FBSVKcUQcYyz40jheSc6h9Ap1A53qc63WpeArU=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=DPB6zIiJyDgvO/5aEdr8RpG0F1XH1i4urIMCD/kFboxp/o6YcnYSbMKmTlCHYMb/3x3v1jY5hAQIUWvUoKNYME0cDMG18MTVuPJG3IKXYTeTwIQ3FTR+LJJVqM+WoUYmIUeKnj8j5hui5Ab9HpBkUbAM2Nu2h5ZNuEXJ2uIkmbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKEeNWGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKEeNWGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ECCC4CEC4;
	Fri, 27 Sep 2024 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727464808;
	bh=Uirr6FBSVKcUQcYyz40jheSc6h9Ap1A53qc63WpeArU=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=BKEeNWGcfRHhjHa81vfus0I0j2lRry3DRC0+CrE05tPXICVbjSdRZWm/oznKw7jq2
	 OV5MbQdrB7xSxzWqVWUwQJujiCQSE6oP0i8WFqUvptbRQ1R+E/L6RZgYg7VCosl6Ra
	 XV0ucjRpNifnzppUZHfgSDpv93jF46GQemotsgX+wHR5/3x5OI0zMEpaKYs5bqSZ3f
	 SFQIQiOnYNbYUs4jTWHj0J10IKWb03fC1qnaYlawvvJTaI2N/AdF2ICMbko5X3fMxG
	 r08UEo+auU8dsS8P1t7SKGC6NjTsZ2zQljkDQLqtzrCUlyyFoiLuOFm+ThaJBg1Qy1
	 ZQ4LGnp43wOpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F374A3809A80;
	Fri, 27 Sep 2024 19:20:11 +0000 (UTC)
From: gfrank227 via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 27 Sep 2024 19:20:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.com, bugs@lists.linux.dev, perex@perex.cz, 
 linux-sound@vger.kernel.org
Message-ID: <20240927-b219303c5-4c032721b2a6@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

gfrank227 writes via Kernel.org Bugzilla:

OK, good news. With the patch it now works properly without my hacky solution. Good work. Thanks!

View: https://bugzilla.kernel.org/show_bug.cgi?id=219303#c5
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

