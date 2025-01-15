Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63919922A
	for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 20:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736973154; cv=none; b=u4gjb+VN4HPdg9iIIg/oJN0hwIXobNRa5nU99/ZMi1PvUUvzM4pFEs7HxwneSAcOmw67KwJcYJwb3fuukDMSLjK/dVlxXlo7QjoSHQ42GkWXjm0xOv7pYIY+KL6Ym1t363WrIXReWIRwgHA/2VxgoeA/D+fbq/zll5ZuBW36QKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736973154; c=relaxed/simple;
	bh=P/FopEp1y/p29HpJaExxp2QmYDSLe4TlbkVAQzzepOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UyYl0V1AYbG+xmcbIXK/r4QbmEKCNRJ0YWKcvrxitKTFYSA83FfOxx7Qherhm0FG+/byr94HLTnmAeTEVTRHTy3mLK0HkwOBIv++wuQKrTkjkWRF0OIcKsleCoGwNHSLBLb8rmnEfOSBWJpX2xDlulmBIzvwjalm59K8dIuPhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+F2DtW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+F2DtW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2ADC4CED1;
	Wed, 15 Jan 2025 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736973153;
	bh=P/FopEp1y/p29HpJaExxp2QmYDSLe4TlbkVAQzzepOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T+F2DtW3Mt78bskwl4q+p4HijZ6xfr6nD2dWzLb+wAei+pyKyxkpmA2i9KDQODx58
	 B8rwncbrxS0+GJ4Vd5jaq5G7cuZFHdO86quFkwAsJIcx9IK1e1i6QWtHZg13VXZjSK
	 UILrG15djIViX1Hs0glPAduZ97FygKMuyzZP69SjoAMArE+8Db51h+kLJL/9emeBLh
	 9cvVP/A8/Lbk5JC4xaHTCIjF96IUAOc7bBDj6AON+xJeM4hCgErTOfo5fkdyBhtr/P
	 fDr8h7dtemx9IsM7EdHUh/71IviziAyTpHy+eb2VwGMVp6W7+zWqV/JyP+jmmK9PeG
	 t6PTFN+b8VjdQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: sof_sdw: Fix DMI match entries for a
 couple of Lenovo laptops
Message-Id: <173697315226.457029.4052151871483982014.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 20:32:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 02 Jan 2025 20:33:33 +0800, Bard Liao wrote:
> Those laptops use host DMIC. Correct the DMI match entries.
> 
> Simon Trimmer (2):
>   ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
>   ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM
> 
> sound/soc/intel/boards/sof_sdw.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
      commit: c9e05763f334845ba69494dd71d7cbfd05fd0e6e
[2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM
      commit: 17615e4216115a0454e0f2007267a006231dcb7d

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

