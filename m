Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02120376497;
	Tue, 21 Jul 2026 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642109; cv=none; b=e4iJdV2aTDOurQmXlpW9tFFCJeLNFpctMaZWhpSFw1z5/Cgziw9FCgzgaOatsuzLSWlFSn2UxkdofdOTGZvO4rUyDV46xJULlf99PqbA0pj+FQ1ROqap+ZjX3JXfQlOUdEsXLK+5kXd7TJi4IjRDrtPKcSLC3SzT9cxGNiqoUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642109; c=relaxed/simple;
	bh=5ZnOJ+kdgPtKc7QmTO3WssKJUezKM/WSkeB7zIrYzEw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RXjqwHzxVzJC9DFlWzAHeCedIBVKzCQAnxrbs5AF+JEtNFhrRNAufy9rh1B5Z2HGQQ6ZqzlvNKuO2a50PEZE7usUYzGhADNK5MPkC89sPg/j1N54KrkzFMbWjNaWMiKSDcEQGbvmoJfP8TNky1wF0x1TEmZccn+xONqBXmDV7as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK7zlnXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK7zlnXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729851F00A3D;
	Tue, 21 Jul 2026 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642107;
	bh=GkSN2lpOOE2XmwjcWu/MQcUmlTET6mYhmWCexTEPPBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TK7zlnXlEKa7Q7N5bZswZ8WHyL/QOH4j8F2bwLsp7ZLfqV3Aru0ahhhvQvagh+sOb
	 hm+ocC6jbEJFBcG/2TlpW91V8154IlfveHMgH6DhgoZRIGs0Cn5+GMIgbEG6xnXktn
	 WbFg4Qv2ciWr42+b658t41oNfMRP0oyn2yH1GGz9Lj+BKB+uoA7mHHqBm5XOtpIPE4
	 z8ojTWRp569EkdKQd3w/ln8bCufrc05U1v110piDcOUtPVyZKTGigEOt3tZukZAr+5
	 NT0I6T0f6tzfl1flZuECTS5kQeqVOscb8juNI+7qfFcvtR0ZHZi/k+lWUEzyFPRCw0
	 8AZthqy5FXKRQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Uday Khare <udaykhare77@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260720103950.14474-1-udaykhare77@gmail.com>
References: <20260720103950.14474-1-udaykhare77@gmail.com>
Subject: Re: [PATCH] ASoC: max98095: fix missing IS_ERR() before PTR_ERR()
 on mclk lookup
Message-Id: <178455968152.8049.15196141832158258717.b4-ty@b4>
Date: Mon, 20 Jul 2026 16:01:21 +0100
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
 h=from:subject:message-id; bh=5ZnOJ+kdgPtKc7QmTO3WssKJUezKM/WSkeB7zIrYzEw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqX3o5riT6aSSWrDGc0F5rIuhjnlHZTsKLsKNcI
 MBk3o4EYZeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal96OQAKCRAk1otyXVSH
 0HeOB/0b6Qhfkkuze8o2+OJFt8G8ljBVafOHabSPo1TzDfi4Go6Tz3vyvuxwSvgoEBnS9reXvGk
 UaVmi88uh17kkB3Yx8MGe9EoQFIXtDBtv95PKjMkHZM37x4YOZA1OrOvptOmuZEacqxxV8NiCOX
 gUHsbnshjvqg4f2XcIacevD/NcGM03emKDYBsRCRCezbbHOYfuTMj/CsMib0zhAbupk3QIFbvVD
 tJjgqRBeMApgZ83+QXlp9PKLrihk1VY+ZQ7iytJJ8cXqb/IPF9s+o7VPD2eDhMItLP1bN3PLYLt
 UBdGsunKLOkw9cNeBl0YR/zfSrkPvGHVfMgMHZrE9GgUSDVx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Jul 2026 16:09:50 +0530, Uday Khare wrote:
> ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup
      https://git.kernel.org/broonie/sound/c/317e21532e6f

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

