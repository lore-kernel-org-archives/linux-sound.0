Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DE258EF3;
	Wed, 24 Jun 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302238; cv=none; b=gxKCdugM6SscCjnxGZaU45ZeBnJWH1uPO/ofOP/Qq+iqkKYLnOxxvtWxmLHLTlPFr9zyxV47RAQZHRF7BsF50IoUodjnbsPM055HyuOdIADr/zlS6RaWUu7+pH1aFQ+gySSSjdIlHEDSnZ+7I64IKgqnR1EmdnF/BErF7COF9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302238; c=relaxed/simple;
	bh=TS6lF6JrlJrJQZgZSjvTKkFr+4J2IXweONfW18CDSdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MHont7CGMoqZn7+9b8UAZ4EpslTl7dYl6RIpdJ7/lXckvgIF+4YRJcmzEwgsRnEHTNiGBcXDICe6TPZQXFSlt5dL32J9OE309m2AeNyuKWT9hWUJ2dRFf+wp5X3nTSUwjYooqjMQsjqLDwPXu/hWmQsexbZnIWf6/ITbJdZ7+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaXujivS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaXujivS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3927D1F000E9;
	Wed, 24 Jun 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782302236;
	bh=OVCa13L8o4YxLxcZVmS8kUrKZA2StQZ4WDpLfTW9kr8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kaXujivSqTLTFOeVqIKnBFyLafIzvhcwoa1gj4Z2IsuRyYYV4RaYZnu61Uvu7lum9
	 4ahKsSAYtnug50EHLjT8b3KqYOjjV2Et38JdrhI7uXTbYA1HfZMFF7aOKZKS3+chK4
	 PlDB9tmXpXsO07cRAZjSnrnXrqKBCeGkEtGq4N7qFjHTJPGv9tYcH9LKyPJuSb2Ew5
	 nae4AnDG1KJj9ZaMlR+jIF/Kqv36d0t1LSWrRVptwQcCnSCcWWLa6Oa5gCkte+lq26
	 yN7zJIpuP11cT5eonnV/gECwsIMn6s/9zsnKYm61g227n9LW/5RYM8swtdX0B3Nbas
	 zhXqF9t657xnA==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Juraszewski <bjuraszewski@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260622182733.23947-1-bjuraszewski@gmail.com>
References: <20260622182733.23947-1-bjuraszewski@gmail.com>
Subject: Re: [PATCH v4] ASoC: tas2783: Update loaded firmware names to
 linux-firmware 20260519
Message-Id: <178222341556.59996.2434804952287991750.b4-ty@b4>
Date: Tue, 23 Jun 2026 15:03:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TS6lF6JrlJrJQZgZSjvTKkFr+4J2IXweONfW18CDSdU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO8YZQTNqlXXyR75BlAn+Hme4FkKaxZBBvlb3I
 Gh5NtCNjpyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajvGGQAKCRAk1otyXVSH
 0J+JB/45j1yu5u0Z1TLsyoh/wxD7Ka5BLfED2kQ6DpGP/zcItgdWc62oxtMcASIY/HE5E6Z1S/p
 1RNFV9IW+2Koszy6xYRtS4Ug+NSEpPK+2z5bvW+cFRxpeQt6y7IHEcZpC/y+hQP18+nwhHWpZRL
 OKY4IQpr+F06Zxfk1au4goNoMzf+eM0hdy29cPjmwHHuaO3H0zVJI0Kdrbrt/b/nYmtHTXkfgE9
 jAfF5Yl6dqqGCCjvXI2cW3YqzNF3pneB8jHiZ8rc6xZLPDfqZZaQD/Rn7uKHQqBPSkAOUORHOxb
 Om52rq/9vCdD5rPgaPRF/kExLPjBL8SLkyzN58dMnwVodZTP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 22 Jun 2026 20:27:33 +0200, Bartosz Juraszewski wrote:
> ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519
      https://git.kernel.org/broonie/sound/c/e26bb459d0f3

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

