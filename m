Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805B3ACEED;
	Wed,  8 Jul 2026 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506247; cv=none; b=RGaUxBmXfpg8N0dxb1OrUDlTDfqH6/QsgF+slif5SjBYzzudHzpN7i+TiXFqp2zL0J7N8eQI98pFVXBGMFBKm8negNbsiKyGPW/03P79bkbgwHc8PaiAivuy35TDqinMCsj7q3MtHYzDZoe+GP8HW0wqXUqyrkkRpA22H7kGH24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506247; c=relaxed/simple;
	bh=MI3jtk9klnI5yCR57kbrCOpbjPiC8juEcsPCprxV7h4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lETCEcdohczdbDfxQeNplF5FT2aOgFRM66Ax08JiAebJIuvhbfiVjknM6RbLKrsoUwVq6wlagPEjSU1ONC7C0GRz3xZkJTctx6jNB14kBk27ld2t1wWCy6JL3nJFMDijwdJbnsfI99Zu2TTBZ04Jj9bI4eAUvSveW6Zw3VFbgDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfGcsYA0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfGcsYA0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712E81F00A3E;
	Wed,  8 Jul 2026 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783506245;
	bh=vuCSxHa1At+QgzfRgx+BbzkdkmhcQ4EdhujqbrLxvD8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=RfGcsYA0KGSWVDJs1jsSabMER5kAoEnOO5xC0zguBP/cy7sS84tT8RYjzBiJANTXU
	 bsc6Hdbge4Vcc0ALVflGb5o+iTscPZB4IwezVKJyjBmC/P6Asurcf2GB8TeU+aax/T
	 6rrBBVy82sT4mDLkc7hnHzJ1a4B7aSasg2H1eJm7TOG4tirN1ajRSwX+EGA630Foml
	 EdWu1rWHb+B0oB0oPq60pBvw/Fy3IOWTes/vLB/vg1it9l4sbwMann5nKAxuXDZKRq
	 yVgTfwmdDOOdsXJkyTcAeV6eReLfe/1ikaWvHgmDlIvU3p3n2usO+srvcDvB/vNZgG
	 JlJBVBdl/Iagw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20260627131205.808800-1-christianshewitt@gmail.com>
References: <20260627131205.808800-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v3] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
Message-Id: <178346181742.59892.268433799792048695.b4-ty@b4>
Date: Tue, 07 Jul 2026 23:03:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MI3jtk9klnI5yCR57kbrCOpbjPiC8juEcsPCprxV7h4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTiVC0pVsqqQp1/ULwRgYdG0h1kBBdAIYyRVyl
 ScDbbBmspyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak4lQgAKCRAk1otyXVSH
 0AELB/9bTW8u6smaJE9CXni5aJB+cT6SOwnwGbvMbRs4FcNpZQjUEzUs2Mij+lbJeTIbpLgUHn4
 5Pjwz18uy0yMpj0BNbl6QxF+mvvtgZLXwsReiw5IvYhtWbBkQX6GOLNKrp2BGFPGTZe/rMjXN05
 REYhLZ24gpTGoUK0RzXyJocrkKSQqQSv+O5vA5jRRhNvdKW8LqfLxCCPPtMxfXR/kV2b6GXxiJ8
 5t3DQGnZcx6OAKfOJGE2NBOsHUlObyFX32DkYZvd8+2pfszMLqZEbrbnxkl1oW9PLvg6XYqOo4d
 wvvrtOcvO6DrybZxMJRmV+v2JsvSwWRb5tnpZ525TCxXy++4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 27 Jun 2026 13:12:05 +0000, Christian Hewitt wrote:
> ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
      https://git.kernel.org/broonie/sound/c/6b59c53c8adc

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

