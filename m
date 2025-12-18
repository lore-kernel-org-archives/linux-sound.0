Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0D02BCF7F
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046077; cv=none; b=N6QN5hUtckjJCA2aKanMF1mKOoLjpD9iFR3q++iuaBbuVoK12VabRcCMyeDHoGaahNW9XdxtBmTC3jcdButV958v89823+D+OevwAnbVHGKPEsHtyUUEdkg4plAkS8izfZL/wnLxrUeRoBQpXIV8dAsgQ5e5AzJ7ef4pkPPVPHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046077; c=relaxed/simple;
	bh=qxr2Hmp0FowCnCyCf5Q/AYoQecHWE/x4M981Vod7CSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aus24YErBW6qGEOpRxxMpEKpr/sYoixjJB79jiIcmIml33LWcAZRPaxryaPXJxTJPY8QRzHcPsGBCvH2qu3dNI8hq/wpVgbzybwqrSGfJi64tkD1KALDlRxoD0wWe0rRYYE3zelJAK1m3RekILy7LWdENIFdsd2zd1fK4TN7T2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7XZVO8F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7XZVO8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9B4C116D0;
	Thu, 18 Dec 2025 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046075;
	bh=qxr2Hmp0FowCnCyCf5Q/AYoQecHWE/x4M981Vod7CSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I7XZVO8FSdskSdVjHCakht9XcS51Qw4qRzaYpBjZU2JeQP20WzwtBSB+kve+s1YWc
	 6mks+HCMAVV5GPj5ekVpMSzmQC3fptTYOgb0MO6ENILAvejFy/qioxTrC+P67nikMv
	 deVDla4DKFco5hdhavSQnfE83hu9/I+TQAgZZY3BPdtlagCupQRuIzdtBGBWrxLsRw
	 X1ZuOs+z0k4a4xe6bVRRih5hHC1MW31NBR3fWfBTAgT30VOf0qqTPAtgl/wjAUbszX
	 KbHdXG8KsjfVgMXAENSZRVD40NNizv8C2bkrvcFWNi/t7DMP1T/V40PbcWpkzqvBbo
	 nMpbx38fpn9Rg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20251216090616.3955293-1-shumingf@realtek.com>
References: <20251216090616.3955293-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/3] ASoC: rt1320: support calibration and
 temperature/r0 loading
Message-Id: <176604607350.48417.11362419533319463637.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 17:06:16 +0800, shumingf@realtek.com wrote:
> This patch adds the functions/controls to support the calibration.
> The mixer controls could trigger a calibration and load temperature/r0 value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: rt1320: support calibration and temperature/r0 loading
      commit: da1682d5e8b53a51072552844c551b1b784e52c2

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

