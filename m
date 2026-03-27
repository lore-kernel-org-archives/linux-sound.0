Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB237F743
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644059; cv=none; b=eqGHXLJV58LXrkR1x+j7N3aGVajI+n4p1zlzc3QKjkx+ANxf+WdXkxUdVmhZtgKHyc2JkFIqz/68kGU4273I+iDfusMHM0x+BuH0AZeRvl4tBRcU9gU7UccubBwcWUmmZtDoY29PDwVA31BoItfUPTsPSV2QKJh5xLzqLeOr94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644059; c=relaxed/simple;
	bh=BEJUPtrDMJJyNA+rRaOUgmzhaFuTGlDRlyCoEl5SEnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VZ5E39AL2xnryjgu2WdBmEjgQKlAYH9B0FCGwMwK85lRxjL+0LZRiew+wKM9YneUvLlTbAU0rTgXwwaY/drbsyxzi3tC+UgkOD7LliUVjGCDiuo/tC4itqn/sU1es3CVWkQESq9xWe4YexJDu48bbeeXLQDJysacrlLVtsOEn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWRiNoWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWRiNoWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C050EC19423;
	Fri, 27 Mar 2026 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644059;
	bh=BEJUPtrDMJJyNA+rRaOUgmzhaFuTGlDRlyCoEl5SEnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FWRiNoWWRrFlcdwvrGmi2H/aNvKhvJiK1fank1lY78QJQK7Kbj30JtJzmNOwXwSob
	 AFBGu972+YT9HrC0MY+RHJygMJPQ9Ab15YeOEofp4UC/oCpGB7fgwdJZPGrbZ49wIq
	 oNPMmyXMchxaDgBsc0jX5QTHCvTpp8xFmS4zUh/8ADtbCQaawVnQsVpbbF+xl9D/oJ
	 9OkunG2/C9dK+5ER+slSxSx1IjMVnB5K7JvLRG5PnQnUjXoB2BzwL+SIJSA7MzXEby
	 BeKTMC0Fwd9JH+Dzw/XdLEiSDcfOVRh6REzQ5LHlFAW54D3L4j/lDj3iii5S6s6pGR
	 93/KExpmWNJ4g==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
References: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: Drop some unused GPIO includes
Message-Id: <177463669410.777262.10906805338638867441.b4-ty@b4>
Date: Fri, 27 Mar 2026 18:38:14 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BEJUPtrDMJJyNA+rRaOUgmzhaFuTGlDRlyCoEl5SEnk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxutYdppYsxt4UPBcA9zmWi1AgpjHD812jrSa/
 8AMyHU8+eaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacbrWAAKCRAk1otyXVSH
 0LqwB/wKTuCuOXboAea+NSOiSeAUNd+zecPiDQBHhLnYFyld6F8hcTX2h4NnfAIY9CQ3ADAqpck
 WFSdXboAAR89Wkg7Rzds17s5283v23UI5jfd3WFZ2TqxSZeJq4kgEc4THx4/MLu8r5ds8Zi87VC
 3XN4KukEKatLIr4A3KeOhB3eD0CoFdaQQapI8at5MhcVbFEMdE+rJMmoRWAXW90EfrrskBfGyC7
 wCSEMLqeRZ/Z4PKPKX31Sko6aeRiYcAz8pflpcY6N568k9YwNvlahog11cB7V6YNXuPzUr6BTQL
 HUdk8nQcb73uYCiiSvkQe0xAm8nP1Phk7Nsf+6/EbhcQ+Ps+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 00:26:37 +0100, Linus Walleij wrote:
> ASoC: Drop some unused GPIO includes
> 
> This drops the unnecessary legacy includes from three
> more codecs.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/3] ASoC: rt1318: Drop unused include
      https://git.kernel.org/broonie/sound/c/486c06451590
[2/3] ASoC: nau8315: Drop unused include
      https://git.kernel.org/broonie/sound/c/175b2d025874
[3/3] ASoC: ts3a227e: Drop unused include
      https://git.kernel.org/broonie/sound/c/00e981c7c0a1

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

