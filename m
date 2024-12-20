Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696711CAF
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 00:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734655398; cv=none; b=Yhup0mEL/6zmgVsP/Xw52ElAYJBTCeAIdChQIqZGtENKavPnz4ioJCwqVYvbm/15/SENZbViqcMQ6w+/aGvv/DWdnSjeXxInAjuO4iHYOLxNb3w8HjMGfhxoh0yafsPbS6zpCwaWINEKjDSQCxMR76pUzOdWYZI6wcmWLIzHl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734655398; c=relaxed/simple;
	bh=pnEgFGaNsm+Cs1XoAqXzmSyAhRGX8SfNv2S9Y00pkSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LeWAmL4f8402BB1YUcZMJoQ/QQDVYwXAKoONkxSHpdl/P53PtWLmH2gDHveiDzgIwbQE5I/QAgC0jmQsSyMwtKenHLgq90YyOwOwImltyYzxt/+vhnz8QITBPlqiBK7c29q1O8xcxXGTWNq0F1fw4iD67XzkhsSS0yMZ8HJ1vJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=Y1iGa1En; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="Y1iGa1En"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date; bh=saT6O1p9ChSWePrD5DHUMVps7R1NcDBOoqFrHHjGIdM=; b=Y1iGa1En+Zj3QIx
	dgqAHZ9IrqmXdiOmBUabAUb6wJPUoNyXzt4GOqfpvSzSkdGP8t393F3FaNe37Nfya8cbamYgziOmH
	ccbejA/7J8GvCAeNapSINQKy3oBLhKpm4A7Tev52WvZfWErMZn+lEJlNY39U+B2/K0mDoE2suetOB
	YniQ5g4djswpHSl8AIgLE0z5hNXpkKLGsLbvDMabwKxg/coNj1p4DP4P0SC3ij4JcxNu9Ya+Zwb9D
	vLKrH0ZuODELtRFoMdujDg710Nd/f7lEpJ4vZttkBB0VAqVzLi3avCgCY7HTdAUgmrX/HrRb0j3SR
	1PQ9HxXiVFvQACi8vlg==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-0817c713662e434d0) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tOQSW-0000000087S-359y ;
	Fri, 20 Dec 2024 00:01:36 +0000
Received: from [220.233.184.101] (helo=rpi5)
	 by CMR-KAKADU03.i-0817c713662e434d0 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tOQSV-0000000053U-24NZ;
	Fri, 20 Dec 2024 00:01:36 +0000
Date: Fri, 20 Dec 2024 11:01:33 +1100
From: Stephen Gordon <gordoste@iinet.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ASoC: extra format on each DAI
Message-ID: <20241220110133.2e8f1986@rpi5>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/7+k9fAFBo/kjv+dNdW0ldHY"
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=ONoh3zaB c=1 sm=1 tr=0 ts=6764b3e0 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=yC-0_ovQAAAA:8 a=wJS4Av5FExyJiEOqahgA:9 a=CjuIK1q_8ugA:10 a=UQzexoHzjaUpTOI2_FUA:9
X-Cm-Envelope: MS4xfBcfCUFx0d08gCSknGL/oJQdReQRwpvS5dOQ/NZPwJsstOcSvlGcxCkwVoUl6GLO9B9Jn+8mjHiK6ADkUbzjz02oUJ4FKztmpJoMZWrwqMFHNvIqq+/n YYdvDMWeFf9Wn54VM5etKEuIxL6WarNvmo236rxRfbnY5Ptw5dBNZHRlD3PtfrCzgdaJRxLvkiAF1sq+24CiSxXRXmYaM03Xnu0=
X-atmailcloud-route: unknown

--MP_/7+k9fAFBo/kjv+dNdW0ldHY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 19 Dec 2024 00:34:27 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> This patch-set needs Stephen's Tested-by
> 

Hi Morimoto-san,

I am attempting to test this by applying your patchset on top of
6.13-rc3. But I am running into a problem, probably because my
graph-card2 DT is wrong. I've attached the DTS file. I used the
Semi-Multi example.

Here is the output of dmesg when I load it:

[   27.277613] /soc@107c000000/sound/multi: Fixed dependency cycle(s)
with /axi/pcie@120000/rp1/i2s@a4000
[   27.277635] /axi/pcie@120000/rp1/i2s@a4000: Fixed dependency
cycle(s) with /soc@107c000000/sound/multi
[   27.277820] /soc@107c000000/sound/multi: Fixed dependency cycle(s)
with /axi/pcie@120000/rp1/i2c@74000/audio-codec@45
[   27.277841] /axi/pcie@120000/rp1/i2c@74000/audio-codec@45: Fixed
dependency cycle(s) with /soc@107c000000/sound/multi
[   27.304322] designware-i2s 1f000a4000.i2s: ASoC: Registered DAI
'1f000a4000.i2s'
[   27.333791] asoc-audio-graph-card2 soc@107c000000:sound:
/axi/pcie@120000/rp1/i2s@a4000/ports/port@0 (Normal)
[   27.333813] asoc-audio-graph-card2 soc@107c000000:sound: link 1,
dais 3, ccnf 0
[   27.333822] asoc-audio-graph-card2 soc@107c000000:sound:
/axi/pcie@120000/rp1/i2s@a4000/ports/port@0 (Normal)
[   27.333830] asoc-audio-graph-card2 soc@107c000000:sound: probe with
driver asoc-audio-graph-card2 failed with error -12
[   27.346051] pcm3168a 1-0045: ASoC: Registered DAI 'pcm3168a-dac'
[   27.346055] pcm3168a 1-0045: ASoC: Registered DAI 'pcm3168a-adc'


I would appreciate any advice you can give.

Regards
Stephen






--MP_/7+k9fAFBo/kjv+dNdW0ldHY
Content-Type: audio/vnd.dts
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=graph.dts

Ly9EZXZpY2UgdHJlZSBvdmVybGF5IGZvciBtdWx0aS1jaGFubmVsIEkyUyBpbiBjbG9jayBjb25z
dW1lciBtb2RlCi9kdHMtdjEvOwovcGx1Z2luLzsKCi8gewogICAgLy8gUGk1IG9ubHkKICAgIGNv
bXBhdGlibGUgPSAiYnJjbSxiY20yNzEyIjsKCiAgICAvLyBTZXQgR1BJT3MgZm9yIHRoZSBSUDEg
STJTIGJsb2NrcyB0byB1c2UKICAgIC8vICh0aGVyZSBpcyBvbmUgZWFjaCBmb3IgY2xrIHByb2R1
Y2VyL2NvbnN1bWVyIG1vZGVzKQogICAgZnJhZ21lbnRAMCB7CiAgICAgICAgdGFyZ2V0ID0gPCZy
cDFfaTJzMF8xOF8yMT47CiAgICAgICAgX19vdmVybGF5X18gewogICAgICAgICAgICBwaW5zID0g
ImdwaW8xOCIsICJncGlvMTkiLCAiZ3BpbzIwIiwgImdwaW8yMiIsICJncGlvMjQiLCAiZ3BpbzI2
IiwgImdwaW8yMSIsICJncGlvMjMiLCAiZ3BpbzI1IiwgICJncGlvMjciOwogICAgICAgIH07CiAg
ICB9OwoKICAgIGZyYWdtZW50QDEgewogICAgICAgIHRhcmdldCA9IDwmcnAxX2kyczFfMThfMjE+
OwogICAgICAgIF9fb3ZlcmxheV9fIHsKICAgICAgICAgICAgcGlucyA9ICJncGlvMTgiLCAiZ3Bp
bzE5IiwgImdwaW8yMCIsICJncGlvMjIiLCAiZ3BpbzI0IiwgImdwaW8yNiIsICJncGlvMjEiLCAi
Z3BpbzIzIiwgImdwaW8yNSIsICAiZ3BpbzI3IjsKICAgICAgICB9OwogICAgfTsKCiAgICBmcmFn
bWVudEAyIHsKICAgICAgICB0YXJnZXQgPSA8JnNvdW5kPjsKICAgICAgICBfX292ZXJsYXlfXyB7
CgkgICAgY29tcGF0aWJsZSA9ICJhdWRpby1ncmFwaC1jYXJkMiI7CiAgICAgICAgICAgIGxhYmVs
ID0gImV6c291bmQiOwogICAgICAgICAgICBpMnMtY29udHJvbGxlciA9IDwmaTJzX2Nsa19jb25z
dW1lcj47CiAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKCiAgICAgICAgICAgIGxpbmtzID0g
PCZsaW5rMD47CiAgICAgICAgICAgIAogICAgICAgICAgICBtdWx0aSB7CiAgICAgICAgICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+
OwoJCS8qCgkJICoJCQkrLS0tKwoJCSAqICAgY3B1X2kycyA8LUAtLS0tLS0tPnxYIEF8LT4gY29k
ZWNfZGFjCgkJICoJCQl8ICBCfC0+IGNvZGVjX2FkYwoJCSAqCQkJKy0tLSsKCQkgKi8KCQlwb3J0
c0AwIHsKCQkJcmVnID0gPDA+OwoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUtY2Vs
bHMgPSA8MD47CgkJCXBvcnRAMCB7IHJlZyA9IDwwPjsgbGlua19jcHU6IGVuZHBvaW50IHsgcmVt
b3RlLWVuZHBvaW50ID0gPCZjcHVfaTJzPjsgICAgfTt9OwoJCQlwb3J0QDEgeyByZWcgPSA8MT47
IGxpbmtfZGFjOiBlbmRwb2ludCB7IHJlbW90ZS1lbmRwb2ludCA9IDwmY29kZWNfZGFjPjsgIH07
fTsKCQkJcG9ydEAyIHsgcmVnID0gPDI+OyBsaW5rX2FkYzogZW5kcG9pbnQgeyByZW1vdGUtZW5k
cG9pbnQgPSA8JmNvZGVjX2FkYz47ICB9O307CiAgICAgICAgICAgICAgICB9OwogICAgICAgICAg
ICB9OwogICAgICAgIH07CiAgICB9OwoKICAgIGZyYWdtZW50QDMgewogICAgICAgIHRhcmdldC1w
YXRoID0gIi8iOwogICAgICAgIF9fb3ZlcmxheV9fIHsKICAgICAgICAgICAgc2NraV9jbGs6IHNj
a2ktY2xvY2sgewogICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7CiAg
ICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47CiAgICAgICAgICAgICAgICBjbG9jay1m
cmVxdWVuY3kgPSA8MjQ1NzYwMDA+OwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICB9OwoK
ICAgIC8vIEJyaW5nIHRoZSBJMlMgY2xvY2sgY29uc3VtZXIgYmxvY2sgdXAKICAgIGZyYWdtZW50
QDQgewogICAgICAgIHRhcmdldCA9IDwmaTJzX2Nsa19jb25zdW1lcj47CiAgICAgICAgX19vdmVy
bGF5X18gewogICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+OwogICAgICAgICAgICBz
dGF0dXMgPSAib2theSI7CgkgICAgcG9ydHMgewogICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CiAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKCQlsaW5rMDogcG9y
dEAwIHsKICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47CiAgICAgICAgICAgICAgICAgICAg
Y3B1X2kyczogZW5kcG9pbnQgewogICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3Qt
bnVtID0gPDI+OwogICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3Qtd2lkdGggPSA8
MzI+OwogICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmxpbmtfY3B1
PjsKICAgICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAg
fTsKCiAgICAgICAgfTsKICAgIH07CgogICAgZnJhZ21lbnRANSB7CiAgICAgICAgdGFyZ2V0ID0g
PCZpMmMxPjsKICAgICAgICBfX292ZXJsYXlfXyB7CiAgICAgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDE+OwogICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKCiAgICAgICAgICAgIHBjbTMx
NjhhOiBhdWRpby1jb2RlY0A0NSB7CiAgICAgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0g
PDE+OwogICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSxwY20zMTY4YSI7CiAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAib2theSI7CiAgICAgICAgICAgICAgICByZWcgPSA8MHg0NT47CiAg
ICAgICAgICAgICAgICBjbG9ja3MgPSA8JnNja2lfY2xrPjsKICAgICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gInNja2kiOwogICAgICAgICAgICAgICAgVkREMS1zdXBwbHkgPSA8JnZkZF8zdjNf
cmVnPjsKICAgICAgICAgICAgICAgIFZERDItc3VwcGx5ID0gPCZ2ZGRfM3YzX3JlZz47CiAgICAg
ICAgICAgICAgICBWQ0NBRDEtc3VwcGx5ID0gPCZ2ZGRfNXYwX3JlZz47CiAgICAgICAgICAgICAg
ICBWQ0NBRDItc3VwcGx5ID0gPCZ2ZGRfNXYwX3JlZz47CiAgICAgICAgICAgICAgICBWQ0NEQTEt
c3VwcGx5ID0gPCZ2ZGRfNXYwX3JlZz47CiAgICAgICAgICAgICAgICBWQ0NEQTItc3VwcGx5ID0g
PCZ2ZGRfNXYwX3JlZz47CgkJcG9ydHMgewoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3Np
emUtY2VsbHMgPSA8MD47CiAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeCA9ICJwY20zMTY4
YSI7CgoJCQlwb3J0QDAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29kZWNfZGFjOiBlbmRwb2ludCB7CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGxheWJhY2stb25seTsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkYWktdGRtLXNsb3QtbnVtID0gPDI+OwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRhaS10ZG0tc2xvdC13aWR0aCA9IDwzMj47CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZsaW5rX2RhYz47CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgICAgICAgICB9OwoJCQlwb3J0QDEg
ewogICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+OwogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29kZWNfYWRjOiBlbmRwb2ludCB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYml0Y2xvY2stbWFzdGVyOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZyYW1lLW1hc3RlcjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXB0dXJlLW9u
bHk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGFpLXRkbS1zbG90LW51bSA9IDwy
PjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3Qtd2lkdGggPSA8
MzI+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwm
bGlua19hZGM+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAg
ICAgICAgICAgfTsKICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgIH07CiAgICAgICAgfTsK
ICAgIH07Cn07Cg==

--MP_/7+k9fAFBo/kjv+dNdW0ldHY--
