Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162A016D9DC;
	Mon,  1 Jul 2024 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869221; cv=none; b=FwbP1U1YnDXGuWdzqBgf1kupt5S6QlUasLSfDxkSLz+Pdi5gRTrf6wDDiPz3yuDEIWA9wcvcs29Ok+JKmiyvMvl1tpvet9Bp4cNjlulaJlw8mL7HRSr8kv6W8ht7iaJz0i0RDdEkcMAyK4ZSfTD/22CZ9CXUkTSF4NMh4xaXgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869221; c=relaxed/simple;
	bh=FPURB7gNINrC8wkHbXgeqzcwCc0hYhVzAJwONXDpHpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijNqGtrUzIVBDT3hQhh3VBJZXZLSYEmcTEFQzGcdf7vqrM+xyRCLNd35Q0AFRci9JKrV1ZQasawKQQR7YF8BR93l/AyJsQaik5WY0IGD6YwjJzSyjgdfTzYGQBcxaBcbvfvVV+4ejEF8SsbzngAMMIDYoljnJLcfhj5jR7tB6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=ipzhGARe; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=vbeHfaGU; arc=none smtp.client-ip=79.137.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="ipzhGARe";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="vbeHfaGU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=0EFDVOisnfDeUARgFLVX7SY2WERRcU2n7g4Z1HR42N0=;
	t=1719869218;x=1719959218; 
	b=ipzhGAReua01m+xly4O4XEW6ZXLKsQLHf0FnJ5WgIs2/r1PzRIYuVzoTGLipSL2hiWJc2nFlaIhaQVjum4l2rg4NKS5HU+9fCJsXp1zhu6ldV60Lku6HK0b7JHkfA7I5Vnp6vnR/UpiWkP4iUSUH20HxVNiy4xrCENN/1yYtSI9nUObEG/91ErYYbeJVu32NrHCa5+F8NBl9XhR9cdccS6dB2tR9kUFqXNunr6pt6bCpHrgPGS97wHk1tNkLFANKnpaiS11TlQKO1cGDBE2Nw5KS1yLz29SQfXusOBmuGxhczK9IFsBgimBQbVx33HKGAXCvW9edZeAs9KBbthrZ1g==;
Received: from [10.12.4.37] (port=53700 helo=smtp61.i.mail.ru)
	by fallback20.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sOOOK-00Dmnw-2C; Tue, 02 Jul 2024 00:16:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=0EFDVOisnfDeUARgFLVX7SY2WERRcU2n7g4Z1HR42N0=; t=1719868612; x=1719958612; 
	b=vbeHfaGU28X6v1pTDn5WlDFC8CHhiYeJIXPeKqYg45HCeqcErEZ4YMyHKgQdojYGxU/4c4NK+Gz
	xDQ6l65JgLxFgmiZRUTqt/LrCYz9qW54K4d/7Q3oPYdvwBuEtOE5hO3uFktrkFIOBxUA+VSssGWxM
	PRFOPKfjDJb+7xtPp/oz2zMmPMm6gO/0NmOUQ7faV6y5NrXbNTwKIXXV6GUsBZLMnwa7l4ot2/jHc
	qa8Zhgx4OCzBp6nh0St4J/nUogruM1ZY+7VB6DSXIlebW+oYOS5ZSLeFiT8YPOWzpN9rMq0vcmmng
	bUBUzeAysO7KKogH00Brko+VRQRefEHWfdIQ==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sOOO6-0000000HXqS-0kbJ; Tue, 02 Jul 2024 00:16:38 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Hsu <KCHSU0@nuvoton.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 2/2] ASoC: codecs: nau8824: Add master clock handling
Date: Tue,  2 Jul 2024 00:16:22 +0300
Message-ID: <20240701211631.92384-3-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701211631.92384-1-fido_max@inbox.ru>
References: <20240701211631.92384-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92EE09148F40C5446A7FAE8DCEC8B7EB8BCFECBD40676ED7F182A05F538085040F2FC769EDF2A425789CEA9C911D09995FEC9FDF3516C4286E597827C598CA0741BB5EE8A55BF1B9C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73C714006C69EB7BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375D8840FA58F505298638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8553737D154D544C9D012B7F63A9194D3F5ED2851CEA6C6E720879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0DCF4F0DC832992758941B15DA834481FA18204E546F3947CBC0ADEB1C81BB362F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F7900637B8FA30D9455089A722CA9DD8327EE4930A3850AC1BE2E73542F54486E6D6388DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A59CD1649BB2102F735002B1117B3ED6969B8061BD9E0DC36072305013E4AE841E823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF61160E4A2A59F8405DDCFE73700EBB0CBAFA4DCB9B2220B81237FE46B0A9C623FA89AC6828CC40489DF1169A732047E3D8E5EF67D927D99AE936252639E45A3B8D0EF07D98ED38C9146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW8WA9HlViieRw==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BAAD3EAE657EF211AE0E5D55A3A4A88C596C95C018F9D311590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4565E9E3B8D953FE222B390E25CEC1621097B07B2FBA41A7E68F3CF0E9FE49B695C5F89FAF04D5293B68E3481FF0F6EB38F18041144FC40D5AF98EED5D2D8118C
X-7FA49CB5: 0D63561A33F958A5E175C4CF306AE754DC3B88536E1C515240FCC470D1F7955BCACD7DF95DA8FC8BD5E8D9A59859A8B697E92A89321C69D7CC7F00164DA146DAFE8445B8C89999728AA50765F7900637D2EF2B06A5A374C9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8DE97B91745A5E329F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE71D0063F52110EA4A731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW99VsX7R0I5uA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/nau8824.c | 21 +++++++++++++++++++--
 sound/soc/codecs/nau8824.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index f92b95b21cae..12540397fd4d 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -506,6 +506,7 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
 	struct regmap *regmap = nau8824->regmap;
 	unsigned int value;
 	bool clk_fll, error;
+	int ret;
 
 	if (SND_SOC_DAPM_EVENT_OFF(event)) {
 		dev_dbg(nau8824->dev, "system clock control : POWER OFF\n");
@@ -520,8 +521,15 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
 		} else {
 			nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, 0);
 		}
+
+		clk_disable_unprepare(nau8824->mclk);
 	} else {
 		dev_dbg(nau8824->dev, "system clock control : POWER ON\n");
+
+		ret = clk_prepare_enable(nau8824->mclk);
+		if (ret)
+			return ret;
+
 		/* Check the clock source setting is proper or not
 		 * no matter the source is from FLL or MCLK.
 		 */
@@ -563,16 +571,21 @@ static int dmic_clock_control(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	int src;
+	unsigned int freq;
+
+	freq = clk_get_rate(nau8824->mclk);
+	if (!freq)
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
 
@@ -1871,6 +1884,10 @@ static int nau8824_read_device_properties(struct device *dev,
 	if (ret)
 		nau8824->jack_eject_debounce = 1;
 
+	nau8824->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(nau8824->mclk))
+		return PTR_ERR(nau8824->mclk);
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

