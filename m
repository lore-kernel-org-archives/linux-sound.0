Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025357;
	b=w38tut4I7GTrfZNGz4lBdAFRUnqzmPma92IaFtFMjX1pftSjvdxzvF9VHIKfBrVfLNuo
	 Aj9K3piWzBYosZgSPGZyZL8NosyrsRNVwSf8AYlFOflFMUfmMjf9oIHfRDbjbckeZJd6L
	 F6EVX/5P4C4uviBYVZcIfByn4WPofYY0zCjWbp0o2JfcYC/Ashddqdv+WIIGNPHYBOecA
	 /BWbY7s/IxdSX/+Stnho8ycgoqpupfgMfD1I/MrJyA0FVX3y5eawTssqc1+fM/E3HXE1N
	 BSutsFV9wNFQr0dHVqPX/ZcdjEu1ROKTBcIB3b4Vd4iny3SEOvsMsEAkI9UxIYSijqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025357;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RIdkJa5LenRRw6urYfdJfH94Dy+Daqb3UMbNwAcNkUI=;
	b=N4ZMu+C9bUw2e0VjbKYuMzhZEtp9S+QR4fbLyhIkg+m1JTUtbOORxfI+5tKEaTbcPU2A
	 FxKb/gibaj3kot2KLwxi0Fqldx4XZQoagqJLDzX3SrpeHCakrQwVXQzgpxC8Mtx0ExISc
	 N43yos3OP1VqOTxwH6OCc9U6zShXF08fO6bNGJIgRRWGiBedw3Th7B2q3608Hiyvas36T
	 z5G0f6smQgu5wjdzg6iYPPZ18njzUlFpUln92tlp8AfHbTdEwaj7vlplRVOO3qbhOVK78
	 M5RH6MV2qQ3zgk3DogJgh5D2z1xvQ6BCJYONcsFIe2klHWPhhUhB0gFdcUulM45xjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GcikOcyy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CA606A31C;
	Wed, 18 Nov 2026 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GcikOcyy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9036C1F000C5;
	Wed, 18 Nov 2026 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025356;
	bh=RIdkJa5LenRRw6urYfdJfH94Dy+Daqb3UMbNwAcNkUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GcikOcyyZbV6ZYAYVI05NCsP4SBhjk/0zkZ9hQ0Y5QcBQUw8d76lEvq1hmmoHMi/a
	 nVEfWYTm72i1jyOTFf09ZgN5GbqCLUqubJYCCK62FwqQlM8KtL6E9OulTZM5JYzAYt
	 ww/pmAVnqtLhnqx6uCYy5HCdLoEKt5dMWLlBmeSilP+bzi55AgEqjMNZRInvgV2MP/
	 6VGerKob9GVW5VaX26wpxQpvL68yq5J2yo+ExsTTbYbx3JpYO01t315/Tn6T8kgWOp
	 8tXz1veIiKPZpT3LtDKSxY71FNibFckoybu9WxgeFwiJTafGvrtN0F9UBnkUMK8taY
	 dCtSbYDm3DQhA==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: peda@lysator.liu.se, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <BF435C6BC6FC2868+20261118033156.3845276-1-tuhaowen@uniontech.com>
References: <BF435C6BC6FC2868+20261118033156.3845276-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: max9860: Register the supply notifier after
 initializing regmap
Message-Id: <179502535165.810609.9743452411132204827.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:09:11 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pLuXjnWgNTYMmlcO+Udup31AdsKFGdHj6AdalwXw7G4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+vjy5zuGjzLxjmqejlvpuurnx06u4rb+9nOS+CVn/q
 fj0ft97v45SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBMpKaJ4a/0be68BctXWN/5
 fqBfcNKpOm65u1cOBF/8sTvq3YlNPRGbGP6Hc+R8mnfqdMd9H6HaOVeqbzdu+XBqFpPXhhiDSdV
 nH9pwAgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 11:31:56 +0800, Haowen Tu wrote:
> ASoC: max9860: Register the supply notifier after initializing regmap

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: max9860: Register the supply notifier after initializing regmap
      https://git.kernel.org/broonie/sound/c/6bceb2fc2402

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

