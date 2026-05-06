Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1532459EA
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 02:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778033902; cv=none; b=NmB+U/XeasDtVwU5G/O+LoE3gSaLncSeTlkAJx3X3nVDsQrnlCGJbAy0k3w+wNKwUtR058ugK3Q+NhCCRVTI5iPdJ3XLAxdBtmnqtKGT7BCWItoXN/Tm4MQS1hkj+2x+2YXa6y4oYe9gXUU8j1hmDa8J5pxgxB9YkvodFdrLUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778033902; c=relaxed/simple;
	bh=F22uXgoE3MVAqHgDCRSDcaD0wBEE7hyj1OijHjMVKgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=avN4N6m+lRYhkgOV7Fo3qQWNdmvTxfnupKieTesY7uFxFM/WULZy4/aEXrB6EZkxGTWOHluSbVJILivaCcPVEbBTdgdCQWQbYha0urLe83dzQYIvpBds2tOScQLaVa5QyL/TKLe8GZ3ysy00HNvAUmhkbCzTBpwTUI9wJhHt+ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6rJmug4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6rJmug4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3748C2BCB4;
	Wed,  6 May 2026 02:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778033901;
	bh=F22uXgoE3MVAqHgDCRSDcaD0wBEE7hyj1OijHjMVKgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j6rJmug40m2Tfl+wuXpxQ1s8CvCDfjgC4TQTA2MvAWcNYqGpamnhSMxgK8jkCQMj6
	 jN0a+Y5akYq77S8Ma8PLWk1EnTMHyvcarO1MDwr9ar/gcCSKQtb8IFBTEpjP7TjmAY
	 Jukq1inqiBmvBsQdSb1NzuvNap1N30uNl0IPF/5L5yahCu63wOm9ByXIgqDO7FrMTj
	 bNWJb1CJrqFlMCxkrZ8tHNGwOUTsXw8eYGc1ObomyNUMS+wwbqMvbDeDsPk/WpuTQ7
	 ywLJ0ez6KP9Mkhkxdjv6zz72poGpXrumOl+VWKaCYrbbNwGZ782PL30MFSgsIP41kz
	 IiZk5LhaWKRbQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: lgirdwood@gmail.com
In-Reply-To: <20260505235705.8601-1-shofiqtest@gmail.com>
References: <20260505235705.8601-1-shofiqtest@gmail.com>
Subject: Re: [PATCH v2] ASoC: nau8825: Fix typos in comments
Message-Id: <177802998768.624351.5743690863224356579.b4-ty@b4>
Date: Wed, 06 May 2026 10:13:07 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095; i=broonie@kernel.org;
 h=from:subject:message-id; bh=F22uXgoE3MVAqHgDCRSDcaD0wBEE7hyj1OijHjMVKgM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+qTr7AbXLX7e49p0y6IAQrlFAQhYN9Glvx9hH
 CA9WeHNG0KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafqk6wAKCRAk1otyXVSH
 0JoMB/oCa8aCoJlFiI98JquFOZuSm6pBh1LQRW6sPkqy2z6vp6FllOgU+3GjVeCMlaYWs/54Iw+
 2dmBLkRmZnJucdXF2OmFvuIgVo6NtMbs7iJWwcSqjV6D5DLDEtpQPKkOdJw068zwO7wRsadtH6N
 nh5uBgU22bXzbvikYwoNdyt3J8/d30FJckdOvQkBD1rkHbSTIjqAXp+wkkaQb3P+JR8yAs9lu0K
 cIgH6vQwxutoYDULolFAGb3GMJc31ciWq81Y6s62ZX8pwMLp9FBcfwToa/znIv12XNSQmHwTgE7
 ki8NDBauq5QoqWXFZ0KWQqR70qM8YjZpenUWQNvLmSQI/xBS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 06 May 2026 02:57:05 +0300, Md Shofiqul Islam wrote:
> ASoC: nau8825: Fix typos in comments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: nau8825: Fix typos in comments
      https://git.kernel.org/broonie/sound/c/5f1752afb464

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

