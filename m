Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC142C4FF;
	Mon, 10 Aug 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380705; cv=none; b=L3LCdslET8y5Ju0GHESMKV2FwY5x8idgP1cgEg9Z77zhquPeIuurUsjlpiFS/U2MOppoxnJXYRiGuSozUUVVyVG6UijN2qDlmRmqO4GLsy+rlhuq+xaDAqndbxHn14PvUDdDk6kzmntOtQT88qQRVAPeXVekK0UHittBLS3tFRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380705; c=relaxed/simple;
	bh=ZuooAG5U5j7XM3xRLBlCFXY709CL4tws9JvOuI0NlUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VTrgI88RpNdJA5dgs8AcZleW7lLp6NLBBUJotGTXxRwbPGLarwFd2TyB+4QhUjeJ9MYPUfWQgfv5nKsSPGN0AHTYKQu1hVfeDA3KoMsCQCtIVQZ/VDhvWsTX0hFA/Dyc3Wf03PHwXxXnP0f4pW3eEj0VK12GKpV92L1TzYw07FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IP5en1cj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IP5en1cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3011F00A3A;
	Mon, 10 Aug 2026 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380703;
	bh=CrFkpqWIt01AXUIxLFRQLc8l7e42RnKcbJvBb9mlotY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IP5en1cjORZ5N9yTbKwy22c1MorBigN0RinFNIFh+B/30Qiy78PfUZH/Kyhl8hKHH
	 ASipT+iR17bTk7N8RVNZTL6BQj22YMiBooEtTm1BadNXkNm6INXRik/jWJu6uu8mls
	 p7RWHRrcKVfo2kayrinWubJj/74enoYxOJWyuFTASHNK6z5HKR4gxS2K7JThGpKsfC
	 wT1qfUxtW8SLdtJ5j1BayliK9QxrNvPmvCKSfqeMncYScH27cuqmv7+RY6m7jDJcyk
	 BAB4HYTdO4albU8aVzZ703O9rnt/vkXozUbavodnSUKRKbF+9DdZOT+4RUNU6ehRAY
	 adqDMH/nUeL8g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Rudi Heitbaum <rudi@heitbaum.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <anNU3tOUR7rOReSB@5e001e58230e>
References: <anNU3tOUR7rOReSB@5e001e58230e>
Subject: Re: [PATCH] ASoC: rt5645: Perform the initial jack detect at probe
Message-Id: <178636732740.155010.8189524501266522274.b4-ty@b4>
Date: Mon, 10 Aug 2026 14:08:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZuooAG5U5j7XM3xRLBlCFXY709CL4tws9JvOuI0NlUU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqegGd4PmuALnz0vg72WyilV2zp42S33OrXS6qK
 sus+6XaAQWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanoBnQAKCRAk1otyXVSH
 0CLEB/0R1tRvRTQ08os6RM42Ns9hCwite+m/TZzsp0bYIXAFf6Z0c3sqVuN7SEOr5gzlEQGmQAZ
 VJE6kDtzmqAyMx1riphum+dn6Js7g8hZXzJhKp+wNprG+Al9kCiRwKHQ1cvkI0gxENLVqJOUwqN
 mnQoyWuyqiBawVsktbaX0lW6ipltBeOAsxf0Jn3CLVOhFEmUE5q3sMjRy1ewKzG9aUMPCYOZ7if
 X9zJC42kY/9XaM9ZrPKnJ8QiTu1xtZgumo+JPbsgfaNbn5WtkL6Ob2pXCoV3F6bQW+yO1jVhtRX
 atd0LGlQCL2kEuWwP6MjTLXOIhPUCp6DKMrSoaXvDviGX8NU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 15:21:02 +0000, Rudi Heitbaum wrote:
> ASoC: rt5645: Perform the initial jack detect at probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt5645: Perform the initial jack detect at probe
      https://git.kernel.org/broonie/sound/c/54b279699279

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

