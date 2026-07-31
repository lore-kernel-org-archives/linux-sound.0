Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D6396B68
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 01:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546046; cv=none; b=GBrGMInlocmdPf8iq3Drib1XRZm1DeLeR1e7Dw4XRJ0R2ks4VhXZjJaBkBU6bBe3MH6y3j1Sy4SlEOYr01l9/V5kRYEjpHewTd8QC+87bzGdn8gDyMaspTykkfiQMFMe6oaOycHY9d4BxSpI7F2PdkBxn3M6/BIl/Px6SFH4CzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546046; c=relaxed/simple;
	bh=pUcATNgVXEZbbypcmsTSDDKr4SyKbGqI0penWxo9uEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WBUxsLqIKaakmSEvsWyqJ0kYdObakC21H9OV4gwPwxF91rTTbDQwo2MdpjDkfThXbuCq1zj4babiZVksc99eovOxEMHsuYciO2PpPHjqs5gvQRPwoQT2Mj6DJe3aYAjkp+j+viZBAgjmTdrA12MIAATRNpWZ6QjxxNu8R3R+pXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAQT0GJt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAQT0GJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38611F00AC4;
	Sat,  1 Aug 2026 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785546044;
	bh=cju2b9O1JDMeXoQZZsb9Iu3nQJGwaiwVrasKmkr4cSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JAQT0GJtzireiokgw2RpPtIW6VkgPCVOrzJv1fvAJ/gIdRI4mexrGM27/3+Jz+8BR
	 aaj+E0QNhqoq+dhRa3biM9mLkz5M5XjXkBWjsKw6GuBrDxy9v+ZNgwdBl+XSkXRZdc
	 uAi3qqU53cX/Sw12mV8eA80zTq59Ytcw12NWzohacIh5EnR+2Nrsxo++K8PVc8A0Ul
	 LdIR2NdRQuT5w4F+3EEmGQziNMyULw+nKPSg4mLIIvCB2wA4uK9TFYfg7B+upuODpM
	 a0T5iCmy/81WA2vDHdW6C9LggR6cw3XvayAUJOCRXykXYX7V7FzKwJWrIy+g+FReaE
	 Ekp20Zy/RzNVw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, yung-chuan.liao@linux.intel.com, 
 seppo.ingalsuo@linux.intel.com
In-Reply-To: <20260730125600.6491-1-peter.ujfalusi@linux.intel.com>
References: <20260730125600.6491-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: dapm: Add encoder and decoder widget types to
 kcontrol handling
Message-Id: <178553107243.353541.15343628410657661250.b4-ty@b4>
Date: Fri, 31 Jul 2026 21:51:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pUcATNgVXEZbbypcmsTSDDKr4SyKbGqI0penWxo9uEg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbUU6XYP2JQ3KuIhe5RrAZ5LaR5vooT1BmWo2q
 FniQwYpEN+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam1FOgAKCRAk1otyXVSH
 0KxkB/wPKvsgfoILCJyNOwfYkkrAZ50kRBvYivr0PAMdfLebpsrBn/Sjsmx0ZkxvHBv79B5Qee4
 DLXYAMnOn0V4qDNmPAel6/OEPc4GP56t8HodsaYjsrbLahW58jE1pGjCZB/KOlfQ9ESvQLI7T+A
 TlwsDrEM894GtFG1v1PTdfWt71VoQsZmTk3hueCP7CSCbFEFbO2fUaiQ0LhmaYPi8WrHZ3Qx/PB
 jhkNXvQAQVyPNDU4L0hEBYBx6pcwnZzdgf9D6qCPxu2ulwq8FovAXAaEZklwAPp+xp+yX6hdCL5
 xvvzN+5XtKwdJqq68hD5R4qp0tb0esCpiW0c6bxH8NE9zhra
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 15:56:00 +0300, Peter Ujfalusi wrote:
> ASoC: dapm: Add encoder and decoder widget types to kcontrol handling

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dapm: Add encoder and decoder widget types to kcontrol handling
      https://git.kernel.org/broonie/sound/c/cde333091692

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

