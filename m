Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539703;
	b=rW3ADdBDzEJX9YdObNJFdffuAcJpjw/bkAcxpDHT5lpgj4KreNvtp2LhEX+UWNMUICP9
	 yfUP5G3UTCbpmigwWULFYGZ/9kFZti8Z/onwRIQNehgdBnHgt81Dmn2cZmka9RHdiWYDB
	 qrtFKIi4lP80mAqlsZxthDZHJR0oz9lAIvNksQ7nIVtrok/HoYjoKL1Nzh7ZyitrZHALq
	 nlyhTbhr/Y6Fb4qTxsSoou2r4fhMZTcqmLGEJt7BsC9stSwC7H/rzvR/h9A39r0FADStx
	 lEDUQRa5N0YhWiW/dCkDKEZhx8VAhS19uQI1SY8ymezTtFfOf1eqCE5dOrvHmBwbOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539703;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AQ4DhJAAcBh5o76+pZn3QR/SSi9s3+u0dv0YNCcAqSU=;
	b=U0f9zwcgn/hLgWq++kK/GFtbOiioV/C29DOS8L1HEqNpL79g75WuHoaB0ktXkYPcd6XZ
	 DWzXD5sju6EYWFhYgD9S3QkGu/StbDbVW3O3SCfwf3U3PzzXc4j2a2erBcSL2Ym5MVZDT
	 DLcPrc2atTJI+l8e/hWoUpTYJG/wEAH49T9rtLMjbys5XVxot+aO9OiInSMfWxzBvev9q
	 IAtF2ns+qnePSr2HNEWG/XnbpckTxknRMhBmCqnjfxTRN0BZvBD/IuWuST/70FZeoyWaM
	 RCYk9XfBu5g36QiOpqdZKjKkuG1wzzWTiVtjKEZO+mljytX8/8boAsUH7NfUq4aOzcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRoK7Qxz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB8606A321;
	Tue, 24 Nov 2026 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRoK7Qxz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B90F1F000E1;
	Tue, 24 Nov 2026 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539702;
	bh=AQ4DhJAAcBh5o76+pZn3QR/SSi9s3+u0dv0YNCcAqSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lRoK7Qxz0FkhHmvFm7FiUrAgcy9q6hWgvlc8elmfIhkruSdaAA4MBWhMOwLyg02vG
	 HZjyTBovUj951ghyKDmBCNzajA/gm3jPuO2yO3NlAq6bqwq7fvrlNyTc2sYPWV3Xuh
	 QxGg36X4t4ormxKZYYesBzeWb5GTGomxhAFnoxloolpjlS6lsAY//1ss7BDydaQOOL
	 agsraoHcRC2l6tooCsNKWBhHQdxvqvz/LkhcZOuCBtaVb/JnnGJ/mZ6plOGZdw0K7a
	 w2sxO4GWQhOWgHcZWq3w/1IHchRNi0DrUEvQLva6pn4SutYqZ5tmPkC3POb5UowxFG
	 q4TJq3h1ptztg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
References: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Combine width_find_mask() and
 get_word_mask()
Message-Id: <179552887992.264265.1451906115514371756.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:01:19 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cTH2NDUympp0VO0mpqg76snS3/pIrUE1bWivaJu/Ils=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZD32+pvXYrO31E872nykbS34rNRgwHpWz69+byWD71
 /Dz/RcSHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIgxwjw9XzYTuZAt//ucTa
 rWa71ys8/FVMzxru+Q3PTV/8/WAmcpHhf7rB82vikwJ/LLhxd9nsoOyHl5SF+1ef8Q6SnM52YZZ
 cEBMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 23 Nov 2026 11:52:05 +0000, Charles Keepax wrote:
> ASoC: SDCA: Combine width_find_mask() and get_word_mask()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SDCA: Combine width_find_mask() and get_word_mask()
      https://git.kernel.org/broonie/sound/c/aff174aab7db

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

