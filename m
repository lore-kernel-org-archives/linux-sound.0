Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBFD3F8ECC;
	Mon, 27 Jul 2026 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192937; cv=none; b=tyB8zsVgZpHS67mg+jAEcWk9lPxuWgqP2hZJ2pIZdHO+7/65RzV2fW0ZvvxsD+fwAZYdOc+vmKsxNJRJq5OcadsmFZs1Np3KbZS7EvwAS3+VdRVIu5/X48cx/GXunf63zIl2c83B4/AXbUzORDMr31LP3TFcVTwvOuimn+/THOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192937; c=relaxed/simple;
	bh=FNo3gmc1o0Cxoyrmqt/dHQiDl4cYskZ1TH01abnlsrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CR3ZKs9AcoSTYy4XK2v8GZIQfQSNowBnzFCKEdnkFC9xAoRFQCOhv6LFnHrWwM4UvY9FqTzgAs9DYQJh9Z+x7aAXF3v4BXCPwqYghvXnJw2Y78eBi4bbpiSkqHT8F4vZFEfhqvYbkGZnlNisMj2iDfNisCe7rIzDPe1SbQessMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHxUexlU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHxUexlU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD141F000E9;
	Mon, 27 Jul 2026 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192935;
	bh=qM84Ulh3pV60hwhWo5a3IA/p8lQVBM3eSqVtl7UxPV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oHxUexlUTrZ/bU0474CXFvWwHfI3G603bcVCx/D36H8VobQsyjoIw9SRmeAQ4cmdq
	 istxdEVUjYKwHwQpt0w95goNh3aMsTpAYdgrfafBrqQVr61KW6up8EuhcaRtW5GlU4
	 JeBOBN/TDP4sox0pZHT/qkMINXOH5cfzowjoFpGTVp9TpDoTMxVtD8FQYpcn7j95lV
	 +WExOPR6atOeAHsWEEeWkAB7aPVHn4QHU292i5FZnS5OONkIOGjUdZaYJezLF0c1VJ
	 iYpCRcKbCsVSaBW8PQbLBHQmrC4mZLrmzst78lhmRyV9UHCC3b31syP5LjJvNuOUZX
	 knenedtSxzgrQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Linmao Li <lilinmao@kylinos.cn>
Cc: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260723093639.2364360-1-lilinmao@kylinos.cn>
References: <20260723093639.2364360-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH] ASoC: Intel: avs: da7219: Remove redundant DAI link
 name allocation
Message-Id: <178509647761.10630.9256886789144016277.b4-ty@b4>
Date: Sun, 26 Jul 2026 21:07:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FNo3gmc1o0Cxoyrmqt/dHQiDl4cYskZ1TH01abnlsrM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+Hl6GDRRdSI8kE9W76qErBQTwXAMEoU5x2lJ
 HpRWltTmRqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfh5QAKCRAk1otyXVSH
 0MoUB/97JTfWVPERj0X7mwCbyX2D/pRpiWxe0JRfuQ5Jr6KeyFlaL8fb1B5Yysa6Mcr9C3sBGLR
 7kPP0DL39gcBwDGpr1ozpmoidN0H0QFS4378X48ziRQugSb0Nhw/OzHVRXeMV8SrQT6U2BCPQP8
 WmxQVeHxv67s4Vhpv7nafubTPd6LGT3luCBqClgujo1+j6Pr3Z+IcyE6oF+8A+CmhztiDw1YFOh
 q/pKitIKDTQe59UcjePEgQiktCPJt9FTFCn2wmqpoO+OuRwF9Ikh7WV/fUfJvpzQhob6HimMPWI
 CQ/o2Y3qa6mEVc6x6oNID7POOlvAQGsNhZxGYnrijIWBENzI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 17:36:39 +0800, Linmao Li wrote:
> ASoC: Intel: avs: da7219: Remove redundant DAI link name allocation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: avs: da7219: Remove redundant DAI link name allocation
      https://git.kernel.org/broonie/sound/c/7859b74c0bd6

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

