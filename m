Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4C3FB7D5;
	Wed,  3 Jun 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470309; cv=none; b=JJT6CGOrCNlKhtxwoWA7upJr16wvEwmdetVoIXm+u+fjOxvE+G9i07mp2TXpR5lXTup5hdJje4BUr1I4vxBwO4ZC+pz9jasyEMD1Cluk4hrcgm3pqLxdE6LOsFAtrh/iwfdf5zK3bl1tjU9pUAkEYrP2SG5arZVFKPnuIm0HUSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470309; c=relaxed/simple;
	bh=NolWVTeLeLTMqFExCzVJkf+Ls/8Ria6cj85mjZlT06E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A4f6cM1vrq4/ROrrS20WEubSwWUzAbW6KvjdeT05rdu6Fgj+avYDLkBEAj1H/8sPPOEJfY3zJvPO9r6uEt8+lpTIm2u9zobDny436+mKEjE1+CAIjOhInupkDlBZ1r9DVoCsW6uHX7RJJjoA2SZmvpa3oNzoJHJ/HxtIqTlux1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwJF8rYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwJF8rYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC731F00893;
	Wed,  3 Jun 2026 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470308;
	bh=fkVdO+skOkNkxjhXlyEYGUCcym7okEoNSxzNx3eL8c4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fwJF8rYOj5nS/rl+jvw4nT9zcY9AkoI52SiZJ+c0qMUHWLgbyi24f74mO04SYjupt
	 57D+aV3+mKsQ7bcjbBRIyd9g70uFmlXGYxMvZBqtpOYpIzzyLvLsBZBeetepzvZEqN
	 eCizAx+GkJcj5/3oVxJCG4KPInWIFtwu4aHYCPdmpagezfh/jkg1JnyLxBAi7KWgRp
	 YfuQsIUM8u7JU6tnLWzoNfEGLCJl65zog1/gMP805lrC8q0QF4IR70UfnvCJQcC027
	 ZvjTRAWDJmzYImK9gDKfLSoWswwGtykzgFFYrMAdvPVhxSjZaAsEDgr2yO0GAn2Syd
	 lHh1AoKCCZaKQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, zhangyi@everest-semi.com, nathan@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260602102749.3962261-1-ckeepax@opensource.cirrus.com>
References: <20260602102749.3962261-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: es9356: Use new SoundWire enumeration helper
Message-Id: <178041359899.93058.17988897424544744039.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:19:58 +0100
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
 h=from:subject:message-id; bh=NolWVTeLeLTMqFExCzVJkf+Ls/8Ria6cj85mjZlT06E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IhuQSFwwHE09qvaha69z4HFh801bk6tlcFP
 PUX1rh1y/KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SIQAKCRAk1otyXVSH
 0IyPB/wNVfUuHRjUuMEzH/O0MHmc2tqrhHJQ5AmyAYsvcGBZz8kfflyOSiBwSb/4DmHkYs7P1X4
 G2dOJZYBuMqmtg1evP/0vlRwvSy7bzNrHP3DZ7RBE9ffRFbisphUwQ7Qx8dA+hDCed2Pm/ER+lL
 pa7dxkwRUpMQIZ0uQxskE/S/kGYupH1Zvtfcc7tZw2m7Gd4GC0F1AKsBA+Hu5idLnSAweJeyOex
 8v9xnVj61f3aimeqQ0wkGdpLaS3qEYHrz3OxEbL9ieghADFY6jfFeTqKkvvrp8+6Hsuh3bL0P0Q
 kRQ5d6xSwlKNQsnCa7IhHBK4195U4uf5KxXx3RYSmf3sk7eK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 02 Jun 2026 11:27:49 +0100, Charles Keepax wrote:
> ASoC: es9356: Use new SoundWire enumeration helper

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: es9356: Use new SoundWire enumeration helper
      https://git.kernel.org/broonie/sound/c/aec0d8c88694

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

