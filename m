Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099E26A1AF;
	Fri,  8 May 2026 02:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778208632; cv=none; b=f2UWxKQWBuKZHHiTxhakldBAvct1/hBBpNShaQ5aP4xmo4OXW0oEOUAGwjH5ox1bmmm4U4uY3ZsIY8Hf3e60u1Buup8nSVoRCPEI12NdZn93RG/eV+ZMA+opSBZaEK5MYKkkF7bgr/jsR6XqerqSX77PiIdkN6JwIMwxEUiuxro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778208632; c=relaxed/simple;
	bh=GaZr+ZiJ2IPWs4DvkQUwFLyZ5Q1qOuDAtUqyvQGXBoY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jch86G12Gqpr4cWCIe1qLqG5cUyOtAMoCqqxqS9SRHLi652DvRZcobv4KThGMiP6yPyyvy50R6xbn2KB9aNfHw4KsTzLBHR1CXY8NMTx8xDKFeNDyTbLuAA9UbdPaqnEzUxgtcXWdmFIHVKl3/+JEmNHOx7Vys66OJF8p9smnsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a9ed6e984a8811f1aa26b74ffac11d73-20260508
X-CID-CACHE: Type:Local,Time:202605081022+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d25b4bdf-5b9a-408e-be25-1cc101c90b72,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:e31c48a74c1a95a0a0a19ac8571852c1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|817|898,TC:nil,Content:-10|
	-8|-5|14|50,EDM:-3,IP:nil,URL:0,File:127,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9ed6e984a8811f1aa26b74ffac11d73-20260508
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2030398074; Fri, 08 May 2026 10:50:25 +0800
Message-ID: <be6ddfdc-7cd2-460f-be75-c30f90a1bceb@kylinos.cn>
Date: Fri, 8 May 2026 10:50:22 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH] ALSA: hda/generic: Add mic autoswitch support for
 dyn_adc_switch mode
From: Zhang Heng <zhangheng@kylinos.cn>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
 <a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
 <87ecjnp8dx.wl-tiwai@suse.de>
 <7493b4e0-2b8c-435f-8421-ed397593356a@kylinos.cn>
Content-Language: en-US
In-Reply-To: <7493b4e0-2b8c-435f-8421-ed397593356a@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I tested this change:

In create_capture_mixers in generic.c:

- name = nums > 1 ? "Input Source" : "Capture Source";
+ name = "Input Source";

And it also works normally. It seems that user-space does not handle
"Capture Source" very well. So should we just remove "Capture Source"?

