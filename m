Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5703B388C;
	Thu, 30 Jul 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435135; cv=none; b=l5cw75ql6D2lUQVjWCr1J2umPEwOnQNHkfyijUa/lo7R53y5d4501rxkd6N5yaHk5/bq5obdF955Ivu/jTjxMcoCDa3thMlNbriJvW+zjXeeZ4gp1zkKDesrjPO75TX4KPvvjRARpM5wyo2nviKMtwSn/tcEbgMkc7M5QQRyCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435135; c=relaxed/simple;
	bh=al0aeyzKhhjI3SzEKoeMt7WtWbD136013GK6wKC3khY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TRrqzjQzPgAh3L0YAjPVBok+hEHO9oY1YvpQBvWcUwz2h3ybowP8Ibgh2vopNTZ93/JLF3Q/Z2RTJ4mw0cW5tTDG4OIO1n5Cwl+C8fOYsp95dkVkkPUaWX2k4rvNJCErfLrCfthprpnafbQB4xpV7FO81vsKxwSmnkiKOnBuniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPVYEh4D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPVYEh4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0C31F00A3A;
	Thu, 30 Jul 2026 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785435119;
	bh=OY8N8assYzhf+3l/VSZbI4YqUTuK4I6dZeFP4UBLkUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hPVYEh4Dm7n1Q34l2oxKx8OBocGNs8fHI5EKLhq7TPqa7hCuDGlb1WYj8Bhlw+Zbb
	 kylmPKr3cNg4vlrDpYiDlCd9Aed+D8r75ICySwIIGoo1gqL7BPd3xzqtpsyTjWDcbo
	 CelwFlUAfUn45790VZFFB3EiqMt3jDD6FASPhLqz+v2Awx2NwAYEpo6E90PO8YC8Qp
	 cmBRHIr2iEjAwnFbwer4NCf4WzbF+KH0ojDwT28gDFJLNIs+8/ral/3W7//s042TYd
	 PB2+5OcuhXS/uJyHN2poWK/w9ozPj+qeB8jwqMkDwMFjzZhED3cqG8M3XxY82TZYxh
	 VAZ9o03Ja06bw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
Subject: Re: (subset) [PATCH 0/4] ASoC: qcom: allow SM[456]50 HDK board to
 play audio via I2S
Message-Id: <178542562010.81171.13829951779945978833.b4-ty@b4>
Date: Thu, 30 Jul 2026 16:33:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 28 Jul 2026 10:53:27 +0200, Neil Armstrong wrote:
> ASoC: qcom: allow SM[456]50 HDK board to play audio via I2S
> 
> Following [1], this adds the necessary settings to setup
> the I2S link to the HDMI bridge to allow audio playback.
> 
> Depends on:
> [1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: qcom: sc8280xp: allow setting m2is clocks for SM8[456]50 boards
      https://git.kernel.org/broonie/sound/c/088c4404b3d7

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

