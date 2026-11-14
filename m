Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669924;
	b=JvVewnx80e/0zM4M2Xd8JOct9ntCGfnugE0NAe4orMXimkiWMjkE4Yrj6N9fCHH68xuO
	 hKfTNcE5MFbD+tNYg7nsN7wuNz5B5cPXX4/fJHSR//gPzwQrhC7UMemnJligfNPYyz98Z
	 y9kfdKkWAns5yjtS4J8l3kpag89UVDbm9gDiuC4CSQIFBx26XdnfIUpDNuspHP5jCd5Nm
	 llTddv1NsYczTnMszBUW5Jv0kTbiMrQaccwVa9hxbC95OgpfVSPtdBU3SLjBDLjgXNP7m
	 hExb4WZUBjHzH/RA7yxP0JBXRITAateLtTo8oCdAMZ0MEQ+4aY7rt154zeiFc5/0JrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=60mPl19dHnr/jmAhi0BlWORpSiHf3XJp3c27JzB/YkE=;
	b=kqr0yY5ilMuGbFXeRnhprbFOsfB5c8cBa/Ip/2KhdmWhiFhvA0lbUCTYAexGh3wfBggM
	 hzGHIffhBQUbH6l3Gzf7w8BzEBmCpe/47YXF8Z68zhqUwT9egBFFRlI06IazSv0h+AG47
	 tb6fHQmFrxnQz5FbiVBf9lGBBWQuEfGjN5w2QZ8aLFceQ3p9nmoM7L7EYiWqKj9Jx6ywG
	 pCrTQ8mo+/kHOTpfKv/mhUdFr76nMWXbWMz/LhgBZSeUX5NyIQAtLrKZeoxMxgifZ3RAF
	 cMGXgQKxptr4bRbUjWGB7HK92FSAFfX8dZlpiyya5HJdaBoIvGoLqcKVqHjr+eQKYqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV8GQ8aV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QEQCGG4C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC625606A333
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 15:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC625606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV8GQ8aV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QEQCGG4C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkED44115249
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 15:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=60mPl19dHnr/jmAhi0BlWORp
	SiHf3XJp3c27JzB/YkE=; b=AV8GQ8aVqfxx0GExufS4HlM135bPFdElbfVU4+Nx
	7YwlrdnBsee1PTmARgHJHorkewsb337JTwHHyDH1E2LyByimGXCIAigXLdJDLJdY
	gWZm8D0YyY0PR3ULRpU5WuL3di3XtSia+65ZHhdd+FFci71a+Sf/V8H9A1vM3zoT
	7C6ZRVaBNy4euXyqHvhgx1wHVVYfdze50cHN2aA1kqwH9fy33lsO2HbmW0cFF8OU
	Hv7EZV67z984HsAXQpaaNdQBrIftwGKgY8lnXHIC72cOtWoF0n3sYjgGtfn5aIS4
	q3tlkcpq5dPtC++Zw7eXWXbRcNDoE7b6/uVWeD0ub9qdgg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjs4jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 15:25:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so2632992eec.1
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 07:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794669922; x=1795274722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60mPl19dHnr/jmAhi0BlWORpSiHf3XJp3c27JzB/YkE=;
        b=QEQCGG4ChTiAUQWccWocipyJmwQKSS09VpljiFjXrEwtGUX4stvJlxJGS8xmXrE5Ky
         OsXINlbWJFdmSFus441eKItycqrkO92SlAfez2jhtufs/RNtb7cK1SlpE8ATFeOk1p9e
         OVmcjPl7/6FoKVA+nXG9e65g7Do77XoQr307+Bq+50ZDikeF2x+AuxIXylGabtTERj0B
         RPUmDVy5ITFmM3iQvDn/RDe+MV4XfUC2dtSYXbyWZwvMbZPpEsVxfkXEVY44Jy9scQ5q
         n6vngVPI8eqhs3reDK7zOnwiXoVzSVkCpWIPEkmTQcrTTxYd6QOAGLsml5QMjYCTgCvB
         0hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794669922; x=1795274722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60mPl19dHnr/jmAhi0BlWORpSiHf3XJp3c27JzB/YkE=;
        b=V/vw9xCOAAPD5vybOJyLp47v94vPWg9rZjqKiNKN5nzC9QiBhObgIc9GPP3CqAmFFm
         tqPm5ikfcgVSL3XZXHQz/Hr1JAI24hgrQTfPVlit/8b+pPduI81DkHdNCLXK711px8d4
         b8HPnVGq3Q3Qq1PcN/uqJo12csqvPtQ8GoG8iX2mJ/PdIKqCpyVQp8VZdrYadvg/YAmB
         LEsWeK2UL9Gn9zxnBv7FQefxtVgqP46jZvBd5fxUms74iXwTfEaNnlgG2LMmVbYd5QQW
         DVlj19dEmNWheLS+ES1VhDGqWpzGePSjt736VnzwD9EokKr4dZeEJcIosgxCAWYLAaM6
         0nvQ==
X-Forwarded-Encrypted: i=1; AL+hErE09PLNhEi2GnpYeN4i+XhpfzSIE4dpiMGxSvLdo3attcsv9XXqG5BfJgxZsoWcTzWmX3ksIOZ9BjyAqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z++Yx20AC012hnuKDiHDG2YqWKOjBK/hprw3mDrn739CDQ6YJuu
	rIB8fSUKybsPGqzFqyqfuIEkRXK3gxCsxJWiap7R3J5jgDOp2qEMeGf68Rrx0QdoxqviuOmReww
	57alh1+9e7huYGikyydr9E/o9lBW1DFR2dPtaZm8q/BaOeNg3bw0MFcsLGDamQ2Y+SQ==
X-Gm-Gg: AYBFou2e8ifuNBMcs3mwwIpbAcm0nL52Q0JWyZpIdHyG3ifFquUldZThaXiQqICNCrw
	wgmvOum12XeCljDjayp19I+RkIijuJmAW8RxY7CmPhQq0t1eRGb9P4gvFg3LGreJvvpDaWspv5j
	Pb0bppJOYkOz1okTiDTtWYbWnxWejqtTjiALMCsU8TCoe0O2ej8uPF4heseZkA4QThnsmMWV0Wo
	vKnnLJiKst8OCdfFmcRfAwY9XG3C4XQme2QiO9kazTaOxh3vY8Fta7CmokMPUT4K741/B2XQH8l
	RY7fgg5EDzzQonnC7rB4VenvyL5eKCOc56+lqvb55nwTQfDol4X70GHkJNX/85/aOvaVO/zp83L
	3t9rOZ8tFMz6p5JFMhpyAwJuk+CaMOOZwey0azTcvWUXhBu/0ZChhIKj4fFCTkUlJv8/WLERrKq
	In0QNA/H08XUqNMMU=
X-Received: by 2002:a05:7023:90b:b0:1b5:b04:139 with SMTP id a92af1059eb24-1b50b0419f8mr5360189c88.0.1794669922115;
        Sat, 14 Nov 2026 07:25:22 -0800 (PST)
X-Received: by 2002:a05:7023:90b:b0:1b5:b04:139 with SMTP id a92af1059eb24-1b50b0419f8mr5360164c88.0.1794669921363;
        Sat, 14 Nov 2026 07:25:21 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm17889375eec.15.2026.11.14.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:25:20 -0800 (PST)
Date: Sat, 14 Nov 2026 23:25:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: apr: Publish GPR callback before client
 probe
Message-ID: <avh9WmMQPHWAwdob@QCOM-aGQu4IUr3Y>
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MSBTYWx0ZWRfX3D7MJU81MLE3
 dt+9/U73HfXnaRC6Ye6IZqywo4k4GvC5eNxA3eijKKCIA8+F/aSSD/3UdUMo3J6Y7Sm5DnCx+xt
 UbT3nsNgB2WlwhW5tFwakHJOgFBNQyKYAPzQ+Hb7gpShNgB9wlcCRK3Pq0oCATVMBe8q9nFgQyu
 PTcMJLZY/3e38agyRjpmc4KWVELANMHaoiYETq+WpBmfqwmPRNYhNdx6LQdA23xOEhQKOgEDME4
 EHdYYKYHVDEl/kUUh/aV1RyK/jhu6iFCwRK+ZpoRF/AR+3UmDBtya8NNB2/npvthWvrPmrJIx1S
 v8dgRZq+cZ21JdZtpA3E4RwD5Wk8Tc5MsX0YX9T5AhCKt/w0R009HjlbJ52VO8k2zbVCVlD4Asx
 69uOLQonmufNeT4MfYfp1us68k0rIbYNTHWDcw5pm6YpL+3CrxhLtYot+yf9GLbw9zKoE3QKgVY
 jGDCG0JNHZMsdk94wOw==
X-Proofpoint-ORIG-GUID: yPxQowJbbgXoz0wZi9-izWhpGNZS0ypf
X-Proofpoint-GUID: yPxQowJbbgXoz0wZi9-izWhpGNZS0ypf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MSBTYWx0ZWRfX+2x4azevr3ZJ
 7Z33r/poMvyLk2z4cj9j74QjaS+O54EC6ekBwq9Y9hNgs+eSQ2dHlMWMl7N8owCNglfVSy2zDzZ
 Q9AF0bWXMxZFO4yJhdtto6wGlNg3wXY=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af87d63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zZ4BmrX_lDwlYoQM88QA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140061

On Thu, Oct 22, 2026 at 08:11:30PM +0530, Mohit Sharma wrote:
> A GPR service driver can issue synchronous commands from its probe path,
> or populate child devices which issue commands before the parent probe
> returns. The APR/GPR bus currently installs the GPR service callback only
> after the service driver's probe has completed.
> 
> If a response arrives while the client probe is still running, GPR finds
> the destination service but cannot dispatch the response because the
> service callback is NULL. The client waiting for the response eventually
> times out.
> 
> This was observed intermittently on Qualcomm Lemans and Monaco platforms
> when q6apm child probing sent an APM shared-memory map command before the
> parent probe returned. The failure has the following signature:
> 
>   qcom-apm ... CMD timeout for [100100c] opcode
>   q6apm-dai ... Audio Start: Buffer Allocation failed rc = -110
>   snd-sc8280xp ... ASoC: can't create pcm MultiMedia1 Playback :-110
> 
> Install the GPR callback before invoking the client probe so responses to
> probe-time commands can be dispatched. Clear the callback again if probe
> fails, and preserve the existing callback ordering for APR clients.
> 
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

Thanks for the patch, Mohit! It fixes a 5s timeout with audio card probe
on Nord platform.

Without the patch:

[    4.483213] qcom,apr 4c00000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
[    4.483249] qcom,apr 4c00000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
[    4.491115] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
[    4.492141] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
[    4.492727] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
[    4.493313] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
[    9.623909] qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
[    9.624571] platform 4c00000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 61
[    9.675293] snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
[    9.678425] ALSA: Control name 'stream0.vol_ctrl0 MultiMedia1 Playback Volume' truncated to 'stream0.vol_ctrl0 MultiMedia1 Playback Volu'

With the patch:

[    5.243457] qcom,apr 4c00000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
[    5.243487] qcom,apr 4c00000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
[    5.259454] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
[    5.260433] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
[    5.261131] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
[    5.261770] platform 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
[    5.393166] snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
[    5.395934] ALSA: Control name 'stream0.vol_ctrl0 MultiMedia1 Playback Volume' truncated to 'stream0.vol_ctrl0 MultiMedia1 Playback Volu'

So on Nord platform:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

> ---
>  drivers/soc/qcom/apr.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index ea7f83916d8d..829e5c8fdf98 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -365,13 +365,24 @@ static int apr_device_probe(struct device *dev)
>  {
>  	struct apr_device *adev = to_apr_device(dev);
>  	struct apr_driver *adrv = to_apr_driver(dev->driver);
> +	struct packet_router *apr = dev_get_drvdata(dev->parent);
>  	int ret;
>  
> +	if (apr->type == PR_TYPE_GPR)

I wonder whether it's really necessary to have this GPR condition guard.
How would it possibly cause problem for APR?

The code will be much cleaner without the GPR guard.

Shawn

> +		adev->svc.callback = adrv->gpr_callback;
> +
>  	ret = adrv->probe(adev);
> -	if (!ret)
> +	if (ret) {
> +		if (apr->type == PR_TYPE_GPR)
> +			adev->svc.callback = NULL;
> +
> +		return ret;
> +	}
> +
> +	if (apr->type != PR_TYPE_GPR)
>  		adev->svc.callback = adrv->gpr_callback;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void apr_device_remove(struct device *dev)
> -- 
> 2.34.1
> 
