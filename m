Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1F341ADF
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774174; cv=none; b=jqH1tIVOPkXOVuKSXuRfhqsQBD4KPzxI1C0UEJAWdXLrFo+Y+215qFnXqMti9iQp3Oin/nYMzUWsKMVzckMQ2reFEIamDvNilxcWgNjF9CnCbp4APYW1pZI/lFvFwiXLUVLcCIgYi8UwLhXeFRfJ46NIw5P9B1YPbPKCJ/1A7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774174; c=relaxed/simple;
	bh=FqGjFH6hRu5Ed+VdLC4sxm7KEsMxh1QTlFaFP9fjuTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=te8agsbkNg2y53kdMoJvDDbi08MvxwAAjJ9ti77Oth2Dmcporu8OmCfgLh+kxmB5jAMgTvod2Kq95aCs4/dTMWuXvijf7jpreuKznxwwya009ZujI6ctzKnJaVdz3Wk3bx4BHc1MNNfUwsjGdsdnOeqMYWvnVs5ZgpLTgx4o3UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dzv4bDN/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dzv4bDN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F3DC4CEF7;
	Thu,  9 Apr 2026 22:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775774173;
	bh=FqGjFH6hRu5Ed+VdLC4sxm7KEsMxh1QTlFaFP9fjuTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dzv4bDN/7wE7/BdFNQbtsUVaGLFEB9sgTQtXkmZsDw8mrVYMyK1Al8tVHUsPrL1vr
	 s27J1wOSe7Inv1HQypXb/guuC/wMAYMFitl9V7QHTbmRMRaC2wSzTwKBpfypPZyx/R
	 vGdkuJyh2vCcxHFgTS0ooMEYpbgHLqKwX0cS/oupBBNx3oME1wnI+1OZ3YomCv7L96
	 qDVFYjL1yJ0xHjOfKnsWxWDCXAsaZpk395R/d5mDehAigxJqYNl7yDlENAtIR4jGb+
	 3yNxX2tEjugFcwAZqdQ8nWyS5VSwXmJthzTY7i5BRgcLZVWiXYaOrRDJ9zwwLXRvqb
	 j0KA0wPqLiP2A==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] Yet another round of SDCA fixes
Message-Id: <177575998167.993260.15164695369618116965.b4-ty@b4>
Date: Thu, 09 Apr 2026 19:39:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FqGjFH6hRu5Ed+VdLC4sxm7KEsMxh1QTlFaFP9fjuTw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2CnZIjHV4uJsQpQbfZZ2TlvJ/14wFtsnyZFJI
 GC06fJlObSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadgp2QAKCRAk1otyXVSH
 0DBNB/9txm/eNR3npp0XR+HIZq/ImVh4NTj1/5MpCHEI7PDsbdDFK+DgmRH5BKhwdtF2oM8j26F
 KTojGyFfAPw4MbTF3JC5pRmG9meIPjS/U8fOzsUnRrI//TGaevMOQWglGRVH+LLMJJWbdBGevxb
 fJ0MavtaRlWYWhqIMdtlO0DK2gtRRzgKevnhqRw+ZtL4zM0CoNs4U1ChFpgKeREkOUNah6NQaa7
 ZqAQLybkMgA8M/eN+2jmFuBOyD3qfuc1C3w/foa3YOQNaP4YAefEWrEgKPhRH7MFqG2xysRVzI8
 YlWMzHc7VWj6InX45U3tU5i3hHHPVDQg/whwaudJbMc8XxHX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 09 Apr 2026 17:43:24 +0100, Charles Keepax wrote:
> Yet another round of SDCA fixes
> 
> Another round of SDCA fixes a couple of fix to the IRQ cleanup
> from Richard, and a minor tweak to the IRQ handling from me and
> an update to the comment on a fixme.
> 
> Thanks,
> Charles
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/4] ASoC: SDCA: Correct kernel doc for sdca_irq_cleanup()
      https://git.kernel.org/broonie/sound/c/c271b0815f45
[2/4] ASoC: SDCA: Fix cleanup inversion in class driver
      https://git.kernel.org/broonie/sound/c/7936490e0473
[3/4] ASoC: SDCA: Tidy up irq_enable_flags()/sdca_irq_disable()
      https://git.kernel.org/broonie/sound/c/87ceac0a98e9

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

