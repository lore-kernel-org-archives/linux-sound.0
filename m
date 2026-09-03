Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBEE175A7B
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471229; cv=none; b=eeB9KPyamj7xmtYiv7MrBHmyMzwFexpftTwJ564Kw6ocbsVIj3rjiRnsDx9xmMN2yBicTJwNCq6phzda7nAw1rj4p5ivzIT3GBwpKh56OMwfHKTGw208vhnnWqLUThrvEfjP3SfO7HqYnO/bcygl74LF/kPeUYmfiN94A2ldFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471229; c=relaxed/simple;
	bh=pxwQhb+YlcG9/36luVwwMgRpYsioxEYXyawj+ITjFH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ppis8bRPySrJarCNh38cJQnK+rXbc0hldz24LYqlZ9PQwMMzaJERKohgGIVGiR+X9mqk4Qx/jROky78er7PhRotjnfO0F2B8fJ4ID7iYXBHqeOcRRECa+OC2HBQLVvEmhlNQwSkWls5wZvGl9cGGdq0FqhLgqNTuIRjWhR74kc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dm3rIcXL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dm3rIcXL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD3B1F000E9;
	Thu,  3 Sep 2026 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471228;
	bh=opqiP5VtFjBm4ZZQYQOc/K4qOIdstY1ksgmtJewl6gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dm3rIcXL0QDG5O3Si9bbkIhg8iL15PSa/s+/990JslUhGUgdfNWUDL0DnqdxDa2NO
	 kMMpOwULFhKaD0kQYHIAJo/6z9hNp/AiDnvwYAfiIrffyJOPQrMedkHCftPKlgpuQ7
	 g37+x+Qur0B2cTa/oP73M4ZeKS0Lmce+rKlog30xxfjpz93srhV+OVETN0YLfe8jUS
	 dFTWOdG94uTHrkKPQvhEuKjFMPPoJZNXsIVrX2qTCdJCncJm8JlUcoT0k5zahMpLpR
	 +YmKGMuqR9nwD89l32lQH0J/d97TW5whz+B1Yh1uC+MWXuKxIeGKflwreWDRhh9vQO
	 YOo7xPiOkuxng==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <874ig7yvse.wl-kuninori.morimoto.gx@renesas.com>
References: <874ig7yvse.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-card: don't use card->dai_link[] in
 for_each_card_prelinks()
Message-Id: <178846745570.7659.5133371513007992854.b4-ty@b4>
Date: Thu, 03 Sep 2026 21:30:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pxwQhb+YlcG9/36luVwwMgRpYsioxEYXyawj+ITjFH8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmee5diGWFgZu5+2n5GfNV3QozswP1UPGj2y1L
 4XMVZPYtkuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapnnuQAKCRAk1otyXVSH
 0DJhB/sGjHrqBAn4HJeSa2eo5BlJwLVjMQi14IXh1x5oPh9tY5uKnLS4RbufbnLBwhXtP+bxAHE
 AWfwhBzb61r3xOZtCvdnU9v5J+Ed9Q3kUbNHdkDiuHwLeDb+t7rUcP7FBLG/BnQ8v1h/kK0926j
 zN35W1zC+q3o1hNJYw+0c1aV+GUe0iTJdnHT5P4nv9dIHTQktOu2NvRkprGX+8mTm56cz3pns1R
 /ih0zQz9Lhu652gP/ecciR7PBIgq+dkfhcE9wPo6rW6KZMGj8g97vxquuom5R6PxmG/WfznPHP8
 ORldQaMwqZvzLAcgxlvJIxImu7xjAbwHwYskcqcuILhzW292
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 01:21:21 +0000, Kuninori Morimoto wrote:
> ASoC: soc-card: don't use card->dai_link[] in for_each_card_prelinks()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: soc-card: don't use card->dai_link[] in for_each_card_prelinks()
      https://git.kernel.org/broonie/sound/c/ea495a3fb58f

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

