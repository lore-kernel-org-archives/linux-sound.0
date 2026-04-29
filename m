Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6CD3859E2;
	Wed, 29 Apr 2026 04:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436408; cv=none; b=Huq181k3v0mcczvgQweB4bsHwvCVkTXs/qs+2k8to+wpUyt7KsXuZfWbBHXzKn9DLDzAqwRWY3H+sDDDpdu1AO0WMkQgjxPnN1KG92PWw8a71JqD+pHF7tc0g7TRUdcql186tOr5uAVB7RmFRWdMTAuq5I9tRFnMEvAFIt6mXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436408; c=relaxed/simple;
	bh=Y3TadPI+Uk+0lcra2ukxy7a1jSLDUZdGEsO0a8IaOuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e7znOLc5Q2QguHmAKUWmt0Z0nZTFZQ2e5kPfxHI2qDXe3pz4D/WzC/WO2Z/8Xj7cUpWzXA6OjPLSHvXzx92bCJP9kEHOjMNYvRJUjX/hrUfvA9GisMisJmPmh6uP3Lpu8ZpVaVGQgvXZSHE70PMGK2GFmiLBD7yOl7zF2SfFsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtLnoFDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtLnoFDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10462C2BCB4;
	Wed, 29 Apr 2026 04:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436408;
	bh=Y3TadPI+Uk+0lcra2ukxy7a1jSLDUZdGEsO0a8IaOuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KtLnoFDX/LmckW/QlstZ6bfDZxf1oto3yy2sVCHBbWDmtY9LuVjn+O7QtJcerlfZP
	 aVBxPB4fOZ/WzwQmcvhAkJjZgxhEC5cO3uDlLnvzCRIwcMAva7msvwDS6MflfjJ0FR
	 4AgqhJxlJ8qKZeHTxRH9k09GbMeDhqsh9OKxkbBHPUc+MQuhTYsLU/+NcUdnrngBK5
	 N5/qM9+E5Z0Z3wK0z6igY9Q9S/D1LqsKaw5+iE0dPovpGe48vtHhyt9Ko0nfyYSHPO
	 8MQl9RAUiBhHQEBaNOEMOcEQD4HJsSb3hZ8KwSq3SSUKUs1S+ZOLtL1z+mY4MxgqzG
	 r3k++/wyxliCw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
Subject: Re: (subset) [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring,
 and K3 SoC support
Message-Id: <177743049537.363516.3431185859758571339.b4-ty@b4>
Date: Wed, 29 Apr 2026 11:41:35 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y3TadPI+Uk+0lcra2ukxy7a1jSLDUZdGEsO0a8IaOuM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Yb0K+ucIi3HDtgy/2P9jyTHgZHvTNgpG3lfC
 rcwtX3nqkeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG9AAKCRAk1otyXVSH
 0HsGB/0SR87C+jiNlh2idBxBsVbfTMnM51S9G6GDqaJKpv/Q0igZROaqjIOgR+7rgwkxtu/APtK
 roW2rPY+7xkz8uYz9wQb+Y28UuChQFbDcPEcrgIzT6Y7uSxzg9kU0Z2N4MGmf5/uaHAPw81iyy/
 bYcX2K0Q6OTTGHeR+9xT3hqSupM8HaGMX0ZCHGi+D5h4dPoMWcRaiQ7297iT4x64WngNvviymse
 yi0pcZRFCp8/QCQ3ll3FugTOHRVdsLE83t0trkfDzgO2uidRU/D6qtbE5xawG8lmzZxbFB3MDoV
 fECtrWN6f3zAS/C+LisSWJobTUle1BCnFLz6FfkJY7GK8uWR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 09:38:45 +0800, Troy Mitchell wrote:
> ASoC: spacemit: bug fixes, refactoring, and K3 SoC support
> 
> This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
> controller driver (sound/soc/spacemit/).
> 
> Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
>   - Fix RX DMA params not being set when TX is already running
>   - Move hw constraints from hw_params to startup where they belong
>   - Adjust FIFO trigger threshold to half FIFO size for better DMA
>     efficiency
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[2/7] ASoC: spacemit: move hw constraints from hw_params to startup
      https://git.kernel.org/broonie/sound/c/6b4afbaaa342
[3/7] ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size
      https://git.kernel.org/broonie/sound/c/03dcb5b68a96

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

