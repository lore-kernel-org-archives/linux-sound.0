Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD207405A
	for <linux-sound@vger.kernel.org>; Sat, 28 Dec 2024 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386873; cv=none; b=bhGYLtAhPph+tEGkddC3BFtW/rVZjf/auJKI2fbNCBgnLJRBWMh6ZGuJqXqhgLt10N1zAjJEbOEaO32YY4/94isNrNPbH5KZ0EW7wzzwUqY0fr6tkU6OSOkbsok+DfRvqPIh3hUg7W5kSJ50tydKbkdJtJ8S8ddVhbQOqDk7syQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386873; c=relaxed/simple;
	bh=Ubn1dPSLqb8PoGiZr4/SnjqEZ6skIxZ6wV++L16b3yk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=oOMQtQAI+4M+3UXpsKg91V8X1/15fKx9LI5lYV0/+5S5GHgtMLnK/o3SSLXhVkZsJHYlgAWFFs2/xVcOgVxr2kEhyTVVMOuVRm511NoYR/q7o0zqI5pwsQndThahbY4maWTJcAuUFJPGCKFxwtMuW3NTyPCFW869INo2WxRN8M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=PyexlQR2; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="PyexlQR2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=To:From:Subject:MIME-Version:Date:Message-ID:
	Content-Type; bh=N5JtDKfXdAICzXK2uqrjKA12tJ19uqHfdGpKVeluSpg=; b=PyexlQR2wAnn
	7BtXLgDXF3mQiL12owkbHYjXSSqBuIKzteuXUtGntFGhF0mnD/8hYAmkc30Y84ed6tgP6egUGnVOK
	AIsM/auiPZ5Qt0Wk6fo6DeHHA+V5Dq1DPAbs/0qnnw469b+w5+wWNznc0sO+PRmoFfetSbvNu10MZ
	TrysnQZNg4RCPFYOMAkh1NSYBzOvDTT8H6dBIUXt0c2gZ6I30X8urIwmXOq1Jpge5XJmmrqDjnhGI
	hm82+S/s/6sC/zRQY0bWpVNsd/f3O4UDBArOTKTxJ0yJQzTKaocaeKr7V83NFUQgsSxPyiTuCW3bw
	qe39A7/b+I9vCXkV3DCXYw==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-0b87596fdd3a2d537) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tRUqP-000000000Fi-2jQr ;
	Sat, 28 Dec 2024 11:18:57 +0000
Received: from [220.233.184.101] (helo=[192.168.20.101])
	 by CMR-KAKADU03.i-0b87596fdd3a2d537 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tRUqP-0000000077o-0tjU;
	Sat, 28 Dec 2024 11:18:57 +0000
Content-Type: multipart/mixed; boundary="------------TKOfELwxPDX5M16xEgxIpfo2"
Message-ID: <86c91aa6-f185-496f-b4d4-4eea1e67fa27@iinet.net.au>
Date: Sat, 28 Dec 2024 22:18:49 +1100
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
Content-Language: en-US
In-Reply-To: <83a2706c-1b30-4ea4-94f9-42353f64a653@iinet.net.au>
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=XKk2SxhE c=1 sm=1 tr=0 ts=676fdea1 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=CVYOQmV5M8RUBYIy2usA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sUHmrrqPYGvdY5bH6K8A:9 a=klsXiepXz4AA:10
X-Cm-Envelope: MS4xfLa3e/Xf8NXB5/XKJ6rc9SP0QRmQBCVcS8TNRdusRUDQ2FIGcZ0mESqJ4kM+qsyDad54fFZAMpauJ88E1ccEiiUEJ3iEMdGnzanYrjT5/VdtyDz8XjZo 8cp9k5yIJVs4aRsX5y6/sBU+HgIZyq4Z6umJYpM+giygJWz8qPaIlaT6FGP5I8Ar73JPKME0gkK9pB9fqZnpZFLuNaQkJIea6MM=
X-atmailcloud-route: unknown

This is a multi-part message in MIME format.
--------------TKOfELwxPDX5M16xEgxIpfo2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/12/2024 11:21 pm, Stephen Gordon wrote:
> On 23/12/2024 1:01 pm, Kuninori Morimoto wrote:
>>
>>
>>> [   27.333830] asoc-audio-graph-card2 soc@107c000000:sound: probe with
>>> driver asoc-audio-graph-card2 failed with error -12

> However, when graph_get_next_multi_ep() is called to get the next 
> endpoint, it returns null. 

Hello Morimoto-san.

I reproduced this using the test components with the attached DTS.

I found that this is because the sibling field of the 
/soc@107c000000/sound/multi/ports@0/port@0 node is null, which means 
that of_graph_get_next_child returns null.

In turn, this is because the linked list of siblings is actually in 
reverse order due to the way populate_node() (drivers/of/fdt.c) adds 
them. This means that when the driver uses remote-endpoint to navigate 
from the endpoint in the cpu node to the endpoint in the multi node, it 
is actually arriving at the last child (with address 0). When calling 
next_child(), it gets null.

[   30.196250] asoc-audio-graph-card2 soc@107c000000:sound: ports 
parent:/soc@107c000000/sound/multi 
child:/soc@107c000000/sound/multi/ports@0/port@2
[   30.196256] asoc-audio-graph-card2 soc@107c000000:sound: sib #0: 
/soc@107c000000/sound/multi/ports@0/port@2
[   30.196260] asoc-audio-graph-card2 soc@107c000000:sound: sib #1: 
/soc@107c000000/sound/multi/ports@0/port@1
[   30.196264] asoc-audio-graph-card2 soc@107c000000:sound: sib #2: 
/soc@107c000000/sound/multi/ports@0/port@0

After finding this, I reversed the order of the port nodes inside 
multi/ports (i.e. the cpu link is now last) and the overlay loads 
without errors.

I get a playback DAI visible in aplay, however the capture DAI is not 
visible in arecord. If I swap the order of the codec ports in 
multi/ports, then I get a capture DAI visible in arecord, but the 
playback DAI is missing :)

I will keep experimenting to see if I can find a way to make them both 
work, but I think some changes are needed to ensure all of the nodes get 
processed.


Regards
Stephen




--------------TKOfELwxPDX5M16xEgxIpfo2
Content-Type: text/plain; charset=UTF-8; name="testgraph.dts"
Content-Disposition: attachment; filename="testgraph.dts"
Content-Transfer-Encoding: base64

Ly9EZXZpY2UgdHJlZSBvdmVybGF5IGZvciBtdWx0aS1jaGFubmVsIEkyUyBpbiBjbG9jayBj
b25zdW1lciBtb2RlCi9kdHMtdjEvOwovcGx1Z2luLzsKCi8gewogICAgLy8gUGk1IG9ubHkK
ICAgIGNvbXBhdGlibGUgPSAiYnJjbSxiY20yNzEyIjsKCiAgICBmcmFnbWVudEAyIHsKICAg
ICAgICB0YXJnZXQgPSA8JnNvdW5kPjsKICAgICAgICBfX292ZXJsYXlfXyB7CgkgICAgY29t
cGF0aWJsZSA9ICJhdWRpby1ncmFwaC1jYXJkMiI7CiAgICAgICAgICAgIGxhYmVsID0gImV6
c291bmQiOwogICAgICAgICAgICBzdGF0dXMgPSAib2theSI7CgogICAgICAgICAgICBsaW5r
cyA9IDwmbGluazA+OwogICAgICAgICAgICAKICAgICAgICAgICAgbXVsdGkgewogICAgICAg
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsKCQkvKgoJCSAqCQkJKy0tLSsKCQkgKiAgIGNwdV9pMnMgPC1ALS0tLS0t
LT58WCBBfC0+IGNvZGVjX2RhYwoJCSAqCQkJfCAgQnwtPiBjb2RlY19hZGMKCQkgKgkJCSst
LS0rCgkJICovCgkJcG9ydHNAMCB7CgkJCXJlZyA9IDwwPjsKCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CgkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQlwb3J0QDAgeyByZWcgPSA8MD47IGxp
bmtfY3B1OiBlbmRwb2ludCB7IHJlbW90ZS1lbmRwb2ludCA9IDwmY3B1X2kycz47ICAgIH07
fTsKCQkJcG9ydEAxIHsgcmVnID0gPDE+OyBsaW5rX2RhYzogZW5kcG9pbnQgeyByZW1vdGUt
ZW5kcG9pbnQgPSA8JmNvZGVjX2RhYz47ICB9O307CgkJCXBvcnRAMiB7IHJlZyA9IDwyPjsg
bGlua19hZGM6IGVuZHBvaW50IHsgcmVtb3RlLWVuZHBvaW50ID0gPCZjb2RlY19hZGM+OyAg
fTt9OwogICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAg
fTsKCiAgICAvLyBCcmluZyB0aGUgSTJTIGNsb2NrIGNvbnN1bWVyIGJsb2NrIHVwCiAgICBm
cmFnbWVudEA0IHsKICAgICAgICB0YXJnZXQtcGF0aCA9ICIvIjsKICAgICAgICBfX292ZXJs
YXlfXyB7CiAgICAgICAgICAgIHRlc3QtY3B1IHsKICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAidGVzdC1jcHUtdmVyYm9zZSI7CiAgICAgICAgICAgICAgICAjc291bmQtZGFpLWNl
bGxzID0gPDA+OwogICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwoJICAgICAgICBw
b3J0cyB7CiAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAg
ICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CgkJICAgIGxpbmswOiBwb3J0QDAg
ewogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47CiAgICAgICAgICAgICAgICAg
ICAgICAgIGNwdV9pMnM6IGVuZHBvaW50IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRhaS10ZG0tc2xvdC1udW0gPSA8Mj47CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
YWktdGRtLXNsb3Qtd2lkdGggPSA8MzI+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZsaW5rX2NwdT47CiAgICAgICAgICAgICAgICAgICAgICAg
IH07CiAgICAgICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAgIH07CiAgICAgICAg
ICAgIH07CiAgICAgICAgfTsKICAgIH07CgogICAgZnJhZ21lbnRANSB7CiAgICAgICAgdGFy
Z2V0LXBhdGggPSAiLyI7CiAgICAgICAgX19vdmVybGF5X18gewogICAgICAgICAgICB0ZXN0
LWNvZGVjIHsKICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGVzdC1jb2RlYy12ZXJi
b3NlIjsKICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MT47CiAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAib2theSI7CgkJcG9ydHMgewoJCQkjYWRkcmVzcy1jZWxscyA9
IDwxPjsKCQkJI3NpemUtY2VsbHMgPSA8MD47CiAgICAgICAgICAgICAgICAgICAgICAgIHBy
ZWZpeCA9ICJwY20zMTY4YSI7CgoJCQlwb3J0QDAgewogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDA+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgY29kZWNfZGFj
OiBlbmRwb2ludCB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxheWJhY2st
b25seTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3QtbnVt
ID0gPDI+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhaS10ZG0tc2xvdC13
aWR0aCA9IDwzMj47CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZsaW5rX2RhYz47CiAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owog
ICAgICAgICAgICAgICAgICAgICAgICB9OwoJCQlwb3J0QDEgewogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDE+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgY29k
ZWNfYWRjOiBlbmRwb2ludCB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYml0
Y2xvY2stbWFzdGVyOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyYW1lLW1h
c3RlcjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXB0dXJlLW9ubHk7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGFpLXRkbS1zbG90LW51bSA9IDwyPjsK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3Qtd2lkdGggPSA8
MzI+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmbGlua19hZGM+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKICAgICAgICAg
ICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgIH07CiAg
ICAgICAgfTsKICAgIH07Cn07Cg==

--------------TKOfELwxPDX5M16xEgxIpfo2--
