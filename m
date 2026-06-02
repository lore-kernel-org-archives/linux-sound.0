Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145C19CCF5;
	Tue,  2 Jun 2026 00:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780361380; cv=none; b=FWiuzdsjg7u0YffnTHGQRxUgNFRMc9cRxY0ibhh8ztoklLwh/wQLf9c68bN0jUeBOVt0gynmvQK0fgEvtbs7P8dmo2t75O/+I2wIAw0q/KDMT3MARkipJ3DrDw+/UNpHVQCj7ovqAamD4iTnnviwCRE1J0N43hqsK+2Wt8kVJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780361380; c=relaxed/simple;
	bh=Ynz+KatejpJwarNr6Qk59ZoMqMLHzKa3ZAcDd+dq7c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnvbxWpF6VgAPPTq2GcO2fBW2SUUHDjl9o9bLbs0T0QWltkZPqLQhTB8AsHHw2UuWQDTqOfLKktG0SG6IHeOLwp0tVgdja01eCf6LvQGcUmzXXDnk9sybQ+TC1vYqw3KsqLszpbOTb7D9wuXI6rvFSBBifktLDkQ+yg0ksP5zJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ead1ca2e5e1c11f1aa26b74ffac11d73-20260602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0fb9d2cd-3a96-431c-b8c8-7ad4c52fb3e4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:85ec5049a3375c1e247395a9d3229e70,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|136|865|898,TC:nil,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ead1ca2e5e1c11f1aa26b74ffac11d73-20260602
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 683246315; Tue, 02 Jun 2026 08:49:31 +0800
Message-ID: <e4c628f8-dac3-4318-bdeb-758ac007a92b@kylinos.cn>
Date: Tue, 2 Jun 2026 08:49:29 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, lijun01@kylinos.cn
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601084309.845322-1-lijun01@kylinos.cn>
 <7ff4cebc-4873-4135-b58c-29a9ce2d696f@sirena.org.uk>
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <7ff4cebc-4873-4135-b58c-29a9ce2d696f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

for example,the DMA controller is abnormal in hardware
the addr = 0,
addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
x = bytes_to_frames(runtime, addr - runtime->dma_addr);
addr = 0 dma_addr=4195352576   x=-1048838144 i think the value of pos 
should not be a negative，return 0, maybe better.

2026/6/2 02:28, Mark Brown :
> I'm not clear in what circumstances we see an address that's outside the
> DMA buffer?  Is this an error that should be reported as an XRUN instead
> of silently masked (which will presumably lead to audible issues)?
