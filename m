Received: from fallback18.i.mail.ru (fallback18.i.mail.ru [79.137.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86F2BB05;
	Mon,  1 Jul 2024 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719868620; cv=none; b=aueVN3OSqzr35Qiu69wkrcFOsSTwsN+zSs3r/X6buzt0yJzo2l3Xd/iKtcSCqoOWkrKsqtiGqhrkcyk05V0fv5P7sUwkeiwalqI7i01o2dcsVEoOQtcYNcCyOOqeYwG2/N3iISe6lYoFwZ9VtwY3qVDmGHbh2B5kihrRusrUkUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719868620; c=relaxed/simple;
	bh=3uy1q1I00JtZDOX21BnWa0Q7cjtU+TTWpXWV748Igt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gftdFdg9hFKwnOPhF5VR3YSeQv2p1WgboNmxkzjkEWnSS+pzL0R49Ul9sYQ2+442UufJI4NImsyQaPxMagrbt0M0xv041ln6Il4E3BzTDNRA7l9VNUvvMeq6VeaQDMCKov8MTw8zBM0vAk91peijaQU+lbB5chK/LgVlMPmbpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=gdUszjX+; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=YBkQZelM; arc=none smtp.client-ip=79.137.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="gdUszjX+";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="YBkQZelM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=sFgWIfMs0xoIMQw9IXDbgyrr3vk9/94ACpMKZVZhK6o=;
	t=1719868618;x=1719958618; 
	b=gdUszjX+YA0KCJZwMaOKgPRcZQ8ivCK8tQlDt3CKSuk86JlJnuR9T1geRtwVej6nQBzEK2HfaC/YTnvceerugXcOumZYVXZDqbN8X50bs5+fvKqnc1o0xOgRdD40S3HjK8e7chE8PK23KQeM5WDzbygQ7dheNf5qquEW/yYQvHYs/mupjyY5AueuGVXcZrFQCeMVor00T/guSqE1qKaL7Y6cRW3X91KMxDUqUNAERaSOck0LMmy9xwC91Zd9xlVVcnoIp+iZN+egwCH7pPThXX3PcPWDbmpXPM3Egifv5YZ/kYaYS8fHYsA/hL7qGdUQYiY+CVp9I+iHY+jGLlpPog==;
Received: from [10.12.4.37] (port=45226 helo=smtp61.i.mail.ru)
	by fallback18.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sOOOH-007hzV-Q5; Tue, 02 Jul 2024 00:16:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=sFgWIfMs0xoIMQw9IXDbgyrr3vk9/94ACpMKZVZhK6o=; t=1719868609; x=1719958609; 
	b=YBkQZelMtsXzGXzOg0SKYsxywQcFQPhpmixxIvCqeBUr+6MeHCtOFmH5jKBLncWEgieo7L8W17O
	Yg7UvygLCPa7Mqx8S3oLUJGPKwFSRbzmV6d8aqjT/HSbIkbKeh+78nyYV92pFFlJURE9XgO12gVo3
	dyJRpQi4H9rZnwgOkrNoHOHJMwWjeYuzwBTtM0+ij1YVWuh5TiIXIUWSLk9F897Zlbtiter8rl9kT
	qux9tqJppZt7oy+rhHSu0jeInKT2adZzYhLhAONjaZGoyDQHPMNHwgI5PCVreyWJDSNpr4yKvNLoV
	LFkYCzo5devzfT6/VpPJpv0EVXd8MxQi44Qg==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sOOO3-0000000HXqS-035B; Tue, 02 Jul 2024 00:16:35 +0300
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
Subject: [PATCH v3 0/2] Add master clock handling for nau8824
Date: Tue,  2 Jul 2024 00:16:20 +0300
Message-ID: <20240701211631.92384-1-fido_max@inbox.ru>
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
X-77F55803: 4F1203BC0FB41BD92EE09148F40C5446ED6AE8E79F10FAC9A00C41F324FD1478182A05F538085040ACD2589D9030AE9C89CEA9C911D099953E14ECB5C56879C0E597827C598CA07402FAF9720996C769
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C4A7E4C0BFE8628DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372E9841F416E2DCCD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82DB741A93B3CB90BD012B7F63A9194D3BF6D75D10A29B85520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FA18204E546F3947CCE135D2742255B35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370B730A9793D99025389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5105DA9812A5A97635002B1117B3ED6965FAB9B8092746FEC406406D89DD9EB8A823CB91A9FED034534781492E4B8EEADC0A73878EBD0941BC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAA417771BA057110F6448DD6630E738689BB76B209CF8A129B2F883581A88A5124DE828755D94EE99DF1169A732047E38579629537E4F8E9E936252639E45A3BE673792307AB8CCD146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW8Uhc2wOmDKWQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B21965CBC0E059640E0E5D55A3A4A88C5599580C8E0FACCDD90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4565E9E3B8D953FE21ECBD88C55622FA0E9F56EC15ECE38FF68F3CF0E9FE49B695C5F89FAF04D529353112B09C8C02CE7126864AC9C6DB6CA2836B3968E0EF14B
X-7FA49CB5: 0D63561A33F958A5314093FF323DB02AEF12BA240B9FDFD50C99F4336FDC3878CACD7DF95DA8FC8BD5E8D9A59859A8B6389ED70FDB73D44FCC7F00164DA146DAFE8445B8C89999728AA50765F79006371CE0A079F1B3D4BD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2B897A0B7B208E1F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE71D0063F52110EA4A731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW+2gnuYP+IG4A==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

nau8824 has external MCLK pin. So add enable/disable external clock
management.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
Changes in v3:
- move bindings before their users
- use devm_clk_get_optional()
- let clock API care about NULL ptr

Changes in v2:
- move the devm_clk_get() to the nau8824_read_device()


Maxim Kochetkov (2):
  ASoC: dt-bindings: nau8824: Add master clock handling
  ASoC: codecs: nau8824: Add master clock handling

 .../bindings/sound/nuvoton,nau8824.yaml       |  8 +++++++
 sound/soc/codecs/nau8824.c                    | 21 +++++++++++++++++--
 sound/soc/codecs/nau8824.h                    |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.45.2

