Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793CB3D1A83
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445388; cv=none; b=b9dp4V3CmDP47ewYfHXGVLtuROXvyy/R1MAhrZmhUaALLX8IEMoNwRgTsRBLm2rnjrk6OAXDtSeyBGPBaLeibKihmpPSKgcF4Db2Ok/JAP231YCS6XE8oyUdVpHqKZ48IGvw3GAJmS5e7kH4X09P0DBCVcTe8hDZvBk6StodOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445388; c=relaxed/simple;
	bh=3wOffVvPbKoVAyFTEmVoLMX/AKU+w7SGUeGYNKvlsqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hpd/J73h9RnafQFwrXaEeXa8gFSIyqFblWq72Xsd5rhtdNzsXngQwvG2Sdpu3STU4n2CqylW9kBzn5khA9vGWnhZwl+1fSaZVfVOz6K81l1PVTY+KraznmT09fMFjxS1fIOtAmlOw0A1ZicmN5/SUduM36hZmXNoWJ+wPCCDSGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1Bah2fM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1Bah2fM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403F41F00A3F;
	Fri, 22 May 2026 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445383;
	bh=uOX4phB+2bLSp6oZd3SGeRoiqZ074MWJ4BH0qF38gsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D1Bah2fMgT9EZLYBXN9TgV92irpxeT4mOWP15I3gWMJIPXBtojEtMe6pFkhZAVnKK
	 UvD1iwSKkqwamrHHVh90NAoyeKox9swt5at9ErXg7A9uv5mfmAov9e20ND2q9E3u7i
	 Itlr20qN+weJcRnozTNyvoIPx/f0+kZkfHetDuxXgO8aIrgBp5olAUXiErKhNfbO27
	 1Lt0+d9il7z/yL6UwRJs5S6qrDS96FSp9f4L0YVws/Ew/lbcqegZqIZfy2CGw9IP3X
	 e8W8UTq7/AscFQzw/GV5WNjWKNLno8K5QDVLBvax5pPrnUCJNQCdRMRwkvtQ/udBsK
	 v0uJCPDL+RZaQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20260520141349.9625-1-peter.ujfalusi@linux.intel.com>
References: <20260520141349.9625-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Use local copy of IPC message
 for sending
Message-Id: <177936180229.58022.12172701954327750077.b4-ty@b4>
Date: Thu, 21 May 2026 12:10:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3wOffVvPbKoVAyFTEmVoLMX/AKU+w7SGUeGYNKvlsqU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6FCk/EkV8rBsOGIO+1jCHqZkeHik5BIoAiw
 8c75hQ9b3KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuhQAKCRAk1otyXVSH
 0A/PB/0a3Cmk6jVRhWAWeti+hot6wwF0P79Q0uyGX4a1PRhHuNhaAjnXzueoFPVywYoGTIyeQ1i
 qldsE1Bhc614kyEMCqYLEtLjwFCQB7brYAWhpsWKt75eHxet/F2gvLjzGJpPyq/EIrFxSBjzVuk
 Vqq7RmIaXB6Q1NW1y65yIHwQsHp+on8sXWQ340W79P1LD0TUBFIXC36pCd7LoGrwRNwuLb4ywUx
 eDZJp+DW3BOm2MUVt7oXCcogPBO0mXHtswoz8OziREtj4TB9Z60ri03h/bya3cQYSqBjLJSsy4P
 swgTokkKJK6SybN+JUbPWlNUvzA73/sjD7037FSGLB74RFCC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 17:13:49 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4-control: Use local copy of IPC message for sending

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SOF: ipc4-control: Use local copy of IPC message for sending
      https://git.kernel.org/broonie/sound/c/aff152a02481

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

