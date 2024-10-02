Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866591D0BA5;
	Wed,  2 Oct 2024 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882105; cv=none; b=NkfpBvT0G8U4g2atjFae4cKn9z/84v+R6ghguThOJ5wwlC0sfaKaTD8RlrZRILP1WDVT0mPVwC7qr/ErqCu2/4Mjedtt5Tr0MKFJelIOifgeD6VJcpNFvrFPX8dae62aweO5RQmGd286LsyACTziorHsWr4So6QxUdc+Y8Ewi6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882105; c=relaxed/simple;
	bh=PfQnazah1z/sNKvTGca/p7zxq+ml4pdTpgE2IHxjHLc=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=GoUI62Bss5j2p6E73FN+Rgyt+c5hfCx21tQKWblxXc0jZ6d6aLH1IKENM9edga6GBm/Ks3t6jmHilMayqRJlCqpnZO7P+mr2059aSD2aFPJcYozbmPiPDMjtbfdtxBgSfPpur0vVbU7V2FNsDac+sIKF9D9er8JxJh3fMT3FcJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8BU9RJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8BU9RJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E29C4CEC2;
	Wed,  2 Oct 2024 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727882105;
	bh=PfQnazah1z/sNKvTGca/p7zxq+ml4pdTpgE2IHxjHLc=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=e8BU9RJnn5UzldaRD0wW9cq+w9Hv/tLCvfQotuEPhSNmxdtgEWEz1YtKXkyZ8Tmnn
	 WSXWI9+9PGyGfs61igXC0k32uzpIkLLNC6Q2nX+XTqLani3V7pZeY1nVS+tst0z9Vv
	 AxOMgMT8HirYycO0kTseXXnlZrGMydBVITP7rHxPw6fwPv5A1m+ZNH/dkMC71Gvg0S
	 mgzh1UDPs76m717F/dRaDd/8FGNk/gcIpYS2I2S9L9qbxIvS1Pz/uusq06k0md+4Xk
	 wBE6EWAB+EEB7l8uhMnQbzaK0FVknihbpgVGPDdmxHDrx5fMs0CbnHU4dbyOvesSCp
	 7jgabiQjiAXcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 794AA3803262;
	Wed,  2 Oct 2024 15:15:09 +0000 (UTC)
From: abhishek via Bugspray Bot <bugbot@kernel.org>
Date: Wed, 02 Oct 2024 15:15:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: perex@perex.cz, tiwai@suse.com, bugs@lists.linux.dev, 
 linux-sound@vger.kernel.org
Message-ID: <20241002-b219303c8-ea09e4d017a3@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

abhishek writes via Kernel.org Bugzilla:

Hi,
The patch has been included in the 6.12-rc1.

link : https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=d75dba49744478c32f6ce1c16b5f391c2d5cef5f

View: https://bugzilla.kernel.org/show_bug.cgi?id=219303#c8
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

