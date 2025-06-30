Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEBB25FA09
	for <linux-sound@vger.kernel.org>; Mon, 30 Jun 2025 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283617; cv=none; b=RH/8lbpSTSN6i2KvtFu9x3082AQh2R/2LkyDvUJ2KnWk7RoiA8SF5CEevuGlHtVqemMeL+eKua3gyPRTMbzE/B7gIlZag1Q+36Z2P5HtTWjArYC5h6a7fBNYP4T9WVIXQ23skyUhPUDXiRH9U6EzwiVepwKoRZAIRClFTHnHO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283617; c=relaxed/simple;
	bh=tJ/uzbzi9837UPWoXBG7ysmbihwENru7iUHm96fMmyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qv6OPArGaBwAieSumYj3spIxq9LPhAnAAPS7DWIC8PSgedrpJbZl1BdwVIwaAluF0CnQ+bBxjU5nJOGCQILzNln0E48fHHpItc6K6KGSGLJwKNhfzzNKNm2vusJHTw0agFjG3kFXb7eSMjbzkFUhUHOPlQABhte1j303B+ZUMy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFPQN2ID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFPQN2ID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B5FC4CEF4;
	Mon, 30 Jun 2025 11:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283617;
	bh=tJ/uzbzi9837UPWoXBG7ysmbihwENru7iUHm96fMmyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lFPQN2ID4RYodOfmYs/v2Lkkd8Jd8iEhBkKAN0Wln6MnfQTCGyS54jUHtoud/beBx
	 RFGgoHRHuHewHLsJA7QrhQXawS/4wIQ5KlKU/0ThmhbiO+4TaIqFI6tUbzzBS2Ir7O
	 53u0xjcknC6q3xZRT6F+FISmGM2QYG7Oo63CyMnGgeG/o9FhvMChE/bqtzXcZFHhCN
	 tFwrOV36JKDQzeF5EIdewOlA12p2dlj9Or4O1+h49NDanCmpgD2gj57AdLHnrXcD8A
	 bkjG8wHpOx1fiRWI1vniDvW8BG3yzgQCH91K4uO8mkNY8xAy3b8NhdYZFfJc9IhUdo
	 1QzpA8DClr4kA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250626141841.77780-1-ckeepax@opensource.cirrus.com>
References: <20250626141841.77780-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: arl: Correct order of cs42l43
 matches
Message-Id: <175128361594.28563.7460423087555295941.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 26 Jun 2025 15:18:41 +0100, Charles Keepax wrote:
> Matches should go from more specific to less specific, correct the
> ordering of two cs42l43 entries.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: arl: Correct order of cs42l43 matches
      commit: a7528e9beadbddcec21b394ce5fa8dc4e5cdaa24

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

