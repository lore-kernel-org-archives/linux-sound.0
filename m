Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C6155389
	for <linux-sound@vger.kernel.org>; Fri, 27 Dec 2024 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735307584; cv=none; b=NXxiFicJzVQqjHGIdmi7UYY9TZ/rudWvt3WNRJBw1BgA1uU0CeOjk4OVqI/3qkY+oYNr3UD2rYuL1sARIO+RUSpYzBAL/xBAF9bNXxoCVioYGCSvRpvwn5Fq/ZRHunxQX/7WXFwbWl2KPzKbUMxfAXM6PY1Yag01SFyUDJ/9blA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735307584; c=relaxed/simple;
	bh=ZQWnd0dhcgVD1FxEgZEpWwWWc1CEl1tpAxkFWycFuYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6aJ63lcd1x7uWQpkOFF541ceEQ99Brlui7ow1zV4IcpPgjsfy6SF5qbLVh0XJ+JysZuhC0YSg5SEqN0OBAVq5uuq8/yKkrEq0b7ggqcODX0xQf1Xio1G6RGkZUccROyAQNmwHtZv+e9truVpn6UcjfuiKP69H5xTcEox5Votck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=uPAYmO7h; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="uPAYmO7h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:From:To:Subject:MIME-Version:Date:
	Message-ID; bh=zJwizkPNeuFPHG1FNqb1+qVrFO0r0k3ZtANTCZdb0JM=; b=uPAYmO7hDSMTgD
	mgGPcirFhEis4bXJDgJkhf29k9xS+8EusnL0KS1NlFERTrsxc7ZqgSic6Fmc7IPe0WhJ79qYyxC3T
	VDv8gJwZz2JSdrTqEEMCL43MNaLU71ZrbaqRXZknVxjdezBStTYSrc4+Mp2xM8cwzsZOldUcMNqD2
	0RWyYDjCoj/FBNoOULAQOryBF1qi9Ldzn402kaZKjJ5WeV32EjpbkqbeGgQmrs+upgCByY+WobumJ
	SDfsU1eskA0viCd7z3fOG44HpkwprnREkJVEKLoc91XXt9f53XQ7lHH+B3RkSUK4QUUCRHzkK8J4A
	5UmCzZBysOGa74PqruIw==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08216fbfbb76706e2) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tR9Lk-000000008A3-3lOx ;
	Fri, 27 Dec 2024 12:21:52 +0000
Received: from [220.233.184.101] (helo=[192.168.20.101])
	 by CMR-KAKADU03.i-08216fbfbb76706e2 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tR9Lk-000000006A1-21kL;
	Fri, 27 Dec 2024 12:21:52 +0000
Message-ID: <83a2706c-1b30-4ea4-94f9-42353f64a653@iinet.net.au>
Date: Fri, 27 Dec 2024 23:21:44 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ASoC: extra format on each DAI
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
 <20241220110133.2e8f1986@rpi5>
 <87cyhj88dp.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <87cyhj88dp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=MYZquY/f c=1 sm=1 tr=0 ts=676e9be0 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=p0_t1xZOgthaIOMNxAwA:9 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfPRqUgEquhNzvqluZvoXQa3NgN72TRblJzRIM/98FjXam9XIKfH0bFoOfPs8+5SJ2jHhc8nxFTw9wH5aM7FomlELaA8rqJrHFIPVp2eRweXzbtJSOV6x QciakJGn8GqTUrKx3nsu3IzgaKNX8osvajbyYzNypUes6hXheE5hQUy5cA9X6OtmsdlDx3d/v5SXgNLyz2aeU2Jws2IGs4gnhgQ=
X-atmailcloud-route: unknown

On 23/12/2024 1:01 pm, Kuninori Morimoto wrote:
> 
> Hi Stephen
> 
> Thank you for testing
> 
>> I am attempting to test this by applying your patchset on top of
>> 6.13-rc3. But I am running into a problem, probably because my
>> graph-card2 DT is wrong. I've attached the DTS file. I used the
>> Semi-Multi example.
> 
> Hmm... It seems the DT setting itself is correct. I have copied your
> settings to test-cpu / test-codec, but it could probe without any error.
> 
>> [   27.333830] asoc-audio-graph-card2 soc@107c000000:sound: probe with
>> driver asoc-audio-graph-card2 failed with error -12
> 
> It is -12 = -ENOMEM = kmalloc() error ?
> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto


Hi Morimoto-san,

Merry Christmas!

I finally got a chance to look further and after a bit of debugging I 
found that graph_parse_node_multi() has a loop iterating through the 
nodes. However, when graph_get_next_multi_ep() is called to get the next 
endpoint, it returns null. I put a debug statement in there:

                 if (!ep) {
                         dev_dbg(dev, "no endpoint");
                         break;
                 }

and that statement is shown in dmesg.
After it breaks out of the loop, it just returns the value of 'ret', 
which was initialised to -ENOMEM.

That's as far as I got.

Regards
Stephen

