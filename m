Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5F24EF6B
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192983; cv=none; b=YzjrDjT3gsGBU+Q4SIloooxdeLvcSBAt1pKxWSxVOuNswIsj/OQEBe5OCeWICQwPhPpZyoSnHWsSJMUVAfirz8TH/CGA638WsoFw2HLJ+AICdfw2fr/Th4zEUO9h0n5DmMJwor4kf1iP10H40LvKWlDiJ2Qw19K6iVPRyO2O3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192983; c=relaxed/simple;
	bh=MVP2iST+lnFHzqu4yB7R7PAwljyJ2PMYIVTVjUGTGVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u2c0+tyKD22X2DLZTIEHKvjWzH015iitijpBLr+ZIH0jpOyzkxit2/uR6lflCBz7I8wjAm12mPdHeOcU6/uxsIaFQdSZfK+yB62jdltkATtuuUFzBlR/jDuSQDZJrhPcjqA+f9tZAPlC2/esinjjlhX+2r9zuKdfpdCDmEH0joY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD++8gmM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD++8gmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DC3C4CED1;
	Wed,  5 Mar 2025 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192982;
	bh=MVP2iST+lnFHzqu4yB7R7PAwljyJ2PMYIVTVjUGTGVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QD++8gmMrkQInMQNUb77a6d2ke5mePKHJoTdcLVjS3kS5EWTkzU+jlMSX/JkgnYIm
	 qsd29MIB4nIJpHaHthr7vnWuxrgZHjr2kXpUq351cnVXA85WkhPTmDuOHbzE3GWRZq
	 v08BJYyezqO2OOf8p0NIDtjCn6hSc9Tg+svKxaLLqzGuWQtHN9WR7bgyaXL63Nghjv
	 XTu7xix9XmyFLP1Cj4VihVYUfF64GgzZA1elqi2ynwJTi8pxcZvCZfk++i1n9oya3n
	 OM+gD/nplvG8gDnYSX+hC2Srr5MVszzvs+z3kWlh9FEFFaZSE9yl6+8YfjT0W9EgPj
	 nnfKftUc1kt7g==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7soz664.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7soz664.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: merge
 soc_pcm_hw_update_format/subformat()
Message-Id: <174119298175.155979.16771312287965710442.b4-ty@kernel.org>
Date: Wed, 05 Mar 2025 16:43:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Mar 2025 00:12:52 +0000, Kuninori Morimoto wrote:
> format() and subformat() should be handled in the same time, no need to
> have each functions. Let's merge these
> 
> 	soc_pcm_hw_update_format()
> 	soc_pcm_hw_update_subformat()
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: merge soc_pcm_hw_update_format/subformat()
      commit: b92bc4d6e21f1802a39975e3c7cc4f76f591d46f

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

