Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB62652B6;
	Mon,  2 Feb 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026009; cv=none; b=hiB9VjsB/nMRFYzdCxh9EcEVtjFnYYmYG7UpIXy+T3J8M89kIZbFVk2Qy8MdlIefPABCR14ysbxX32NDb4TBPZlhmx3ETmgIJHTB08BxtAxsoToPdbStEaoF9DU1RJ6NEntk0BHceGWiU60fJ3tubu0h7yXBKuoFnXntivmew5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026009; c=relaxed/simple;
	bh=n6/dCElRLxptLv7X4dwagHBxZhOxOWycWm32EOgkITY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RjqpdRVsxr+be5jofopfWxBZfJtgCQb3szOfqxIbCmNYiaJh1MkRi2goSVyud0SU1VXo7aJq9HixpbRR/7j9cYGafQTiE5A4Nx6DlVJ7vypfyh3UF/yixr5jxv/2LxpKeyoeXEhTsRdeMSrzHwNnWfn4FmTJXwG5JvlPnbIjOOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDs5LAsf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDs5LAsf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC93DC116C6;
	Mon,  2 Feb 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026009;
	bh=n6/dCElRLxptLv7X4dwagHBxZhOxOWycWm32EOgkITY=;
	h=From:To:Cc:Subject:Date:From;
	b=bDs5LAsf2NtsUjc9IvNZDDzvv0+30gd2Bl42E7NSaJPdzImcHZzwylyVpqx8hf6vu
	 j1dzfqDR3P6D8cHIlOOoWV574J5AjZYJUzhF/gKvjsZCLuifVgbXqsuwuHopkC1lxh
	 TUdH0mHJrY7rOagUAQTaifruON5r5CZahmBncjLiG5Qfi+g6zQv6rdoUD/IloR9a87
	 ywOih7pdyQnVtdQl16wE2xSxclMB/ZhOfqZ1aJJHWmF9AJWZsAQEruRIyUYWBiw1Ot
	 lcefe++cv6BxPhbtgi9JWsaDnedaz6AzWNMK523MM3IB/PCqXko/p2acvO+JMAPwws
	 DHBIKEXmFLVdQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sophgo: fix 64-bit division build failure
Date: Mon,  2 Feb 2026 10:53:14 +0100
Message-Id: <20260202095323.1233553-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
is rather inefficient on 32-bit systems, and using the plain division
causes a build failure as a result:

ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!

Consolidate those into a single division using the div_u64() macro.

Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sophgo/cv1800b-sound-adc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
index 794030b713e9..b66761156b99 100644
--- a/sound/soc/sophgo/cv1800b-sound-adc.c
+++ b/sound/soc/sophgo/cv1800b-sound-adc.c
@@ -105,11 +105,8 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_priv *priv, unsigned int rate)
 	if (!priv->mclk_rate || !rate)
 		return -EINVAL;
 
-	tmp = priv->mclk_rate;
-	tmp /= CV1800B_RXADC_WORD_LEN;
-	tmp /= CV1800B_RXADC_CHANNELS;
-	tmp /= rate;
-	tmp /= 2;
+	tmp = div_u64(priv->mclk_rate, CV1800B_RXADC_WORD_LEN *
+		      CV1800B_RXADC_CHANNELS * rate * 2);
 
 	if (!tmp) {
 		dev_err(priv->dev, "computed BCLK divider is zero\n");
-- 
2.39.5

