Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267A2594B9
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562513; cv=none; b=EyCTPMkOF3NyNNm3BciLnmcp9mk8YYqW7okJerF56TDKAtzrevUXmxt6YPlfqXxkaMuEWidtfFpeh9vS8Gzq5lpMMR2f4jHKW3tDVzhEbnyZC5zUij0g76adqGY257mUTMIXhy96v8viVw/WOepUJ7tcLp45rhQEwXiGYzWz52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562513; c=relaxed/simple;
	bh=OaolQjIewO6xINX8WbzvAr9mUJR+T7VXWcqV8aEV7y0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LwqWDqyBqpjIhVUZ8QL3SIwsrU2EI2VJW++1WcFzAUcJfDAFGpcSiYBt+RLceN3BM7W1iN5BBVAqqhslHH0RgKxXLAfcC7WOfy/07XMdE1Az/2CwQR2MSNCzpi2UCYv1hIbLDLc9kRKi1zeqQppLWxfj0QRFEQ7p6QV1s6lDxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=Mxr4afkD; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="Mxr4afkD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:To:From:Subject:MIME-Version:Date:
	Message-ID; bh=b8eOCdFvjlP4CVijQxsGIp8Q92qJs/CmtWSFoUF54hI=; b=Mxr4afkDi9+iPI
	3TedVXWdhWJrxqSXvbDZKmB/7PkSyamM9jwRrZeS+aHP1/6GQjbQPIWYaKhxmsZ4N+jDngtJDy21T
	4k3ryGBEBRmfGflp/9nRNRsWGmayTmhojRXLr2cH6+iYfESVShX8EibIpx/nIlzcZHCSD+6nyNapi
	T9A9MhBH58j5QhF6zT8j/GI/j2Loo/UEbv1yfOABY+geX811BowCED7yAgEGbVSPZd9CHoeH3OZ4t
	2SBemJhPQFiE091AcY/MdqmFP5YPkQUB7gqoF4D4jWT/LkM5gzIPXlRDYpSuzs8zvD4uAjhupFUx8
	8hFeMTMKm2cNZtIfM35A==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08bfa4c5bdedaf3a1) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tSF5f-000000003Rv-0HTi ;
	Mon, 30 Dec 2024 12:41:47 +0000
Received: from [220.233.184.101] (helo=[192.168.20.101])
	 by CMR-KAKADU03.i-08bfa4c5bdedaf3a1 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tSF5e-000000003kV-2PL3;
	Mon, 30 Dec 2024 12:41:46 +0000
Message-ID: <a7abe121-bb5e-4fbc-bbcc-157d54ea2a70@iinet.net.au>
Date: Mon, 30 Dec 2024 23:41:45 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ASoC: extra format on each DAI
From: Stephen Gordon <gordoste@iinet.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
 <20241220110133.2e8f1986@rpi5>
 <87cyhj88dp.wl-kuninori.morimoto.gx@renesas.com>
 <83a2706c-1b30-4ea4-94f9-42353f64a653@iinet.net.au>
 <86c91aa6-f185-496f-b4d4-4eea1e67fa27@iinet.net.au>
 <bbdced52-a155-4c9c-9afd-187200fa5371@iinet.net.au>
Content-Language: en-US
In-Reply-To: <bbdced52-a155-4c9c-9afd-187200fa5371@iinet.net.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=bPMQIu+Z c=1 sm=1 tr=0 ts=6772950a a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=VwQbUJbxAAAA:8 a=4jraHwQkAAAA:8 a=S-PTfgghlHUsea2SZBUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Cm-Envelope: MS4xfEB9KIJ71xdTvAM0U83xIcu5WFgIuAJYczXBHvU0Y6vhlns/D4lR3YDu0KiIsju8PMtoPYAQ6W9AZEAliu8Xf0ASG2Tj4D+S/YoZ9Xyjon2dO+y+3T18 yn5unjUHWD4W49j2iGIHFUXg+BXuYHXx7KLwj/TDOSkRR1SIBg0COLhn5XU+KwCD+FZCJK7XNR4ojcOG1p7f7U9gJ2bhvfVXviA=
X-atmailcloud-route: unknown

On 30/12/2024 5:02 pm, Stephen Gordon wrote:
> Anyway, once I removed those flags, the DTS works, as long as the CPU 
> port is listed _last_ inside the 'multi' node. This is equivalent to a 
> requirement to list the CPU port _first_ on other platforms.

FYI, I just submitted a patch to avoid reversing the sibling order when 
updating the devicetree. This patch makes audio_graph_card2 process the 
nodes in the correct order on my machine.

https://lore.kernel.org/linux-devicetree/20241230120315.2490-1-gordoste@iinet.net.au/T/#u

I will stop replying to myself now!

Regards
Stephen
