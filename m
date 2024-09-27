Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332032AD00;
	Fri, 27 Sep 2024 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445992; cv=none; b=C/0cwF4VL45/J+/8TXYfYT78yD9KA+h272NOf9yYqH/LgCo5aW6bk3z+5tnysmrD3DGpSKv0NtE8P3dYt00lb7BI43WvNXQ9BeRsh3tOV6Q9ok4cbrXUcjeE4XESnaf4vn37MsDtKn4+h2sLkStdG0TF/NFX6kRRCupQf5rUGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445992; c=relaxed/simple;
	bh=bYMFiHPY98JmdK52iqkz6NE2QQygc4jCovSXN7ZFcT4=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=eVDnbkUWZxSAtDWnqHSwjFt9DB35NCIGjCCfSO8bt9HoR5bT1unsxM4HKc8d3fJy7pr39flVaECSM8Qu9zMW0FAX+Np9eB469maPHtH8mfCs7mQhFJlbl0HXlOhUEXaJQ4uhzzr8bICoTVb8A7tO3KjpfJUeq9gNn5LB2koyEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeRs2nsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeRs2nsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B173AC4CEC6;
	Fri, 27 Sep 2024 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727445989;
	bh=bYMFiHPY98JmdK52iqkz6NE2QQygc4jCovSXN7ZFcT4=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=GeRs2nsCmYsAeeL6kpAdyqN913oBDEw6TRm8DfiHvieMypxytTAZ/w3xmNxY2B4kV
	 kad4Mzzwxpmw9Dad7OnWYh4guaNjpMWxw8el4c39Hpz6DX0VlUVU5rtQLj2EiXykXK
	 TilAOO9Pt1qi+ShZX620AyNcn7qkP4GkvHFhgYWXfQcawFR3aJnOYsYnaEl3R/NeRX
	 H7cTpPAWwQdTwde9IyPLF4bgwkoTUqzhu1GiN4R3coWhsLm+0tpw4Jv56dP2Q4PM3X
	 sk6mcmm7FAUIa6sKUjBUMPfD+XXM1DDqLI/L02u+mwvxcSZeLDZDnTLpoaNmwi4pPK
	 ggEtz6ZJEJhWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 782253809A80;
	Fri, 27 Sep 2024 14:06:33 +0000 (UTC)
From: gfrank227 via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 27 Sep 2024 14:06:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: perex@perex.cz, linux-sound@vger.kernel.org, bugs@lists.linux.dev, 
 tiwai@suse.com
Message-ID: <20240927-b219303c4-0f29e88737ac@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

gfrank227 writes via Kernel.org Bugzilla:

Attempting to build. Stay tuned.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219303#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

