Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09AB327C12;
	Mon, 15 Dec 2025 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807130; cv=none; b=JazW8uH17NsoCFXmc1uqoI0tKQNYpHYKY3PJ1GpUBgLkkac7KDkRSeHoKIfEv/6naHG3PAGzHIoGln1RZ0h11UC4j+ldhqSJKul7L3f/l4IqPi2TLAbPG7b90/L1DUxyl9mb9YOe2W9/iH2Q5qxbra59k/dzbZ4LxAAgGgKoPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807130; c=relaxed/simple;
	bh=m82WsvRRZfI3omoyvVudU1ntkd1y7W+CAVgLo4GxqLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X+eHZpiVWhlHiDwa94H3IYYzUoAMs3uEB635TNJsCP9ZmTJCsJwyz1TTlQM5/juNeX4st16NccKhwhbaYpJ0cL3BgLOxG8K5RHRuzpsxK3Il91f6itYirmTWmQiy9LP34+3Ng1LJdbYWJV8BrLHiFM9/vAl40PobcBUvy4tFTbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fr9tgQuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fr9tgQuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3224EC4CEF5;
	Mon, 15 Dec 2025 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807130;
	bh=m82WsvRRZfI3omoyvVudU1ntkd1y7W+CAVgLo4GxqLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fr9tgQucU7dN/hImWXrVU6vFjfZAVw0RQykau6Kb7hXxG/vU0cylNgNmhK9rMt9xa
	 RLx4xgwifdAGBpBQgGkc8FSFwJoDPH1MHbyd1fKiEhYwn1jz/xyVSPcj27qI6SBO+T
	 ffbvsKb0YvE5JnmfE/1QgV2Weu1sFthmtM52A38MNw9bzWVMEeZBq09yECVMWXAC17
	 LoSuvJ1wld7gYSIJkS2+gHPn1NqiLu3tC8R/6S/PAfi1IHR4DX949g2tWIa8EAf2gX
	 hV6vupUealSGh/+H5A+JO2DAql6/fjtKSI+SqlNY4M0pO79CYlpCUjwiVY25W6wxwa
	 6ffTo/3q6+zSQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251212044408.1286-2-hariconscious@gmail.com>
References: <20251212044408.1286-2-hariconscious@gmail.com>
Subject: Re: [PATCH RESEND] ASoC: mediatek: mt8195: optimize property
 formatting error handling by using scnprintf()
Message-Id: <176580712756.161056.16246291831827319109.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:47 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 12 Dec 2025 10:14:09 +0530, hariconscious@gmail.com wrote:
> Replace snprintf() with scnprintf() when constructing the property
> and remove negative return error handling as scnprintf() returns the
> actual number of bytes written to buffer.
> 
> snprintf() as defined by the C99 standard,returns the number of
> characters that *would have been* written if enough space were
> available.Use scnprintf() that returns the actual number of
> characters written.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
      commit: 180cdb96e821e30528b02708b927c93daa0ed40b

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

