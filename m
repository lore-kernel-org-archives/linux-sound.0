Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5D834B66F;
	Sat, 18 Jul 2026 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375499; cv=none; b=m1u2Fvrj9TFOeekQKnXK2tLYpEIWw5kJ0GV872qQL65QxwSrYGnTTBE/TK7euupq/AdKEOmhXSSBgKoVtnMOkjs4R0QdKxID/3jU+iUPGJee+hafgzP5iiuJG4Kn3HoKnTJc8okqkeZqcHNM1oOhpIJS8vEqlIVsH1gi7m9IakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375499; c=relaxed/simple;
	bh=zShSTrRppGP615BMqh6C7h4KJ0EQxSE7U+LfEa6pH4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jpx5rR/Ufj0fcmq/wjbVDYZRLFtQzaU1CZC2XkS8fXWyFtKL0e61Haqah8y4nhq17E2Kcrtb48IQrbMIskgVXNDAMdYodLBsHEBD0QQRbOV3MUEFBmhjc64rtUxj/0/Ogc7liOAcq2gx4H9Wq+wt87el5ApzclJEU+vB6D2loBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDLrTq39; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDLrTq39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FD01F000E9;
	Sat, 18 Jul 2026 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784375497;
	bh=F3Vmzqa+B7bnlNDZlpa95iUzPwaZ8ZUjd4m0PWZMX5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QDLrTq392zodIIq8YVemEq9q0HAQwARtV5rLM/m8TtgXxmYb8mKRMBk7Gk8TWpxL+
	 uGXb2ppL8xXUhVxLrteb2yS2nZBEFpto8G4dKmjIqJ6zzkIMnCZV3X7TiAcrAXneHD
	 Upd4r66hDf1NU62aYRlnmwBQwtFlUw7uctNazAonr2MshQYJQiTW96k8L8AvuJAvY4
	 IzEYjlAgHjEcf6qGlu/ILpHxPISUKCrTm4HNHm0l4r9i8ENI75tPtxVWAkmF1s4QKW
	 LkX/FjIcUpJG6pNRaunVJqVbXP/9KWpYAL159LXHuOJvJk1IaDWpbLab/tL8ODLqJ9
	 jkr0IyJs6r0eg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260715120135.939280-1-rf@opensource.cirrus.com>
References: <20260715120135.939280-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Add support for CS35L62
Message-Id: <178433879568.61249.2098398768104942925.b4-ty@b4>
Date: Sat, 18 Jul 2026 02:39:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zShSTrRppGP615BMqh6C7h4KJ0EQxSE7U+LfEa6pH4A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqW2jHBy+5JaPCGTWH1mAspFw12/TnkZX/Zv4kK
 nQelJQ9dSWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaltoxwAKCRAk1otyXVSH
 0MZ0B/43KCbycO4iGF/y2LXzwK5bnLm9FLCwBmWYr4MKIKKJu2sdU3dTuqiGGgg5ygeSuz9PW3+
 DyCHoCZnndMoMUIAp2/Fsn82I1blR7x1gkw3FzdBW8dkct0c9NGyNzRlnkvxrW0Eo4bxEf/zOEC
 Qnx2WOR8dwiPGxsaF8QVdOLiMvGJqwvUhw6LRmDeFcE/11s4Xqtj07ejoayzHpThXBGzD4VokE9
 OvLwTJhCHUH+1MwShHdDlAJIXr9Vg3UzoNv/VUdIN9NabbSw4d5uprIiLFtC6RwNqKGl9ma/Cik
 i0dQ9hR027I9b3ES9iFi08NweOb+j8IVKw5TPlApz0iWZDnf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 13:01:32 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Add support for CS35L62
> 
> The Cirrus Logic CS35L62 amp is similar to the CS35L63 and can be
> supported by adding the chip IDs into the cs35l56 driver. It must
> also be added to the codec table in sdw_utils.
> 
> Stefan Binding (2):
>   ASoC: cs35l56: Add support for CS35L62 for SoundWire
>   ASoC: sdw_utils: Add codec info for CS35L62
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: cs35l56: Add support for CS35L62 for SoundWire
      https://git.kernel.org/broonie/sound/c/3330b5f6d8de
[2/2] ASoC: sdw_utils: Add codec info for CS35L62
      https://git.kernel.org/broonie/sound/c/0306d2115581

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

