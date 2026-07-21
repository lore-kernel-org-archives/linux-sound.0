Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45773353A87;
	Wed, 22 Jul 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727258; cv=none; b=R1lmhamoVUYpUxzMMtJuAV5ud9nW/jl+Zku7/T+NuvzOkvv3Hyups20/guA6qZHI/K8iAiMcavH+qBaC1qowuyBmFOlWpUxroiCdWLLEXaGPHY9t4Lx6FwsE8QDuj8iFZnbGuv3typuPvZgbRl9NR7UREfnM1Fj9uLsoAtWFlTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727258; c=relaxed/simple;
	bh=gGaw5KUbxdNfY6U0BZ5XDyfWOEi7DpMzyGXTOpShHEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jfn3Vjgfld4XYsM79JYv8X89SF5AHTtO5ln7C5iSGnrtg91TaRJ/xDhQ+yXa1o8u0+79DJJ7UAdW/GWeeMIaW1ha8i7Z4H/2wT8J9rqMFYGBZ7qSzlJNJDRgVCKu/8hkkHO+E5yAU6fGoUKPIhDTKVFuK9Xp14DTK22Em7tBAl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUf+1Q+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUf+1Q+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33691F00A3A;
	Wed, 22 Jul 2026 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727254;
	bh=zgraxFlLslCNI01wClzdJePYl6SSyat7/TGKUUY1+qA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KUf+1Q+x1s9VnrcuYGX3YFeWF9fLPRzZI9K5CXS8lFcTT1+jQqH30WgAafAn1aGNL
	 vm+t0iyXysloAR0ymaWo6RT5qVjNkjhmUNBWmVHDuhikadKVrYEBgcIETJyNQ7BWL1
	 CMQJCqS4spdeCmicC/uigPiCZ7gH7EHjNChaHZ4zAw0M+USDjJfesTx6gQ19r27iVj
	 w5zzjeL36LNxRkViNP2pDA7T79T+IAGdBNcySLtyWgT23r5vXfYsDYKbJjHZYXFeJO
	 SDBbEokODq2mCDyBX6L2vwLU49JoU9BqAdE3+nbS/jk4DsHuhZ/RPryxCkVB/lygOy
	 95CGZXl1bRJ3Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Uday Khare <udaykhare77@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260720104254.14948-1-udaykhare77@gmail.com>
References: <20260720104254.14948-1-udaykhare77@gmail.com>
Subject: Re: [PATCH] ASoC: max98090: fix missing IS_ERR() before PTR_ERR()
 on mclk lookup
Message-Id: <178466985955.260430.5561151349173827521.b4-ty@b4>
Date: Tue, 21 Jul 2026 22:37:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gGaw5KUbxdNfY6U0BZ5XDyfWOEi7DpMzyGXTOpShHEk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbT7117jLWKsNnsRhWh3fgOXE5elDUbNRdvU
 JQISkwf8IWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDG0wAKCRAk1otyXVSH
 0EusB/wM7wklYmWGNEPoJrVOtKd2UYav/szGF71YciGMdSvonN7B0nmpHEU+8kUtKh6IUEhKrff
 8Iy/EC7RRtxldyytq7ma1BSZ52wOPs4D10FytcfzBRgbpmyGJo56cjoTS/uEmYxMs7l0kY6i2sd
 metV8IAvf1188RnAtGi7iMMmU5yNC6uPkpAomwWsne2R5qnNhsWn6auid6iemd2K/21kxm7OLrQ
 qE6Fi/9J22c4dfsssj1AKIRfd2aX5GzzcLejjPeymeslzjsSioscU6C+57GhFdvhbR9Or2nH+R9
 fQIA1V1dpFZOGcQKlZ2QwaQbzmX6njK+9tN0shBqwekpBBrM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Jul 2026 16:12:54 +0530, Uday Khare wrote:
> ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup
      https://git.kernel.org/broonie/sound/c/a792ce0fad61

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

