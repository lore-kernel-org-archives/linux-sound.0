Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7621ABD7
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302247; cv=none; b=q2DpfO7+LA+Pg4Bq29Jev9Mg3k4t15NnicOJ+nQltT0RnswTj2SEgXNu0qI3XYWaWuh6rbVwTJ/2r5RR5odslmeL8t2IXrjVLkqvwmWBaTBIXa2ZyVyVIzysLeYdhQakTtjHoJ5h+xc685Y5Sj6nZJXKlHM84g1N9em3uP0k6LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302247; c=relaxed/simple;
	bh=HZE0Wpkes/sXFG8NUUqT95HIZzkTEP+tgnTjM53t6js=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UDVkxDsNPd37Q3TsHX+ruVbmq1ZmnWWV7/OFDZ+eMPvEzqaoMi3+0OCDazjNEtgfcSYURbQ3a8kqmi3oiSBQ5v2nyT55FGZq4caFdYzZ41ArsMHJg+9HEVwCtOtLUd97Hni1EDr5UqV2XLXq2i1yh8e2MwadY0sDnTYiACDvgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W19ThR9l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W19ThR9l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A50E1F000E9;
	Wed, 24 Jun 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782302246;
	bh=CvgMz7wHS2PP4gXqP8xz3z5glwIxUVdU9SASUbWmlsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W19ThR9ldbWjQVtNNPT2wA8L802OQXvhTfhlxjfKDRtQhx5hUIawBspEclwLRNHpX
	 18LZmBa2hNU2Koz8C/x7z0hDrtJnmMnDOGnAjJmvvGjdCrY+GXLDeTgq55WwXZ4Bc1
	 b7BZGASWGl3HLyKNrlv5SjS6TEbQytkR1S2gZ5zgzahtu7VfmwU7T+cpkTLpY1tYQ9
	 QK6tOMSdI9wb4MZ8/s8n9gfcMkp1oV75c9uwSKwscGOq5/BEVuzY0C+Yk1MFGJCMBr
	 YxaU2w13RI51n5F8AloCoAM3iFyEaiYRcYcnjEHtnfv0scupYA+jQF+gYVHyxPuWGA
	 8oNw7k+fmftAg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, flove@realtek.com, shumingf@realtek.com, 
 jack.yu@realtek.com, derek.fang@realtek.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260623102514.2422990-1-oder_chiou@realtek.com>
References: <20260623102514.2422990-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5575: Use __le32 for SPI burst write address
Message-Id: <178222344062.59996.1232312314102593171.b4-ty@b4>
Date: Tue, 23 Jun 2026 15:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HZE0Wpkes/sXFG8NUUqT95HIZzkTEP+tgnTjM53t6js=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO8YkL7m+m4apBkbGzez4VWX8OU+/REVgJbRiV
 n6vmJVb6nOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajvGJAAKCRAk1otyXVSH
 0FkgB/9qvy/TBU8R35pA9zw1P03ZD3+0UZGMErGl7ZrSvfMJGP0hR3wWH40TzKUzQAMuF5EzubO
 MM4KI6NFQE4K4H9s8LIo3fC6+9UgABYyF8QqcsxCl1K82HACHhjBGK/yLZW+YoZEcnOZJ+4aBmk
 JdZgLfvxsj1Qj6Ztc5Z4YcEw9F4bj0+IzE9frqsf0/hexM+/Fe+nG9qQZpc1mNr1risnt+tg89b
 z8vaWd3S/mf8nXyQ/cRY7bgbCLQOyZDVJNZzhZHJB2AfZe1qO7XHxEfbEtGisFawYihc2dFhkod
 LeLvJHxYnEJpuV2+YkqrAAt+P7DgmthHG/DCjgTOVAMt8v3X
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 23 Jun 2026 18:25:14 +0800, Oder Chiou wrote:
> ASoC: rt5575: Use __le32 for SPI burst write address

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt5575: Use __le32 for SPI burst write address
      https://git.kernel.org/broonie/sound/c/d0c415f0076b

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

