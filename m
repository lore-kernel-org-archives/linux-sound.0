Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FB03B6344;
	Wed, 22 Jul 2026 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702950; cv=none; b=dB0qGcvXJyYeoITtndVuNTCm+mxCDdZTQOWFeoev1Yt82qKRqD2DdfUozvu9UMs2YaEUfU93oFuCdyj3MYyWZSR7oSS/8Q2K/w/cDZorhQbo+2vm5oBFjHkQEdgg6O8VOd9ZSIGCN2NhSx/GmWi95vyt2LcT3dUi9Ps/xb/P0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702950; c=relaxed/simple;
	bh=L7HY10A9RBqgAYLsKrt4csHo5m4rJfTb4vZCCrYhH3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHT9UMm6WkiY20SiFGk453uMSar9GCcOxAdhJ6lSd5AZQghf7RfV7WzPEXqV5LIt7cNcyr0XvcoLVdG494MhuKJK9YoBUT5S+gsrSqfy5cizjbi7lmY/95NI3UzFrXfB73GGCGU21aR7XHx3kU+jG0mdEwREFhKje/emLOdRARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 69b3ade6859911f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:22290acd-855e-4924-ab09-36dfa1a46604,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:524b21156f34f25ebf813b71e4eff85f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 69b3ade6859911f1aa26b74ffac11d73-20260722
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1441209101; Wed, 22 Jul 2026 14:48:57 +0800
Message-ID: <edc4a1f2-174c-4e7a-b69d-bb5e5f6784a3@kylinos.cn>
Date: Wed, 22 Jul 2026 14:48:54 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "ALSA: hda/realtek: Add quirk for Lenovo
 Xiaoxin 14 GT"
To: tiwai@suse.com, perex@perex.cz, kailang@realtek.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721121609.337299-1-zhangheng@kylinos.cn>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <20260721121609.337299-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

It is possible that the original patch does resolve the problem, even if 
it is not the same as my previous solution. Therefore, I would suggest 
that we hold off on merging the revert patch for the time being. 
Fortunately, the original reporter of the issue is still able to assist 
with validation. Would you please review this issue as well? Thanks.

