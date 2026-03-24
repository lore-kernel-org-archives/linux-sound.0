Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C28317170;
	Tue, 24 Mar 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381448; cv=none; b=G/WovscjoL4JAWpoDJf6qB4kgSBuYy5vlgNLNcB37mkcLF3yEYheKDTgtz9MdMfL1gVyk3auJQIRe69UcrOVXrCM78fFBN6WmP2ZztlgFZejxj9YNfjgy6VyOl/MyG+thPm0Z5IYYg4KQbbwrJcvxwAC5q47TIQG+Ao53rSfcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381448; c=relaxed/simple;
	bh=3t24e6Nr9RxnulaeTfeNt4MpOZwLzLsTJ5Dya2xVw9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BCjhth+06ZiFNnnzsRoH4M1nCeZq/rbIA5t4JMoy3jwWruzTWljpTzYlLeBhItx63R8Vuo3EgTBJsrgN3s5gk8Lf+aOLLJakrkhHtzLoH7G5iUUwkzxxKRzcgw+Z/wCAInhMIYulFKBl6Tul5jJgEiFMBnjR80/Do91UhULV/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHwHAT9S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHwHAT9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FC7C2BC9E;
	Tue, 24 Mar 2026 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381448;
	bh=3t24e6Nr9RxnulaeTfeNt4MpOZwLzLsTJ5Dya2xVw9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MHwHAT9SKUl0vG1xB43oml2kGSWrJ3X136+PtlKjIemSB4MGDEAxd1mt9dJlG7JsX
	 4skcJMTWrNyQghP2xcECA/EsbeygVgAr6/snH/DY1s8+4Qpv4mUEWSRr0f7pVSLOVg
	 4Fu3e5DO1jDMgKGA9tzC1HKnLqznXRy1oO7TV7UnYSXIRB0iAbKy1H4yDQLynqIo3k
	 quOF91frhZFH8efqcz4miEBD85rK0rmjJJYk2v3qF8ILvDjODUoRbcXZxkJT7AsZNW
	 oEuIttStxuc3NI84VXvZ78uJeVz/xQpustG6oGi7dzOQinHqgSKnOURla+/mlTsx9Y
	 50TT3UiPr125Q==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 DanielePioGenovese <delitedaniele@gmail.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260320155842.55304-1-delitedaniele@gmail.com>
References: <20260320155842.55304-1-delitedaniele@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add MSI Thin A15 B7VF to quirk table
Message-Id: <177435896402.86944.7340385155971642362.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:29:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3t24e6Nr9RxnulaeTfeNt4MpOZwLzLsTJ5Dya2xVw9M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumG6Bx5Br8WwHwrwddPGgvf4H/0Shy+8NZbE
 FSNYORQBlKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLphgAKCRAk1otyXVSH
 0MWIB/4+sjB2zzpLsSEDhrHzaMYJ/jAYpb7jKQPMVM4TEoIHTLzP7tCBhmi8s6mjMdcpghX5oCE
 ECGsBCBqklv/FSdZwZZM3CgYHa8PWO69I+uQiZP0uySyd6sYti+7SikjFzbYVYJHXwc7elP6THD
 9xJkqMCqnviEn/qeGOi8HNEQhIzUusf7n8yb06RzG4S5115i8NXGTGTyDasPghv0hOHzyG4r9sD
 h4MohgArqr3binmmWkZLsl66H6BwgfjEP5wzD6fHinw+xNkrXoC5dCCpTozdh/xhUDLyPiKIv5u
 vxdMR/SlB9A7XoCdPuCE5aDhoNRRQWhpnYfo12GlyxIWZtxh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Mar 2026 16:58:42 +0100, DanielePioGenovese wrote:
> ASoC: amd: yc: Add MSI Thin A15 B7VF to quirk table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Add MSI Thin A15 B7VF to quirk table
      https://git.kernel.org/broonie/sound/c/141efa53b987

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

