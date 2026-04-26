Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812526A08A;
	Sun, 26 Apr 2026 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245734; cv=none; b=ceGdG8j7SmekPs5UndRwf79ql8emK1S9VPNVwxqnbdOaT9y41HjMvzIEZyRTL4McSeFGOKYWVQnUTkSIJWNUWhMFwJ6kxk/sOnl6EN3i9+hIPbMxXA0ja2IY0tq6YiSls4llHlH0Nv8VSt0cusf2ROWUxKn9zIobrgOaKLa3PB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245734; c=relaxed/simple;
	bh=UE1pPai0Sbq4k96a0wkCf2S7y3cSXs6tp/dMMzRzfTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wa4jFOUas1GhGyAF7xi2sBAxpeK2PAkT66K+HB9+0h7riI4VXkCEbgQcPaLQEFGo4OJ+Ic8mLNdl1ufCeM471B8g4M/GSiKJBSB8EaSzo9d9htZdYzl3gEYe9m7HO3qBN0guvjzNomHO4m4fNvccXWvjHn5pDO6jf/C3c6zM4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DED9Q8zV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DED9Q8zV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3A8C2BCAF;
	Sun, 26 Apr 2026 23:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245734;
	bh=UE1pPai0Sbq4k96a0wkCf2S7y3cSXs6tp/dMMzRzfTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DED9Q8zV/GtrKnAp8tjknrmUs8ttI/vbio54q3Fx4buHDfbkc+2As0XiSOO8TcDjB
	 UaNxtheRxkoYUxmNVxL641shi8ooDUU6F1wBTdPKI5wJ1+ya1D1+9XKqHEufSJGeY4
	 jRYmt3htEBegDEQ2/prvJU+REhymOcxj4XQVK950HKA0scxs5UC6vR0VjawiMUjhqz
	 iPg8o8X6wET3fn7B5KVj3UHAsX5DJmVWgedxleCELm4YW5jyxjaygAvr6rkjWKP3AV
	 2AqhbSf3/NDsx4dtCb5+Reh5blNdBD0K2AEWXF8tO4NITdwq3FPUE3cokXH1GOM0zk
	 WgKcLQUt60YbA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, 
 Robert Beckett <bob.beckett@collabora.com>, Umang Jain <uajain@igalia.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260423183505.116445-1-gpiccoli@igalia.com>
References: <20260423183505.116445-1-gpiccoli@igalia.com>
Subject: Re: [PATCH V2] ASoC: amd: acp: Add DMI quirk for Valve Steam Deck
 OLED
Message-Id: <177724046328.266775.3646182629938640063.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:54:23 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UE1pPai0Sbq4k96a0wkCf2S7y3cSXs6tp/dMMzRzfTE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4ifwyGvLnC0g92xj0aIi5QoTUjrq4+kVn6g
 qQIxKuphRqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eIgAKCRAk1otyXVSH
 0DEvB/9gKzlhjwcRNEW77QshxPjeyLJZhUGDqPzuBll7w+rRIatEL7m0buln5tZRvFKkYprVgwe
 y1AaaM5UFCw9+RzZJgtnOVuBYF/FmH/Vj8obIryXNwxVUzSM7HNLZk+54dD+5VesPIwdGvsap5k
 4LM35j3qxkDj46vqGyDfEtjfo/DOKK1pHD32/dflCJACCo8ZuxnJVDkm4+yYOE9l40PfWzXMviL
 1m+U8otn7eVvuCmvM0tL17mxaoLHOorTJWQqQZDrmHP8E2ACTPZRvMDMGMufGbEDMfgGR757xjX
 qo4kpFdMwH3AlOj7FzfugTqBe5poDxtWvyRSDePlX+wRbWuc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Apr 2026 15:30:58 -0300, Guilherme G. Piccoli wrote:
> ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED
      https://git.kernel.org/broonie/sound/c/b0f6f4ac7d5d

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

