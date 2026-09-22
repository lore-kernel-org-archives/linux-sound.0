Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6497541453
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080515; cv=none; b=RBk+ZxEicTQPNcewizWFtCIBM+cw+xdxQb9Zq44kHtJqYwNYnMelKtfgmVY5+9Tf1xPyZPK+aiwRiM5vAvB7WhOOsSHbMovPbI5RFcyj71g4gi/3X7tKZob91xY7Z/s4Anyi1NdQ4sraTT+NTvM7rCz1elJJdk/STVg2YdJiQLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080515; c=relaxed/simple;
	bh=nEH+lIzXfchBqFvZ01FvHRuzLRNXHE2TnezFpLnEfww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MnkpC1GRMxApWi5Xodg4n4pDOCqHkF/CPBpu3Y6XkZl4uKDMpkMZ/+Qt3+ht0RSp7Z04WclKP5KJwq86zkydhsQGCHPgydXHoSubTGqZCL4uWz5qLxzYifOzdPLDznzOye8zYfLPTSEJO87jkUqz8u+1pCyHFsP2JjaBf1EVdGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTqlXKnP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTqlXKnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF481F000FF;
	Tue, 22 Sep 2026 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080513;
	bh=RoHm1u50jrGFwY4HdVApWcvmIcqj6idxogrAZv/2N58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FTqlXKnPPVqfOEIDq+pdSQmfUwDdJJ1DXyc2vbuxayZ8Kme91FtDRcrFk65I46zl5
	 AAPIU6C/LJnpvlSXLRyM7ZjCZZDlGgp0QnSAhTg/ohNDdyqNIuFic/rANzL1D9uxN3
	 tu+WRVfJGQVfXregweJkXCTCIjt7BVVy0O+aBDLuDEZth0T1LJwBkJ6T29QiEFYHWB
	 flHrPPOaisBgy5blHkVOHtsTbxV4l6uHZgPNjwsXz6Iak37LAGoFjnhQUFXelco6rK
	 pLuuH0Ag4yZDTB86SDRdwzYoPVjiqxZjN1eI/4HYCo5Q8ySSajMHY0bVr80eY6u89e
	 fwG/F3R1C6WnQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260918111745.3589393-1-cezary.rojewski@intel.com>
References: <20260918111745.3589393-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: rt286: Revert delay value for jack
 setup
Message-Id: <179007280227.322763.10999770855697185790.b4-ty@b4>
Date: Tue, 22 Sep 2026 12:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nEH+lIzXfchBqFvZ01FvHRuzLRNXHE2TnezFpLnEfww=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqxNpX8+ak1YutbLJN78ld6zFp23x0qKlj/h09jz4H5T9
 75FPzJKOxmNWRgYuRhkxRRZ1j7LWJUeLrF1/qP5r2AGsTKBTGHg4hSAicQ/5GBommK2R+L8MidD
 lrWGi6VaZHfyF+7wabbjriu4FjilvjVMK1qi5+XMovnaieHVy56WpS22M7oUmiFVNV1ytcZTVvc
 EqcwQhpur/03pNuy5fNU4/V5/ZGK0eA37oQW73S0m3+j/k+d7z3n79RcHj0jsORLhfyjggu/Gk9
 cjCowOO+11560KbH/8x2RPqckqzy2Wnab7ciPWf6nhncshw2XnLXBMrumI8SmdyO/MjwTtgw2Ov
 BLnPKShEn1JgevudAMBOb5b94+6FBrkyJ+f6bqarZrVRNlmxWe+na+OdLGmGChmxrK3ZN2fHyop
 bl6RKjJXyMO/37l3/4aF4jkaE48xNu1VesasljqXY+dqAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 18 Sep 2026 13:17:44 +0200, Cezary Rojewski wrote:
> ASoC: codecs: rt286: Revert delay value for jack setup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: codecs: rt286: Revert delay value for jack setup
      https://git.kernel.org/broonie/sound/c/d30fba93ebfc
[2/2] ASoC: codecs: rt274: Fix format setting for 44100 rate
      https://git.kernel.org/broonie/sound/c/6eda8938a790

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

