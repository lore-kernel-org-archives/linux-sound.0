Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFE2459C5
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014519; cv=none; b=jo+YEBnTItGHyeXyYD2m0cqK6CeV3ZztaLsvGDe76725V8XPRXiQi4XGd9IXefTq4ZkbRLlY89o5juoibkALsbybllCRCEJtFrPHyY4Vq1I4yssAIjOx9yke2mki3/cwT1GhyA0PI9DWyajWq7dsu4Vk6c4kbnYxqWRrRsr8pgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014519; c=relaxed/simple;
	bh=K+krhjyhqxujEkOARCqxOl8iD9RJ/yZI1mInou4tk6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CkdBSEb/H6GO6HjSAP964fHF0fGZctF6pvXaTdGUbdIDd0qRRjvTN5+DPR+X8ILZ3F7i+QHKUi0n9GYN0jOrn6Ch3kJkCf1pKVnqBo9rreFL9dFRFQjiZXdfuhwhzpnCKWrhS447uXCg/46775QuoCnwbMQOxsfJjYnGZQZzQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSng+dyu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSng+dyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EEFC4CEF0;
	Thu,  4 Sep 2025 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757014517;
	bh=K+krhjyhqxujEkOARCqxOl8iD9RJ/yZI1mInou4tk6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RSng+dyuCHSuneU0f3QZjhBFBj0JhpV9K6txE4BeX67QilyNGs1nQDQ9KTcgZer/P
	 cl58eXXSzB7omQ+SZ8wSsT2jPn7zOvOlQyhdmzMjsk1hvD6zU3tsaveyobuB9ZXTlj
	 vQKiLSCF1Sq6ozM4mI4k/m6mzAUybyjbMDLFC7nfXnEhcDJLtTm5hKtqDhY2GbrMYa
	 W+PsYZ8UqJg469pnh2UgOEiq65J7BkED7OsxggNPYjYK0J/MZp9YupIy6vXIechP8w
	 /EsTMQ/y0OrkhzDuH6Nz+sTMzrXtPHyZeCcckdQ9Y5VePnV+DPXhFfxXXlPgcATm6e
	 O4XjMhnO7K0AQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
References: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] More minor SDCA bug fixes
Message-Id: <175701451608.137723.601541406669309200.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 20:35:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Wed, 20 Aug 2025 17:37:14 +0100, Charles Keepax wrote:
> Just some minor SDCA bug fixes and some minor structure reordering to
> improve the padding.
> 
> Thanks,
> Charles
> 
> Charles Keepax (3):
>   ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
>   ASoC: SDCA: Fix return value in detected_mode_handler()
>   ASoC: SDCA: Reorder members of hide struct to remove holes
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
      commit: f81e63047600d023cbfda372b6de8f2821ff6839
[2/3] ASoC: SDCA: Fix return value in detected_mode_handler()
      commit: 16c912ec34edc4d7daecde58e40d480858830a12
[3/3] ASoC: SDCA: Reorder members of hide struct to remove holes
      commit: ec630c2c8ce215dd365b8c3644f004f645714a0f

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

