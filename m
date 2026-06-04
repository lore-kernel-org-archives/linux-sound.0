Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7B2749DC;
	Thu,  4 Jun 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579085; cv=none; b=MrKZAlKlbbsaMwD6X2Hbfv8dw6ryk7RpMC3TGgvtKRERc1m0evvVxcuvuvG8aWWIUpU/IYYG6mTDNCDiDZxLfHkSYtze1flHIvBEmPSbVkW+FCieKjAwOOvdaeTNpDbJuPs+nxZp076hK908vqm8AuzK0IF3z0+3lCraRb1jtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579085; c=relaxed/simple;
	bh=2pWgIm1Nhoa6psZjid0Din4vks8Kr4vrbiWvxe4Een4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L8un/tZiPS98DK8ZwRZ1y1pm1H/8vLpwKRpmmyo3k1xs9Zdm1wVLgAlPHRQFf5x+JUhRLJKt7KkOFx37K51mIATmyuOi45FngLu37eZ+q0pYPEKDjB8i7WbFla3D56xGjL4wKKHoaROd7CHBUbSwnkEIyCVaUIT+Nq3uUysf1v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNH3A0ax; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNH3A0ax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D011F00893;
	Thu,  4 Jun 2026 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579084;
	bh=4i+5Oc5ZsoKkhZpgkOpQItJog23dGHd+tw1jq7bPNu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DNH3A0axR0LV8vskeJIH89G+PSaM/vLTRLvtxU+luz2cF+jQkCG6161V+Eel47xN5
	 2e9QU97D6fYb0SGT3yRkupa0s8/IHjEbwH0js2zd14Rv23TSzYWMkLslXWs40jGEtP
	 n1V5PEYvZRP4p2u9AnnDOaYaCjCzGqq7HpxRBy0DEA7AQvkwviTeUm06XTGD9uLxDD
	 y26eoD/xt0iQA7bQPLreh+T2norbrGaJfG/O/O8idBRn3QCHYjv+CsQ73mBYlUDj/L
	 5+KK+Kg8P/dXkV6AIjs912/Yh1bfrOEXJBDrRBbj9FopmtH3sUb/I2nmBZWQu3S1UM
	 k8IW0x0Y58ZKw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 David Glushkov <david.glushkov@sntiq.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260531214512.170716-1-david.glushkov@sntiq.com>
References: <20260531214512.170716-1-david.glushkov@sntiq.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add MSI Raider A18 HX A9WJG to quirk
 table
Message-Id: <178056843837.53724.5582134038042058804.b4-ty@b4>
Date: Thu, 04 Jun 2026 11:20:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2pWgIm1Nhoa6psZjid0Din4vks8Kr4vrbiWvxe4Een4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqIXsJ85L+4RXW7uxYPnud22i+gnZdoB03LmIt0
 9DxNeggZn+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiF7CQAKCRAk1otyXVSH
 0LIOB/4gw14zLHstnRbdi5TnM8BxjXuM/6Vu8rfOPRJYTiIA/QbOytwy3wLRJg+N7bNkLvpCY4x
 Fnc9dkqjv8AUwgWThX0JodoFll+w6mhbM88oKm1q5XbNnf17iaB7uNC4rvsAP0hd67y1C/Y215p
 j2LHkzY4rzIFTnUPAl7NhWx33gXpB51ei/yKKSBUmtgOwddC37qt1oggRuZBp8i0A2Z2MGXYR7W
 4qajTqgy2Q+Q29LiIUjM9dzNMFYNpM8HNHjhnau9qoN1taXYPK5zvARjKb3mKD/FjpKn+Uh2pZg
 2MJNYYbzkZ8hHhQyJBpdHlaDy5vGIj6ywoVzgjzBF0fB6Y9e
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 31 May 2026 23:45:12 +0200, David Glushkov wrote:
> ASoC: amd: yc: Add MSI Raider A18 HX A9WJG to quirk table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Add MSI Raider A18 HX A9WJG to quirk table
      https://git.kernel.org/broonie/sound/c/cad530a83711

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

