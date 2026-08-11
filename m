Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5723AFB11
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462866; cv=none; b=FChRLUMSF0kh1z6t9rI0w3+lJcSf39ZjpEd/arRmP4n+YeH+wk/CcoYotjQtqhOB5iMh/AZA3VP8CWRw0h3nrMTKD4P0jCTIbARkpw/PV7ju8uf/geH/SOvSazCQEjKPqL0c1/xMKIqcK4wAhTngYI2AM8qp1s7oHgb35piTkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462866; c=relaxed/simple;
	bh=z/kvDvJC/xsBubPEZZOObKr7gxsRJbxQ7Im6X33g+RU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GnP1bYOKX6TZXhy2p69RYMZBgVee1fOAnvYxdxrSBKCjUDQJSRryhQPYqAowR4PB5WT3Trg/bYMYWotVNizPDd0UoVMcc1yY52nHc4cWcTQfzL/3ln8TdVW/4YfkHQPIS3Q6ei5y9ue7EC5GngRe59sKaq5CiXNEcqwops5g7Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iweFy+mS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iweFy+mS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6EA1F000E9;
	Tue, 11 Aug 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786462865;
	bh=A3X+5rgnvL5aMHccTGtQNQ2ECkZd3eeQ3gbTzH++UCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iweFy+mSVnZIJ6u/1sFJX8nhOX97X7xLz2QohrZ9mbaBVyGrospOdmNznfuvpxTt4
	 wmzRe4q5In0AN2GlBpDj/Rr+hD5oK2iAwCOjZCwrbFX+wWMoD4AAZ80MFl4+7oGVGl
	 02Y4vE5qO5VibdCoKVvKud/OhNs1jyBKWXTKEO8giW7DdSItnA5C1lmNw4Et9HuFJz
	 V3S/qCaF6lYvkd6loZavtmBqgQalajulSmrWBe08j8CMQ0FMjjqs+EuqmZ8NeoKbhQ
	 dnpr6bF5YjgisBNnNfWdRYWpb6UpgHk52cu80OrYWSzWkSQeTSijZOcp0kZ600yJQ/
	 ewvf0/vAKBPsA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260811121446.1805-1-shenghao-ding@ti.com>
References: <20260811121446.1805-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Fix compiling warning for
 tasdevice_set_capture_profile_id()
Message-Id: <178645568501.119683.3855902141272177238.b4-ty@b4>
Date: Tue, 11 Aug 2026 14:41:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z/kvDvJC/xsBubPEZZOObKr7gxsRJbxQ7Im6X33g+RU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe0KOuSGI44Y23IIg6ZRryqkhe/Xv7oF45QWp4
 TZ2CzQ+acWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantCjgAKCRAk1otyXVSH
 0Dm1B/9qUg+ta7ooTGyqtryPsttpJAF7PplPJbOturg20ML+7u6O+3XvpSqcFaPI3LmWAHwZHaT
 E0wMIvv/HThy8McLggbhU/KOboS4kvuoeh+8rva3wb0xe4oJvvOfB6WeL1hOJXA8+U/07TAIgas
 jwJy2YTkTMzKqFo42AkFR8veVz14v6nyeKyITjiDpXHg8kmBfO4MqBNaBwtVnbt7hFmWm1QBguK
 ZQjvIxFHfDlOM3AAI6TxMYxiuL0eXGlqYKZhES26J/g0+Q0WAFmhqLCwRd9M5b1qKrMnu32Sz+x
 dsXJ9aImcN0sqsq8a5wAVJI/eFvogMHaoQuJOxLkv6cRDiG7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 11 Aug 2026 20:14:46 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Fix compiling warning for tasdevice_set_capture_profile_id()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tas2781: Fix compiling warning for tasdevice_set_capture_profile_id()
      https://git.kernel.org/broonie/sound/c/6f14f6a24f11

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

