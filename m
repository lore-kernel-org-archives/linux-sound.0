Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1F20B20F;
	Tue, 29 Oct 2024 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234146; cv=none; b=I45HVHJpK4KwUZ58mwZWyPrjeo7nj3ISvFEjPwJtrS6LKXaQ7Yyc6PdGTfM8vmDB+pJ54xHLC/rl32WHGIRXvQ0yCOZ7hiGbPW134YdAJFE0xiBNJc/+qPToJtQAD/EO1kqoqN0K7tbzD0T2Sc0qUdiGLCjTJtJ79378MYd0pac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234146; c=relaxed/simple;
	bh=EH49fBcg1xnPZSv8CjBUPDLHZTVEnhL92w20nPZLvxw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GfdnQWdiW+lyzXxcwUAGA/uCNRIZoRU+OjwmilPHNdp/K1LtP9hw3zqy8hnazi4YwGJEd1ASzTaHR+eDvEgwt+BsjxLZcUkvfyJKy2e34IcZKrvupbh+eEDkyjG/r/iBxdrbNaEoyxKhZMSwRya+TCt8+pUSUp91Q+ZrIEwA71w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYvIRtAm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYvIRtAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3892BC4CEE4;
	Tue, 29 Oct 2024 20:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730234146;
	bh=EH49fBcg1xnPZSv8CjBUPDLHZTVEnhL92w20nPZLvxw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KYvIRtAmtoixygMz+a2XxHt6DkPRuQjciy2Xm03E3wMqsbV3tLs50qwpWQSrnjm41
	 /MIoS9Fuxx5hp4+7WME89l48G9pESX/ygwqTaUF5InHJp0UH2sLjuLu5Z8AKOSg8iw
	 iEnqog0g283e1ktePYZYYacZ6aWje6Ao90HsXZV8aTnC0r4N6PTlnqBlWfJX46Hqz0
	 CBNMK2nwjeL+VIvg0tDdWQymmT/n97hx+R2K2cb9cGE0+n6R2Vd7PHJHZhEQsVVOKH
	 fn+9Axqa+oo5ObCVIHCjNBrH2fMoBfjO6t1z67WwnUm4+U8TqsEAhD66rq0Nfjnxee
	 PqUmSF7gB92hA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 Nuno Sa <nuno.sa@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
References: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
Subject: Re: [PATCH v2 0/4] ASoC: codecs: adau1373: drop platform data
Message-Id: <173023414396.174179.15867147846547510289.b4-ty@kernel.org>
Date: Tue, 29 Oct 2024 20:35:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 28 Oct 2024 16:43:37 +0100, Nuno Sa wrote:
> Here it goes v2...
> 
> v1:
>  * https://lore.kernel.org/all/20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com/
> 
> v2:
>  - Patch 2 (Bindings):
>    * Removed extra blank line;
>    * Fixed example messed indentation;
>    * Added more properties to the example;
>    * Add maxItems.
>  - Patch 4 (Powerdown gpio):
>    * Powerdown the chip when unbound.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: adau1373: add some kconfig text
      commit: bebf0f45326e6cbb6f96e405e4179962a5675aaf
[2/4] ASoC: dt-bindings: document the adau1373 Codec
      commit: 6b26a56fc035971951299dc1330e1fc5d49866c9
[3/4] ASoC: codecs: adau1373: drop patform_data
      commit: 71743cbe28cf1d1f845a30bc9664c3b6a08f0d30
[4/4] ASoC: codecs: adau1373: add powerdown gpio
      commit: ba79bca407d3b7e6f5be209d9b3f73f81ee8d460

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

