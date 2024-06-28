Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C0D299;
	Fri, 28 Jun 2024 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719556953; cv=none; b=eFuCzrWKwIpc/cAPojI709fdG47V5wqdNkZdfaRGtrT6uKji3WZXnH0L0RG4T3d8gkH0LLizGqjxaysqxmX8vUPO6x/D1hOcpyCK2swKLQ05fJWmJrgNrRHgA/CSdQ8+MAGvUPTcHPAjnYfYsZXq/3qregfrxAzARRMy/1ZfITc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719556953; c=relaxed/simple;
	bh=CCYJOjVFV72eQ++meXn+5CmTr90D7pypumqlYRG0TRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmBolRWBKW+GtOFnPNyNe8duHF+8dS4lu8DqyF+AnYfDOURe+mekY6ap5fISrzG1HnNDHVLWAyPpoowbE1crsfkUh2z3MzNJadQuTW/saIcJkB4HT4pP2KyuwSArViSej/+AbNHFk5UL6Q6QqOYcEDR93goOtFY9ZkGMKQ64Ctc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=WPJbCk3+; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=rVYVJBXr; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="WPJbCk3+";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="rVYVJBXr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=tYxOvltrA30hHNMLKHjnacM9wzigGdQlst2vhd5Nm7Q=;
	t=1719556951;x=1719646951; 
	b=WPJbCk3+KLtXkdmxov2yJbcSu4Fv2FYMKd97ZZ7m25SuH+tZsYZNYREx4cWJBwlqQFwBRNfWgnd58fBOlGTXc1I/xarrsnKMP1twHaX60eh491HX1FmKNeOu5NiUbBsq/U4LOTbpymAo0xyxVcv7S39Va0XvMxuVrKM9ECTPIEjWlIJoNte9as1DGBPr3vH8H1rTQKGmC4aXvqJrPKggNxa0do6ukVjlPI0krhO6EJ3/JDN0w2hIdqA9/OOWEdhfFLvVC/MaS3zvnoAQ1w3hbSe/qpod1IbRP/+OlG0ra9vJcldzcjp7aVzTo20B1XPhWcxOZtQun88orptu98g1gA==;
Received: from [10.12.4.29] (port=49992 helo=smtp51.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sN4wg-001Jph-Jt; Fri, 28 Jun 2024 09:18:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=tYxOvltrA30hHNMLKHjnacM9wzigGdQlst2vhd5Nm7Q=; t=1719555534; x=1719645534; 
	b=rVYVJBXrlYctNoURlQG7sH2XJwN7Yno3kwwCNzVz4BCVrP/EqZPFI9x+IcajJy050xHaM8UKXe8
	fonTvnxzkHb12jc6YoDRoSUklExSyP5bPXf/bnxTOLFuQAo5i1lYMxGnA8d4IUKsfT5uHgH8aLoRz
	PbStyUoHEskjvcK+zvr5PjkDKqsHbmmc7PckoEnUoIAt3hrSuGwggYyPmdetoztmzZaBu8NA6oK74
	srTvlF9Yi+8ahuzjSFpd7fZr3DQtxQ9UvKclTGe1iKy6X4dthfag4NinkJlmRUbgmTziyJ8prFOmg
	GjS7dVBUduQpla2dlRryJAwshZ/xACZV6wDw==;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sN4wR-0000000DKRj-3wLX; Fri, 28 Jun 2024 09:18:40 +0300
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
Subject: [PATCH v2 2/2] ASoC: dt-bindings: nau8824: Add master clock handling
Date: Fri, 28 Jun 2024 09:17:47 +0300
Message-ID: <20240628061750.11141-3-fido_max@inbox.ru>
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
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD97C71CE65BD8BD11AB987BBA14BC810777131E0DE46F93A6A182A05F5380850404C228DA9ACA6FE277E4FD14EAA9CF763AC8EDD30083ED68EE8D89A78EEC7F1AD7BD3776DDB6887745ACDA9D15A5ECDEF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378F586D843116CFB2EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F369DF47D8099E7136A597DE0F6DDF699C87966859F48BF75331DF9E95F17B0083B26EA987F6312C9EC9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7D9442B0B5983000E8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6D07623A0E6354027CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166176DF2183F8FC7C04E672349037D5FA5725E5C173C3A84C3335407143AA9223635872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A511E423A653B73F435002B1117B3ED6967C74CCF4891D97EB886DC9BC01168B20823CB91A9FED034534781492E4B8EEAD05E80F4396618BB2C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1BCF54096E4D919572604C5F68A978C0FD4CF48868B73570872E01B69C5F633A80C7DAD1783D929B44A12D68860EECB7F9916180378C5D0D896C0CB3C25AE39F55BFE451C82EF709146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3k171cwe9KjCA==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B23491F84E0F7D155A12365E67D9B78B7823688C44C93D6BA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44E72EF7427BD9C0864826EF222902C20555BB764A7B931BC049FFFDB7839CE9EFDED2BF4F082F19567B06A93D4E8A8F700FAD1B8789BD8D801BB2F0AE0ED2083
X-7FA49CB5: 0D63561A33F958A5A3D335C8DC7B77EB94FEC7F6CD0D10DD803FF06393FD0795CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F7900637889750A55773577B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8BA7556051D6825FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE77DCDFB3399A2F72843847C11F186F3C59DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3lnz6ORH3cytg==
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

