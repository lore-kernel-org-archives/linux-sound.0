Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7C346E58;
	Tue,  5 May 2026 01:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943340; cv=none; b=b3sOtCVOBTZT6TG51iwbDt8C+bwg0WAwc63659ip+7YMOJNUZpasADwPuZ6VTZT+9cLROaBIvbQ3LtzEIkr/QPcWlorKZVD69eqXr4nivZQImvqbHeymgladUyOhgDu7okT9OXtEWAfj96rcMf9BsPE2kRHhG/WureOB7eQvzBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943340; c=relaxed/simple;
	bh=u69m2B5RzTzsKgKe6ORYCIAIi30wCElSGmLS4dBt3WQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GwXbLNThSSAZewHp0Qd7XJJAVOYST5KkGbiEL3ZPJDQKndFJTnfoQHQ44ichQCFC20rGHS+mF4baHGA51pVT4PNt8JN9j4vmIMfsippmwXQFXOY9jiqWL30gCpFHca9U7QE0KGlLqD/5L7PosgqiBHkIdH3aFgcL58jfO66PmU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L94XoK6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L94XoK6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AEDC2BCB8;
	Tue,  5 May 2026 01:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943339;
	bh=u69m2B5RzTzsKgKe6ORYCIAIi30wCElSGmLS4dBt3WQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L94XoK6kt4qbpWiBmwgz70XF25oiDNFnWQRckVdxxYMBTbHpKsLB1+VP60bHnTX69
	 clCsBlDz9ykVqD9/+uRtYOg1R+ll2ySq3GLJX/VxwDdKwuLaW2aO1a+WKhY1aNMKdY
	 qKKo94PBcaKsLaXhXiRl+PVgevoPQWFaFfqmHoy7PrGhfN1F8vxXqcnbzGyBBUpJVO
	 E4NYlhVq+Atpff855JZT6whsqxGG20N3hRLie9rsK8b5eL0pqZqQrvcIGbnxgjC2xr
	 Hju+mEulIM1A0Sbn4gEh9pzT2zuOsVBOyOJA4XozlA8nyN+utE1DX/3qvabjuDen2r
	 pDF5hETxBtSsA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260429105315.2438298-1-rf@opensource.cirrus.com>
References: <20260429105315.2438298-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: cs35l56: Fix hibernate write in runtime
 resume error path
Message-Id: <177789979962.458539.11650026109801258351.b4-ty@b4>
Date: Mon, 04 May 2026 22:03:19 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u69m2B5RzTzsKgKe6ORYCIAIi30wCElSGmLS4dBt3WQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMqqVDIx33VNnjJi/ZB9ios+iEY1GZXjV2GQ
 7NujcfDl+aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDKgAKCRAk1otyXVSH
 0JtJB/wKoELpXObKWB/TxgXESHAzjsmLffVqt5pgAb/M4lQLsEjqz2z7Xg+3HPVbz9EpWPOBJrh
 6uBL2lOh/wKq7oftWeB3zqTfW1x1t3eFFP7DWfrPPA+XX9kRjGYLJao9p2UP6Wd2qIy0h5djIT8
 yMzZjy5NFjHpQJh0SdphPquJ/siZpYqLuvFedd4bbsY6b8vi8f/St/LyNzkTBaO/PFCQO+2ihuw
 g/88T+SUiMi3a7A7Mk6ZQo5acCgEMU+KoBuuD58rugBsG/53UDqlGxtwrwSaJXRKPyrn0W7HKNC
 xfxU0TCi+hEm3+F4bTpjWqsMqEawRZSopY/k/qGqECimHoOp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 11:53:15 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix hibernate write in runtime resume error path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Fix hibernate write in runtime resume error path
      https://git.kernel.org/broonie/sound/c/c64e77490b7e

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

