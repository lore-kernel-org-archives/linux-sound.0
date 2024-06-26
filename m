Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE22B2DA;
	Wed, 26 Jun 2024 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414934; cv=none; b=cDVMnufsbR8TlhKH1uEh6xvkCFoKlysRlDXuanB8QYEcIHqauWxpGr5hqY7oAhn16JdN48Ve5aZyfX2CTIDVkEjHsoVACOP1sjDH85PC3fmSCA0vc3FO2HobxvTyxpsyOOkcv04TEHxnpQonMu6QscCg85xGk0jOYNUkUcxJOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414934; c=relaxed/simple;
	bh=OeVyeBAKzs/4y1bxzS5DdMIxMZ2InGgIDPXxr9igdvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2Ue1PGQr63wb57b+fqIzl6nhIZyphOTtNjMctHjCvhZwdACETkkfsAG0+HoTEtlWY59lQUXLgyFuo8OVcJQJOWynOyExAHuy7CY0FUOyxNiyTS0WCHVaeXsN3y5F2Z0BqS6CgORHlTI5BMbm3In7JrOfE0K/V1f+ljHDI/cpg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=KqTqz1jY; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=XmSneLwJ; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="KqTqz1jY";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="XmSneLwJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=dxF648gxj3B9Omidvm2whmJGIvDn08s3vO+mWJ+BXng=;
	t=1719414932;x=1719504932; 
	b=KqTqz1jYtML/OrsFAu/1+uP4bolMMHSnByMTin3aG2UL0YVH0HdPhAB98yzBvWT0lN7LR4B8/NWTNYUjGw+n2IwZVL9tnxLr4CEXXU6GXQ4Ls47X1ERKEje3L52qiK4xDD6I3iheJzqBMTZA5plA2tKJo3cJCtHSV3prkfECT6N/jQnJmrt7KeQWcfEyfiEdYRMW5DVCbOBeqaXalmd4pMOqfZs0iK6SYf+ej3ymSZkEu+G1t2Cg+Pct7POr/gtw2QtbKobuvt21B5RORSggMC9VS+ebJzSs1WJ+JCAsLCl+HBSswI2tNz9LrE7ewH8tE0mAUcveA2QklTnYmnvIUw==;
Received: from [10.12.4.27] (port=33816 helo=smtp53.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMU8H-00B2qR-2c; Wed, 26 Jun 2024 18:00:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=dxF648gxj3B9Omidvm2whmJGIvDn08s3vO+mWJ+BXng=; t=1719414025; x=1719504025; 
	b=XmSneLwJga+5gnTvCf2EbYw9GcmBYTcliUmJ8OdHZzg/vXvcxlXhrn7hEeDRQmr/bMPxsXI2OeG
	vV4K6+6uFxCk/fBWFVaQ1ydKaPDgyBp0C8TZMYy2O8vk0fXNfx9R20GiX8RehZOa6uqUVfiq3+6Fh
	EMsuPzy2uUBAsMZnnpnBYO2RmLZ2kSZYg6yMYgsfKN6RU7+lloz7140B0oajT6hW1rig/Yf6TJ30A
	veFsHLzOWWtir7c30+nadzpHZOKoWnKD4lyj5+1EAoa+yLEW/J2mwdnCAMTmxiTiwkGLFZIELGP/1
	UJV65wwCevfXssLjxmiBTL28um6jTXw8VE2Q==;
Received: by exim-smtp-84f7fbf7d8-c7c8k with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMU7x-000000007Ow-3KSw; Wed, 26 Jun 2024 18:00:06 +0300
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
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: codecs: nau8824: Add master clock handling
Date: Wed, 26 Jun 2024 17:59:29 +0300
Message-ID: <20240626145931.25122-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626145931.25122-1-fido_max@inbox.ru>
References: <20240626145931.25122-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31FC5B54BF874E61D0114C6A87D8B6D27F6182A05F53808504094BB960E7B0081153DE06ABAFEAF67059BE1FF1D93998012A349DC5573309D55012184F85FB44711
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77545ECFDF1E157EBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377A06FA5CCF78F9BC8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86E4F98F89057007A58B7FB142A6C57706D003B8AD3E5443320879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C078FCF50C7EAF9C588941B15DA834481FA18204E546F3947CA7DFDF579AB090EFF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A508DE97438ECC554E5002B1117B3ED6966A3718912C43EA0E30E4A65F242F5898823CB91A9FED034534781492E4B8EEAD6804EF05EF4ADF2AF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFA14E7758F908F505FE6BABA54C349B0C2651CBCC52A9A36505E3A1517337EE7E66971B16C155F0C9443676941C84C1C8DA434089A13895A7A654F9AD099EF804C026D4239C57A204146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWooYFJycFIqV8g==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B59935C79194F79410534B403F2BB02FEDE1AABB7E7EBF47190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6AC98A6AF4E4FECC206049FFFDB7839CE9EA0123DB20CD7599C11B18C8DAC4108D960813AF0DF6ED2730D4276C549D21D09
X-7FA49CB5: 0D63561A33F958A570279B4CDC907CB830871E9D80E7D87DB0140AA5F50CE4EECACD7DF95DA8FC8BD5E8D9A59859A8B63033054805BDE987CC7F00164DA146DAFE8445B8C89999728AA50765F7900637436E42DEDF9DC02F9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3D6B3BA020039D4E8CC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E7350555CCFDA08FA3FAC4224003CC83647689D4C264860C145E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWopqBG7QJrW1Xg==
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

