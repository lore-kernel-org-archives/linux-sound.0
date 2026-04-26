Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF230595B;
	Mon, 27 Apr 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285232; cv=none; b=jl7dy/6vgrAYSxFdVl2UXArqprtusqoXv9UmQuNdr8xyCOHkmv5nX2HD8KhCRDUfrs/ZTu+aDE8yYDbnaSSk65seT/LQJFDQdbaFDzdJdEYBLDzKBSpAUp9X6+XS3DLpbQRqIAz0T68v0WjKVEbMnaXuyTS101iF0U4uIHyZkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285232; c=relaxed/simple;
	bh=iWvCMYHf2ONE7Ft0KDBTErQLv7Gxw4rLpl3UK+tWZt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H9QaPrDGnYbJ4P4zEHeubPYmMEtnq00tILQV+WqHQut67LwE8JawlW9IpCcq2TkYnPp0pd/9zsDgUAl7IPxYZsgHS8Cqo9Kj14oN3ZSFSiaQEPEKx5W1QkzOCEi0sJ0t46W/X7gViGrgOq3tflZOOJO+TIjG5rV5Q5Wrd8gj/00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDtnjjRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDtnjjRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8558C2BCB4;
	Mon, 27 Apr 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285232;
	bh=iWvCMYHf2ONE7Ft0KDBTErQLv7Gxw4rLpl3UK+tWZt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gDtnjjROoUHzXsn8Uq4GVZ0YZK0J4jO6wpVsVB0GWr/LnVYspJA/eLW6TfzcbgfEv
	 LQhQ0mWUyfyhabAghaaplQGJFIRO69ccZgDxlszTChjefBim5qGHhL5CfGn0LF/6yZ
	 oZGcn17GIq4jmmhcpkM/eUWUnslQgDu4Tldl2yVLVSOzmlHwvVmV5g1TXTLpPUjxly
	 kkwVfyQASDeVw6glkFz/QCs+bDzB2WD+YxvN2JOKv1+y0mZsHEgS9s9itHG7S2wDN4
	 DrsD3gNndrETusyVrLb9EHjRzjiBEFJEz+1vwE7TrdCLDVtyRtrF/LkYWQmQ+T29rj
	 kpnWlGYCOrsKg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sen Wang <sen@ti.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260416232640.3084132-1-sen@ti.com>
References: <20260416232640.3084132-1-sen@ti.com>
Subject: Re: [PATCH v6 0/4] ASoC: Add TAS67524 quad-channel Class-D
 amplifier driver
Message-Id: <177724658349.266775.3229695329706944762.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:36:23 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iWvCMYHf2ONE7Ft0KDBTErQLv7Gxw4rLpl3UK+tWZt8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7zhstYsHkCuUrB2nTH8CdRA48GSrVuo2aO5sk
 p5tefMP08yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84bAAKCRAk1otyXVSH
 0HVuB/9dG/PcWFJm50xhFScyz+LfmEdG3xiAlSeMkJ9PCtmsZxXdyvdrlwdMePCm0mT9LsTaGMC
 0n/QHkMZy+oW/TzrUaB5wLKkm2lMQcQi0tLWxUMB8DAnkKc78C1FLVJhG++vtGahbFE/tCRQxDV
 cQZMD75RdB1YpxyBba4KsIMq/6qg7Wp71RMDonLQujO+eUE/ps9zSskr7PoNGJs6L1W/jG/Y2CF
 mOKe8HvWvwH5yIvhjcXEOskLZbyDrxixEIbLAhVdQYok4XYh8ozbDqsZkLFLI7BwJKYx+J4/RG8
 h9dCo8WULXMBn2zhy5tCSbHt8N9jRSVWtN+/7R+401aWdjOr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 16 Apr 2026 18:26:31 -0500, Sen Wang wrote:
> ASoC: Add TAS67524 quad-channel Class-D amplifier driver
> 
> This series adds support for the TI TAS675x (TAS6754, TAS67524)
> quad-channel automotive Class-D amplifiers. The devices have an
> integrated DSP and load diagnostics, and are controlled over I2C.
> 
> Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
> ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
> entry.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: dt-bindings: Add ti,tas67524
      https://git.kernel.org/broonie/sound/c/5067f61ccaa1
[2/4] ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver
      https://git.kernel.org/broonie/sound/c/133c81f84471
[3/4] Documentation: sound: Add TAS675x codec mixer controls documentation
      https://git.kernel.org/broonie/sound/c/ba46edca354e
[4/4] MAINTAINERS: add entry for TAS67524 audio amplifier
      https://git.kernel.org/broonie/sound/c/3507e568d634

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

