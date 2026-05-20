Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8B3D811E;
	Wed, 20 May 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278575; cv=none; b=J+nea4lSCPqSoIDS2VI0dRy9poB3wBS4tWu8xNJLRd9MzuEhgE+tAL+4lgH1lYPzHRWirxI1HnS6+wv5ZWlrD9mIoBz2f1T++KlBYA8L0Jv2rxU5n8P7BLa712yRN0Puy3n/FDKXj4WwFBnxal13Cg4Ovs1APYmFWGsFgGyRHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278575; c=relaxed/simple;
	bh=xpHE4K9WtVkacoOO1Mfn1VZJBwFr9bGGeGC217kLoKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l8eAHHHfic3dvGLyG50ymk+6JUITgw3O05f5w9e7pGkh3e3zdbAnIlgU9dbLuHt+vRv9a0LAydVbrCtFfMBgidzAmNkoCn8GwVLu+OX0Dfvqgl6yNipn47h4ZJRhgo4X3qD1npKY/U969OFoRhqQ78Mmtn75Hfufpah5xwl+LvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y37+2ryR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y37+2ryR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7621F000E9;
	Wed, 20 May 2026 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278573;
	bh=bMx2TxPTAaNa5RY3MkqWbs2tXzjOIrKSnt4/rIEz46g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y37+2ryRHrzK/9nGUKHfD8Dv1oY4O+yrRimzOnMWtPqPZctp3yB8jbidCbbaqMLux
	 oFGy+vA+IszzWnIYAQUHb6IdJzhWzpFKHGSmPAGye59amjjmCLFOf7WNbUGtoJZEsE
	 S/tXZWFk4ICCoTRAcABceRNe7kyghr48T+fkuM21fRBnal/Vqad3P7D4sPhgi+ieBm
	 NEiiDphqQ9InYYqzN2sXxx8uzRRjwmZH2bdsLZ2iPwRQRtzWyOT7vE+vbvIvtEtMgx
	 KB8SwA8Vk9af+R/fzuk4SCOHP3oUOH9epIlIAV+e6EPOH+Gye6ODpsIM+sUM9wCyw6
	 IvvZfiYgbiKLw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Li Jian <lazycat-xiao@foxmail.com>
Cc: lgirdwood@gmail.com, loongarch@vger.kernel.org, zhoubinbin@loongson.cn, 
 jeffbai@aosc.io, stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zhang Yi <zhangyi@everest-semi.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 Huacai Chen <chenhuacai@kernel.org>
In-Reply-To: <tencent_93212098B8302E17913CEFCD29E77E07B407@qq.com>
References: <tencent_93212098B8302E17913CEFCD29E77E07B407@qq.com>
Subject: Re: (subset) [PATCH v2] ASoC: ES8389: convert to
 devm_clk_get_optional() to get clock
Message-Id: <177927855635.56665.112760725243399672.b4-ty@b4>
Date: Wed, 20 May 2026 13:02:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xpHE4K9WtVkacoOO1Mfn1VZJBwFr9bGGeGC217kLoKA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqDaLqyoWaQHbF7A4WJvnPbP9aByv1fK+ApyRWA
 chFH710S9SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCag2i6gAKCRAk1otyXVSH
 0LWlB/4gRi0z3NCLbR/T2GCSpmObtDddyqe3tT+/ZFCA/+TFthy7x20zlAPFm/E3sFmfPcK7FL9
 IkeRnCGA2H3ae1/ZY/vV2ipEfVkZRPmXqSXz2oonwblCMYejIOyrI/Wjzv79zW8Ns4uxSsSiOuy
 ruHYlKwVTbPAtOy+5sbVOvdMJbgYMHG08xJwx6SdZ0R6tQQFcDXYpLAZTwrw1HaCx4P7xkfsh2R
 /92S7wj52qK2NtkLxJJCYsMtDE96oCKiAsVTnnUNwnoTVZP8DCX7FaCYlRt6VEjFtOJsNZR++l0
 nN4WtF0AKAlayJnA6fcUmUAuAbXvFwDF6Vz4kW6Fg3YHnQAK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 13 May 2026 12:52:17 +0800, Li Jian wrote:
> ASoC: ES8389: convert to devm_clk_get_optional() to get clock

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!



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

