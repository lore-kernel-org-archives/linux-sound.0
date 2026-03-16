Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1D188735
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625155; cv=none; b=FBWvrqeH65xRyGfQu93xGwT/olRkOCE0tM6tvOuYaRi+E3e6a7v0FoIYykx6kUiIYpd91ewGSOAvKM0yd2VBPTqlF9JNvxSy/K/0yp6FnqIB1wUYpqt83iw/ic6NWQR56Z0fZ1aYRvPnWqNDLo7hGYAzBy6ULAjrp8ca3vdjrxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625155; c=relaxed/simple;
	bh=YkUzuMQ1An4eMIrDcnZpIA1MjoRSeqklZzcvFcu13rM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iX8SPkuMKh6HzQwHqw+OS97y2paay64hI3F4rjQPiD1/ssvBi+cx6vz+LXZE3eYyoy18rCfNP6ABC3rfqa3eHqhaT6wsiUv1NBCWhiXC6vI0NxXwkFDIDVwQKIV6S7UHPCIWL1eeMXBXi9Xgh0gRTEdzxCiI5aeqXJ4KkChAliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0Tqh1Xd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0Tqh1Xd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1A6C4CEF7;
	Mon, 16 Mar 2026 01:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625155;
	bh=YkUzuMQ1An4eMIrDcnZpIA1MjoRSeqklZzcvFcu13rM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U0Tqh1Xd14rnz74MI+nVCF+U8CNEPSv7y39joW9zlwqhFZUrAAGgkP2vpghMfw/KY
	 WCDkNrChl+Uakxd5dT+0BnDEKec2PN5E+F7otVHc61vheb91RRyWesOmOA0auVb4rN
	 x7z+pT6fvs3S+sCaeRaYu/MXGqydg2sCD/uIVPazwQhmO7fTvu63JKSs+UGYDFDRMq
	 7bWHdrPBMnd0F2cBbw2NHxQxa2w21uS+HyPapfInKLW8ycNxFtg0MjnaJsAvL9gWDA
	 LrT0+pvKH1rvCAJVLDhVhEabgU8EyP4uNLplxrEej7Zto1C4K49R3zBnYTuyMrastH
	 8fv9OVGEFUKtQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
References: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] Add SDCA support for the cs42l49
Message-Id: <177362335561.208027.11791872683904732325.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 01:09:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YkUzuMQ1An4eMIrDcnZpIA1MjoRSeqklZzcvFcu13rM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt19BKzWSjcQ3oV+kfWWdzgIE1A71h8Y/WbVz0
 ZjBn4xuNgCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfQQAKCRAk1otyXVSH
 0IZPB/9OytuyJL/bMRN8rgOp4fPaUZedFfvModY+LDYt2ejJoZEAo3KvoqlkaT9NLgLlhfY03nR
 pa3rr0BVBAZzGe4l73ylrnz1H8tMdnoz6lqXsapYtEYmocjNZPVGRTVUJLrotuPKXIoDJnkhJA/
 F8sur3q0QO7/4v/a28vmMjl2IvZaAwNX5BEzlAVwbZJ3PKiLItuXPioFLv7vyd+cV24xyucER9D
 rLlvW/JXd0Rplk4VCIDM+niRnquHygqmfFWBDswBukLFIl+wg7RQkPpgV94gi4vsYtu4impiupP
 RXlQJozMCxV7bDMnr/JBgM5yfW1wAWXooOHQnemgy1Nqppon
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Mar 2026 16:08:56 +0000, Charles Keepax wrote:
> Add SDCA support for the cs42l49
> 
> Add support to the class driver (just adding the driver match) and to
> the Intel machine driver for cs42l49. This part is very similar to
> cs42l45 so for now it will just be supported using the same UCM, hence
> reuses the name prefix in the machine driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: SDCA: Add support for the Cirrus Logic cs42l49
      https://git.kernel.org/broonie/sound/c/7699b12a32b9
[2/2] ASoC: sdw_utils: Add codec_info for cs42l49
      https://git.kernel.org/broonie/sound/c/5e2f19ce90d5

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

