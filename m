Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935237187B;
	Thu,  9 Apr 2026 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721118; cv=none; b=NfC180h487GylcWctejhoWy3wOaThTsQXBdubemC4ZfAAXTxxsMebQWmTemm2Ssr7iGHbcB0z5mbrujAP6/4dGXfFLcQFuhETEawsN41LNc7pCnfMiFqLaeYqUC0/ZtGNBvnIUBHtpyNfcmRbWsZSDT+AlpQdc6stWt1hNe4i8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721118; c=relaxed/simple;
	bh=+cxnegO5bWAZBh9AQasFsaD6d7cF6iQC5NRz1hZoOeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBfQYOIp6D8YX9m0t54b0Si3IycCN25P4JeYTcLXYy1IDkZeGWGJci1Dt2yMQyQwoPvNgtcB13qIH6Rdmu33kP1YRl2RSxILCTd6lkxasFU6eUH2zKsyXxUe0TF8ORhAFA46Hwl73MUt7wgHJqf9fbdNzeSyyA7Y2j5pQCHzPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f57c7d2433e811f1aa26b74ffac11d73-20260409
X-CID-CACHE: Type:Local,Time:202604091501+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:106bc6ae-2310-413a-bc3d-7846abe77119,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:8b1ba2886613a30556bbe89cd82b2b83,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f57c7d2433e811f1aa26b74ffac11d73-20260409
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1894631557; Thu, 09 Apr 2026 15:51:46 +0800
Message-ID: <f66e3c00-5280-4d35-9e95-2d142e4f1458@kylinos.cn>
Date: Thu, 9 Apr 2026 15:51:44 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
 <873414lnyf.wl-tiwai@suse.de>
 <f72b3ebd-a7f3-4a1a-a48e-bbbbb67b18de@kylinos.cn>
 <87mrzck34i.wl-tiwai@suse.de>
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <87mrzck34i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Do we still need to consider HDA_FIXUP_ACT_PRE_PROBE

and HDA_FIXUP_ACT_INIT?

在 2026/4/9 15:24, Takashi Iwai 写道:
> 	snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x03, 0);
> 	msleep(100);
> 	snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x00, 0);

