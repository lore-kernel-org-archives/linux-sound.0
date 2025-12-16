Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FAD20ADD6
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903588; cv=none; b=cDbxe8od4LL5nyPKFrYPAOxJ/5SZDeUJZk72ssRsxOFVEPlSehKS6VSwsYl3ZUJ0slFiAyJ+y3Fj+kxTpG9QLbefE9kFvvw5mbD6WgGvIwVx3FTaLpCxkUnUSeV7cIO4MtKBvwdKYuK2ehnNAMhNX8iF0qOQt11weOEdo1/bnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903588; c=relaxed/simple;
	bh=d+6wPve1rJ6g4t6BUYmIeYS+29HJGg3GGOI9GgSsLEM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fqQTshEgOwDvubU+Ku5hbzy3Vj9zMVfKIFUFKnhwYm2QzxlTuHLgWpWxiSbWS+LGOVx/KrpEYpdiZYF/uYIxBPcguYAe13fB96gY4ZKUAqm6BDYkTWK9S/9FqX+947y13gEt42j8M+qDnOeA68hWkjeivo3+X57qGfNAOBajDAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvFLqvg+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvFLqvg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA787C4CEFB;
	Tue, 16 Dec 2025 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903588;
	bh=d+6wPve1rJ6g4t6BUYmIeYS+29HJGg3GGOI9GgSsLEM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pvFLqvg+K1QjCg3l/pAdMlXCokZ791MwQBvXQVBGhYaIKHmw5KWNrdJLDQ5iLFIte
	 yAQgqEzYowNdH7BdUMMqWT6aLjjpK2X9hB1bk/8E6zBsvoeMmziDcGeoTMvpvmw0Hd
	 OxZgfMd0JSwSaKfOxb8tPBr+bYLLVQsbE+l8hSHKUBDDcC+02f6mmRUbMlw4aWaw6A
	 1mv5WungyRd8MPL8yN4Bkeusd3OCtoaoCcH9wTf4dPapeVmbitd3MQ9hs0onmRNZO3
	 MUGeyJ3O56hh5mJ/JaQkpqar27uY05kNOy75Tf3+ZEJDEL0e7ZU+KqI2xqowIDcAB9
	 xPL2clWI0aD0A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20251215130819.31218-1-peter.ujfalusi@linux.intel.com>
References: <20251215130819.31218-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Only check SSP MCLK mask in
 case of IPC3
Message-Id: <176590358552.182908.9456837473721872654.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 16:46:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 15:08:19 +0200, Peter Ujfalusi wrote:
> IPC4 is using the NHLT blob itself and sends the SSP blob from it directly
> to the firmware, there is no need for the MCLK quirk based on the SSP blob
> since the SSP blob is in use.
> 
> At the same time reword the error, info and debug messages for clarity.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Only check SSP MCLK mask in case of IPC3
      commit: 524ee559948d8d079b13466e70fa741f909699c0

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

