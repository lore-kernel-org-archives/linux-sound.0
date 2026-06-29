Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5740759B;
	Tue, 30 Jun 2026 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818252; cv=none; b=ljbs5VA3a3fw4pjiyaPfQ/S+XifPhv6geTPVBOcwyT/SNEmTHMWlPrnjyXpMxRAkv1GSEPKk4ARqC0JZrghIF2x4cb1f21UwHb08rUYQxGqG2E1Pc9QH2N+6Sa34jjFqbEmB7lIFvZZDuBqEZLEG1oPm9mwyAIaTr7wqdBEe4ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818252; c=relaxed/simple;
	bh=AwZ3d4FfPSG3YBMoLDDfMBeHI6D1TFdt3s3/YXGFvL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AJ6oA4DtbhgzHaa2hTKZwZfocBpOxaURwDRrkX0nw6c6RT/w1TAbZvPdubSp3zphuK1CTmQ3yRmEyaBXVLB5Tlz0ikWmt7iyOg+9PreupKXyWfvCR6bcPd8jGK8d2070VtcidNr8AhuYQMgwgAmPvjX+f5S/zYJLRdr4RX68RVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWAqOaXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWAqOaXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B385B1F000E9;
	Tue, 30 Jun 2026 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818251;
	bh=Rc94zaq2I43jsxpZPFdMtpC4XJopp5ZxER16y9CDZTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GWAqOaXXj2ceNnaKGbgfh8YvPwCssyBdtpQvn2vVnlMCdlHR6D8qe4EDK25VbqocS
	 C78vRk/fWSkRE0XtBBSm6EGpEdEvn+0k5FR7mr39JLfKxm8mZZY7NwkIrvVxCiCXqv
	 hMFbLGNyZnKzU3Kr8U4nMyRe4ccXvW4Wy5rq4PmfiTt/cAgavnp9ZGjMnFYTsrsi05
	 1kX7uo2JAsgtaZt7JBG4UPMIYp7DJ/SoLzwKHcf2+9H4TqvfRod2zx/F0exkGrGUPY
	 v/knMq5212qybcyZJHpPMkFZbfmH8/3FijfKv9Qsy+nlpb4XIrx2CbgQrpX/nB0q2i
	 PTgJEkK30IiAQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Rander Wang <rander.wang@linux.intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260619122325.2504287-1-runyu.xiao@seu.edu.cn>
References: <20260619122325.2504287-1-runyu.xiao@seu.edu.cn>
Subject: Re: [RFC PATCH v2] ASoC: rt700-sdw: always drain jack work on
 remove
Message-Id: <178275524339.47562.14577157113007733972.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:47:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AwZ3d4FfPSG3YBMoLDDfMBeHI6D1TFdt3s3/YXGFvL8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XIDsSIoz4dneehP6/riBi1PTeMJx3Cq6411
 XC9SbQ0AouJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlyAAKCRAk1otyXVSH
 0PEAB/4ySqo+GR2URqnnV8c2YFCdgAlRzzeUWg/Ip52c7eb3fOwAyH5lEjj7V9haruKt/y9/AtK
 Gfn2FhCnuwhOfqCZv8iVU1WB47LJp2OcztAiHZXnywIEhhi4nY59E0EHKfFdxqZHPKly3iEfKW5
 NFVlXrLpvFKKamMfCgr0foFaqKLJIRGbiXxojEgg96n/rRrkBR54IBku4sREKgPSZN1NNmE9Iuo
 unQgGks47MYL8YkyRbXhUQuA8PUBj4HczOMgEKvmiN0hWOpOeGy1zrzm9g5eV72OTJ1PymzeXVF
 UtUYcMg8nBQT5RDioEPeiR4nF/sY6Xa3Flpmo8xmiQ6Y2CQ/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 19 Jun 2026 20:23:25 +0800, Runyu Xiao wrote:
> ASoC: rt700-sdw: always drain jack work on remove

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: rt700-sdw: always drain jack work on remove
      https://git.kernel.org/broonie/sound/c/612ccf42acd1

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

