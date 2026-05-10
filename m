Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30161AE877;
	Mon, 11 May 2026 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778459253; cv=none; b=arpKRubGGxssSvJtJU4XAniRsTL7WzyHw6RKJi97Z3kZ1sTFyOoWebLQInblSYUG4tGFXPx6hQDBcQhRAfliPO6OFIrCD98Ipv0Xa3qX/w9jSni+KsyB8D8i5gUJRKTMHU8yi0GlLUWcgmZIgqLBJtTHKpvbbWxXk020+GU25Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778459253; c=relaxed/simple;
	bh=zrRNcPe3NrqnKm+RIe9w0AUIgWf4yvMCAW2OWp0lSFI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pfo9nig1wjo2sTqswmm54Bt0mW3J5I9P93tiY2gmVflCmxvHym3VnU9NpqKm+Fy785Etl23qR+dRrw6s9yR0MlCFah4yxbpzd4AT4wNTLcOrD7tUXBiK/UidkHNhnLSG/OfJHppSeFRBL6LBbsuXXes+GMoG0m+F/NnOk1xjhK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnWRzb4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnWRzb4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773F3C2BCB8;
	Mon, 11 May 2026 00:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778459253;
	bh=zrRNcPe3NrqnKm+RIe9w0AUIgWf4yvMCAW2OWp0lSFI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MnWRzb4AhYpkbuRemJUhrs+cCUY8xls9vG8Ii57JqCXWmKpTAQyjKsWjvLcg7mj2A
	 dUrZJ12aD3nl9TVnfLE88iUlPKGp4C/cqVKkQifz8ICOlO9t7TIf2aDlvmg6eV0uq1
	 WeRkgyQvJVGxFFI24/B2zrF34xHRFxh9cuhsj6E079zgXQxs+EaowoyEQhB263Ztyu
	 1edXlSFLhNv7/SCb5Rb9kUnev/UFJfpgVS3+mAtO4CBhsSA96t1ZrQcHbYFDdj08lt
	 UC4pY9khDklUNOoSkOSlqy+UKfOEwGxrMU+C6jExjtYJFl1a/n/PaAFnloJJujLByo
	 EMzHLjPCYN4iQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508-asoc-doc-fixes-v1-1-b53eec42e340@gmail.com>
References: <20260508-asoc-doc-fixes-v1-1-b53eec42e340@gmail.com>
Subject: Re: [PATCH] ASoC: docs: Fix stale and misspelled references
Message-Id: <177842076763.951539.4788022638179714248.b4-ty@b4>
Date: Sun, 10 May 2026 22:46:07 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zrRNcPe3NrqnKm+RIe9w0AUIgWf4yvMCAW2OWp0lSFI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqASJyYaNvonnpEVCMM0E6BSym1XOS2VPXm33Cs
 rF3gMhX3p6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagEicgAKCRAk1otyXVSH
 0ACfB/0WRD1RYevSFLHAYH3ILTj2MKPyVdu3VKfhB4G30SX+4h3fnV//txbQQjUDEN/xRjsxmtR
 0adqOUbalzErmPHHYZoUk7wlR/P38MruJGGa7nnefGuJiSJhiJ8jgPT3WCYg21uWLWCwmyvQ3jH
 ffUS4KbxCB8Lav3YyPUwsFmQBUCsUwZwfinm8e6uhPwaK22LhjqmgpstBFuQdCTC5ZI43VXcoY8
 ouxOkdtxKDriHzDVFoEFFj36ZcaZGfgOL8zcGm7ThKxhfTPFwWWCGtOVMndJX2cI517bvCLtOlZ
 pwuAL7QtUKn6ikOK1EzP5C/ecLnRAIfcEuEMt7jfm8cZsFts
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 08 May 2026 01:20:50 -0300, Cássio Gabriel wrote:
> ASoC: docs: Fix stale and misspelled references

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: docs: Fix stale and misspelled references
      https://git.kernel.org/broonie/sound/c/b2d1eaa9b660

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

