Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B063D5C2A;
	Fri, 31 Jul 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500973; cv=none; b=X+p1rykTg2/38Xuq6a0d615hpC4wE6MTdTAz0V6l0rWFlSaK8mYxJoPrWXkRw3AmkSQsZ5iTgfOdDo91jPnmUFfG11bo+PpvTQE4GRvTCH4IoarShy0BLTf020QQ7RRgEXTxSHTo7abs5fjHC6sN405whHPpg6O5bRfwFXRED4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500973; c=relaxed/simple;
	bh=fcTNybD60hHHX2uRQ0TiAaWsqkVT5xGWvUUpxuHYEJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qQXe+vJOLCpsIvsRDSxn0v7SYUXHjbFXd+FPWkz/EK8xba2nXzrWWsiw50Bz8sgt7a2lPVrK0m2S7ry2nc6YXJmwg/ImhVuNWXgYcpndH0Owl1BCT3k8oFzAgYEUyN/VkwM/cgUi4U8LM+dzvFIk/QCxb40sZ4skHGCiJQ1kBQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoxRIE4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoxRIE4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CB51F000E9;
	Fri, 31 Jul 2026 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785500971;
	bh=eT8FQf3PxqRsPOImv7z6foKRzZimedLgLDX/bPt86xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JoxRIE4S93zPVijJCmh1VAJ9CjnVZAs5nMdR8opOwLR8T+kuHPIApxaOZOeYRJPEG
	 KlPH4zY4WRM8qCQ8VtkOG6r9QiJhttABLgRgf4kX0Rep6BFCc/XYsgSYFvfnORG74N
	 hhDOkR/ZJGKAYVWhQ82tOZeu1VLg3q1Q5sjlRzfIY0NUSMgLzqA4LUTQzjoZWKahJE
	 thDM5i0FqwAY+2NLnEPBPlhS5wfFnp0hLElfqklFLhLqvde7fIMLCd6jGzJnTFRuSB
	 FJnJdpEo95GHQlEHMpB5jSyBZ5KGN9PQbe46ZZ/2K6YkkruCiuxqdWg1pPbvO/3RXB
	 iswMN1ZEzclig==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
Subject: Re: [PATCH v3 0/3] ASoC: qcom: audioreach: support WSA speakers
 only on WSA2
Message-Id: <178550094533.136247.8108653420741029312.b4-ty@b4>
Date: Fri, 31 Jul 2026 13:29:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fcTNybD60hHHX2uRQ0TiAaWsqkVT5xGWvUUpxuHYEJ4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJUn0uttozTmqjmRUjYG2vVApeHToC71qSqDm
 hqZWSKskI2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyVJwAKCRAk1otyXVSH
 0NBkB/9Dd9EHUC0zJ25vNdFv/cUap6IUkcnmHyodT5qtb7blF4iKzk7iR4lNhEbPtKCskYixxfe
 cRd0UWU2ddLDs9g/t1y8Ljm25RdVl3cxOVJMGGydOaSqrupb4VsmSTk3GVdPU6kxAPSbb3+2JYd
 WUCyCXa3GznspNNR5BUXLcF76JC0NVgAuWueXs1X61wAvEylMytUnarSeFLm+ruGTPvesA0k5cF
 4ZJdX+vuApOt9cPL9aYQCcEzIJPjR/P9NZt/Z2eAw4hoV9r8eLDema+gGEyYuinteJRH6v0PjIc
 pmtB+GzRSOcIuty/0EtcTLreVkNO3NTpQkMlCA4VBlsHCW2Z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Jul 2026 10:46:42 +0200, Neil Armstrong wrote:
> ASoC: qcom: audioreach: support WSA speakers only on WSA2
> 
> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
> of 2 WSA speakers connected on the WSA2 lines.
> 
> But the Audioreach DSP only handles WSA2 in pair with the WSA
> interface by using the upper bits of the active_channels_mask
> for WSA2 and the lower bits for WSA:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: qcom: audioreach: compute active channel maps from channel_map
      https://git.kernel.org/broonie/misc/c/c663014e452d
[2/3] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2 sound card
      https://git.kernel.org/broonie/misc/c/b7b0a445ace2
[3/3] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel mapping
      https://git.kernel.org/broonie/misc/c/968d38918ae8

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

