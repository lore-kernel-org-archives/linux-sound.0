Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC858F06B
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067139; cv=none; b=Wc+UM/GVbpUfZcbAPxn8KJoo+9Bfe4PMRBzYPVbWnpEQdF0szrLeG+EZRvwVDDwURSoN8vBo0ZkxRYxUOprrk6QWWSE/qb20EW+FV2c3/3sZlAnpviLus7t9ezk0kvFupdL/T+HgHjB9p7kfpkUOht0oFbxB1zLxvVa+jVXpVNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067139; c=relaxed/simple;
	bh=C7FkYf5gO2Pvu8q2mkNASOy66QFOyHwvpl0SMAkmvYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q3bsMhRvgBafubf/tA4SbwvvS78/gq4TbxFoo/ps9PUEFuWND03Kjxq+aiAKc1QMQDpoJn3xG+vkzigALiE4keJxyjLUYyqzStWt0utRTdgaqqjOmHy3VTyy7OKybq6tlPAg0NmZulLefdjYj9vm6dfdPTCZeV/izNuZpzzn6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQdZSL4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQdZSL4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEA61F000FF;
	Thu, 10 Sep 2026 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789067137;
	bh=A6Pzuo+zeR6ni32zWeNIUKkrRB15JkwyfwAwvNa9e0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hQdZSL4/9UCsJ+F9y4mxaenno1bObxeD7R2+gdol4mNwSXzOIsLDom9Tc29tcAgjJ
	 MfnQton/2q6lS5QcVQFMbBTSV0ZHG4p1LejNOI5ebO09y/TObrSf30q7IG5vOvCAUv
	 p3xRt96+GY4bMyf7eP010mzTFvPiHN0iu6aWCLgCoRU0hnIZFvCCTF8mx3KT9OYci4
	 w2Bv95PYKOQtzOGMwqsieJJil9Lkn1bgv3k/qKHQwQ0zfEFTIVkqW70N4mGavGHlUe
	 Ft38xRxeOhpXHOuB5CoKvlbHGxOybU47UgwErkxNrLMB5bw3yT2eTRdYmdGI0Qtpr1
	 IY0WHxPQaavgQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260909091806.872977-1-shumingf@realtek.com>
References: <20260909091806.872977-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: avoid re-initialize in advanced mode
Message-Id: <178897648942.151853.16160284532970887567.b4-ty@b4>
Date: Wed, 09 Sep 2026 18:54:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=C7FkYf5gO2Pvu8q2mkNASOy66QFOyHwvpl0SMAkmvYg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov99k68ULBJBE2kZVfmx0dzQToejz0T7O2lHo
 K+0rND2EeyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL/fQAKCRAk1otyXVSH
 0BeAB/wJtxfYnOUOhz/nwGzk4rjrDaWB/UHgQ8bmSlT00ObHr4gSM2tLHYKd9WwUU7VHharFziu
 FMj11MgIBwObqeFl0cOO3VVvq0idK1eH9Zuat/73Ebh6VSVuJz1ue+TjpktBRDuXDHiryROnRhW
 z7swvgX/RxZ/Lk6gnuF/GZxVVyRNZhG4T5WWzzm/vSq1MiYStyB8p+Z2SpOlPTxIVFpMnLZb9ku
 UTpALuYBKGIOTv2sfVa8PD6ZVQCWjGDpchEcjTWeK5zZFY536Ig5NXxmjIhB33OL4QIvfTeniJM
 H/bZXCJkaQhALY9oFloRL9BlPSqtn4FpD3Fueu+RokqTc2J6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 09 Sep 2026 17:18:06 +0800, shumingf@realtek.com wrote:
> ASoC: rt1320: avoid re-initialize in advanced mode

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt1320: avoid re-initialize in advanced mode
      https://git.kernel.org/broonie/sound/c/04c3ee0f5d15

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

