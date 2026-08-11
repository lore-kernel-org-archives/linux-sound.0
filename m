Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A72E285C;
	Tue, 11 Aug 2026 22:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786487891; cv=none; b=OxkD2qsPjIlzZ1jWh+9kVBXEpXJHJsG8T0V5CFu4ZNXpj7WqdIJ5aDugWRV7DeHWzBTCDCzBuL5yBsR7cR0IGRj2dCro2F0AEBPtVgMLR8Mvk+10YQzEr0NhWBk89MTjBYCjqIIxvcwtKeI4ar+2VHNs7f1N3rum6E/Epx49OkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786487891; c=relaxed/simple;
	bh=PFySlH5B9ZraY1mtFxYeHSeZtPI+MiPthDCd/Alk13A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cJP9swQL/nSE6RyKyfM1jLBKeSIYfOQnjQwpxcXlg+/2eNf8pYXUfIA+EzRWudlo4h24rmoqNooiNOXgfeexZYpBeEyCABXVxt4I2g7nAlXQAS0VCevedgMFbQMM3ArGd4AIcWW7TTfzvU/3iAB2PxdTzsUrIufOoyKkPCLgS5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp/G9klf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp/G9klf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860731F000E9;
	Tue, 11 Aug 2026 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786487890;
	bh=FzXKYC03I39hEmbzF80sm/2SvrE4o5YfUYy5npuLn4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mp/G9klfJuNuH4680Hf+YQJen7bPrescNeaTOga6wwUZTTnP+OBZC/CMpy2aXj4IF
	 47dpMCLmMQ80/yTXR8OxNEyCH5qxaA3fofIbCuA6eF0ddTWRpAYS9ULr3cuwDlKhIE
	 Wd4VD2X8mvgWyKDG3hnNeY5qHpeZYC7LXXnJxaEBtrf3zm/jozxmYXWjg4ghNPsBQt
	 rAZk2V279Q4fmzHZNJDeoIwwU2JXENHwSbngVYzMMG2WjWvNnjqeUM2FrG1NM1Np/c
	 zdUxMo2/VI7WXvTs/24Ry3b4iQh+oZVHI+VKm+4KCbsuuVPpUO8QMKoDAG/NxkET8u
	 QdXwZYX55pd5g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Maili sound
 card
Message-Id: <178648267066.387691.4593405387170532179.b4-ty@b4>
Date: Tue, 11 Aug 2026 22:11:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PFySlH5B9ZraY1mtFxYeHSeZtPI+MiPthDCd/Alk13A=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzqJf6/xFx0jz2Y93tXauXZzhqhZXormqdfuH+m/31fV
 KmZK7dwJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkdfW7P+Ul4XwlTrOlK/N
 ve5+13VxzOass6wbVk7YWD/zmln6qz2+Vtk6i86ySNU8e9dxM3nFDan0FxICXVrFVb2vvFpuikb
 vsjPzPvmTM/G4Z7vtBuMS2yW5Gko7za/33m3+NmsCV1LquddRoe8tJTtzd0u2nr/ms6910p0553
 v0WTmWKh7ZpPCsXXaC1wyv8jvyDC8m3VVdaP/ow22hNceC/CpWTGg3W/baN8EwN4dJJMBcRc05+
 q01f7RRWoL8kqJ3jwOiNSM92t9trNCsEGpw1OauunMvuH6uzvupE/LVZOS6rtQpSZesrNT96FrQ
 YBvJzdXmajZT+enbzVk7GA4690x3VPT+HvHv0/zJ3guaAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 11 Aug 2026 14:16:03 +0530, Prasad Kumpatla wrote:
> ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
> 
> This series add support for sound card on Qualcomm Maili boards.
> 
> Prasad Kumpatla (2):
>   ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
>   ASoC: qcom: sc8280xp: Add Maili sound card support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
      https://git.kernel.org/broonie/sound/c/4d788788e366
[2/2] ASoC: qcom: sc8280xp: Add Maili sound card support
      https://git.kernel.org/broonie/sound/c/19b7493a7162

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

