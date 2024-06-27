Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29F17E9;
	Thu, 27 Jun 2024 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719468934; cv=none; b=s5Ao2djl9VvSsYYslilE9ieYEH2MZYs1UMpgsHX1//+9cdMKyho4pIKauBcWQSba+rLN7XzecAOjV1hUDcs2/zWNu+t399HjggLBi4bmPrQtsLMgGF75mKPfQIcY4v4gf8yhzq5yyJqRl0BQISRoQYR7CXXHkg4npxVeA9h8dFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719468934; c=relaxed/simple;
	bh=yn1EXQ33os732gYNCftBCiSlAe05r4zpnGb7T8V2XmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R87xR8xC1cfgIwWu0CZh1+yK50ILLC9UsuGZnTSDqxIWAfIbnCg4359MIF9HRE4R+4P3Z5evSTcArPLTPC1kxpf6kLekEBN5R7mFG1NrJG6bnvdaFRS/N213Gm36o/SklcpG5Hc/GdHtOmQP+4U+527Cop+YbhAE8mZgC1GBpzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=V5D39aCy; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=QY25sMCC; arc=none smtp.client-ip=79.137.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="V5D39aCy";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="QY25sMCC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=YvwWvKWbkaWStnEiMFA8kYmzXbyPKBVBYZ5S12a/KBg=;
	t=1719468930;x=1719558930; 
	b=V5D39aCyTfAX6h4m9GoVwyxvGfnWXFdM4BiQ0QGSQcfYBWVsYuUduwyHXaT1gWrxUWbZgacpnNFmRVR62PaA+cMMYdD8fkOH3G8ptkXDge+kZ3TqUOspbI5Y0fY73X78uSVJGN/vdmKsjlJa9NG58+mtFM3fHpuw5QEim7F5puqe+ui5BFxsfYCrjN/OR1Dggprukds2SLgyHUWom2um0f7p47GjCHrZlwyEOd87/QQOb7cV74FGD5d9cqVvUjKzmOt87iMkWitcAutGIYjQFGAXL4LWh6v3ojd/9GeZTQHw0TEpiHEUKQPZbagscOyTPop8lf5MbBnFL4krCoCroA==;
Received: from [10.12.4.8] (port=37634 helo=smtp35.i.mail.ru)
	by fallback2.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMiPo-006ynb-9p; Thu, 27 Jun 2024 09:15:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=YvwWvKWbkaWStnEiMFA8kYmzXbyPKBVBYZ5S12a/KBg=; t=1719468928; x=1719558928; 
	b=QY25sMCCpGgA3WpvD8sTuvl0LCTOvEdlVpKesVz9RrP75kv9ILM71bfMwj1Yzq5ywK+1y71cBy/
	6oSDbvOdqEaX69RysjZkppOTdrY8v3vWfcAzepoL3y+i8EvGKsXeHdqtt8jNB7PWdLcsEG8zLzneK
	L4LGZ3PDETiq3GCBfyOn1r7Ujtsr1I8O15TLS0pXlq97xHSABfJ/yV1YVdmR+poexw8RZsioKuv0P
	dR6jXurkmDPnHmhBwqfWsiefiW0KW51pl6+YSVZS2PcG0U08vO8EQQ1b0gyODtfyS8TMUV8TAPLZj
	BNCEJn9X7J36cZOnDAk6cui8gICif6bDCkqg==;
Received: by exim-smtp-84f7fbf7d8-hgbp6 with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMiPX-000000008C2-2oWL; Thu, 27 Jun 2024 09:15:12 +0300
Message-ID: <920995ce-9913-4fd4-aa54-2c5d60bac03b@inbox.ru>
Date: Thu, 27 Jun 2024 09:15:10 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: nau8824: Add master clock handling
To: AS50 KCHSU0 <kchsu0@nuvoton.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lin <ctlin0@nuvoton.com>,
 Seven Lee <wtli@nuvoton.com>, Wallace Lin <sjlin0@nuvoton.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20240626145931.25122-1-fido_max@inbox.ru>
 <20240626145931.25122-2-fido_max@inbox.ru>
 <30267661-fec3-ec5c-4973-8b2013f14056@nuvoton.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <30267661-fec3-ec5c-4973-8b2013f14056@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31F1F92A1EFA9339B6F13BB3ED69C1CEC2D182A05F5380850402F8F1B328E395C4A3DE06ABAFEAF670550096AF54BC23A5CEDBD76CFFC2372100009D0EC9FC8B3C9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A4C4638C9DDF45FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BC4B0F5721B555078638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D891E17E1EDA14ED313A31D7088E697C7A263CC7B33B595DFE20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947C062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735E4A630A5B664A4FFC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A520D77219636251CE5002B1117B3ED696BDCFAFB884F138F5A9DAB4B68AE4D22F823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF0DF3AADD24675CB0C318DB682A04B147C73544D50CF578BB89A015165E8B947C80BEFAEC9D272008443676941C84C1C84A7CEF38EA62B6ACBD14DE81B3D0697273A32D8B02A34957F37A8DA3E9B01C3902C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWooCpS6sRoHegQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B7633336BEC2AC87DD47657217676579CD31CAF3E9C4EBF1190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6AC92B7FC994171670D049FFFDB7839CE9EA0123DB20CD7599CEEDC89F4C79789510E9446EBF000EE814D5AD6EFBE8F0543
X-7FA49CB5: 0D63561A33F958A551E9A0CB264D7ABD06067154CC96251686E870AA18C8055DCACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006372255A60090D554F4389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8DA7BFA4571439BB2F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE778B471BB9634AD8A731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWooULYVx5qCNhA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

27.06.2024 03:44, AS50 KCHSU0 wrote:

>>
>> +       nau8824->mclk = devm_clk_get(component->dev, "mclk");
>> +       if (PTR_ERR(nau8824->mclk) == -EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>>          return 0;
>>   }
> 
> Would it be better to move the retrieval of mclk property to the
> function nau8824_read_device_properties? All properties can be read
> together.

Sure. I will do it in V2.

