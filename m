Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C81C218592
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569747; cv=none; b=nJ4KYC34f6aeu/wh8II1+xjqF3OFghdpsDW2DZ+A4FOtJZg8oUr7R+bivrdPlA10pvXFW26BJzsvL43DCu5NaYYwvyMtcwmYinThFE5qoHXYcFsOEyJTBUP6DjTb0xNCNAHU+2iNVVSwR8lcAqHiNqxLf+DeFVrXQorxzEpQRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569747; c=relaxed/simple;
	bh=2/0M9v7njdAySdJ00Y4sXCS9JuZE0BGP/wKBHOKg5jE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DgY+CRZ/B9ATpZj1sbaB+KliemRB/eC/3YHJJudXZJNPOJMP/vm74UbOJvpF1HBEMk2qAOuJMdOW3p47bwrDdt8HqKf2l5ic4Phn7gkIFPwhgwh5LIaMOjrdH5foRs7ha5spw1pjGZCMkOcb8nMcNmWgkHSqZSG6+ubtlOMRB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VikcNEbF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VikcNEbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9762C116C6;
	Fri, 16 Jan 2026 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569746;
	bh=2/0M9v7njdAySdJ00Y4sXCS9JuZE0BGP/wKBHOKg5jE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VikcNEbFJ9hT4Asm8hemF2G1Li9Qspm4S4xsHgdPZhTkiyb5ojvMd1d1wvM4RkJiL
	 oLWGT89BDey6oRMmQNdL4qva/qml6u2wGIv8fPM5AWT6QEOb8/mUExhqm11l1nPB1u
	 eWvmcbZPpEmJSM1htWlKGMsJSni9vf69N9esB7Vv9Ih2qLmUhG9XUlhZDYh8HJF4Yl
	 YYHpPt7l/WlikdPEfZi1BEC0xK5HTlCEiCwSH52WqWDFdbf/H47XHJRevvQMX05skm
	 GlIdgizkAUjyiVyV3iF7tqLuQ7BIE7xIZ7S8LP+C7WTuH9lW9qPkKFwi/UiXBmhbAP
	 VU5jIDeKEaiDg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260115141107.564929-1-ckeepax@opensource.cirrus.com>
References: <20260115141107.564929-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Handle CONFIG_PM_SLEEP not being set
Message-Id: <176856974556.65310.14857215888679145704.b4-ty@kernel.org>
Date: Fri, 16 Jan 2026 13:22:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 15 Jan 2026 14:11:06 +0000, Charles Keepax wrote:
> If CONFIG_PM_SLEEP is not set the completion used will not exist. Update
> the code to avoid the build error this introduces, without PM_SLEEP it
> should be safe to always run the conditional code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Handle CONFIG_PM_SLEEP not being set
      commit: 7a3d1b04d938f31e112fe09c0ffc1af830ba1f6d

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

