Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C499B185E52;
	Wed, 26 Jun 2024 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414301; cv=none; b=Us4fpORbh3soF05hokE40Kx4opUaAEgM4wX7BYCcbWdInWr+c4JqEy6h7bhdmS8oA8kjsVVBXp6UvfR+A87HkcgGq4aIlgE4rEDmmRqk4yn+v+LeNYpIBtpqo9RKmfI+PJCc0yMD/jrchNB6kLtZdmveSGnoMcgonzOdEjseqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414301; c=relaxed/simple;
	bh=ZGHpU2mK6LnO2Jxl+CqhYMo9BSGbEhn6NgP1Aqn63iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEvLdwHPcizOOG0261+MWl9o0TRJ0FWWkoNiR3xUY4yK8mT5S0ik8VfOUpLH6+KP/lM0d/8KV59OFTVpoXzJVlKhZhqwZrzdvh66V8j6g3mUMB9YNDw0qeNHIsexBuN1mHvIaMNi3fnvpHf5F5V1bVoUmn4HlpSFokHk9Tr6srA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=b/vgqZOh; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=u+8YAEo+; arc=none smtp.client-ip=79.137.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="b/vgqZOh";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="u+8YAEo+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=kjIQc7jeZaVYEiwPdh4XTzlvgv05UxecfDBnXhnpxZk=;
	t=1719414298;x=1719504298; 
	b=b/vgqZOheM9//ZHR8V51X1j1Ft1UH+2+jIiSZuwCVV/NGI4wBGh406942xFzB/AfAGBAA2Qtk0foui/MLsL1AHMGN3DgiTiiWrqa8PH0LSg7Vu4Kw/VzwrQFkqsGEjTCBhGu5ms9/EZjDCpZZAAxqKgZGaTWLJsxdaNSVMluC3VdGKEb6lRjPt1a+8TYfWtHvslKhAqCiAf7Ew7PTqGFD+Q2g/esymJrLK+IK2AXDtwcRofmfDBf8TWmrWDS7CuZaJN7iEXcXFjLpXzJTjR+5XSbMf0GTQ7+6YI339DhNCennfgTcLtMbmrqWEMqY3IIGfbWxa7G8LOW47b2Te5Dkg==;
Received: from [10.12.4.33] (port=54830 helo=smtp58.i.mail.ru)
	by fallback1.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMTYd-00DxQ8-JA; Wed, 26 Jun 2024 17:23:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=kjIQc7jeZaVYEiwPdh4XTzlvgv05UxecfDBnXhnpxZk=; t=1719411815; x=1719501815; 
	b=u+8YAEo+SBjZwwB1qeifq1z0FUcw1J+4mshgOFOTTbn2Ga+tyu3hGOIamb8COq3d/Of+WLzPj6x
	/Dncna1lq8Q1G++sH8SWEnovKKlprrBZGLNUbpMmv/39O5GUhZZ8BPctUcIyW3SMjj1PfuBcdN83H
	3ZpaC7wJMpnUmpSrurEdauXGSN9QANof7bk2+4Qr53GGGhU4pWPvMHAW2oipoG7OP+EaFpOtl8fIL
	hzHP/OCVOdfDoOol7vp+FCpfHEiQpPAfaNbbh42uYviL9rjfFNfX+TYnfpqf7gp75D8Y1VHVac2i1
	FoKsAo8w8TmsQVKY6fxnfIw9A+1PpKMHmdaA==;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMTYF-00000003pHy-2Etb; Wed, 26 Jun 2024 17:23:12 +0300
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
Subject: [PATCH 0/2] Add master clock handling for nau8824
Date: Wed, 26 Jun 2024 17:22:54 +0300
Message-ID: <20240626142259.21608-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31FE95A5D547D219D00F4630BB0E839A018182A05F538085040A96E5B031498B355A6D5EE0DB6E1EC8D905AF360A394B343B9143B39FE1528AA285C021E7E0FF4E2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E50EC9128971FD6EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727BBC20C3D5F36038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80545DA1402C0D37466CD5431CE238EE8E1B1733C77635C7120879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C06030C3405640F6718941B15DA834481FA18204E546F3947CC2B5EEE3591E0D35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063706C07FE7DDBB4AB7389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7356436AE5DD6441DC7C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A54D4E170ACA0FBF775002B1117B3ED696CCA99AE81B3A8E2A361FAC1196A180DE823CB91A9FED034534781492E4B8EEAD577AE849BCD98940C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4AEE0A9E6E197997319919EFC76C0EF7A59577C50A0A7102C5FFF87E0D2C559D45CF0F9AF1251E13443676941C84C1C85CDCD43B5D3B8BF2236B3925D264D5F749DA116B25652720E4FDFA4A036B0C3902C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoobqGKCNZ5mAA==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B750B0A609C864255A935B69EAD79682142167D3E90D87E6490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6AC2526B97F9CA12610049FFFDB7839CE9EA0123DB20CD7599C748E1CA8E2C4DD4D88ED067FAA3FF502F0FCCC2CBAEF1B50
X-7FA49CB5: 0D63561A33F958A5645FB26CEB28F4B5783517F84447E0CEDECA2EB4243E295ECACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006379F47EB75722646729FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3B7CC44DA769F8E26CC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E735DD0078234547CCE7C4224003CC83647689D4C264860C145E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWopvUSfYACKDvg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

nau8824 has external MCLK pin. So add enable/disable external clock
management.

Maxim Kochetkov (2):
  ASoC: codecs: nau8824: Add master clock handling
  ASoC: dt-bindings: nau8824: Add master clock handling

 .../bindings/sound/nuvoton,nau8824.yaml       |  8 +++++++
 sound/soc/codecs/nau8824.c                    | 21 +++++++++++++++++--
 sound/soc/codecs/nau8824.h                    |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.45.2

