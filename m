Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD944185E52;
	Wed, 26 Jun 2024 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414271; cv=none; b=L972OlR07JWHakHblKGswLMrx+1L2gYZF3HD2YfYEQcRA2JecJbSKcw3NiTT1cRDDb7rj7iTepZCv4MTsFb6NbqkC4yWoddihwTxPNGWQyradGvpGceKvygEMOXJew1+cxnCJ2UcTIn7V1xHolES3RBBVy170I73kVSdGh2mIpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414271; c=relaxed/simple;
	bh=OeVyeBAKzs/4y1bxzS5DdMIxMZ2InGgIDPXxr9igdvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+Ej2c8+taTQNfYRcqqBXozPQpomW9UttSQ8P8DSuixPvuy5OcKxLPGWVobmvYxd3j7DN6GVMwJ6+yJ4FA2VFQDpflWBlqhl0ZWD3/c0bfxDIzX5wC6NfY3Eq0EJWAJu8sqeziEEM2wSVQUTmzQjmAoyfhDgViHkZzspQ/vDvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=gTcmVdyJ; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=WUa+W9pu; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="gTcmVdyJ";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="WUa+W9pu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=dxF648gxj3B9Omidvm2whmJGIvDn08s3vO+mWJ+BXng=;
	t=1719414269;x=1719504269; 
	b=gTcmVdyJp3oQTcBT4Egulu5NigF72Cs+xW9WkgcjJRa0Bcn0/iPkkeh0OlDFEZgUHDmkyoXYhL4wvEjNxz/cIhUexdvakO5A/RN2tcfZj98CXPUK2Dto42L5MzOPR+mYFWwrgY1qitXq+SKhhG4YNrtnIuyOxoVrKDTSPhBbazszgO8f7xAHxV+3MiYuKsXm2WOs0cuEruhRneNUn8M0Nha6OnLLgH83j9RxaAI8tqFSr5cnp+uSxTw4oAVY+VnyVhHuhRXuIR3py6wB5pgwE7pFikTEnPnNw15/MIYNa/T96+7ierhWlUANDG1KIOQW1LANF5cTIGJHaDEgouuOwg==;
Received: from [10.12.4.33] (port=51466 helo=smtp58.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMTYZ-005Rj5-EB; Wed, 26 Jun 2024 17:23:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=dxF648gxj3B9Omidvm2whmJGIvDn08s3vO+mWJ+BXng=; t=1719411811; x=1719501811; 
	b=WUa+W9puE/BJ3jbA4UtczGYRjnVAyNnmjE71xrqYkLfpqjQ/8lZyjYh97d+rlSk4E0F7P8FbylL
	QWVmPNMYsBfcJVxvVVOh0aiiUpZSIUZ7AEc/Cka7t+JJwSXXwhuyZNZDDb7HiykkXEGY7xCB/YiOP
	yWLJa5sHLnIXS9A1DLeZTdG7/fwqunjNdxfNUUJkBfm6/9xbWmuRWDw7uCFGvZtMc8+WRe5eOEiTj
	j2VD2KQGFF4hJc2i6t+7LyMjKb+gBHVVRr3QZ39aqH0EN+VwdDz3giy6mvM3R4ukT9pev6/w0nwce
	+aTjFz2SD+fXAyrEevWKNde9vQqrgg8dhMPg==;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMTYJ-00000003pHy-2fyP; Wed, 26 Jun 2024 17:23:16 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Hsu <KCHSU0@nuvoton.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: codecs: nau8824: Add master clock handling
Date: Wed, 26 Jun 2024 17:22:55 +0300
Message-ID: <20240626142259.21608-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626142259.21608-1-fido_max@inbox.ru>
References: <20240626142259.21608-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31F2445BAAF206D7ABF33F1671F7E087A36182A05F53808504041D6E07DBB3F94CFA6D5EE0DB6E1EC8D3AF138FF561416A9B9143B39FE1528AAE4D98B9586BF5A92
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77545ECFDF1E157EBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377A06FA5CCF78F9BC8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F61A00B72C049CCF66CD5431CE238EE84494095C9A0588B920879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F7900637D9CFB327BC390E24389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC886A7C529F68B8E5CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B9149C560DC76099D75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A528204E5D6A8A57CF5002B1117B3ED696814966D8306C0F6222DFD5397F446790823CB91A9FED034534781492E4B8EEADEF0AF71940E62277C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFA14E7758F908F505FE6BABA54C349B0C2651CBCC52A9A36505E3A1517337EE7E66971B16C155F0C9443676941C84C1C8E53347EC12B50AB8236B3925D264D5F72DC27AD3CA7DFF92E4FDFA4A036B0C3902C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWopjbj2GBkGIOQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B09F2DD876D2B05C8A935B69EAD796821D9A9B7A2022D2D4390DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6ACA5C36130BC0CB103049FFFDB7839CE9EA0123DB20CD7599C04A9CF4B678D01C5BFCC030D5ED8914D63AC828BC1A299C0
X-7FA49CB5: 0D63561A33F958A56D56E682764620F158AA222922CF094973103714A208CDF9CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F7900637436E42DEDF9DC02F9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3D6B3BA020039D4E8CC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E735FC839A7D10C5E1E9C4224003CC83647689D4C264860C145E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoowxcwLI9VNjQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/nau8824.c | 21 +++++++++++++++++++--
 sound/soc/codecs/nau8824.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index f92b95b21cae..c66b0a5a7448 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -520,8 +520,15 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
 		} else {
 			nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, 0);
 		}
+
+		if (!IS_ERR(nau8824->mclk))
+			clk_disable_unprepare(nau8824->mclk);
 	} else {
 		dev_dbg(nau8824->dev, "system clock control : POWER ON\n");
+
+		if (!IS_ERR(nau8824->mclk))
+			clk_prepare_enable(nau8824->mclk);
+
 		/* Check the clock source setting is proper or not
 		 * no matter the source is from FLL or MCLK.
 		 */
@@ -563,16 +570,22 @@ static int dmic_clock_control(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	int src;
+	unsigned int freq;
+
+	if (!IS_ERR(nau8824->mclk))
+		freq = clk_get_rate(nau8824->mclk);
+	else
+		freq = nau8824->fs * 256;
 
 	/* The DMIC clock is gotten from system clock (256fs) divided by
 	 * DMIC_SRC (1, 2, 4, 8, 16, 32). The clock has to be equal or
 	 * less than 3.072 MHz.
 	 */
 	for (src = 0; src < 5; src++) {
-		if ((0x1 << (8 - src)) * nau8824->fs <= DMIC_CLK)
+		if (freq / (0x1 << src) <= DMIC_CLK)
 			break;
 	}
-	dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, nau8824->fs * 256);
+	dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, freq);
 	regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 		NAU8824_CLK_DMIC_SRC_MASK, (src << NAU8824_CLK_DMIC_SRC_SFT));
 
@@ -1510,6 +1523,10 @@ static int nau8824_component_probe(struct snd_soc_component *component)
 
 	nau8824->dapm = dapm;
 
+	nau8824->mclk = devm_clk_get(component->dev, "mclk");
+	if (PTR_ERR(nau8824->mclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
index 5fcfc43dfc85..d8e19515133c 100644
--- a/sound/soc/codecs/nau8824.h
+++ b/sound/soc/codecs/nau8824.h
@@ -434,6 +434,7 @@ struct nau8824 {
 	struct snd_soc_jack *jack;
 	struct work_struct jdet_work;
 	struct semaphore jd_sem;
+	struct clk *mclk;
 	int fs;
 	int irq;
 	int resume_lock;
-- 
2.45.2

