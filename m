Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A33426D1B;
	Tue,  3 Mar 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536809; cv=none; b=Un9gqnTXHF1ViP+vC1bKxIXW3Rti2d1ReULF+gitkkUB9QOYcHE0lC4luqFr9/33tRhP3cLndpvtqIpkVMlPJfz5gzyNV43sCJpp39kEvxal9HW6oyR8mgvkChDevifa2Q3nxn1brPzbj9Rgt+lsQrSUeJYNbDakHhQG5FBEHlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536809; c=relaxed/simple;
	bh=nZfH/KFXXPbkJuJvudZ9Iie+8j2hVfm9hk0dVOGQgYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GZAN6GQnk90eENh1VfdkCKqH5HxqdU+yWXj6Px4HI2K8P6KRpKESOp2yyoTGi8bRQFG3VJ3IUlH+qowd+Kdq3uAq60LRcumqmFMj2nwemrt5KWgv1ZqKTAkULv4UnB84gh2OSjzm6277LMFB6Voc+cCc7V5HPqrP/B+n6yoEfcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZ9AmDQQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZ9AmDQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A976EC2BCB1;
	Tue,  3 Mar 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536809;
	bh=nZfH/KFXXPbkJuJvudZ9Iie+8j2hVfm9hk0dVOGQgYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KZ9AmDQQltCKID/NZkZ3NPfBnOoYT38875FnhIf4L5iztVb3mz0aCkLnqpqDCu/Yw
	 T8XyWEdOMjS224JlloNRN94pUL4vgqEMKVQTTUKEanvcTJiXLeoLukZWhtpK+oWn6a
	 7ft6mqggQkNGjW3uqQpY/gLL33dEf8EkKetUJc5X2/PD2JRvarDqQvzMAnl6sYDbQG
	 gmg3zR9QWEH5WkTBdebKiXvQp8Xtnn8YjZ4kZPoOGm1r0ZUuo8q1l28Im77razQAN1
	 NeNwTZrSTgUndmzU7xLUY4EhRh89Jv5WK/+XsAfn74/xSt3bY7+Oi2ZL0QfkIeFV0I
	 uyJKpnTfIN2Tg==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com
In-Reply-To: <20260224130307.526626-1-simont@opensource.cirrus.com>
References: <20260224130307.526626-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add ACP6.3 match entries for Cirrus
 Logic parts
Message-Id: <177253680843.22767.4870605144474939638.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Tue, 24 Feb 2026 13:03:07 +0000, Simon Trimmer wrote:
> This adds some match entries for a few system configurations:
> 
> cs42l43 link 0 UID 0
> cs35l56 link 1 UID 0
> cs35l56 link 1 UID 1
> cs35l56 link 1 UID 2
> cs35l56 link 1 UID 3
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic parts
      commit: fd13fc700e3e239826a46448bf7f01847dd26f5a

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

