Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF33186E3A;
	Wed, 26 Jun 2024 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414238; cv=none; b=kWCghTwrS86IxJK0jD0LlvYEbmQP4esNXlsA0B/I6wqNKLAnGJ6vM5rBnMukE1rtzGoi4poP/XZzdrDCeZAedZTzK3kjZbe6vPEFH2sAH7IlibwVSnH0K3LcUkm5s4bfgQR3V3mlCXEqT132i9+3lZ81t9LPCn590O+CbDftoJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414238; c=relaxed/simple;
	bh=CCYJOjVFV72eQ++meXn+5CmTr90D7pypumqlYRG0TRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9qP+ye0cJBStbj/ecYyEkCXEqfJ+p8CNSrwVPdINIx0tBbeLw5NhohwVQSPljXk1fJPjuJHrMSjBqPvtjXFkSV7IvE7M37qeWoQgIWW1AWZhsEjiWERez+W/Y8kAZmZjOJVzkEoiiSeI03+X6GycPM8KKEw0BwyOIGnthdCejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=v9C5Qe0s; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=rKSUcZDP; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="v9C5Qe0s";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="rKSUcZDP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=tYxOvltrA30hHNMLKHjnacM9wzigGdQlst2vhd5Nm7Q=;
	t=1719414235;x=1719504235; 
	b=v9C5Qe0sUmvlo4C2TSrqIrsQAE1u//l4fITuPpj2SGJ5jWtxhrRC1tBCZcpIQbdAstDFd+PJ5orcVpc1V86VUGCWXbM2zV+jqITnyvSLfXKMKQbG+q3Ce7+jQOgo9Rvt8+tYIKh+B7X7lNRywnx8hDsnUSTjxH4ChWoNJkUB5/0jotDTKF+7V+4FXBslJwEZ19+9NQ4qnDuumnNT1x32dMSjzrrpw+1KRNR51VFJ98ULyJceCedrkG3jKFferxCaFVUD5qub2qUN9Q3qsROWDDEO83gTXUe5acv7mbviZTIvZC/yGrTCWXhZINuaNBDMt5NDSTWbQFyXmWHt5zjV+g==;
Received: from [10.12.4.33] (port=51458 helo=smtp58.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMTYX-005RhL-Cm; Wed, 26 Jun 2024 17:23:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=tYxOvltrA30hHNMLKHjnacM9wzigGdQlst2vhd5Nm7Q=; t=1719411809; x=1719501809; 
	b=rKSUcZDPnmE2yJst3fVcORpnOy7RdF3aLwJKf6VZN9LOgASlRfJZfkuiiFY96gBOS6yU+G7W6Ro
	XE9+y1yc8I0KPdAqgs7WLDa45mLgDfO9gI/144toBvxsbNYOEKzuyuIcC65cCYDSNTP0sWZDQGula
	Y1DijpSMbSoqNB66YPExKmgE9NY1Slq4VGC1YTZpp5l5LiMRwxta9GYR9ccGB7vR6TA5VVuxF+N0e
	lv/rEwKg617xAEiW7sB3l9nEhMkEJc8Bv6mNX1dFvfgJlZ1HLkyCn9vTfACLuZyfJXW5CZ+t+/szo
	cG3n89Kk+pPCO+Ii7ITzDskNyQ1C4TTtnwDQ==;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMTYN-00000003pHy-1364; Wed, 26 Jun 2024 17:23:19 +0300
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
Subject: [PATCH 2/2] ASoC: dt-bindings: nau8824: Add master clock handling
Date: Wed, 26 Jun 2024 17:22:56 +0300
Message-ID: <20240626142259.21608-3-fido_max@inbox.ru>
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
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31F73B686AE539CEBFA1B46C6F320A82FE6182A05F5380850403DB3F8EBDA18B05BA6D5EE0DB6E1EC8D4C004C614E0EB4D0B9143B39FE1528AA66B8565FC0A35870
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637651D61939D0B3DD78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8AAF5CC69E66E4A2C66CD5431CE238EE8B3A45A7657C38FD920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0ECC8AC47CD0EDEFF8941B15DA834481FA18204E546F3947CFA486DC37A503D0BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063710E79982F6CB68F9389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73525A4AB119743A3B3C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5BB8EACFDE19A467E5002B1117B3ED696F9A99E012D8C49FDE41E333F9D1358D5823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF467B3235B4E0BC29CC6E057EFA32E7B6585E8C317849DBA961A7401D5F07184C711F655CCE117FA3443676941C84C1C8837E7BC5D7BD9DE7236B3925D264D5F76AB564C9DC938C09E4FDFA4A036B0C3902C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWopNp5NE7WFt4Q==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BC05603238EDCBD8DA935B69EAD7968215B01829C1040620190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6ACA47293E4A4445725049FFFDB7839CE9EA0123DB20CD7599C504289D98FC8FFB8A6507EA05958ED2CE6B89BAB6E96C80C
X-7FA49CB5: 0D63561A33F958A57A1267E8E8685564B7030136389B16FA3981657EB93612D1CACD7DF95DA8FC8BD5E8D9A59859A8B6DA33821E755670D8CC7F00164DA146DAFE8445B8C89999728AA50765F7900637889750A55773577B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8BA7556051D6825FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE797E1AC076310AD62731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoplaCnMdWWHwQ==
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

