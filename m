Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060DF30B51E
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760554376; cv=none; b=hpQFyTsWd6mXPz2At7g5zlo8ykIvqi9o/Dh0u9OViy9rTysLWWAFRpp+Z8mI/bdSuGmTUZFb/3+PDoGzLcv1svbpi6ZCfd0ZjDnXZZJZsG9ODc7T+JG2HeAWAKRON0iMx2pnwYmhwDiZs5PC82eKr6XvWW5kJOpBui3pRPCpQMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760554376; c=relaxed/simple;
	bh=BJ9u7gref7Sm9PATOE1LgC1OyA2Fhuwu8+PqXqnJA1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VBNcjFgQ6XLkk+8nkXWPcqZFaNOi08nSL1YGHEHspZgvf+Snk1YdNrhmTbfKPxPm9f9L9GiTqtmmLhd7/38k2/psy+BtF9ePVGvcebkkyS/P4OG6UFoRkqz/kmb1A8TdFUrwV3izRSC4QwNJzZYjwPqc3cg0AScsIVB7OAQwkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBQeFgLc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBQeFgLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762F8C4CEFB;
	Wed, 15 Oct 2025 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760554375;
	bh=BJ9u7gref7Sm9PATOE1LgC1OyA2Fhuwu8+PqXqnJA1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VBQeFgLcw9TKlcCjr/n4RPyclIrM4LK5r1iKErx3SiQq031EXTIkstAppZWXwWuKa
	 sTn8zdUxK2q4anwxQ8lp+aqutnEqv2pe8oNqwTZ9qoveROrq2/3FT3on5kA9bWBJin
	 jKAaijxTWhoPrD8j7IQlBl17I8/efkXBfYc+RV31DRupMTDIuBn3m28V6kEOZmAMh3
	 aD11JlHttgs7oQZxryPo+yAMZs0TGbytJRugPemR3Mm4skqX01lyc/FoubN1OdmYbu
	 r+KHrg0+G9JDMlEdGN36kJjGh4U5Vua+J4ziFRwVedj42K6N8vga3+30rlj6zEvJqR
	 qmgzTXAka559g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 bard.liao@intel.com
In-Reply-To: <20251014092157.2789054-1-shumingf@realtek.com>
References: <20251014092157.2789054-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: sdw_utils: add rt1321 part id to codec_info_list
Message-Id: <176055437316.231901.6440983120962344899.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 19:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Tue, 14 Oct 2025 17:21:57 +0800, shumingf@realtek.com wrote:
> The SdW machine driver supports the part id rt1321 amplifier.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: add rt1321 part id to codec_info_list
      commit: 57b00ab3d33d2b177bf45d568fa1e6203cd099b6

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

