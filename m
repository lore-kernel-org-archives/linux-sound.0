Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85134200C7;
	Fri, 28 Jun 2024 06:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719557404; cv=none; b=Y9Vuls57C7CAaU6WZtLLvvL8sRbwRvQYUAGmh9EqyhQRktASfMWA0ZfKuE9D1K9PgzmhRvR2cFhm1DRItHYJdvz5Rf1EKSeHjza4bGDsCee5AuzbJ/VHvCgUntjdGgrEYOTmkwMsX6xmEpzoXE3iWpJEP3wFK3rBHBhw0Ck6BFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719557404; c=relaxed/simple;
	bh=wXupM/sGCTMKIVg9zidcHBj/bXkZFYfzdldrhAQKGuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwkbRtiK7gBgVTQAqLE9bFh+VvvRsQmaOKmi9RdB2DMva+C94ujXJh8RuBm2j3opDxYkeZ+ESe3DYwbpGVYYaRSrNyhuzykbpzFBmOLvvVGwGD2v8AQ1K9oDMQT2LBBajQ04Oxrc9/hRKhfKafFJe9NgT27YGpsOZQ1yKyyC5Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=ADkaylFK; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=opo95j+4; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="ADkaylFK";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="opo95j+4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Z1gyLv0ESrMuuRJY5UN58Hh1+nv/oSXBLDcsbhVihBU=;
	t=1719557400;x=1719647400; 
	b=ADkaylFKLMSN45299yh8ZE1Dhe6McZOWkck3IcCljqwU5G7ZYZ1JpSMpYpiQxJNIKZ41fgmneBiQUxSuBvdungeDuECIdusF0bKTWwUMiIEbTJETGrNpBu6nZfovkInywZTrycM6Usy3bJf2NIOvK2OVcGtyKXRb2AmapZjV8QmiJAT8iq8KosAS+ebggvTXmKbOVD9KYvYDRB8c5EQM3Ae2VIuD4kJVfsdAnUKaczd70HLcqarA2RqoxenMmVDhmh2Nh+QeHy3CezBN8Yz+4gG7yMAo6aH5AbFj46Vq+//VP7oFasaoDEqgkzIMuAD7rbdtH8cANWls6yIpxNMq3g==;
Received: from [10.12.4.29] (port=47098 helo=smtp51.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sN4wg-008Jt8-0b; Fri, 28 Jun 2024 09:18:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Z1gyLv0ESrMuuRJY5UN58Hh1+nv/oSXBLDcsbhVihBU=; t=1719555534; x=1719645534; 
	b=opo95j+4vaDlzkIP9m35994tsWaueWA5S3lsPwUikhM05PY+IbHy5LSHD5NJoLE9KS+SXSuJO6+
	hkb9oIfo90iAR1Tp+IdVW7huWLqOCbCbSLWtp8Q37j6IdVdM+OMEJRvVIsiVM2pt/objK5LczUnbq
	OMIjCIwIB6hfdk2JFe/k1oppk4ol5zF3snRKwxNlJ7PCrB4Bv13raQjTfEKYvqiL6t5tBbA+so4lo
	VWdjr4rK0xr/dpqgEevaAmbKYb54i1eKZ6jiCW4DX4/Epc8nx2eI3cH/Y6/nHK/1PfovY9F3yzrXr
	g/MLm2fAvcTdjFsIoqueDJxxHxSBuWZrsVpg==;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sN4wQ-0000000DKRj-0z0S; Fri, 28 Jun 2024 09:18:39 +0300
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
Subject: [PATCH v2 1/2] ASoC: codecs: nau8824: Add master clock handling
Date: Fri, 28 Jun 2024 09:17:46 +0300
Message-ID: <20240628061750.11141-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628061750.11141-1-fido_max@inbox.ru>
References: <20240628061750.11141-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F96858D558BB6F8ECDBC1E4CBB32F923D0182A05F538085040C7E28C4B4DE50ECDAC8EDD30083ED68E60ACC50AC9A7B37E7BD3776DDB6887745488E5A83A4F5E58
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78EA80DE462DCD770EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375E7A1B5661595F038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C7FAB39B5BEC44226682DC0906D38882FE8B2F64B0C3E0DC20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F790063706586D6E6283AEAE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FA486DC37A503D0BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A50985828F7D6B0B8C5002B1117B3ED69632021838AFC2989D1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFE146DB16C4F81615CB7DD9278B494E9D69CBF862BFD67DF2B292CB58E7858F681545B20770F7F5D44A12D68860EECB79E1BE3578573AC86896C0CB3C25AE39F8F09A5C9E72996AE146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3mRPyj6SSyzBQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BAE739AF5F5FC55F1A12365E67D9B78B7C2B028ED107BAAEA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44E72EF7427BD9C0864826EF222902C20B25D5D0D96FCFCE0049FFFDB7839CE9EFDED2BF4F082F19521FDB7C0F278E5287119073A55FFC48201BB2F0AE0ED2083
X-7FA49CB5: 0D63561A33F958A5A3D335C8DC7B77EB04F44647FE0137FEFDF4DD0D389D1F7ACACD7DF95DA8FC8BD5E8D9A59859A8B63CA5754E60C5D220CC7F00164DA146DAFE8445B8C89999728AA50765F7900637844B52986258B1B1389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC861191FCD0E7B64B6F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE77DCDFB3399A2F72843847C11F186F3C59DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3lnz6ORH3cytg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/nau8824.c | 21 +++++++++++++++++++--
 sound/soc/codecs/nau8824.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index f92b95b21cae..7153b746f4b1 100644
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
 
@@ -1871,6 +1884,10 @@ static int nau8824_read_device_properties(struct device *dev,
 	if (ret)
 		nau8824->jack_eject_debounce = 1;
 
+	nau8824->mclk = devm_clk_get(dev, "mclk");
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

