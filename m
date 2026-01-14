Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D792E0916;
	Wed, 14 Jan 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382567; cv=none; b=ATLwW5tvY9RqWAkwV54lCiWygVzYHvMLOp8SLtoEyh4shRF4duCRljqbBnrqaLv5THdHaKlnt//jTeemn3xzSeA4npqM0OEPLYuQHoGFd4Ff6IZs5MRfWgKZqTG4h4BjDiRuVnIAbAaqEP9J3Hg4pCr/XdAFfIfh7p2dlK/5E10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382567; c=relaxed/simple;
	bh=ahX/3wrDXq3nxF0VdhFX/y8GedTEdTx8Xu7D/J5BaOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehrM8im8229T5MXVJAMw/GXtKRtJeyBwiW7LeuiC4fqAVHArwLERih3ULgZT+/vHhHWVNVD/pIcsxe3mFCtN1TUx2w5dU7RhCO5WjpUC+6lSYAF+NjhdNJP6ckZWZ2tL4cKzIKF0oN87cE/HUCr5QJf6s9rYqjYbUU7qu6FACCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 918aea5ef12a11f0a38c85956e01ac42-20260114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:60b60259-d6c6-4b8a-bf25-56c27d5971b0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:6749871abe083486557f1e800b2a7cfd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 918aea5ef12a11f0a38c85956e01ac42-20260114
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 457102914; Wed, 14 Jan 2026 17:22:38 +0800
Message-ID: <50aabc16-a8c5-4e6c-ae9a-da79a271958e@kylinos.cn>
Date: Wed, 14 Jan 2026 17:22:34 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
To: Jaroslav Kysela <perex@perex.cz>
Cc: tiwai@suse.com, cryolitia.pukngae@linux.dev,
 kuninori.morimoto.gx@renesas.com, lhi0729@kaist.ac.kr, pav@iki.fi,
 rene@exactco.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229093130.3202058-1-zhangheng@kylinos.cn>
 <87ecoay7vt.wl-tiwai@suse.de>
 <5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
 <d16a9af6-2b35-4588-a08e-83846a5f6242@perex.cz>
 <dce94739-2632-45d9-b212-447848bf6058@kylinos.cn>
 <77e5e5d9-1de6-42ec-997d-24f76cf4f383@perex.cz>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <77e5e5d9-1de6-42ec-997d-24f76cf4f383@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Okay, then keep the status quo.

>
