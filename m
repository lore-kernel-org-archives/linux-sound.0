Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD4187572;
	Wed, 26 Jun 2024 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414033; cv=none; b=p75VVfUx01JRf8Y7uiBwnWoxNNjpoRz6yf+gC9SIniMxE3L4AdgwtPEwm4BFX6Ugailga4IIJzACyvzNWXHYWj997h6gkLJ7Syku840knxGj4SwpzmfWAapcnmJGmf19vPXIZ4cH/R7T8qH1TKS8tK8m+BPrHK2vYMcHGioE26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414033; c=relaxed/simple;
	bh=CCYJOjVFV72eQ++meXn+5CmTr90D7pypumqlYRG0TRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+rGo2kQkFgJSP+a/L/pxyyuvA0kuGY5GwbCG/M4dUxOjrFK2SYXHAwGEwRRanfnTrY3X0mHF7mRRUvzbhhTkXoaPzW3Vx01O7qMqCMSG1w2s930VSmvSqTu/Vq0qLbiQLLDiWwea3IpLuzA2rye6gHZYXUrxjxCqsSdjvVCgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=h3d+/SII; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=WN5HbpQj; arc=none smtp.client-ip=79.137.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="h3d+/SII";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="WN5HbpQj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=tYxOvltrA30hHNMLKHjnacM9wzigGdQlst2vhd5Nm7Q=;
	t=1719414031;x=1719504031; 
	b=h3d+/SIIGoyN4tSm3TAUkZ/qvb8jV17uJ8KPPyhEg6jTmajYy+tS1OyNv78tLF8hch9TDs9xsHbGIVIuXQeuPfYinBnOJMTZeh/zuWwphJx30BIbflAV+Q7hmiAHTK4t2hJScg2B7x3G+N1AHpR5mB0P1zLpaz3AdTph5P+s4kSMYrFGoiGd2Sz0ouvmMv/gF2cW45wrPayKXoI4uNc9E7uNYiC1hf1rCNlARDFxdW/6W1Lll7KvdqkJWeVvzz6cFk6ThG7sD5aIdlVvTnkEHeYJjdjM00nRNAANkUrjEhdPnMLeJ1X1t/9mILE3yvjJiNgO5qr0K9eXwNuuPcEgpw==;
Received: from [10.12.4.20] (port=60720 helo=smtp44.i.mail.ru)
	by fallback2.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMU8H-00CY2K-Fw; Wed, 26 Jun 2024 18:00:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=tYxOvltrA30hHNMLKHjnacM9wzigGdQlst2vhd5Nm7Q=; t=1719414025; x=1719504025; 
	b=WN5HbpQjae2HA+K4462tBXN24Rowh9aCzRi/7HEliMDvDNXo9XvcDjV4d/rbyJdqxko561gev51
	kwaVJicZpmCIUmr2QrrY7W9oEiENONy7gYz8ZqYGC+NTSYFU61foF1vV3kraoxhLhwd2mQILQn6uH
	iTbrlFb7j2ZVbpme5Vbd2NeuQ7n7SZnC4H/dc9yeijIFGWQk3xvYEitVulv2sol/Cu66PNWlTCQIT
	5suGdI7hE3wPFBciRaJjtf05BHiS8tQpjnXFjYs342Wz9z88p3qtsuoYaHpuL0JFf+JYtJUaJ2Hqq
	IZ0al93qCvwCCEZPaM7fy7/3RD9i4NCTDW6w==;
Received: by exim-smtp-84f7fbf7d8-c7c8k with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMU7z-000000007Ow-0VC7; Wed, 26 Jun 2024 18:00:07 +0300
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
Subject: [PATCH 2/2] ASoC: dt-bindings: nau8824: Add master clock handling
Date: Wed, 26 Jun 2024 17:59:30 +0300
Message-ID: <20240626145931.25122-3-fido_max@inbox.ru>
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
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31FA5E152DC617FFDC37660A00524814A67182A05F5380850401D703743B63DBF763DE06ABAFEAF6705794202B1EA8E8611A349DC5573309D5528006A18B89A766F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063752AC809489EC5B9C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E5F31A6B4056F61658B7FB142A6C5770A26E9AE8CE7D4B9320879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F79006377C70927E34808485389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC89E541A154B51D14BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A52D7602D3FBE782CE5002B1117B3ED696CCB26F4170AF7D3FC66B2B37046EC955823CB91A9FED034534781492E4B8EEADB71243024C627CEAC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF467B3235B4E0BC29CC6E057EFA32E7B6585E8C317849DBA961A7401D5F07184C711F655CCE117FA3443676941C84C1C83D57CA240CBA9F4AA654F9AD099EF804D2032A9D9A44A225146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoriMAkFf19jVQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BDE1D5D6BB9FC814B0534B403F2BB02FE65B72C4B0EFCDFDD90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6AC808063995AD4E39D049FFFDB7839CE9EA0123DB20CD7599CD6FA0DA965E278DDB0F16C3871DCC2080D4276C549D21D09
X-7FA49CB5: 0D63561A33F958A570279B4CDC907CB85CFBE178A8A02B1A87108CC2C650B8C4CACD7DF95DA8FC8BD5E8D9A59859A8B65FF0BFC5AEE34BE6CC7F00164DA146DAFE8445B8C89999728AA50765F7900637889750A55773577B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8BA7556051D6825FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE76515C59FC18CEA6D731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWopqBG7QJrW1Xg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 .../devicetree/bindings/sound/nuvoton,nau8824.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
index 3dbf438c3841..232dc16a94a3 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
@@ -23,6 +23,14 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    items:
+      - description: The phandle of the master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   interrupts:
     maxItems: 1
 
-- 
2.45.2

