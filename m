Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E743DEEA8
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075358; cv=none; b=EM56OpKCjttMJCQe17VIlZEoAfU9QJNBhAcGyNrJ8RViu+MVFWBRjNubDSUEIQOaa+Q6Ha1ewYDMjIT5NN21YEoGvBrXERgxVVIbvuiScBsXdsvL7Q1zJXR/jWhwE87W9LsQ7ZmFtCiok+XoeTwHkmyxZjkLRkAMm8q6QPPdIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075358; c=relaxed/simple;
	bh=TXox3h5T+uF7bTIwe+wBFFLGTlWZA3JJYq1E2cQdV5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gwvFukUlJMJxUulZRGi36E+uyucSu4srsIby9Ytlejtc7Gx/+/00aGF/U+sgzb5+RF2eSIEELHtA+MrHCjMgauhYhh7tYnqCgWQwbfq2j/dYe0EaJbZ3wquygKJck0yINqsSnwQL2JW5dEvQtP1sUgsBs3Fw2i1WSf968M5gYJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bl45Uym5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bl45Uym5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64C4C4CEF1;
	Wed,  9 Jul 2025 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752075357;
	bh=TXox3h5T+uF7bTIwe+wBFFLGTlWZA3JJYq1E2cQdV5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bl45Uym5fuM0O7ZDs9MDi+zThI32FjmXFfkiK7jJk8Isuf2xhZWq0Uh4eIoIMgepB
	 PK9YR5hVcKR1bxZesJYgAdWdOQCoBlG7AymMq31c9SzOh3a0DZb6cQzlmpvnpb6pr2
	 rmpts8z73UEVeXrYQWTmoKKnPT1wg2Lpp+vCrdO2gHLD0JSe+USNgLF5xXTZsLT3OE
	 1I2z3Ej8D5fjJNLESGEbr21Urc6foL7VdS7T+BiQ0D9zFl81xEiTP/LHiO862NfPKl
	 +uDMAGjXAidzTbM7VNARgJSAxPRVgwqzr3VTR89mp4h2R8nBAHqar3dCq2vHW71JQX
	 VmOWxOOqFscVw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250708105009.1883627-1-amadeuszx.slawinski@linux.intel.com>
References: <20250708105009.1883627-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix NULL ptr deref on rmmod
Message-Id: <175207535511.695799.7803207392167455990.b4-ty@kernel.org>
Date: Wed, 09 Jul 2025 16:35:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-07fe9

On Tue, 08 Jul 2025 12:50:09 +0200, Amadeusz Sławiński wrote:
> When uloading snd_soc_avs module there is NULL pointer dereference.
> It happens, because codec was moved into pdata and
> avs_component_hda_unregister_dais() was not updated.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix NULL ptr deref on rmmod
      commit: a609bd74b8680dba62c44f7e6d00d381ddb2d3c0

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

