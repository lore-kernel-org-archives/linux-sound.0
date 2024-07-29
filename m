Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2215F32E;
	Mon, 29 Jul 2024 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273442; cv=none; b=bUAYshlSIrNvk6uudx2oBTl5SubdojgXvuowxhizPx11R+UqyE7W5T+WZDXZYlNU6EGyHlmwj0Fz4OEThg8yVxPe2ZBPKFnqKVkhaXxNEeZREDK2Kd57aixtzWLou/kMQKTZ4ing17P/GZW7WVN76Ugg7Mt0ZGljlF12p2GZSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273442; c=relaxed/simple;
	bh=PEY4N1SeOldJfpmYebIWBl67BwD9EmlTasjdOhxv4W8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rov0ZZLXV4f9Pjhz2wM7Jvaxau944GFnzesIh1GNoUFzfOgM2YlIk06rrORj0rYSytIDp6HaOOJ/pB3ypSD0fXgQurSNX/Imm3qyb4QQph5sDfaAt3TskJ4tpI9uO7fE/djYnzb3ki7QcqywAmh8D7tHMTC+H++bj8kHcRuT8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E93kPSWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E93kPSWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE20EC4AF09;
	Mon, 29 Jul 2024 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273442;
	bh=PEY4N1SeOldJfpmYebIWBl67BwD9EmlTasjdOhxv4W8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E93kPSWixEDFqZLHZ8Xl2LZjTukyIwS7TrnNXwsJ6o4KG7chXU5Q1yZywA2xFzqX9
	 XtTEU2SA4kKPDeel0t9hX88+m3TOesea2fWk7glZKU3cAOswKTrB/te98vDv8H3T1b
	 qjX/son+O3HfadXwNS2TLpehXU/A9idvJAGs41D35MpkZbaYDMUg8eeAa6bjCD87do
	 fKJWjEL8TGHV/Q25697Dkl/Fr5jxQRxqlgfpXzxOxHCQBHLquYxA0EKaQvoGz7t1AV
	 xTp34zxmrGd0awXvLCfqRvhkBg/B4gfywT19g7AoOXOYL/erDQYhFvi+CLthLdtOEQ
	 D2u1tLBBjuybg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 amergnat@baylibre.com, kuninori.morimoto.gx@renesas.com, 
 jernej.skrabec@gmail.com, nfraprado@collabora.com, robh@kernel.org, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240709085131.1436128-1-nichen@iscas.ac.cn>
References: <20240709085131.1436128-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: remove redundant null pointer
 check before of_node_put
Message-Id: <172227343957.109775.6108322650659499357.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 09 Jul 2024 16:51:31 +0800, Chen Ni wrote:
> of_node_put() has taken the null pointer check into account. So it is safe
> to remove the duplicated check before of_node_put().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: remove redundant null pointer check before of_node_put
      commit: 42eb47310f89eca3226e8e427bc9d571149dc866

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

