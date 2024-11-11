Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E2C1A01BD
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334891; cv=none; b=J8B1NxmxNl5fQ1801hVDqVWq+A3oNsHqczCE+A+mLHuEbzfnjS2XhgJbke2zk7pRhgfEEjWkzdyKbls+32eCHZ5r2nnitYaUASbU0r0LKW26AJmer3RExvYQvKeO6n5B/bzrLKMB0B7TvjZ9GcXchNHb5mjz/eMwuHOy0K6PZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334891; c=relaxed/simple;
	bh=mNraMleayjlcTQIA5sZQ0obt7MGqjE9tcFKMVWqwceQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aTzodAC6ig6iLzLtF+ZoU7QFbsKpo/iEh1SD4iFq5N2J5IghbYsc8uomHRy2FumNfrhoYbPnvtoREk16BcqGRXWx2PRhssH/lyJmn0eNtvlawQgCGxXliwdqEBIybZ1my2nf2NRxaqeRYD4+VJG4fp2XmfGbc1Ozqk5Pz97F7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qa4zA9z1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qa4zA9z1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83A6C4CED6;
	Mon, 11 Nov 2024 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731334891;
	bh=mNraMleayjlcTQIA5sZQ0obt7MGqjE9tcFKMVWqwceQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qa4zA9z1qtD1odfdYJ5NwXYo87fwBWaTLuHo+tCF23WDv8gV/3YEwLou4bRAZCAnC
	 u+cwR4YzEM8n/ZIDDfzhY4HOvoMXIWs4+qtHJO4hIh6HbYkZ9rDT7clJWOR/pk1Wee
	 ipNXdxi06oHe+rGRygxSzrsJDmhte3v/NKlV35S6g7NK5aDieo2PQEbnNUNhaycvPU
	 ZAeEmBUdF2vNU/CUG7UrAXkdwUSwJEdGecX8IP3yLRiZlqG5mdqcxK2A9z4NvgYhbh
	 UmDQmhvop6DUgpbbyvyP7jBVQbogIVd+ezPhfeGHBkV0bt4WAF08/cXsczxIwAmGEU
	 iCoUz8Z5uXazA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20241108235453.196289-1-marex@denx.de>
References: <20241108235453.196289-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: max98088: Remove duplicate DACs
Message-Id: <173133488950.303054.12333895265536366292.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 14:21:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Sat, 09 Nov 2024 00:53:47 +0100, Marek Vasut wrote:
> This codec only has one set of left and right DACs, remove the duplicate
> DACs with duplicated bits controlling them as the userspace can set those
> controls to mismatched value. This most likely does break userspace ABI,
> but there seem to be no in-kernel users.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98088: Remove duplicate DACs
      commit: 725570f96321f3e0ae1c6a1f80482d2907538d07

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

