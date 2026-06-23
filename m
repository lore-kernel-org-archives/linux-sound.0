Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E921ABD7;
	Wed, 24 Jun 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302252; cv=none; b=oYytcKSy33oGRI4umaK9gBuHMyGTwcPtnG/jnq5yeYNs44opluRdCUz/Ooxfqa/QErVJcwZzlhW/1Qxwh03z1sDXNU+mzmFYrQYg9Z4pWVoV0d/OIKv+PEcrWmv6VPWgA3dKzkutfFBHbCHA9tJUmEhQxeLl7a15A9mGdgJrPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302252; c=relaxed/simple;
	bh=YMecM795Ya7DaGgN2O6rlI/SlafFKVOi0t/Ua1H7gQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uGTxEFHJMBojsZny32bV6cpQIZ3qRgpkkqxfkClodVN+WausRdsanIHTGULIQPF2lLJUgFYd/UpqIaycvWwokpXA151gmokm+QgYQPhF+URHOqE7XL8FZxjPIzqfrTHtqcMgbF0ZAOXuYSs8UeZEZLIxu2zjOWKEcVSsAjTP5C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ML/AO5Zc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ML/AO5Zc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA221F000E9;
	Wed, 24 Jun 2026 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782302251;
	bh=LOu4MYUVfU5OvS7oY5UzVC8btrmOUnOhgT4EKQPyKVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ML/AO5ZcZ5AO9peXHZmUG8zkwCKEYqLHmP8qSD03v/PBH2Ehpy6jjvkckQUnHg7l5
	 NIOLB1SEecGPEOIhbuRAunV2268veWpLTzhs5kIFBs3BOoQn8fekvUD3o4ZTiF1mX7
	 s4FQChclTPGK5zvRIIYO9vx4wB0IFF7sR0s2RC9EN6YodXk81xm5C4UE8FncT40t82
	 JFqjF/Kbqp2ddDQf3PhoPrWm/wd8kmm4b93Sf/x6N/qq9deNJo1/s5hu0YDzQOuNki
	 gtwipb2Ht3KTW1CrwRTjkmHbeXJBfozW9YW+NqBTT767cIjVcKqMcLn3JcZGNOskuF
	 wBqTbsZEySBCQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260623110526.813217-1-sammiee5311@gmail.com>
References: <20260623110526.813217-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: SDCA: Validate written enum value in
 ge_put_enum_double()
Message-Id: <178222244469.59996.15240341686889812578.b4-ty@b4>
Date: Tue, 23 Jun 2026 14:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YMecM795Ya7DaGgN2O6rlI/SlafFKVOi0t/Ua1H7gQc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO8YoxgmAoPF2Tf5bhKC+3DZEb4SetqLq3G78D
 0XAMtYdWkeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajvGKAAKCRAk1otyXVSH
 0FI0B/wIG6gSC6FioW4DxkimvXUw/E9pIX7bHq9QzYwhLzwcHiaEA1fouPusCs2cU3WDuZZ1eT9
 SDWCMtXZgcSc1sF9Dt7wx6MR3w8N9eOR4HGpFFp9vlpm8nAyY0DQtWpvAfrSszknZ1C8/6j2jWB
 duPgCsvwpfe7YlwIPp0Zf2Q80Rnp29+f6zh6adUk/jsnn6R0VYe5nFJM+8f1oE+6N52IROzW95U
 z8asnQBoQmPq+ARy7BWOgDCDI4drkNBUshxUoqECOu5nSKgwVCGG1zPsV8bV7Qnf3n9RcUJ1t/D
 AfjgxL2e4os+Y4WkX7kbgaslUTT3ZkSJkXxN5y3mOlEJwQOA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 23 Jun 2026 20:05:26 +0900, HyeongJun An wrote:
> ASoC: SDCA: Validate written enum value in ge_put_enum_double()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SDCA: Validate written enum value in ge_put_enum_double()
      https://git.kernel.org/broonie/sound/c/1ce42a11bed1

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

