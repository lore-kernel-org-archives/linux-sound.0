Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90C38F87
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710175824; cv=none; b=kv/rMQMQlQxMRpmHwXrTILTYqafwkYsp5kfajSmeakCnBAnebBBo75JqhHFHrQmTmzDwAiTCeV+U9FjZNGroinHcb9fgpEOW5QhMjyCKVjTvwBNmbLdY9ilGC/5Kyt8gs+SQ8H5NfQRQyExndRA1tXcdQRFF80sQ5Y/LZ4LT5Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710175824; c=relaxed/simple;
	bh=AnZPCw5Tffdvf7/IZb/irBm401ljUYTUMF7o+adqVNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=svyhOXQpx5uul2C5nUJcoqmCja/xRyJeEREc+u8Tc+V7VbuH7uu1f7tfvQcfhnhgfb7JXuor9iL1DMG0TA+v2wszWijGGh3Yt+6s+GS66RR+dX/MkDaII05lLvOVWl/R2EMTsLo8q97/GohWYTzM8qmcjBRac02aomZgTdeAki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWDNNwtA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWDNNwtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338D6C43390;
	Mon, 11 Mar 2024 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710175823;
	bh=AnZPCw5Tffdvf7/IZb/irBm401ljUYTUMF7o+adqVNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iWDNNwtAdABRqaM+b+yIycWe9CKtZckJGXmJuwfL9gdslkDcnDr01Lz8EvkAFYJ0S
	 2o/VHjqyOgyKIKsh8kHqXq3z8NBLKqtYoZtoRoeOegG+XpJAfEaAuV3YSn2xQeuAPo
	 hNW3bP1sUY6fBGwB0N6pvekJmE8PGkwVqbaoze3wLduovx70+nr1Rrkeo05SYG8Oo4
	 PVTXwXxZq1bqBJ2ul9FM+93LivohnDhj3rtJXA1fMHna5qOcih+l9JYlaZZwCBwwiZ
	 grxpYYhDVsukgidoPLTy9trm5Nt6ygoi8RH6giwtBVlgvxIFsInVVCZXQrWsvbV6EI
	 LYSstICn6541Q==
From: Mark Brown <broonie@kernel.org>
To: M Cooley <m.cooley.198@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <CALijGznExWW4fujNWwMzmn_K=wo96sGzV_2VkT7NjvEUdkg7Gw@mail.gmail.com>
References: <CALijGzn7GL_tmdGZXy-tTGCgpT4bwLW2+QU1QBseMRQwjPhbtw@mail.gmail.com>
 <5eb9f2b5-62ef-442d-b93f-ea6b0d85eac3@sirena.org.uk>
 <CALijGznExWW4fujNWwMzmn_K=wo96sGzV_2VkT7NjvEUdkg7Gw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on ASUS
 M7600RE
Message-Id: <171017582179.37800.7778117949908187228.b4-ty@kernel.org>
Date: Mon, 11 Mar 2024 16:50:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-a684c

On Fri, 08 Mar 2024 17:35:40 -0500, M Cooley wrote:
> On Fri, Mar 8, 2024 at 4:37 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > It's a patch whatever the reason for it - basically your email looks
> > like it got almost everything right (assuming git am likes it), you just
> > need to delete the process question above from the changelog and add a
> > Signed-off-by as covered in submitting-patches.rst.  As that covers
> > there's legal stuff with the signoff which means I shouldn't take a
> > patch without it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE
      commit: db185362fca554b201e2c62beb15a02bb39a064b

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

