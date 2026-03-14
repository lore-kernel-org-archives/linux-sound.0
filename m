Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0BB241139
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625113; cv=none; b=RSq+rtpsIZ6Ka7CcVvCAPB2JU3c0l3hc7zG33UdM5WZgEMGjJctPkO18cfsjcO0cWXbfaEdlYdq1gRp4rTjGWjL3fZ1XAZji4ILH9eaHoO22YrpUdhspqHcWwifGyyo406f3ttqJUge/wctTzzzA8wtt05RvwNrXXMPDBvao+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625113; c=relaxed/simple;
	bh=XCoDdGHzCRdM2Dca3rmxF/gDh1qClrUAfPQx5yGNl9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tFyiZw8v6IQ26j+1yB0nfJ7gYSD9I3Zvewgxt9lrb9Zj+rUEgHUIe00bx9fwRakPUqMcOBEShuSe7vMiiQQZo3B3tK3sic3eyVlFkas/8lxf94ysEBamjWHzJDOXMKV7YqavCAH7hOq1DAV0BvLdTpSXHm4VOIKVwSah/PFdIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkR+jeI3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkR+jeI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8CCC19425;
	Mon, 16 Mar 2026 01:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625113;
	bh=XCoDdGHzCRdM2Dca3rmxF/gDh1qClrUAfPQx5yGNl9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EkR+jeI3SCLrVpUL4b1KPMkEB61uFEZS243o2nc/uOar+Tnsxko5DzcXvHDihJRDL
	 vP6eCIpqNrvchKe2uVE+xKKbCEk+rLtXkiKksHUO9yaDA+QRZSPJBDYHV7Qxkew5eh
	 cM2KOoAJNOlSVUGvuEDrAYucYsepD1bGalukftwjdWK3hYzZe6klG/iHWDI6oBrGMe
	 dsGATxNom6/QsJ6klR4q1Bh1tR6CcqopO4AHpFXicbLZ6qtcbtTRYgAUA4TJGK1cDc
	 I3IJnFlVUb2M606ds5FtcZdRbli09hYj0XuTMW9S635FjDNwv84fiTP8Rzo/7RutKG
	 hXsL93z2Zioyg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260309091605.896307-1-cezary.rojewski@intel.com>
References: <20260309091605.896307-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: catpt: Overhaul volume and mute
 control operations
Message-Id: <177352553538.149922.6808347415489289670.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:58:55 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XCoDdGHzCRdM2Dca3rmxF/gDh1qClrUAfPQx5yGNl9M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt18Xz8o6d555LLuytw54GICnFsmDoJKyASxYe
 03gPcmY90iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfFwAKCRAk1otyXVSH
 0BMoB/95nClDvuaXiNaV2Dpkk+ZbfFGeuLEMzR6CgU9lMnOfqV/Cq5MlbWfwKBK08Elrn2BeiT0
 P7mxaaiqTdcS0OZGhmJTaJFZem4ynEUop8TmWZTvFHdcnFDpDr0+Xoafmbnc8fcPe4RaX8dQtQA
 GxCAZCc88z/4UHF7ygHBMBnfXxaLHB9Urq+rGxHFZYtH7iI5l98lAku+NcfeQXEtDA6RUAou+wN
 uhHOkT0qLRUo+JogJ1oHaFrXsEXNFE94FpXE5ENa30mOuJdi8oqzzin4LeNRtFKaRP0VTR/ZhMa
 MBrFrWtgetPgz0uywZu8mmtTxfrEVyHdEMXBXLND+3CEh7XU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Mar 2026 10:16:00 +0100, Cezary Rojewski wrote:
> ASoC: Intel: catpt: Overhaul volume and mute control operations
> 
> Short summary first, longer description later:
> 
> - fix the return code for kctl->put() - currently the driver returns
>   '0' even if changes were done
> - lower power consumption for kctl operations by waking the DSP only
>   when some streaming is done.  No streaming? Cache the values and
>   inform the AudioDSP firmware later.
> - drop the existing code duplication between individual and master
>   volume controls
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/5] ASoC: Intel: catpt: Synchronize stream access
      https://git.kernel.org/broonie/misc/c/b0b49c77bdda
[2/5] ASoC: Intel: catpt: New volume and mute control operations
      https://git.kernel.org/broonie/misc/c/d16b942aa7fa
[3/5] ASoC: Intel: catpt: Simplify procedure of applying user settings
      https://git.kernel.org/broonie/misc/c/2464febd81e4
[4/5] ASoC: Intel: catpt: Do not wake DSP just for volume setup
      https://git.kernel.org/broonie/misc/c/150badf73e9a
[5/5] ASoC: Intel: catpt: Migrate to the new control operations
      https://git.kernel.org/broonie/misc/c/8a99ccb032d6

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

