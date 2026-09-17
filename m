Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DCA4AA1F8;
	Thu, 17 Sep 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645651; cv=none; b=YbQTbUXTnD6wt3ahQEG0wyyVzdf9CaJtmD0KkwXOzat4DMm5uN3SvFX/wR80KsgB8n2MS3UtNHprylQc1O+833uD5LMgUFvExSskVjGEPEcfPJzm7vOusZ7Cu6pLn5n5C931PQJM1vxyrkV2KDKaawe9hU9dwFlTyOJmwPhwMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645651; c=relaxed/simple;
	bh=AI39L+ZGXRClSJlTe0kyuJR2TpQAZ4EaEYHa8Qj/SGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=smz9wNuUjo0cxSpe1hwTgmX+Up7E4cNnsA4U5wZiijnTZGa1pEzhvpiNthfa+v6wixAkRtTjvEVPxugkzQvg+8giEgmdKJHbKKKm9g3+wD+HjSgPDKBrUzsdbc4FTXsuKJUKDdJTCbekeRAi42PQnL1+ReXNg9lXDqlsyNC3qes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imIZAN0h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imIZAN0h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4B31F000FF;
	Thu, 17 Sep 2026 11:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789645650;
	bh=pG9cjks4k9C8zXZoyyabDPkmF6b29sL50DaD6ZJ/fQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=imIZAN0hmzffNgznzHciVaNnIMdo4L1CRg0bzohczdDonRTNvzgN9xj+oBJzyx/6W
	 YaGfVZnNve8wBJpxAkVadK0qyhwPIw5JyuiBj5GfZXGz6UBmxNkaaMDNVAY7p20o8v
	 emWLQInj4/otQcaXpctfPr/d6A4xyro1cH13tmiixbdvsJStXO56sjq+jwRaAe5Dqf
	 UZmptcuhw7oZlNNoNjPOUV3LfWuRC1AgGsNsvhOOLpge3XDv0L20Iw1ZvxEX9/CBG3
	 3OGfz+j2Vt2cKBOPvk6oWWbzd0xCZiVDl8UkEoj6vnAvkzPjdOkbZpdrZPLFQOEwHw
	 0yz6qRHx8dseg==
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: error27@gmail.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com, 
 sjlin0@nuvoton.com
In-Reply-To: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
References: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH v5 0/2] ASoC: codecs: nau8360: Fix DSP routing and
 deadlock issues
Message-Id: <178964562125.162267.11490477756224504460.b4-ty@b4>
Date: Thu, 17 Sep 2026 12:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AI39L+ZGXRClSJlTe0kyuJR2TpQAZ4EaEYHa8Qj/SGo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq9NNaOWAYvJ6+NpPO/Uc/gSc1YSTJbKKSK3Ry
 V4GarGP+6GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvTTQAKCRAk1otyXVSH
 0BplB/0W9f9TY0gsc/gKa5Lv6Fg3LKvUnxe7GYFkEcaFzk7QniihDWsqi5EuiM5tUzqiu7fb02o
 ipmNlt2YnkBifMAJ944mRhwWK9zW+4v9FklbF36zf0jCmtWIey2M5ka/oXrrdbYzk8FNo3rtIK4
 x4Vllzz5QEB61m7p7CbTFc3IpnM+78xqdp/7U9rGOXmbzXFmBAu68cTlyMF3cVygDJ03lNRfb36
 CxsJblUyoFc6IM5s6rTRK8ehrhc0sk/K3hRUcohbUfLg5u+HqujPPR2udldYuSEvTzElU5+NASA
 4RFKd0kLq9xxcBN7hZg37lnyuwwJPadEV+UTyjlIuFlD//2o
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 09:56:46 +0800, Neo Chang wrote:
> ASoC: codecs: nau8360: Fix DSP routing and deadlock issues
> 
> This patch series addresses two issues in the nau8360 codec driver
> regarding the DAC mux control:
> 
> 1. An invalid hardware routing state that occurs when the DSP firmware
>    fails to load but the userspace attempts to switch to the DSP path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
      https://git.kernel.org/broonie/sound/c/eeff736ebf5d
[2/2] ASoC: codecs: nau8360: Fix AB-BA deadlock in mux update
      https://git.kernel.org/broonie/sound/c/4862e73eaf08

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

