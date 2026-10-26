Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100312;
	b=NTgjQR30ay0NNXCSzpBHGfiPqde1AoV3+2vg+AWRoyldfczhxvXdjwztn5Yxrttrgj73
	 MXmKpp7VmJbs1bFjoPO0zISwYi7L3RriiEORJOermRQZnaHHvXdrAKKAGstrXB/ho7j/M
	 xjcz15em4Uf3/7EJh1rGbmLczK7ItL3f9jJY02WxafXhLt9WNTp7wzPc9tH8g/DPb+L2Q
	 bDOLzycxkrp24ptRfJAUUqnHWVI61y2y1EIygiWuY1TJYH7hNOOeCTG2QF9JZsoF80AoO
	 gT3QpQM2Qe/MMHEWJrwGuMSvT23oExqz8GNEEfteEoonyTDCA/EGKAM/Ivi6oTeFI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100312;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eovlKjwBwrH5H1voap99JWfPsj/COeYozSnUeVtJ7kc=;
	b=jbI7HFMXLcls54ObHlP7n58cB9kxZ4zKfRBLBLPHT34koHYJpTYLMAR5Yc95ww/aLPVq
	 kb/ICH7OYK9/1k9w8CeK/nwh4nGS0XJK28j6KDouUwoKKF7XJ/J7D49qazUx+o86fxWkE
	 0cdck9FkMN0JYGlAhZ3BnRHe/nkWapUKEIw9ZbBjfn8ae1dVSqCvN4reh6eT5ZSgkyLmD
	 aMZcKpvomFxFVakrECsJjvbWy/H+A46wfL93RY+Y+G+7YrIi5ZDMgQxhqZ7/2OkVNrdQg
	 TUXMiLBo4m4sTWNXbsKFZLv1T21mQi148fRodowwPG1oGKv0yw2W/HH6im1ZnDblEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M84NNiZi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B535606A31F
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M84NNiZi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D111F01825;
	Tue, 27 Oct 2026 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100311;
	bh=eovlKjwBwrH5H1voap99JWfPsj/COeYozSnUeVtJ7kc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M84NNiZiKKTBWtt9+fK82oUDiRYQJhOv2zh/wFbPrVSKoZ4/8FY7Qe4rCj0/t3S1B
	 9OabL1opQEBoUu7/tSYuTMuIWg9bD8A52v5ydELs2QjiPzA5GhkttvWFMAsQR+68fI
	 EcDuJ9ZsbBruaPueikMDsNwtsxvOHZUDPSDW+9cjzQ4kGb4mSFmeX6LBW0Xqy0celt
	 ZUQZs4Jxl4LDWllUo+bkZmXtuY5NCxHRdcLFa74Cs4ddPeoDodrpoTZruaEcOxCA4r
	 QsZRAqc6v4vA0wG6lPFI63IBvGhAzTv04h+vfOAJFf+OY1FKH07CO+EZMlNMrCapay
	 AQPeDAn1DP7XQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 032591F4ABB4;
	Tue, 27 Oct 2026 11:25:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, sammiee5311@gmail.com
In-Reply-To: <20261026054837.13618-1-zhangyi@everest-semi.com>
References: <20261026054837.13618-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: es*: controls that write each
 other's bits
Message-Id: <179304597887.199157.15716429453952742651.b4-ty@b4>
Date: Mon, 26 Oct 2026 20:19:38 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=broonie@kernel.org;
 h=from:subject:message-id; bh=i4ogxkUqeD4GJzJkY1RHHmbw7sNnsKkkb51vv3urm4k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedIkIfVji+/K2fVZpab7iv4TrW82vL/gqmvim6uPsj
 /rv/0273FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJ6E5kZDgi/WKyo8j7gx6f
 /HiuMD2rq010zlgtGBOXZmj1gcf+gxLDP4ttr0zPcq6LYGr12T3H/1PN9R9STrs+PinMvGfUo3V
 9LycA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 13:48:35 +0800, Zhang Yi wrote:
> ASoC: codecs: es*: controls that write each other's bits
> 
> Both the Kcontrols for the ES8326 and ES8375 have an issue where they write to other bits.
> This patch will fix that issue.
> 
> v2 -> v1:
> 	-Add Fixes and Reviewed-by tags. No code changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
      https://git.kernel.org/broonie/sound/c/dd64271fe1b9
[2/2] ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN
      https://git.kernel.org/broonie/sound/c/29b867d8351d

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

