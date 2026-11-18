Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010847;
	b=O9UKfVeIs+d4jfO2WjhZwze49+qbUWAmJ8hWY6kF7Swbsc5SO1Df75Qb92fNSMIt3NgS
	 F435Fs9waIKlnx4+frpUYSTIAlrb87m9vNJDF5nE4W2fPMrCKKYzi9UOACdKsw98Y/Rs5
	 hRdeWp//zKTt9XXJiHnjU9n/XzgHYDBF8sN/qy61NZ4EdxzEog5WK73OH+fMcFH5dGznQ
	 NkAl9gzrGG1al4QipDdbYLVueahbdWPlS5XeS/SfBpuPqxPUIkZbQGST0e2rvo09cnnYq
	 6LLPhT/xBCYAEDcVKQxx2f0fKoXFp6vtxSpWkyDT2YwM9By03Gb3Zo3r4R9hAALZGEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010847;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UGHrxT+hP9jIn28HjHtz0gbo1j8kTyfn+d+CbhJ66fw=;
	b=t5KvbDbmEjBl3YG+pBg+Hx93jhiY3oj2fTzHCqWUnSOYuJfyLsPZUm1fX1UuzME8IckQ
	 YyJxlwKn9hUklK++Ab0/IOmR1Zb4NgtUA520vEMcl2aFrJWDbFzVgr84GIcrkyF891jTj
	 DTS87ZHajSnZxLydzL/2ePI1k8eIS1gTAKIis+Z0eaEgVIzhsIT3hYWXVyP6U6clZDIaw
	 Zlv8MmaNu3Fy6/xx/ZGJ3CMpcu+udt5yU06ni/aVoes0+fUY0GTHnr5S65SN0SchMbqyl
	 epznCd0K4acJxHPj5Y6AIqb/wREiqf5Yei0qL5f47WwW1TuJ9P3hEqsbOk8330PU/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOcMvlVy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C8606A31C;
	Wed, 18 Nov 2026 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOcMvlVy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672FF1F000C5;
	Wed, 18 Nov 2026 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795010847;
	bh=UGHrxT+hP9jIn28HjHtz0gbo1j8kTyfn+d+CbhJ66fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XOcMvlVynyOk6DMn031HgoBwWA/5rO+fK2IdWKTfEnRjhbyn55Sa0N38ohZbIfG2c
	 uMX0QVq7XtW7A120YgvBGGK9hxlEYHJFgGa5rFz/lSrrPl0fGGLYrNpUZgVGEMNMzB
	 U3+BAglvaC4CxQMeqevQfJaEYwmlujFv1GDigj4P4XPram2kU0V/8gY6o6bCBbPCoK
	 3onSEff7xyvkURf2lCfsguswU82dgDrCS+wEUdu27VaqGaUb26XzzINMypXZL+xv2J
	 Jhu+zHCsYCGd+qTrtn8f4vzAt4XlacLh7bYNXCXq0RyObgLVY/aMz0kYWbfYu9Mfcn
	 /Cv/Xvnzy7AIA==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <31EF1D727C977B5E+20261118082325.3915977-1-tuhaowen@uniontech.com>
References: <31EF1D727C977B5E+20261118082325.3915977-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: cs42xx8: Restore cache-only mode on resume
 failure
Message-Id: <179500723460.124542.16243013578958627645.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:07:14 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zpmJTdGXDZXnDkpjAsVPS76KmdOeGibjcYfxZr3NjY8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+bpTmKxVn1nzyyXAB47rkZK1oDsUTtndZApn3BJncl
 d7Guy+7o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABP5+ZWRofVSSf7qpcyv/BrC
 S/Y8iFbvb/7/8YZ1eeRVizXbntzcsJDhf1xFiYLnc7/STS9T9red/NV8V+N55o/vZvYnmoVtSpW
 W8QAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 16:23:24 +0800, Haowen Tu wrote:
> ASoC: cs42xx8: Restore cache-only mode on resume failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: cs42xx8: Restore cache-only mode on resume failure
      https://git.kernel.org/broonie/sound/c/1e7c013d46b9

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

