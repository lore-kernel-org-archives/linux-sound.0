Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E24D7953
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644745; cv=none; b=IL3n3kxRLeuBvuOt/moK5UXxrdX7HimssKTbkrT1lMttalco4QcX59KlTOyEI4NaOXdBcMu9Qp9Ek10BKWT0E5YVdibyDCeN0puwGsW9oen/MXIgewhZiMNl9rMhqOVjD9to2WTifqAP8QDAvrM+p+h1P+lKnkNzHF1WRPCfS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644745; c=relaxed/simple;
	bh=/FI7vAURKpZxVsUpR6jDWufV1A9d38FkBmGvIQ9FgJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uAWZ3nM6ZIAlvYDOfyoJ2ypCEb/i7HBRk4VrY+Jp6KJGe8ERwibyLDi8aLyKlr2s98eydyrnKSycTn3NZqPzGDUvDn7jyUXOu6pmZKI1R6xMKUQab+5L4T9MA5x2z8bY0fZ4PiajrBd+z6TvCKqgi0Ac2SCi8jtV3IzZOqLCJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6UH8W81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6UH8W81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F194E1F000FF;
	Thu, 17 Sep 2026 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644744;
	bh=S5kZTwc+Y7f8zSiRgfEnjiO6nMuBkbcmHGG4IStiKP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T6UH8W81C8LAE8oC7pqKNrCoBm3RVpLUTgSQxgrrNdxLb7OEXW5nWjwiDY3HHcG8C
	 zA/5urwAJNEU0P2pTAtq7FxfAI4gmA0OdMdiXgU59qGrUodwlh3xE6wA2v5NN0NFdC
	 z+tQgk2CLvQYWeoEVgEWEvPXENNU0+Cl23814ivmGHrrPZ78WBaKkJOtfuVbp1qUGH
	 oRZLA2/CnG6/NJ2Eg5LcUxjXABrmvxHJB4L7U2onywRttb4OPkaTixrmYJCJjEX+XA
	 1rG/q6bo89br5saiuMUURoKTzIxE0b9cMFHikiAeJrF5zxK+IjWflrJX0jCKAGwTAO
	 ZERb3tJV0L8bA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20260915023006.22940-1-zhangyi@everest-semi.com>
References: <20260915023006.22940-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v4 0/2] ASoC: codecs: ES8326: Modify the configuration
 and add kcontrol
Message-Id: <178958239923.100121.3807580590016546583.b4-ty@b4>
Date: Wed, 16 Sep 2026 19:13:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/FI7vAURKpZxVsUpR6jDWufV1A9d38FkBmGvIQ9FgJ0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8/F6SVFs8O0CJUGcCmTj3TktzScb1vANPZfb
 JHdoktqoECJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPxQAKCRAk1otyXVSH
 0AgWB/0aGMJA6tor3N3XbOgOOfY44KDq2GZYb3oKDMHWO46vpOFVToEWUCm0bDn/Oae4useywqA
 iZsUBMzNeHx5Jr1CJI+j+D0UmIQBKJOnZcK5Dwu0h4C62doIbVpU/hkoi/ckv0pEw+LAkZkcLJe
 1adbsMvryBpkMy2FjSYuRJWxqBJ+cuZqe4AHelmztgVArZ3Cjw3L1db0v92MqWklGBmdeGlXYEI
 Qg2W8CUgSQvL0HgQ3es70oA21z1pIsGOMZS8RvDmbFmLCX9z+t/bNxizqXC5UeaQwtQOvnWxxEX
 EpbHp1gSIIQzQjYvRAr0NMLbErxGUdJ69SG8YqcYmCpQEbgY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 10:30:04 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8326: Modify the configuration and add kcontrol
> 
> Modify the standby configuration and add the kcontrol related to HPF
> 
> Changes in v4:
> 	- In kcontrol, additionally check whether the input value is less than 0
> 	- Move the assignment above to the end of the function
> 	- Add a lock in kcontrol
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: ES8326: Add private members about HPF
      https://git.kernel.org/broonie/sound/c/6d5cd3882ce5
[2/2] ASoC: codecs: ES8326: Adjust the standby configuration
      https://git.kernel.org/broonie/sound/c/b05772f71877

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

