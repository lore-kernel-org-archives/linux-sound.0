Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7C346E58;
	Tue,  5 May 2026 01:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943331; cv=none; b=uraWa3utKw0bediXjc1no9gyV4Lsy95ssUv/4go4XW+/HeUQ4QjB3SGQ1WqbLeBtbVegJ0p/lTUq3HhDRc3E7STTShRloRcpGBJoZEAYGUIzfvI3BaeOemZJDFe5LfBNwZfslB1UypOIjzspVB01xsZzZbl1uAOeGYCnxkWZqxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943331; c=relaxed/simple;
	bh=woxUsYPFNU3lcGn1XDYMBz35B4nqugontWy7D/h7Dp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nkfAuDVVcMomu4CtaseBWKiyjBKam5Deyo1H6j44mCMGi0XeT5KwzXvAqRDwd8+bQEWmgMTXWEidrB37Y6MFtSBiPBhegiEx8cd6hifUIBBVsKfbJlJcfhVf11dodQa8mwoEiEllvSPdCCopp765IBigQtN9b70drlqi/orqR4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKKYuQIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKKYuQIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93569C2BCC9;
	Tue,  5 May 2026 01:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943331;
	bh=woxUsYPFNU3lcGn1XDYMBz35B4nqugontWy7D/h7Dp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AKKYuQICIVSR3D7SGSp83GlvrPbcDSYNzSrGeeB4A4uXc89877wVIKrgPCxRR9+C3
	 Z6xl8slRbn94imwRSKqvbHA9H+KCfHvfCX7P9KqVDTSUJx6vgVS9m5+DoPi43efiAE
	 H9oyHK8tDjCRNQfw6OB18+Nl1B+///VjxR5ZTNXlq49URcHqep8VJSvaxyKkbAak+u
	 uSegy3p/XxIgy9ckWGHinc7d3KNdgCJ3uJD1lcHjV6zMu+JOIdc6+TRQYUSAGB5EF3
	 ztlx7ecpr82xxHDQhU0v/Y/Xt9g0YqvnIU9zZHcSFSuYDqPePXl+TjRbQ4G4cfOqNH
	 53PB/pf2eUV1Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Tommaso Soncin <soncintommaso@gmail.com>
Cc: stable@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260429160858.538986-1-soncintommaso@gmail.com>
References: <20260429160858.538986-1-soncintommaso@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx
 product line in quirk table
Message-Id: <177789991892.458539.5261022917607088167.b4-ty@b4>
Date: Mon, 04 May 2026 22:05:18 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=woxUsYPFNU3lcGn1XDYMBz35B4nqugontWy7D/h7Dp0=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBp+UMgRb1fw9vvPB+Qch7RFxzYw81wQ3ae/rH4+
 wIdxfomvniJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDIAAKCRAk1otyXVSH
 0A6QB/iEMQmj5XjpA6KBYSr+CWgsCDdDaprrqMMEYxA5oDhIyZn7ckbBCXF80eU7MyBwe+jriET
 wsvwBWEzeHDdcxO9cmnteIw2Syyy4R+X5SNc8vK3Mce+26d/ZTBfJ94c2yCvh2A0R2HOA98RRIN
 6TOkc21tzHCmzOvwI6Cb2OSg/oR8pH1pvAC3cGQVYrbQFe9o9N9SBQRNZSMOVwJyFO9lbn9S9db
 JgmHX+xTJTStJbJ7ux+yVpdNpCM6npCDDbvNKi9i97plPcOyK4M1RIkP6acSJxOnAacgCozYHG8
 G/gvtjJYCUOXawN22B6W6PXUQJHE32KuFJPqd60Ab+TPeBo=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 18:08:57 +0200, Tommaso Soncin wrote:
> ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table
      https://git.kernel.org/broonie/sound/c/d63c219b7ff3

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

