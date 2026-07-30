Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161B33F5B1;
	Thu, 30 Jul 2026 02:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377434; cv=none; b=ZDrOgtnapqmVS8Pbhu7HvUSEwF+PRhwSSvZuMUylULBFgT75F3JPe7uJzuuMNGdjjeEdL0LbUikNKnaJJdBT55MD5qTYSGhY9z0bAL33GCAeGMuZnWMkcewGpjRTntvIV1PDtnZytfqoDC6o0I8KlYEBQdkTrWzn5oTIDbzX394=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377434; c=relaxed/simple;
	bh=kP6BL9iCgQNZ7Jnn8KQ+qI+imlnTuErFxsM46RuxhDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L542Oefax1T6kc0lWI78ut5JqiOgPo1zfg6PuVQqDnxQMCd8TtA8NYslSuYHZ3Wv9UOyTlqXOVr3Fv6dBf3zYt+ppKXrwFD5O8hx0JIwtnj+ATBKDTwvRwLwDgozMmtvee+fFMoOdEv9q4wuT90rg/640g0QZrMbYVizoosskD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d17e6b0a8bbb11f1aa26b74ffac11d73-20260730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cee6afe9-654f-4bd9-be19-02a35081e612,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:701d4bf66c524f08a6cfa1d5d88a5a8c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|817|865|898,TC:nil,Conte
	nt:-10|-8|-5|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d17e6b0a8bbb11f1aa26b74ffac11d73-20260730
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 424524517; Thu, 30 Jul 2026 10:10:21 +0800
Message-ID: <8cdd574a-e4f0-498d-891f-31105a79f940@kylinos.cn>
Date: Thu, 30 Jul 2026 10:10:18 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/intel: Add Star Lite Mk II/III to
 power_save_denylist
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729125544.539067-1-zhangheng@kylinos.cn>
 <87fr11524n.wl-tiwai@suse.de>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <87fr11524n.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> Is the problem verified with the latest kernel?  The report above
> looks very old, and it's not sure whether the problem really persists
> or not.
> 
> In general, the power-save deny-list is a kind of last resort.
> Usually the pop noise problem could be resolved in the codec driver
> side.

Based on the SSID of the sound card, I have not seen any relevant fix,
so the problem likely still exists in the latest kernel. I agree with
your point, but most current driver fixes address pop noise during
power-on/off or playback; I have not found any similar fix for capture
(recording) pops. It appears that many users default to the `power_save`
workaround – I also previously disabled power-saving mode to mitigate
the issue. For future encounters with similar recording pop noise,
I will try alternative solutions rather than relying solely on
`power_save`.
