Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4653E8C63;
	Mon, 30 Mar 2026 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910538; cv=none; b=kyeWtL99VtyKxsvQvX1auitJvFC7jGLaNHJ4lFGZkZs6c81T9dOuL43bnp9xVy8KDHTiiZn1IBM260KNowMqGvnevGEOlOJm7t8U/N2mLIaYF9ClIZTeotXy89FzLctu6HVXVqnZLC242SGF9nVcCS5Ml0Vvglu2Ihu2x5xKn78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910538; c=relaxed/simple;
	bh=LLzGo7V9W9+SfjvxgiXYvbS1io5jVFiegQHa5XE/cCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZgzjQOxlXnuc0X7TFGAv2iZPDzybIBVEwIS4oDFYS5rYrE+8MVsAiyosc/pRrCl5eDHL3oKs6RUg/HamKP0QWSF220R6RClc95fvm2CRD9oqZDShF9StNwBod0n/p+DLbcdjuxFD2qPR9WtwE2HKPzwU62yIoe5pt7zn01ICLB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bxxy/e2I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bxxy/e2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23635C4CEF7;
	Mon, 30 Mar 2026 22:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910538;
	bh=LLzGo7V9W9+SfjvxgiXYvbS1io5jVFiegQHa5XE/cCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bxxy/e2IqC0LejI0nILCkXMr08C9jQt8glbyrTRiLt92ZUm1Szp03LJoVZvXQZeNM
	 3Gr6zXwqILJDDZkqog28NfJbq3JfoOTnjO1Lf2AKwEkShQfRNsCqS048JUX6Hnawt7
	 XP+yp4img9WxnESPXgGnt4V2FWBexP6aMC9pOw3P+jgak1sLO6gRTCas4cXNW89r7a
	 MB9ka8aEYQb5wRcITRPHRU/pUNY0lu1vbJyAB0WfgYgyHJq9oIIf1Ah61OiqoItUs3
	 UBhLJZ55jV7ahT3Y3rbknJ73XP5GxtROq6GE5azKMAD0ete9ASKyuFNfqkFIOjw+R0
	 CC6ZufJFNVojw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260324210909.45494-1-jihed.chaibi.dev@gmail.com>
References: <20260324210909.45494-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH] ASoC: ep93xx: Fix unchecked clk_prepare_enable() and
 add rollback on failure
Message-Id: <177489590946.236167.16255573814551398239.b4-ty@b4>
Date: Mon, 30 Mar 2026 19:38:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LLzGo7V9W9+SfjvxgiXYvbS1io5jVFiegQHa5XE/cCc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxIRk92f2Bz7SbTSrts19hBDJKe+OMyLuSCS
 6VFmmrBTOuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8SAAKCRAk1otyXVSH
 0GV8B/0X3N1L3L3wIvd9CY64zrbCwOs9nj88BibyzYIkiWcw6iiB4fCgHScVLU3lv+EJV8VN2qX
 jAa2o1zCftL3zKELMrhkgdwkwnmjkscAGmslmZKEqwn56X3RJd2iuzNyLHlYrfRMzMhEWRtJXq6
 75VxJItnqfh/uLi5nS+7ZeqcSkbNdwUdxUZ+mctFpYVTbEFmivFcq9QfVMk6rfejEs9pwWNIkk+
 H0u1JSryb0GFZ8696612zDqCnD1kRvw4wTkIpzkBeJ4815i5PNMNly/PMcbT6b9MkttM+SnfU3R
 fGpF3J5OyR9jtZa7HVEon6s8dqzK6PN3xqoYlzdqWeE81oMN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 22:09:09 +0100, Jihed Chaibi wrote:
> ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure
      https://git.kernel.org/broonie/sound/c/622363757b22

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

