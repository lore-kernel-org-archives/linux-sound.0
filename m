Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63C1865C
	for <linux-sound@vger.kernel.org>; Thu, 19 Sep 2024 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726743679; cv=none; b=LagaT8aanAW4b+ATmvbQuA4EmlgxN6E+DjqB9gipOcEtHd4J9A2arnQ1jTm1btWBsVhR7zvYTMFHnodZVxHznMTC1di3vZ0y1YE3lfJjOxzB/t7rqalO60luL5CJOCK20RYN8pc/CarTIoN+ZRLBc5G6Eji4OeB47hFrDfJg7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726743679; c=relaxed/simple;
	bh=MIAC4lJKtz2gLsrT5JRxMos43OWYq0SsPLKLRduiHXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mjT8xTUY0x28BTfpfAgj2qHr4rGp5IYWkvFoiUdPiREquVUx72lm1gUUzK8FGclHdgAGWDgnmWH4Eml7uiSIoPk0I+9IwmsZRbL1CfHjNdeCTqKPcl9DrH61pBtMkauapvXcKpTD9dMEI48gOD4UdrSDqbXYl4QpQj/csvJ5UeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZGsOmy4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZGsOmy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3120BC4CEC4;
	Thu, 19 Sep 2024 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726743678;
	bh=MIAC4lJKtz2gLsrT5JRxMos43OWYq0SsPLKLRduiHXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KZGsOmy4zltvaNVvm5wAR+eagJGP8A3i08mnseCm+Oc44CTH+t01/JKrUrafVxxHb
	 gUAdFApnQDcjlaTnQ9kvlgoN0MllF+20hNAyd48kLRNmaLsreW7bnMadu74O4jztzf
	 W9QyrLbVbKE7lrLck8GkLvz9GWC/qT1In+Xqih5ABm4sOpEz0jOx5gcNvBxK4XdysN
	 pSN5MxLHFXGq7UF3K0Ug8+jjWAdfTudrkAH9Jk1LNtqCFf36f0CodKtVphbwDmAyda
	 vPrXBFQeGPUoJYQM6JiF/hHgdOJ/dOd6EBz1tLBLKE3HsxP6zIPQinovhfedOU7h2g
	 LdgTNpIVnCzlA==
From: Mark Brown <broonie@kernel.org>
To: David Lawrence Glanzman <davidglanzman@yahoo.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <1249c09bd6bf696b59d087a4f546ae397828656c.camel@yahoo.com>
References: <229243264.8919425.1726551100908@mail.yahoo.com>
 <1249c09bd6bf696b59d087a4f546ae397828656c.camel@yahoo.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
Message-Id: <172674367776.1818903.601899830520932163.b4-ty@kernel.org>
Date: Thu, 19 Sep 2024 13:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 17 Sep 2024 00:44:08 -0400, David Lawrence Glanzman wrote:
> Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
      commit: 84e8d59651879b2ff8499bddbbc9549b7f1a646b

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

