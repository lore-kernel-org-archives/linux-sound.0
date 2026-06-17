Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1422EC083;
	Thu, 18 Jun 2026 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787136; cv=none; b=EissVLTEblQe5PEjzycspc7O/4W4pHTdjsqxCE5iDZ9VVb6g2UMVGrQxJUdIueqlFGl88amli4bS/QoyIFY04as+Tbnr+b+YZDfKHbnPLrG0ZrSwggRDnqdPtM3ir8CtDAulq6nbthd56T7iqD9JzUp96qnoy3Hp5WSqxYDfT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787136; c=relaxed/simple;
	bh=cZHFjNy/6NFBFXNib1jhv+zTowFGvp8VfFvdb/DXgfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h/X0EBbqz9W39njyist9uFUTUeEeoXNoWHRcOziedveugp7Lvt4V5fOWPwYyDF/82y8TP0neQ0JzjJZGcWbDtdFzd2tnB+2reDHBvtD2VdnpJSPtGhQ0XjDSpKIEZaJDCbEqs+a60RMiiMnpntflBgJjoRpZBUiHUT7MJD3lCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPPd/U9F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPPd/U9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DD91F000E9;
	Thu, 18 Jun 2026 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781787135;
	bh=Vz1oXNRo3BUov7hdX5V+CvF1TNMBCvUiBsEAYmRBSWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DPPd/U9FBPuuasp9S2ujWhfxrKtYgF3cZ/zwYePnhu7y73mXj3rSf2wzmkKeoOA2o
	 1uvcWXMdNVMSgEX2f3uxCugwtFTRyKtWDmC8FJj6EyI0itDFNLhtdHmOpleOGiQtwH
	 UD1LqVl2GsOs41b4SVmPwgJc651nWcv45lCbCgqW9NNwz349m/w6rYm0Ax7Eo9ne+t
	 vEWQTLFbyK3nA9x7i6JU435TwONq3dwwCe9kSmLAQBsduKv5fMOVy+i5gbAeOweJak
	 iK1QYATihNyCVGHAfcrBlSuHx04BP0dB/GP6TNBYkhU/pYrE7a38zE5JV49FvO+G72
	 P+kbHGF4o16vA==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 Sen Wang <sen@ti.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260616233322.873081-1-sen@ti.com>
References: <20260616233322.873081-1-sen@ti.com>
Subject: Re: [PATCH] ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in
 dual-rate mode
Message-Id: <178170461522.38451.2000827887786423405.b4-ty@b4>
Date: Wed, 17 Jun 2026 14:56:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cZHFjNy/6NFBFXNib1jhv+zTowFGvp8VfFvdb/DXgfU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqM+n8axWKqcP0HHNlcVUCFzNqLRQLM+k5loqKy
 +d2Cu67L7WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajPp/AAKCRAk1otyXVSH
 0KKdB/4076F7Oc4C5Twk+zmE2Cq5r9YjzBgEQks7XKqBVJPu7xXEvdi+HS0Zca848ihnlqukMkw
 LSsthApX1+DrnihY+pOyl7ldl7RgBPcRs2jr7L/EK5+ayTdHavoKMz4aRuolwOq5qeoYCVm1/Zy
 CGuW0FCGZQbHIXA6lZx81phRqxLgXAVm02n1St3sE6uIsBxSt7vMk3i8PsxO80N6ZiATUHcboSy
 7xz722oeqJt0M5VXgqFktB2GJEk3mhahDvQemnAF98eGXwWG9f7RDAvyU3JLzAuIjOuon7I2z8P
 sKfXak3O66Q8t0VBT0LiQ9oUneT5hNIZbHPmKX1n99p2/a4C
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 16 Jun 2026 18:33:22 -0500, Sen Wang wrote:
> ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode
      https://git.kernel.org/broonie/sound/c/fdf043f5f3ba

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

