Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AA28E0;
	Thu,  9 Apr 2026 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775714313; cv=none; b=LZ2S1PPkDWmshzCDXICQN0D0I7CLI0ZgYJlK4kXdKmflZCqHk5o2VzD/qMuwq+Ypbbu0DbZpYs7c5f9hVSQ9nxOyohbMsnyZHVT/Y1bqZP9XJJUWHRPEkcL5Q03GEAGfTzXTn0/FO7jpeL0wXbC+DD+7I1AawvAwyaa9m51r2tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775714313; c=relaxed/simple;
	bh=Vfpwuc0hrFvY8Ie9vHgsxjZfIEkijCa9GwWi0Qc24Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UM8vvUjD6gCuPscP3VpJCZMPJD3SQ2LIkG75u4iqBNNzjFb6bT23BUW7IfUZdrRCzPPm/FhFPqIMez2tIKqztdkZiipwjmREl806hTzb3x0QHmNfM4y3XYs4Eq6qaHVsq5H4lhUozVyXtIFEJO52FkCst+JDRBdKYhNpYn9jDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1f1dad1633d911f1aa26b74ffac11d73-20260409
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:90571754-6be2-490a-9573-9d1aafebeeda,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f4165319b9ab070e5687ccd022404458,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f1dad1633d911f1aa26b74ffac11d73-20260409
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1574737530; Thu, 09 Apr 2026 13:58:24 +0800
Message-ID: <84e98864-5858-4bb7-b62a-5b4928f2065b@kylinos.cn>
Date: Thu, 9 Apr 2026 13:58:21 +0800
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
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <873414lnyf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

hda-verb /dev/snd/hwC1D0 0x14 0xB 0x40
  I think this command is meaningless, so it was not written.
hda-verb [ALC662_device] 0x01 SET_GPIO_MASK 0x03
hda-verb [ALC662_device] 0x01 SET_GPIO_DIRECTION 0x03
hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x03
sleep 1
hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x01
sleep 1
hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x02


This user actually used these commands and the audio output was normal.

The last two commands clearly trigger the falling edge of gpio_data 0x03,
Referring to these commands, my patch writing should be normal.



