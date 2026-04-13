Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B66C3EDABA;
	Tue, 14 Apr 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184112; cv=none; b=UTXCBuMzGoxkf/YfzHNzqxV4xfE9duaTx8Yb+4Lq/krb1iKn5OdJj5sbQfdHnXnB56/WkAcU+qd/MC86YVGmZfETdTNc2LAHG17hNxWvWy4r4a4l5M9G4vze/qwHhRMLUHHsfNdZHe9st5iiJIWnW4yCFMJqNrEUhg+SWASwHDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184112; c=relaxed/simple;
	bh=V39/1btDjdN7e2y8LscmUX4ZzmoyzNnPY1iu5oCTcZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DLmDx3Rxu/Puk9LfFPNugeABor0J1rgKahJe2+vv3v8/MZUvqd1I7OjFIrgzNM/uAyINm/Q2P9axQbb51oI3hAdSuYHDI/kH556jVq4bI05W+IqxAjaVoEp+Rjc+XeaVycGjegDS7gORKtuI9wgN8U7Y+vDTcpfig4fWXgrBCJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxhigXBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxhigXBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD7AC2BCB5;
	Tue, 14 Apr 2026 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184112;
	bh=V39/1btDjdN7e2y8LscmUX4ZzmoyzNnPY1iu5oCTcZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XxhigXBGR4haixhCigfadFr/eK5rG1Or+BrTf1GrNFDBuNAVW1aIGjd/qQuKu07FZ
	 by4i6+b6OyN0IS3aMkdousOJ9cCvC0Gy8/HY3fk0dK9HxDG7TNeaEtlyJA4Z/I41n6
	 DUek/UjN3bDoZAhZrepCFiHg73XYWtqUuCofK4+g4uJRV2T4DFhZQCYTwE9pBDyWwm
	 RM0tZbUstYza5ZJmSPgM8jpgvRWnw3ue0eDVuVKMGpuvcT19Jpa6VcJe+wiy6WFTw4
	 /IW7w8yVEGhvXnSGZZXkvvZeRc4r65JNUXyYiGCZvi/NQoBOsCz4+bRKYnm1mBAwRL
	 hreMp+w7zGCnQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260413-ac97-v1-1-b44b9e084307@nxp.com>
References: <20260413-ac97-v1-1-b44b9e084307@nxp.com>
Subject: Re: [PATCH] ASoC: pxa2xx-ac97: fix error handling for reset GPIO
 descriptor
Message-Id: <177609976501.111092.1025386040469103436.b4-ty@b4>
Date: Mon, 13 Apr 2026 18:02:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=V39/1btDjdN7e2y8LscmUX4ZzmoyzNnPY1iu5oCTcZs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp3mssD4Qyc33RSSk48z1ootLeK9Csk9hr8VRC5
 em8GXkZzdeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCad5rLAAKCRAk1otyXVSH
 0PUQB/sFn2qQIPGSkEKBfxGsYCHFs0WV/TDR0tlx77sI1iLR7XOYqdqZkbtrDLlC5OWv/Fgx26l
 Zgdnh6cVzmBBtyfu4ps4K2gzsvzDhkjb7gqUubLGSnQqCQGM+Mswea6ia0fC79JhUoBQRvvUv9b
 /OCzyMOs4XcdcCaG+sGoFOvFkmMaeYRWjlrwyfuthnughI86z+tVYGGvcTgTBE5ltfJ6NbXH/PC
 2iXQPM0Y+dO7F+dkeJmc21OglM2z9rx7/uQhlYCxct6bpAPgHFrIlOlm1WVjBQWbnjEIjh46O+K
 K7AOSTSNcvF2yk3o86NHT2riuDdmF/FjfH5s6WBlZRZTvtFO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Apr 2026 18:52:43 +0800, Peng Fan (OSS) wrote:
> ASoC: pxa2xx-ac97: fix error handling for reset GPIO descriptor

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: pxa2xx-ac97: fix error handling for reset GPIO descriptor
      https://git.kernel.org/broonie/sound/c/54a032d3e62f

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

