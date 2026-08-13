Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028583BBFDA;
	Fri, 14 Aug 2026 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707498; cv=none; b=SCDUCyrJaZwzo5L2uZ5Q92FEIKU6EuaeZNpKIEd3ttYZorDKLQk9C+9MjlLkTAyaQ3u1T1iS/wOx+6m/gIB+6aN2LEwIiIJCUnK9RntEugzC4TZEQlNJCDae6WLSwFzj5TvO9Wo9OUiOeeSc/sWxKfkZY4QDvjGyfN7OL+UDcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707498; c=relaxed/simple;
	bh=8lDtPDBKH9C4fjWO0qkWriu7o5oWLc59eHnw9DycBAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qM4jhrUjRG3g/F0aT9hS22+xznkI7KTdde5AE1MGAANNxX0YQb7/q+YZ7zwtQkP8n8r298H3H6khM9mQjmC5jbMgJ+oAbtDawg4xnL+Udn8SNkSKtWB3fqwrt2E05Gmp78OWvQFGs+VmEpDQqiXNBT4oyltbP/x2QgGu6nF22wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ7oElRu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ7oElRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59701F000E9;
	Fri, 14 Aug 2026 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707495;
	bh=jG1k5+1pVs++b0xNDohmxTQX69CR3Kt5tTmZ6Rosp5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iJ7oElRuVTAPRXska5xDjPKn9t57wXfrGyabXhZyf1xEwXQ7zPcQF/tn3GKx+w/vf
	 4Pp6ZzRYFoAMqKX9Mih0YX8rdK7j5xrhliFj869lugsUlg/OqKgM3QQ7Vst8qRhtIH
	 hxoJdKLj80P9chHKSjcGuO5xA2/SoumyJJlaSkhw9t2MeOEzdbvhoR7vaae6+Mcpw/
	 9aOnu+GBSf8TVr3j06iyhyEUp5k99K815PnkMkn7gKw6ofeFy+WfqnUfkIJDnFWQXD
	 ULOjYC6eeXTisCjOqifxLZLr2Uh9Nppf8O8SQG0mSq2gPdl/ga3sTB7lAmvmF3VQ4I
	 L9r5Ngh04tG9A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260811041925.25016-1-rosenp@gmail.com>
References: <20260811041925.25016-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: pass audio_drv_data to dma_irq_handler
Message-Id: <178663266445.110398.236798656655444523.b4-ty@b4>
Date: Thu, 13 Aug 2026 15:51:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8lDtPDBKH9C4fjWO0qkWriu7o5oWLc59eHnw9DycBAs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfv4jHA6sKuj46WvMYl0TtAWI9NWzWTwl3jgax
 /ParG0m6fSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan7+IwAKCRAk1otyXVSH
 0L4AB/sHOXvRta/c/y6NX26HOleT+/mxoWR/DZKJqvtV8DiihZsrdiLyEwkeExw+Qae9DgmmxQ5
 X7r/J48K2cMSV6y+8u4Dg88F0UZ39LobZTxhlb4hoOT6ldpLAa6+aVawiOX0/O0voHf0OLVjYhS
 7H4YiYY1sDuuTJNtZXJzQsdzet0sgXdIO8hqWPPVKaNc9WF6q0EMyUGk76yJwbad/2dyVugVIFL
 je0O1QYu+zXmltgN4g0RCQMcPKpSUqRxJC7aEUp+a3OnhfaufD/jKbIFeMWkwk+MqVSXLjltPW/
 QEQnDkKDEl7Ko//anxqa5V1DQQyb5W54FrvtYcFIw6B3LHBm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 10 Aug 2026 21:19:25 -0700, Rosen Penev wrote:
> ASoC: amd: acp: pass audio_drv_data to dma_irq_handler

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: pass audio_drv_data to dma_irq_handler
      https://git.kernel.org/broonie/sound/c/0196c4b4f82b

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

