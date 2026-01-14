Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617B13112D2;
	Wed, 14 Jan 2026 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377689; cv=none; b=LcI4mVWYiho2u5WPwpWTHy10au3xD7F3U0HcjglbhCKfYhS483SnL1gfrgU7Gh9kZOHuZkgiaAo2Bepx/v+o+J8FCnBzt9/xaBaVVBCDj0jBLyY8+v3C+BqLhjmtJFCBnPbsmGKTL+lFpPDxNfSt/oHRQxpJNWh6DgbPP7JGKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377689; c=relaxed/simple;
	bh=Tk6DW8eEOr+7C0cYveP3Vvc7GcgYRr/zb306VEgULfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Laqg7fHWRKbmc+X9Z0Xz698I/VTtEfXPfAA9ALs333VsokvTRhzaJOal3ZEGDLYlAsuN7sxSJhjQx5Baob3HL/yPTGwpii4rQcRdyMWONLuT07sp7RqgbrnqO+J8wz7rOdRzr71qK9Sjti/OkM7UZf/PzTlkq9lgJm4Z8wQNQuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 31537120f11f11f0a38c85956e01ac42-20260114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:400e92c9-564a-4de9-b285-efb62cbe5838,IP:0,UR
	L:0,TC:0,Content:23,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:23
X-CID-META: VersionHash:a9d874c,CLOUDID:b390171d5423b8ab932fbcee7d088c3a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:4|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31537120f11f11f0a38c85956e01ac42-20260114
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1455287023; Wed, 14 Jan 2026 16:01:12 +0800
Message-ID: <dce94739-2632-45d9-b212-447848bf6058@kylinos.cn>
Date: Wed, 14 Jan 2026 16:01:08 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, cryolitia.pukngae@linux.dev,
 kuninori.morimoto.gx@renesas.com, lhi0729@kaist.ac.kr, pav@iki.fi,
 rene@exactco.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229093130.3202058-1-zhangheng@kylinos.cn>
 <87ecoay7vt.wl-tiwai@suse.de>
 <5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
 <d16a9af6-2b35-4588-a08e-83846a5f6242@perex.cz>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <d16a9af6-2b35-4588-a08e-83846a5f6242@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Is it feasible to add a Line Out?
The original intention was to reduce the complexity of upper level UCM 
adaptation and make the USB onboard sound card backend consistent with HDA.
