Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F783469FC
	for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509624; cv=none; b=YJvijToWAz8cskiqBe7tEHnzBuV/jOBM2Kx8IRDWJ4k4j0mLw6rLU9XTJA/4BB8mXRat8rrY3vs88/J/scw/Zzqp+J6jMg2ZiMz7QE8w/GzHMnMMrS/JBnM7xgY8mn716VZ/AbRLzDsLL7iHILbZVMV6YJmgvSsjX8suOCiomiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509624; c=relaxed/simple;
	bh=nFt0TCsK/mvrwd0bks0fDuBdqsqXOIKOaXhYIdU6iAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AXzENWMLfQiYcxwvbseW+S+aVBjYJBJBRqiKfXa6bYI4Lnl7lO4vlIgHI6wCEJ5CXH1oL0CkliEK0ec+/JvgdvcKvbt28V6Gw7cZ04IZ0y194DxctFjCniSToMRbG94Cba+Tsszaf9tU7P95goF3ejgbs/addPc2gDqA73uXl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzMyXgs5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzMyXgs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3231AC113D0;
	Tue, 23 Dec 2025 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766509623;
	bh=nFt0TCsK/mvrwd0bks0fDuBdqsqXOIKOaXhYIdU6iAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SzMyXgs54rd+cfO7fDEaVQj7/zNboklqZrseyoWdJmfpSvzeVQIh7LE3a+ACIWe8u
	 +7Z19VevoFbdk/x3WJ+8Nd/E/XiwGx0YlgiK631SQqcsmBMTEZpmi7mT+4pvIJOhcf
	 fR4rhzeRNftSoTVZB8e/uABtnfhrB8EsBvYGexfrHxZBz67GSPeoCKV1KJqPBNIPdR
	 ThaiwiwWlFBsbrICggqdgxiJ3V5q5tVBvGWUXDVhC/0XLzP2bkqYdlIcAyqCuJskOR
	 7yQD3TTUXn5Q8HASju8MzvWQ2h71caNKPj2wjK0E8W7Xurfi1PLIQ8g70KosshrVyI
	 X4vxNvPNUeltQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, seppo.ingalsuo@linux.intel.com
In-Reply-To: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
References: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: ipoc4: Support for generic bytes
 controls
Message-Id: <176650962196.445350.13684132786841714827.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 17:07:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 13:20:40 +0200, Peter Ujfalusi wrote:
> We support bytes control type for set and get, but these are module specific
> controls and there is no way to handle notifications from them in a generic way.
> Each control have module specific param_id and this param_id is only valid in
> the module's scope, other modules might use the same id for different functions
> for example.
> 
> This series will add a new generic control type, similar to the existing ones
> for ENUM and SWITCH, which can be used to create bytes controls which can send
> notifications from firmware on change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: ipc4-control: If there is no data do not send bytes update
      commit: 2fa74713744dc5e908fff851c20f5f89fd665fb7
[2/8] ASoC: SOF: ipc4-topology: Correct the allocation size for bytes controls
      commit: a653820700b81c9e6f05ac23b7969ecec1a18e85
[3/8] ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data
      commit: c1876fc33c5976837e4c73719c7582617efc6919
[4/8] ASoC: SOF: ipc4-control: Keep the payload size up to date
      commit: ebcfdbe4add923dfb690e6fb9d158da87ae0b6bf
[5/8] ASoC: SOF: ipc4-topology: Set initial param_id for bytes control type
      commit: 2fdde18a2cb1631c01e4ab87d949564c7d134dd8
[6/8] ASoC: SOF: ipc4: Support for sending payload along with LARGE_CONFIG_GET
      commit: d96cb0b86d6e8bbbbfa425771606f6c1aebc318e
[7/8] ASoC: SOF: ipc4: Add definition for generic bytes control
      commit: 7fd8c216c422c5d42addc3e46d5d26630ff646d1
[8/8] ASoC: SOF: ipc4-control: Add support for generic bytes control
      commit: 2a28b5240f2b328495c6565d277f438dbc583d61

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

