Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798487;
	b=uTf1SDdPv41XLw7eBFKFv3T1yxo3JohIw3fgigyU+JNFKsCQ5RVUBBXdzB+K6AMYKbKA
	 30owf01Dsu2U8GdIekGaMgj0GsTxnZt3qty8Q36nkJ3FUHLQ/TiKwJcGpkPlTvNJxkHWr
	 E5qG0TNe4nRaewpsoLJKRKOvQqXZO+vxKSAIn1EB045fD1fpCnyN9inGz+Oo2ZKeXMXZz
	 8hKeM5LSWEC3ZKAlkHyf8TTKfe0nW1sy6/PggvjOOBXe6wxwsGPmB2Yu2MO/qixSa6G1f
	 oGo0B4qA3mvWv+y4qXSK9gmvZKV+S6cviHNjdCmhatHAvx6Us3S3ZE3onenzI93Ra3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
	b=lGfaOUSlWTtI4e6YGUwKLXMT3+StTghsbuycIh7AFJS6hHJE5ozI9Qgsv/u5HA9ZBdFC
	 jifpPT2e9oHSBAcgJ6woQInYfWVCmzQf5/D8Ov0p+AOmYFCKAVGoaWeAMkpnbGuBWKOmd
	 AXOkLPC+eTHW/TRA4f/O2KX9kXRKh+Ffjca9mgn9mWHH/aNb9rq7tEcLngqA6xddu93g1
	 rpr/D4FMEgHoQpvOU79lYEDaBESOvukHTgRlYRb20JdE9SXAUt27hj4IZlhjM76p+ARt8
	 xSVwrvzV6x45kDyq440do45Oz+eR1xJYIfuQUB+EWynPochkx11olWWapAH0FK6/pCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7mhROGi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2uw9ryP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4036606D805
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4036606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7mhROGi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2uw9ryP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba09k1149880
	for <linux-sound@vger.kernel.org>; Wed, 4 Nov 2026 13:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qo4pe7avcSY5Cv2vjrKx5CQZ
	iGftqTo4ZYX8oBfFgQU=; b=R7mhROGiOL6p2MqnlO1Hg6L2M8Ht89mafYPL2Dkl
	f+4hp8rWPFWVDcirAgkzqrJPWVjrvLM6nnIikWuY777x9dd6IIYEBJgy1K7VJleO
	rNalgb6jwpFkReVE4yMSy+rY6KA3qZx9JgkCMbVhi9UrVmZKkAovaapNOu1AGAtW
	SpljDoCPzw5evg7bTF74EO40pgdEUgYfxaC0LJ/kVLt40xX/8D74TcrT0erKhUGc
	Gbj6d3T2lGwZYOKziqXQnsNpJ4L1afRkHtmfNRvFZpO/sRjjabBfBIvbbWu0V19B
	z0tTJKIWZLbAPwiSU9DMdHMnsQDIdnUCfu3M+L4LJY7sdA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y3x0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 13:21:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so19026e0c.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798485; x=1794403285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
        b=O2uw9ryPc4xEeCfO8TPlgEId+43tfNPkoi3xfTVO1jPXwiSMP4CZqaJCffIvh518CX
         kVsTzF23ih4qLJohAsPk7rRwza9MvScQPMPSHW1NZbb/9JKG595tk5N2NejFvkef1G3o
         ahybGlUN+X2t7lwwZV2SLazu4zBgppP6N/JHwEpnGTxrNZgNqoN0icGzmlAkHAplGbRx
         ASd/EXHLDfMIAYNEL1ilZ6mMrxxdNBg1T6+bjyp5T5cMg0P09XyssdXuswTZcX58jg2C
         n8PKruAWUYz7qRRRpasRcGneb9pld9FeCWjs2OPogwwKXdD8nhVGV67iEY7HoX5a1ckO
         Qlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798485; x=1794403285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
        b=JTCaF9G1TZxPPkxO9v943jmma7Bf1qoH1lRfcdrDfZ0bu0niHJoqXZjbXy40rSv8Cg
         z3DTN7wdm6ykDex+Vh57xruDd0TrGFyuOqaQwjcNUBAi19cOgAvz+it+nLAp8klZIF4z
         aOqJQtVVkflO6DIdX6uZ9FyOGFO75YgqPmu5eQgs9IDsOhxbklHVB0ljYeC4pilfGlhT
         V59fP//VbqLNgVFwge72WebMfrJ2WxcIxfbAfcdaO7XM3DNKEDA9xytwCE3u2hDQaYTE
         P/5Lg8J2u9xdBOcnQhifvOo7uEXjz4mN/EQ7znh9xoPFvFab/M36HKihdSF6UhnEenKf
         WzYg==
X-Forwarded-Encrypted: i=1; AKwUvBzuR3S+Umn1apyiQm3e8Z46gmZ0i/ySF12ZtyYqoglxQbCDFW53R0860/qhSk8zOdP/dkzGqCRTAWlPkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+DHyhTjH5E2nIudxqjhQZkQtirxYWvSehwVg2tdxxun4ZP8Sdg
	ygVwbZr3UzCJzjEDsEBOaZFEpXiPQDFy5Y1VnZeQySlqFo7r0UAnmnISDLDMYkP0Wi1Lh2h+zM1
	wIZi67H1/h8I4nfYyaJ5LHUs1SHv8nt2BOW7ywrWI1fUKhwuWDein3/vWlqOrnwbroQ==
X-Gm-Gg: AYBFou36hfdEBvMKdnH7OL6dcuo+WBzNb72vpe3M+HXvOzzZGbrZGQ4gbZ4pEkAZcsA
	FNfF1nXdXgv1WXf8dLE4ajhyqDJtqquSqUbl0PbeTo+tUcJnR8egh1aLuFreIOHWTjXTiEvcyOo
	VkzPDVE8KDwQVqmmGEURWF3F0aIPjo5nJmMNMuurixFp4sZ9q8b4bMSQ9GRIWgcSXiI0K+dfyWr
	/SW+ZqkuYi6YtuaJxnM+F74Ne8N3GpXZ/r4j/SVThIoHcn+8Yaa8ESM6MnKrgVCGNUJ1OnC5wBT
	BTjI0pyIZCOmI/LJcP/0olOYgeNVA80+lvVUo9G3dXfXRFcJPAO2SH0oV3iszrXQ04zcLsBKB/Y
	GbaaCqhVICA02lcHMqzWZFdsJmLW235ICBQFzCL/AmpzDBpuPqTQgzKuy9GP0czA=
X-Received: by 2002:a05:6102:149c:b0:7cc:9d83:c670 with SMTP id ada2fe7eead31-7d0727380dcmr4847985137.25.1793798484379;
        Wed, 04 Nov 2026 05:21:24 -0800 (PST)
X-Received: by 2002:a05:6102:149c:b0:7cc:9d83:c670 with SMTP id ada2fe7eead31-7d0727380dcmr4847970137.25.1793798483608;
        Wed, 04 Nov 2026 05:21:23 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm4151228f8f.33.2026.11.04.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:22 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: qcom: apr: Narrow critical section in error
 path of gpr_alloc_port()
Message-ID: <f5iivuswaihysan45izwqpzgnrvxjdvf3qqq7ihw6bcht2xzcu@6fxt4h7hg2b4>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: jm4XzJ1HFblOyQ6ZZ1GJ6vj-GN45q1pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX/zs3tLUKVrU4
 hWpOJetEkCiYWhl4aWxW/069Oj6GIT+6itcBBENT0NWHdgLaEhpAg9bveNg+gjWpJTSlz5D5Gf/
 pPQ2CnyUjGPsqzSWG656I4dkuJ0y8Sl3pO5VPRctJ+gJ4iW4t4La2+64Ltzd4xttOIw0lQqlQ1e
 O9d7CCjUl8okurUMNp1IwT9TZPNODRMr07yawGYknOiRwKJQ+CWGbjKey6HXEcYooMe785JWh3N
 EIMzDe+a4gUQznA3oxgNVMChxqKU87oWkmsKtdm1ACjKx1RVuY01kSlevrGNe00+asdTRmjP6AT
 Sgq36et/5Z7gPpm8DkFdl+EgXaxzuWy9QsRMTKhJITC01jeDOlf+jfMLMm/DRM0LpfmCD6s14Ij
 XbExAsWhcZ1LSmJwIcgdEbB1Q2lFjqwABeP+Om1ftt3Yf5RNdl0YrFx27v1FGV3Va1O+ByEAiVt
 /EYhYTGAo7mtJ7Kuavw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX9Wi1iPl4kgU8
 spw31A5mjGKmwXmVYeMbkB7Vv+Ev6WzzSy3vjUWXSZ1davR0EqXG5OCJ2PgV1E0pfBt0ikeTYxK
 NCOkHJ24o3R7yrLOb6W2f10N96Aib7g=
X-Proofpoint-ORIG-GUID: jm4XzJ1HFblOyQ6ZZ1GJ6vj-GN45q1pe
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb3155 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hx4PSVFuWk2BDCO8aWAA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053

On 26-11-03 15:56:38, Krzysztof Kozlowski wrote:
> Error path of gpr_alloc_port() can unlocok the spinlock earlier, before
> printing error message and freeing the local memory, because the
> allocated memory is not published outside of this context.  Shorter
> critical section makes system more responsive, although gain won't be
> likely because it is only an error path.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
