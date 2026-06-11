Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E639D3D2;
	Fri, 12 Jun 2026 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302739; cv=none; b=GwTkY8DBGOVr6+aOE1u9A4Qm356+8jX5en8VNiU7nemXq6pfLaoJi5AN3RlXXoMloJNYtFSEsvI8edSUYQZ4refEiEo0wydhp/1B4l/rJgWULH15lOanxqMlCKJU4rbgWwd1xplHCuE+RGg+n1UpPOj9Fls6f2vX8MSDsDJ+QWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302739; c=relaxed/simple;
	bh=cd/Rqk5jCjHx5QpYorhfM9dRWelozdFE0HHSuqxyRM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bkhqRX9c/3MFlp4M8uU2ThCoL9YrQOpIwEptEKDNXW7meKC5LhlSU7ChC5ssvLNtcaKlt5jxlU/sg394QdI7jvQQQkOzECE5BHjLnUP7GjolEAgaX9aZq7S+GpNXwLTRVcq334K6PrizrSpvvyUsY0tzGQRMOJfEwxz44RD+IKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2IGZz72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2IGZz72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EED1F00A3D;
	Fri, 12 Jun 2026 22:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302738;
	bh=XFgXcI8eYpTyPHFsBlp4vWnJ+v2US4lLm9YM3O8ihB4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T2IGZz72jj8RR1vU0RCmgwqVoLEswNXkT6FeXibLK8uCMkC4rO0s0uIyHgrLC1Vgj
	 SIXIAEnPdJOF5vZd39ojmsbsXOd1QcVwfSCWOnWKrMACsZkVIvZ8mwAav/JYTjGPow
	 +juLvM+5zRORiy0axBBvNTV9zcioCM89BMPI9vObIiMip+WsHHbC1xz14J1Qri/3++
	 JDzeV8zUdBPDBfhvt9KNPpfYlRzXcw5zT3+LK50mwdSGf1P8SrnGOtKYYv5idQ02Sj
	 F+0+QdKsqw2ws61j3Y5dve3oZUG6B+/O/l2f9AO2pnsE2eEYNHGL9ms1wkjsq2mwQn
	 m0Qpt+OSzWaGw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: Validate written enum values in custom
 controls
Message-Id: <178120709588.484538.13926774785759252487.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:44:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cd/Rqk5jCjHx5QpYorhfM9dRWelozdFE0HHSuqxyRM8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXOfprae3uN+jjD/M3mgHYDkCm0b1ir+nQe3
 TEnD/+//2uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFzgAKCRAk1otyXVSH
 0NbkB/0cVMj22Qt3fYcI0NPvijW++I2Di20znzFGpbxekxJik4yO7krsIl4Gf8nohSbF9lCXu4f
 VWP8ZL/Ro2YiI3EygH4n/Og9jLExzNPGqofxcJTwTMBdb6gpY/fSMtq0OpiBo1rYBz8jdg4IEgi
 PQkRMUmh/kUXVFAFgBee7s7ePjq0Chze+hP6iz1sfeqgOg48Ns2ObjrRGrMrub0HKmqurNod+9C
 qpUnZ3p7FY8s7+aCVh7eJVhcPuEFWSC1X5C+DIAoE040uZcYrU2nIKo6ko3LsvcFQZl1ZSeXJXO
 XJrBLhRGP7SJVuYUZWXEIGyJ+u3PWBZhS/3Osoydm3qTIEzD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 21:43:12 +0900, HyeongJun An wrote:
> ASoC: Validate written enum values in custom controls
> 
> Some custom ASoC kcontrol put() handlers use the written enum value
> (ucontrol->value.enumerated.item[0]) to index a table or compute a bit
> shift before validating that the value is within the control's enum range.
> An out-of-range value written from userspace is therefore consumed before
> it is rejected.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: codecs: hdac_hdmi: Validate written enum value
      https://git.kernel.org/broonie/sound/c/0b08baeccdcf
[2/4] ASoC: meson: aiu: Validate written enum values
      https://git.kernel.org/broonie/sound/c/d65adf854772
[3/4] ASoC: fsl: fsl_audmix: Validate written enum values
      https://git.kernel.org/broonie/sound/c/3cd17e4e2871
[4/4] ASoC: tegra: tegra210_ahub: Validate written enum value
      https://git.kernel.org/broonie/sound/c/1d8aabb413b5

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

