Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCD01482E8
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 02:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232200; cv=none; b=ImSnG/2+a2C5gkAi2ecGv2hcuWt+1+UCd30/XE7cmVO9RkUs1esP2cxXlkJFUntW7elpKqdB3eIGDi/LjYYkxXf9FSeprAXvRAAh8RN7kwi/i0hFXllTvT/q84mKF423NILowAIB4kWZi3Znj0gloHZMfboji/0AAHduHOHVTUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232200; c=relaxed/simple;
	bh=czpqOfdVTyvfloMPiicURtmhQ5bdot19U4D7sTJWoMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ns3GdDvWMpfXr1lUz6TAysK0hRGPJZRbs9F9MuPlEhdfZRnchnLu87S0siu1Q1ftJNBeIEu6SmvMbvxLcWvoiwb4ptjc9U20SrBNxYJ9dLnX1C+qqzZsXjMS12xHMiyVpFSFe8JQmJrTy1efKqDHiAXgVi0aBLNXVyVYcLL7b/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 507a7b7e265e11f1a21c59e7364eecb8-20260323
X-CID-CACHE: Type:Local,Time:202603231007+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:753672ac-5c90-4275-8c6c-3a014e549050,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:89c9d04,CLOUDID:89a7fcaa6d9b45b8ed86aefcd9f195a3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:1|-19,Content:0|1
	4|52,EDM:-3,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 507a7b7e265e11f1a21c59e7364eecb8-20260323
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1385212059; Mon, 23 Mar 2026 10:16:34 +0800
Message-ID: <7fa11848-2497-40f4-b61f-a609cd77c67c@kylinos.cn>
Date: Mon, 23 Mar 2026 10:16:31 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Sound quirk for Legion Slim 7 16IRH8 breaks volume control on
 Yoga 7 2-in-1 16AKP10
To: =?UTF-8?Q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kailang Yang <kailang@realtek.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Chris Chiu <chris.chiu@canonical.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <i_S7iS6mWHUQexU6eMS8mOTAzBhZjnV3XUZlbfNkXVtGJN-tnGpBVMC_mTit5moylkFcCtpQpjospNM-S7X4a05cl-gdL1sQSk0BKuqYbhQ=@protonmail.com>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <i_S7iS6mWHUQexU6eMS8mOTAzBhZjnV3XUZlbfNkXVtGJN-tnGpBVMC_mTit5moylkFcCtpQpjospNM-S7X4a05cl-gdL1sQSk0BKuqYbhQ=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This issue has been resolved and a new quirk 
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN for 17aa:391d has been added to 
the code. If you have the latest code on your end, you can download 
patch 7bae956cac04.

在 2026/3/22 0:19, Kamil Gołda 写道:
> Hello
>
> I have discovered sound volume control on Lenovo Yoga 7 2-in-1
> 16AKP10 [0] laptop is broken by a quirk applied for Legion Slim 7 16IRH8 in
> sound/hda/codecs/realtek/alc269.c at line 7578. Both devices apparently
> have a sound card with the pci id of 17aa:38b5, which triggers the quirk.
> In my testing, commenting it out resolves the issue.
>
> I do not know how to handle conflicting quirks like this, so I'm messaging
> you to report the problem, and ask someone to fix it or tell me how to do it.
>
> alsa-info report, generated before the problem was found
> [0] https://alsa-project.org/db/?f=1de95f933bbbb6f22d917b1ba537d562d90eb762
>
> Best regards
> Kamil Gołda
