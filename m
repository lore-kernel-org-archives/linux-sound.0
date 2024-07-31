Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7285191F8C;
	Wed, 31 Jul 2024 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722426530; cv=none; b=SAYMssRGcKBKRPfcBp1FGkx5DZn1WvRJfpYcodrKwuTzLTsecKv+HED8Wajz1iRBx/+Zo5CbZaef+jKlVYI40gYsXMc2Gm/mddAxoiYrPCCllCQ3jJrmEsdbgKPJ1klIwMb7CIEQjC3eHfJy6EuaSjarAqScD999mDeu9sX22FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722426530; c=relaxed/simple;
	bh=eMCe0BeajwTdXJk8ZG7lWHugRG3CBtcRg4RMJ2blul0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DSKIyeSk5oRCnBizz8FmZ23p47IqmkqvehN3kW5wG3uisqrHc2Dq9Z4uo8pCX9/AvdPPLWv4utDQzo2erzcPTW8BFuNuobBrCD+gcRDJFk/USCOneg/Bu8LGfWZnzl3tl0hq3nVkCi0QcxLceZpK8jVdmqWWqAejpD6Iw4OP51U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=R1wcR+yg; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="R1wcR+yg"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E5CD31F999;
	Wed, 31 Jul 2024 13:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1722426520;
	bh=Rzs2zKhNmbV41FgRJBzDyt1F9WRkatvV0fHFhoA9GTk=; h=From:To:Subject;
	b=R1wcR+ygxatdDtpZ8IhYZtQ/nLAQQ4ym8O/y+aOK41s/qMJ+N7cVBb1PmgTOYdjEw
	 2TgpNBdh3Ov1BXPqq1jvIwO/wS1vNyuVY1mGGcnWw5vl2MR3YRx+89ZabRN67aYnnV
	 trjG1rvgC7YHqu6tkQoX8b0n2YwCc/ToK1K4O4Uob8A1hVaOC8lgqgCxctzjmzNnzU
	 ACdtcuQriQkt4ERPpsNwXBtDTZ1FF+4y7MfL+ieKiJkPx8wu4nWrCillE/jiEWjnaD
	 YmNO0BUXx1rB6o6GLEShE9e9sy31Y0sa7hfjHp0amRpKlg/nC98UnHN7G10Or5Hzb2
	 lrFZAJKHoCoKQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: nau8822: Lower debug print priority
Date: Wed, 31 Jul 2024 13:48:28 +0200
Message-Id: <20240731114828.61238-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

NAU8822 codec PLL parameters are not an information that the general
user should care about, this print is supposed to be used for debugging,
adjust the debug print priority accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 sound/soc/codecs/nau8822.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index e1cbaf8a944d..fd4a96a12060 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -736,7 +736,7 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
 		return ret;
 	}
 
-	dev_info(component->dev,
+	dev_dbg(component->dev,
 		"pll_int=%x pll_frac=%x mclk_scaler=%x pre_factor=%x\n",
 		pll_param->pll_int, pll_param->pll_frac,
 		pll_param->mclk_scaler, pll_param->pre_factor);
-- 
2.39.2

