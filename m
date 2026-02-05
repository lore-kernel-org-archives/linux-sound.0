Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD73AA1B6
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289491; cv=none; b=WFHGn1N1hSi6YZTWax07gmN9JZgQYOXSHCxy+RH6/qbQQ3YnS4xKbUd0IbKskHlGjJQM3uJpGZuCpqwUbYQXFjqzz++FmoPFxTzvCJFdPGOU3/thESjU3oseBI4vmqxew9HGkyWnZ7TSr3oelSd0zzgRsU8gDGf7oS4MACoBDgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289491; c=relaxed/simple;
	bh=t2cB+V+iIXqemTcejBOKmF3n0fl5VQQawpl09DTsMP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QhPjvZeBidS/i0pvE/0373PtEnVCmOQQpq1WoaK9mpbsTE4zioHFs+NbE+zRxw4pqKeHmbOaEkbSfLiemPcNsaRKszBfOlXf9T2GGOlDn48vM9N68WLVqLX4usoOAqOM7F2GfEojuk3JXGPyJRSbzvUZDIAsm1aveS+ba6gn0z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5HmRW3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5HmRW3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2343C19423;
	Thu,  5 Feb 2026 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289491;
	bh=t2cB+V+iIXqemTcejBOKmF3n0fl5VQQawpl09DTsMP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J5HmRW3agVsA74gpWfr422Lpb4WiqaMLC9jox4Ac7a5IKhgEWhEB9mzbcS4WXq5Uj
	 XowMF6VHvw4Efk7CPUbNzDWSKaPDFPM5PpGwthmR4yW5QdfEP4BKI6fZIpDoMIJu0d
	 +BirgM+npdzy+5J3c+ZfmgxyjVPrvFro4wOdfj6nSirXPEWUSbHTnltiXmw1igwIpK
	 NsxsEwDkdGv1R3YUkFF+OgW3ziWm5O+aSSVigJW8yvnmX81blTBMBUo7EyS0Hbh4Ez
	 x0rd4+LzPBximyq/OKEazVbNeDGl579/an1e8TIRtZ+T7mDTpdQuSFoiroDj9NUnrG
	 D/8+uDkWnZiYg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/6] Minor SDCA Fixes
Message-Id: <177028948966.8656.9368936617190659285.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 11:04:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 04 Feb 2026 12:59:37 +0000, Charles Keepax wrote:
> A bit of a mixed bag of minor misc fixes, improve handling
> of volatile SDCA Controls, make some minor bug fixes to jack
> detect, improve the cache syncing by adding some more defaults,
> and improve some FDL error messages.
> 
> Thanks,
> Charles
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SDCA: Remove outdated todo comment
      commit: b27b57f85fe3f0eca479556ac55bc9cbd1a5685a
[2/6] ASoC: SDCA: Handle volatile controls correctly
      commit: 9fad74b79e5ff353fe156c4b685cceffa5afdb1d
[3/6] ASoC: SDCA: Still process most of the jack detect if control is missing
      commit: d7730c44b7dddbc5063505ce9e0c21d8bf298368
[4/6] ASoC: SDCA: Rearrange FDL file messages
      commit: cc2f22a61ad66fda7e50339f9ec33720694e0b20
[5/6] ASoC: SDCA: Add regmap defaults for specification defined values
      commit: 02d851b46b366b69dfe0842ab45313d8a4d6c960
[6/6] ASoC: SDCA: Limit values user can write to Selected Mode
      commit: 812ff1baa764080ba37bb0729e0c23c0e869b542

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

