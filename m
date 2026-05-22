Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF8135E956;
	Fri, 22 May 2026 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471843; cv=none; b=MX+eHGVnEEFJJEYQk2BQgwWQcVneDuMh7ro0Qe3/Y0/UQHN/V6Er6PeR2GIb3Rl8LQyyG2yRyEohbs7P1BfjdXTivLBpavcmyMvofQIJqlieVPELPB1HEAMxC2pbEOAijstbiSiYvVidRGq26sIP1IzJre6AVyDfw6rg6oSjcWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471843; c=relaxed/simple;
	bh=xWFVqWztShCirmApW3gFp7kLzV92xCyCzkRDksqOHGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ggOpLovbSS8vQ0ykGvEnvlKzAqU9H8JmG1l8NXRQ9n9IMA3i8aPwe8AIIXT3ShYDt7ilA1TLeh1ajVxpPn4lHacd4Hfysen3bL263XX1yr/grDb3W/WkX07NG/TbMU+iCBikRyMZ7bEqjfVv8QJsRyXlvkNPViyPbp/+3DyWfOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V28kY8Sv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V28kY8Sv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459851F000E9;
	Fri, 22 May 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779471842;
	bh=K22gNRoh2z9yLN92hgi07gB7wLMlyv2U+j/zIg7Two8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V28kY8SvG4Ipwl37n1Zb+BfUlvKbi/q1KOCANLazO/AUMWs8LdVgsU3OBjuKJGv2b
	 zKrZYp0Gn2nMNdOzH2LEHgmmHKVe0Ijy+lqwXpeENrI/13C9sk7ZNybhVDXs9qEP9J
	 k0LXZuZ0Wxni335iDzREvLxxITTHHAqY4Pu4tOLtPXNUjjdF/wAYwx+Toic5gYzefA
	 qhFYvxxXZAKetz0xjRsZqQdvOe8jY36EY+q+vxjr80T+EOi/z+CBq3xLMkfb7brp5M
	 uYWOF4iidpCPPeqva2arWerxghmxsIZk62BJUxApUJrSYK3qqqxpnEp4n4OQXZGFJq
	 Q8Zb0nGbTaoSg==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 phucduc.bui@gmail.com
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: stm: Use guard() for mutex & spin locks
Message-Id: <177945340534.6494.9459779300774728810.b4-ty@b4>
Date: Fri, 22 May 2026 13:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xWFVqWztShCirmApW3gFp7kLzV92xCyCzkRDksqOHGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJXfKyDXbJQfdrp4L/s53dZlnV+F057bQiQt5
 UY/e23F22iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCV3wAKCRAk1otyXVSH
 0Ow7B/4pPIJXmPZTefFXWsQL84lP4Kk48+aWzm16FutztIvaUHaW1SJXmqmauCZI5b1uMEiEFae
 ahkGNn5CfFZMHif8/yzHTIs6/3zEp30fPmDt7ze1Tebq46VEQgqGlmuoDsJZqSlB76vi0VGogGx
 a1K4GSvksfz6BM3oob91h7qSZrHxV+SB+xbfULBKRgGL9uCE7IvKlRw3G14ze9ro6YkCNMeWuu8
 qIb9Br51R1/zI1OOB1D1YPE2x/RDo/dQSyiyKJHGO3h0k9DX1jiJt3kzucwNrNDyB7k/39fZARD
 cBHgjFmjdq/vmNOk7MW66pJ1R3mukbEsVIo39LidLtFi5f37
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 15 May 2026 18:24:54 +0700, phucduc.bui@gmail.com wrote:
> ASoC: stm: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in the STM drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/dabf5b45b18c
[2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/b212cb00168c
[3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
      https://git.kernel.org/broonie/sound/c/5e54b4c280af
[4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/3f0d573c3259

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

