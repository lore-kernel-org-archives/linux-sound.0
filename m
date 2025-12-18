Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547B2E7BD2;
	Thu, 18 Dec 2025 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081874; cv=none; b=mgHi4dYewJEUyKqCnzfqly3WpL9wWzaJfd5EGUgsAotoQS0iI7a1LRDIs8J8pur0zRQXDkue63w6N+hhIHSoS1VHR9qaqxzx2n8q4wBEpMJRfPgUj5+rpHA5qT/hBNuhih7fRTx7LbUc7qUrqixB0b7GbvzTOLYYEu4vbExWc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081874; c=relaxed/simple;
	bh=cEwdoM3ekZYqXJrp6cwcmWe0ftdZUDQjOKNB8LOz2Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fbBs9VYpTmhpmaeh51bhuxS+KKV4q7Wz3FT4exml2v2J1lZzepbEEOdKLYk3TupMD3pP2pIfLcWerp05c5bkxt6Y4eM3IZJlHJnKmN8arlh7y6T68Ih7cmAnw8nuceoymVwMHW4wHJqPpTg4Yo1OHSFJRXgbhDU/1AiD1172Aq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXQE+XN/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXQE+XN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A035C113D0;
	Thu, 18 Dec 2025 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081874;
	bh=cEwdoM3ekZYqXJrp6cwcmWe0ftdZUDQjOKNB8LOz2Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AXQE+XN/C7Bf0mkX0F+xCRIS4rW7h8xcA4eTuBhC3LDfUXnpkk1AhBZcgCLjTLn3a
	 Ybsz7iBnlH7LZc+rHN58Epw67fDP+mHmWeoY7Ks7+y+1OUWgSa59s7IUWEw8NyCqRQ
	 1Y2gtJ6HCD/koJSJ84VCF+Ni6kGfBWGVMtJEopq7wHdpdVfB2fng+muC1cvRaxqUSg
	 FR5nOmXD0Vjw1ujTsqeRkXJyOI8sJrif5jZiVEwBDYQ4I13bRev29xHq7dssDt8Fwl
	 B9loKxoYKPERFcan62Q58nh02GGujUoKmGopoylKVoxC5pmeqBB9Cy0rtZ3MAwihEA
	 vpv1rHsyzpt0w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
References: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: provide regmap names
Message-Id: <176608187210.237766.15885878211073292970.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:52 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 09:49:30 +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '30cc0000.xcvr' already exists in 'regmap'
> Fix this by adding a name for the non-core regmap configurations.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: provide regmap names
      commit: 08fd332eeb88515af4f1892d91f6ef4ea7558b71

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

