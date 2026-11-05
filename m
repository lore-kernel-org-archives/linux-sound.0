Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868737;
	b=QXnMEoCWgl7+h99WulsCYEMIDqK/xWJg4Z85XbXZUQctHfcCAV9dE/Xia2nocLaYlkUo
	 mhbtvKgmuyFGfbxAt1IAfW3oH9DqOxRWw5/2Y2yoczc67H3dyWSH8uClbhbMY8Pw0H8B/
	 z9CxpKvluWUMIHNds3u4ETpIeSTF3bwHbrIgk5pnd9/7+21dJQU62dtQuKRy1wwuKO5k8
	 PlymQttkq8q5H4SpCr3XdgdJwZzNGaH5y1Ni3YRy21KmpFvfr37yHKWbFKyoWFWTRR0Iw
	 ymUmK5l0YlmhF3au2DL5gIOomixpKO0rWpUbaVYOSsJeHWNT9CiDFCyK0IVsXD/ST/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
	b=WDirAysvd8Rj7y4fNHveob6GaMbos+jtb3S/4BULgO/YfAEJBd+TGrenBZ8yNDWEVNDZ
	 CszIIeZJd6LHDocc3oLOnaT5QzQIx+5tJd+HKDHkb3UTYpi/TGbSXpP+Vj+tGafnkDQma
	 9wTpwtW++rsMerkAMLgRb1KoA8jSr7569XQI+bDWeaagTBtDuTZ0ddRzZDdl7K18xln+X
	 wvAdeYMEY2PsvWGYF0O8hlu9yjACujf3cvJQCQqg75ZTQ/p8h8wpq62QojL5C5N1IoEKk
	 Mw6ZS8nHbeQYyewQEGnogSs83tboTZrJRmdBtclmT8Uj+rWrI6DxoZzJsWWLulDWc4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFG9SRMZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261E606A328
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 08:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C261E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFG9SRMZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U2lQ565039
	for <linux-sound@vger.kernel.org>; Thu, 5 Nov 2026 08:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKMn93+Pdz1KflYpYZRmRShK
	dt6jXJBXPqsYlhldJHo=; b=duwbX2bqOb9603Ifb7XUTLPi79mBxD4P0AtDZQ/1
	k0SSLKBI05dxW5jcl2W9mROYKSNb12hR0aBBCDqIwRid/j7koacWsDufQHr2wHwl
	tb51kDKeRvVlMwr0fLkR8i19Fp9jwaATCbr+Xz9cS8e2CAZRwpwiyBtKEr9bBMTQ
	aYRaXT/V1l4WnrPLESMwRSCzMxbloDMjhItFQi83sb6d6NrkCcqh+CU01pu5NMGn
	XrJxy28HLL6gAA88R0q4eXGg6ofUBwG92fw+ef/Foo6tCQBrhQBv6aFZ6/KW0/z7
	cjpmS9P8DunvZcMZ+E086ULDnmonWlYefxRgRtGz8UuE3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8vkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 08:52:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91e98f04b13so7015296d6.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 00:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868735; x=1794473535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=KFG9SRMZBt52l/EkT8L9agPlGLNzNi0xaEfY6qixOKQgcpdVEe3j9D2HDIcFlOguul
         Yb+khRVklHxxK1ZxHFub+/HOcGU6dXhMEVQtM8yejitaFuI25Kee+ogmSMR7pWtI+/CD
         f8znQmaUrV2ElaulGHNyjS41hXMwYdQnEWCbH6XGC2j6u2UvaOKEArPbpbLBY8cqKvel
         ZSO9PExzKeh/e8so+rJcyzhk2rN9iWtNkPXiMgs61u3bMy4RhT1pf4IUZFfu2MNPXSY/
         Lo7YDSz9W5elGosILSlUe+HTHtwk1YHhREm2V0ubumMZqQSQXox+Ridulqu3Pe6+Eo+3
         eAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868735; x=1794473535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=EEauTiNvqLM1cKr4ZAuYfclcTf3CZwOY42IFTgw/agzy6ei79agLvISpw4U2DSoUfC
         gHI7Grc1tCp02nFWEM0RWf0YXx/PWNUKZbcbVk/iFG6BUZlQFIIxcvohd2hTK10ynAZu
         OxR3FRxAqUEZv4ZVbRrucX8Y8gXeDFDqVS1MJZJySkMQFu0uic7SuVPBZUd6t7PeW2ig
         2bI72Q43gcISXVx935aETB/Vz0sRA+r0rVSVMmsImVFiZE+aQqpPdYYRCQwjMZgHeCuh
         TjWAyDGDE+n6FFH7vT1Y8Qt5KtHhY+uU6x6cWrOBZfVoyWeJvOYJigRYKnRxCjqxjSBy
         9JNg==
X-Forwarded-Encrypted: i=1; AKwUvBzoK1iGGBi/Z3kSC/+P3eWLOkMDkMrVK2WiIDsWFQuHp9hMtaf52mxL+LVuJOZhW9yMgVT3lVOtHl1RPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0OnkKVQ4jPCrgtpoofvezYSXFPIBSZHUvyp+Nrn0TbsgIBKQ1
	t+vJwkgB3D9lwFCRrXC8weLyR7pchfP6Wg3d0OTTtQhJmfSEgwgpaR3j9h/fXltPEKl5CFCERr6
	Yh3yBLwf5LuFmVfO2z5zhM0AzZ3fS2/beaoWB9gnlIOpWqyyYWFE7DTe8BpaSpZvbgw==
X-Gm-Gg: AYBFou0j8BoVPjB5clyAdk3tf8jQBOdCkw+dt8o3dTFVRDcpzwoHpKkesOklOn/uv57
	b+r6CcP664X8X6p+uDy/ZliWKGzx5KAt7YIMFWV9jKcRIYUSZwvVfWp7+Jk5da4lNwd88aRCMlQ
	XWnwMFJ5Oga+/KiM9CHJoq1kyXaJ1/7j0kUo5yEF2OTtDp9uGQsHx4gny7pCSIe2FOQdFuh+Urh
	oSAWrW0iYPd7SvoMYhF35vnxDcF3OblJWwGRWGcIzc+DBukFX0kqaeqfb20UI3aBcsyLcr4JoF3
	soB1mxWtwY0OgvJKPsJsQ3oX/WXV8FyLqRmE0DIEQdX8/iUvHPYrjc01jWp1DE7Yq9mY39IHI9b
	w2hG8lolu8QAWufaYAJP/N+808zYHzeOQUxD6/L/RUX4VRKtA0CDkFw04woEsq3s=
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865813285a.11.1793868734277;
        Thu, 05 Nov 2026 00:52:14 -0800 (PST)
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865810485a.11.1793868733609;
        Thu, 05 Nov 2026 00:52:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm58243895e9.8.2026.11.05.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:52:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] soc: qcom: apr: Reject packets with header size
 larger than packet size
Message-ID: <diddapoxu3cgqkuldldmlbnlmlt3dpin3563rhrie5gyvg74jo@ip7omguafebh>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: eZ-h1hFJe0EBVGDABlxD8wE5d1VUIDEp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX949dHwEcPWKV
 LerwcKxmt4sFJzvqSvPqs+9SdPT+/ziAlk1BDP6gZT0Z2SUkMBj9YcwWn0Zhr2WVZM0K491SA0A
 PZ17wj0X8Ht2v0G/tSeqNZC6hBDFziA=
X-Proofpoint-ORIG-GUID: eZ-h1hFJe0EBVGDABlxD8wE5d1VUIDEp
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec43bf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX9+jEVy7HELH/
 AaIOdSo0jgXrDfEqtH5SDTfAQo0XFvrCeH9ojfZp8ozJ9RjAMoizm3gAjiBzRIYgCDVhxH7IJEU
 LsrPuaIuMPxglSsqw+h4Xh94PwvC0+jZmWhn9jZCQrtUUH+iNART96c+yRLBH8j9I8a2GEBLXgn
 bixoO0Nq3Vc1ABDGqeLfx9cPi9fx0yV/frfRKpCtVxTsq2GJW53d9x3/4yubT+3MhTNFGRdWeoD
 rTBS09eoW0jzQrMcqRGj6RpbQln0ysiBy8UNlbgNESNNp6tgbdcEpWbvCzSNMRoAi3iRQnTkwUU
 hVMeeVjwwu2tvV0YgSR07HBKqhzkmBfyzXt2PPy8LIh6RgAhvr5iE3H1+1kheAFIFMXJFD3dhHb
 idjox2U4ttNPnFptZFvSC8d875lPqLlX0+mV5XZrpfMcj3vpXiTUzTMhsCufBKroFjkrSkgOLJk
 ZMk8tZjMBVYnh2haZJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 26-11-01 20:07:35, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
