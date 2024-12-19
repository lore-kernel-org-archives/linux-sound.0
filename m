Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A983D3B8;
	Thu, 19 Dec 2024 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734625148; cv=none; b=jLCWDJXE1AghQl0HGVhTusteVrlpXLwK7E+09R9dOj8WxDKstEhVUmcTAGR1Gt8C3jbE5MI/olS5vFmTw8/fOAy8Im0c5Sz8QZsZGnG/5oK83GrAvrkxaOQuNDoWAt1CnJF2X9Hds8lb7oNgb3B5dJCqZ+6+d7Yj64Wh5wKYak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734625148; c=relaxed/simple;
	bh=kJNcHPMbjFb6Aho2NUJcW41JRPmk0uJDYJqJ/w8xypI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i0ElXAKIAI1q78L+ods6F8gT9IEDswMbeOrMq5xhAEMr0nzXCYmx4iM4YOJYdBVaKIND1ikJE5wYgWAnZD6uwB93Wje/Ea4+QGpBtWgCrN6LAKiDlJ9d5z8HTSQaXlvdfV+DzFc01r25hx0qWglIoFRSNjYuMsu7Yr34uvquDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMZ/uyNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMZ/uyNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2BCC4CECE;
	Thu, 19 Dec 2024 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734625148;
	bh=kJNcHPMbjFb6Aho2NUJcW41JRPmk0uJDYJqJ/w8xypI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HMZ/uyNqe6wHTRjC2efrEjjesE6xxPGpiC7rPuiVPpjDuHcTuQ7jPXSi3x7M8Bk1r
	 ZgJGLxwo6bDwT5dC+vjSsmQM0Pz8LNFlw6aD7CdKeoZaaqYHQCfzKl6PGvZ5Bz73Ri
	 5Kx/zGdIHYDdxqaMM5Oxkax32cqJ//JRivyPTK8obX9X8s7nnF9Xh3MFhuzDM2XqBt
	 zGLWOrmOl4wV337ixhmzKIvlCEAoZBi4ofrM+/6ca+ImEJIp0LqffmH0WHSyJbGmGe
	 PrHhb7l1lbNehhM04u+WuwS83D6JE85gAohbKOPBOYIzIAX7iLgMX13WidMjgwcRLq
	 nd3nnk3/g3nfQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 treapking@chromium.org, yuanhsinte@chromium.org
In-Reply-To: <20241219105303.548437-1-wenst@chromium.org>
References: <20241219105303.548437-1-wenst@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: disable buffer pre-allocation
Message-Id: <173462514608.189443.5339636221433842657.b4-ty@kernel.org>
Date: Thu, 19 Dec 2024 16:19:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 19 Dec 2024 18:53:02 +0800, Chen-Yu Tsai wrote:
> On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
> (AFE) is limited to accessing a very small window (1 MiB) of memory,
> which is described as a reserved memory region in the device tree.
> 
> On these two platforms, the maximum buffer size is given as 512 KiB.
> The MediaTek common code uses the same value for preallocations. This
> means that only the first two PCM substreams get preallocations, and
> then the whole space is exhausted, barring any other substreams from
> working. Since the substreams used are not always the first two, this
> means audio won't work correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: disable buffer pre-allocation
      commit: 32c9c06adb5b157ef259233775a063a43746d699

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

