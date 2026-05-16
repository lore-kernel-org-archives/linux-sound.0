Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1672D0622;
	Sat, 16 May 2026 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778904763; cv=none; b=ld7SccBSiJBzSBfrJ+ej47yPWRZG+XlGUfti/RXo6W8HevyvzLcCkrKTFwJmhM/citJZR3m+6YpvhEa7a36fpLqqEM6f7ckOu+p/3G80kNcsvtsi30VOntQHm16MqrWJcThnEBtWO3Oz9/p6PB/tvFQTcVZ/dE2We0M6Who99ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778904763; c=relaxed/simple;
	bh=lqGIrwlfuhKsd4xEOsaRjxfZrabQm1EX4r205d8fkwQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e8KEuvoWfsoATr+v557fge0rMKogG5quplLKAcfwIMfTDvO6Oc2prUkBHlNEkp6aRx4k2hpAiNrG+Me/bm5ruUwdFguQ7IESFhQDO4LnuawQp+LPLTAfp8eOFADq5VJES8ESSsrJEPrZErDlueuKXAPUNj2dutd5JKVEl3Wy//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJHDIPcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJHDIPcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FCBC2BCB8;
	Sat, 16 May 2026 04:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778904762;
	bh=lqGIrwlfuhKsd4xEOsaRjxfZrabQm1EX4r205d8fkwQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dJHDIPcdtY2xaL7UlGYBBEZvlOGm5Uw/oMPvm5HIWmkLDZduVEd493B87dyTJ3Luo
	 gYeX1QrsBc1AuFlco7EdqUjcGMKauXgcx8gfpJEZlAG22ly1co5ykPgZCYyIPhvkUU
	 sr9+W0eK5VzS/nNw58jqV0q5CYHcf3WDUcIfhPx9fspO0QdA/xKaUAi6wRjR5NiAv9
	 QejiJ32ffQldK+B7XtGmrN+ZAUGDQtemWcKNe7HqYeRt9HEA4JG+NIVNA12+ktTtDm
	 T6LejK+68dyv930CcP0JoeBc9BMI46zQDiD3/aN8PAyH4gpEKKNhknydEjZo814g31
	 yABlsQPdQwhYg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, Jasper Smet <josbeir@gmail.com>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260513052137.56703-1-josbeir@gmail.com>
References: <20260513052137.56703-1-josbeir@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for ASUS Zenbook S16
 UM5606GA
Message-Id: <177889854215.1174745.5425976968873547641.b4-ty@b4>
Date: Sat, 16 May 2026 11:29:02 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lqGIrwlfuhKsd4xEOsaRjxfZrabQm1EX4r205d8fkwQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB+63xZfesLhrmmAQNaFl5CiAuY0a3r+JaQ2dH
 dnT9RVTZ+mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagfutwAKCRAk1otyXVSH
 0DBwB/9Ovbp8pSMKWcniksvpbEeyM/rP/o7lLT6KGrHa9FN/B5HEO/x3BNz3HWA0nMP1w5dCtO+
 CVJVmbojHjbngOKQDxBVu/H8Kozuc5ISZ4F15Si4c28rjb3gbd5DhAXkyyRuhS4YK+qup4bKnNi
 bFG0IQGTIK3xNgcDSjqiQ3UcrnZpZ86+o6R0NGHzrs0O0eaYmRNYOHHYEmyCmuAM4tvSgHNHSsV
 YyC4YV1romW0151+qr6q/w30lprjSuK8mEnX5KbBeNRwbuD/Q6eI4GuDkQYRU+wk4y1Tu+X5ALm
 Xq/osm1x5lNhYiXx4oAp2Y+fsgq/221BrKYAbebcK4J+OjNy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 13 May 2026 07:21:37 +0200, Jasper Smet wrote:
> ASoC: amd: acp: Add DMI quirk for ASUS Zenbook S16 UM5606GA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: acp: Add DMI quirk for ASUS Zenbook S16 UM5606GA
      https://git.kernel.org/broonie/sound/c/6e4bfd9da885

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

