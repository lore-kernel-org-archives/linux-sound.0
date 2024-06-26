Received: from fallback18.i.mail.ru (fallback18.i.mail.ru [79.137.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33661194082;
	Wed, 26 Jun 2024 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417734; cv=none; b=R716Vy8Ea8xCRkfVER+kSBn4km/XJqetTl1TY+8JoFGYjBXnIzqOM3Yy4PqN/b6VMvyInggeoDPqwB06MQoLFbaEPr3WtRHKdu0gKR+RQ/E1juvcKo79y1kTiC3TkkzOJ40YtmI/PT21Eqk0NrH7sflZcoEIySNxYlbtE9KJbLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417734; c=relaxed/simple;
	bh=Wx64qhe1qZdNI9piuDe/1BE9IJ2u7wuWxsCaqg+8skI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOUSiLlx9hMgk3X48lW8i5ffZ+WFljUTY8w2GMK51IzBB30lKOXzXbgGI2Kktss/8wkB1QZrNGOzB5sPFGKBauD+3JBJNTFjTWry07sHyoTMZCf10Y6cX5RbFOIf4a3yPYQ4gUr9175UdXzEfV4QMYS2LvCRSThyGX6jkqlR9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=gzIqDt4s; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=Xbo6ZH9T; arc=none smtp.client-ip=79.137.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="gzIqDt4s";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="Xbo6ZH9T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=+4L+aoviuewCB9omo/DsrXB1B/JwKXRXhHS412MaR/M=;
	t=1719417731;x=1719507731; 
	b=gzIqDt4sfgAVQ02r1sTTsnaumYSoEb3kp31ycHSzyDg9vfg/WTwjzqe7/vV25SXpgTzqU4JkSeUC62iP93OcysjMVw3myZzEh+aq1vxzk8qUfa0+N2aeGwpAVnvl/7USADKbwk2dBGwQymbKMo64DFRmgYCFAyjkldISrq0bLoSYklwmHzjSl3xA+u41D1wOC+XYXu60VNcaSIdDstGhb7rKZ2hByLQj5r9r1RzzOMjaPevVFZfjwI3PvscqQZqV3+1RPyUqSXbcYbxaRvdS8q4koLJZnzEG0g+whYjkSjH6owprJwsKkd7H5TF8CUKRxCpowWEMzRIXdG+sNSyJFw==;
Received: from [10.12.4.16] (port=57712 helo=smtp47.i.mail.ru)
	by fallback18.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sMV5x-00Axqa-K0; Wed, 26 Jun 2024 19:02:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=+4L+aoviuewCB9omo/DsrXB1B/JwKXRXhHS412MaR/M=; t=1719417725; x=1719507725; 
	b=Xbo6ZH9Tf+Y6xNcHP/ITG/5zDQZyKPcfWlO1xZC//E8dLzeQidsw9TXIAIaysVmd5s8dyRcN9K7
	03Bdmnk50GRvmHYx4+enXG966mSEJhwxmGpXZahpQh+o/uX3XtZBaSuBmwltWg0JjQAt0+nBuQuQ6
	0WaKb/gqp+7RoM6oXfe29g/Opk8rHaxFXmxFgLV1N5mjuEGq5gB/E/jU/zR2nV0prnEmyZ9kAudEn
	n2fudCsycHBnK9Vvl+MXBEpTGdRso0dnxliQ7i/L5vuwqJx0wltJ48V+MNGBaVrDBjgz1pV2ccZUE
	5fKa0F/XJZ1+/anpHgnVzr1sE6vsWKmfez6A==;
Received: by exim-smtp-84f7fbf7d8-xws4d with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sMV5e-000000000rh-3wQ5; Wed, 26 Jun 2024 19:01:47 +0300
Message-ID: <61bd9289-1ad4-40f6-94c3-1b10dc7f1a13@inbox.ru>
Date: Wed, 26 Jun 2024 19:01:46 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add master clock handling for nau8824
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, John Hsu <KCHSU0@nuvoton.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240626145931.25122-1-fido_max@inbox.ru>
 <8b6198e7-f82f-46ce-a126-972191c347c4@sirena.org.uk>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <8b6198e7-f82f-46ce-a126-972191c347c4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD99270B3E0DC24D31F7A6FF83E609CEE73CD1A9AD03BE1FF10182A05F5380850401EA75908F9D031693DE06ABAFEAF6705CEA613E07DE41E16BCEF1FCD5BF8CC87CFEC41F7248C3CD5
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BF6699A3AA9BACA6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372BE3E2E75E3847F48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8082199418765B0CBED2DFD256DC6EA0CF73C6075B803342A20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C01A0BB1A02D89336B8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F7900637F09814068C508CC822CA9DD8327EE4930A3850AC1BE2E735444A83B712AC0148C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5C7BBC09C4F8844FF5002B1117B3ED6968E1D22B648F3D612FB820E9FE7BD014C823CB91A9FED034534781492E4B8EEAD5DF1C2DF01CE7211BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3488E5CD2E691F5566BC21D74A8261C325291A1F2FDEBB9B8FD39004B08049085D93BF6B3AC03483491D7E09C32AA3244CD7E50F55A2B328E577DD89D51EBB7742CADA0FFAA1A907B2EA455F16B58544A284C01B66AE49484A5DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoqQMBhpGJ2ZBw==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B4AB9B5CB7CA700A3AAFC94A4184A5FA14A93E9160197D11F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44D426FEC3FC5D1C73B55CE1B3528F6AC5239E7E7F2895B96049FFFDB7839CE9EA0123DB20CD7599CBD284F553BC65ADD5874F7E141210633D52097CEC8344961
X-7FA49CB5: 0D63561A33F958A564303504A0E77BCB54802D43A999218789494C6BC437CB22CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F790063706C2E049600DA66E9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C36804EF05EF4ADF2ACC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E73525A4AB119743A3B3C4224003CC83647689D4C264860C145E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoqQnTRxI3PqMA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

26.06.2024 18:32, Mark Brown wrote:
> On Wed, Jun 26, 2024 at 05:59:28PM +0300, Maxim Kochetkov wrote:
>> nau8824 has external MCLK pin. So add enable/disable external clock
>> management.
> 
> You appear to have sent two copies of this series - what's going on
> there?

So sorry about that. It was miss click.
