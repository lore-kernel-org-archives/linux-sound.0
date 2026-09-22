Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8D3AB47A
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092870; cv=none; b=AgGMElg0LRRbByx0WvjZ7TYqNzQRvY07EfsLs6vj9Ti2YOUElvSaI6Peg1HIej5PWdhGZPfi9Hm52jDO+ODuoorGrUfP5eYHU6J4XW57kUz6FUonOYmbp0NKfUldWVxnI6Z84+wXv1q5BrJF9Wz2H6KTOn+4H9kUS+8ETQBm8h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092870; c=relaxed/simple;
	bh=LHDUfK5CwJ8lI9grWRG7EQmwkF5ujcavl1cQEzZTRu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUm+zdh6g8TtiXxPpqHsy2Cnepj5p6t4O0Zs9rXErmdHMZ2gYJa0hpbKMSe7I4hlr552H9KwMcDYrGIxSK8OeMtVZvwD9nznejM0pmVuUq/XPACwq0DqrPeVBvu+IL966w8Fineq9oWGUzz95oLdC/o4YODnZfBqR65lcP15pXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+P9tur5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6OSGLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+P9tur5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6OSGLK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMpS3307542
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=; b=g+P9tur5DcPeVXU1
	J/qxk7tS6vpW+LpaqIZgoV6OsWFqu+2NxYqnnsdLI6mW1cx3VKGG8SJm/0uF/RaH
	G/mGn++EQ+U2oA/9gnjpqjPM9jofVKRzAJDrqv8zmIdrTOjPlyhGk6ekhX9LvCDk
	Nw++VREeVpC3cEE9TUQLGN4XSN9d3svo2dJa7BamXRPvlqR3cEoz3qRe3qj/O3YB
	EZJEe7OUMobU9lEtDtnaOnnawZn74eHElJVtfa3GsJPnQE5rvo/WDHFuq2OyHOoN
	n3zAINhb+kxqhATK3AZHWtPqABhUM8wi9evV8ji9wA1reYgNB6FnilvZvO9la+IH
	7S54ZA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj1130nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4485c1944e8so11747fac.2
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092867; x=1790697667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=OJ6OSGLKwgmrR2609CwYN85dvPyrBkAkKq5UlIw7ElQyg1/uLkAA4FJi6JP4tvZZ8z
         Pmw4w8woSA1ndcmkkXDsBv2A3FIxcLMtqvw978yLh1TWB2RBiVFOBNJBxY86kcgog7Ge
         Jk2Dx0ocRIGiRLQyPnzfMFxYDd1fWznWxmPajlvO1MACxxe1YDegvqMtl3dLMtUxRJl+
         05CHKk7Vi2p8WVGz/Nw/xb6bfUbUnpy9An8n2vkXDSFr0HqAuza0aFu8GJPy53MFDRtE
         xTkNq03RrF151CLvZMysh23W8iYoBKvy1qh9mAuFstftQOnc8DN1n9HfMS/FOD6ZZ37A
         S5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092867; x=1790697667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=wsv6QHxhSmo1wttwoaSTwMqH6r6J/QT0YdYUffBjNyCaMwBxFvosinOTEngrJ4cW3h
         cU7SaiXaUACnjP/skj9jvJarU248ALkxFKXww3HegqWbPFyHQfKoMzWNaSuV25nCFUgn
         aKiCPdcl4/SPRYXnhvNEwl0PbdP5tenlvS0zK5/XCJYqhyE7pi37wuA/YXX+Uy3ayyeV
         +jbAJUK3ORqVUzhXcP+lcysH4IOWFqMriT+FRMxYvf60KG2j99OGGO0L6Ar31XSvcplg
         ENgZkvcRnR6+HYW55NcjAOtCO+R8fSJdz5LBt4pti/O7wT55QmrWK3h/lVFpeUB8VfBY
         9SqA==
X-Gm-Message-State: AFuF++m7W/mYzvXqVW0M4kA0zs7xhLeBAC4z1oMKvIJINZh1Oc2xtW3z
	7vdFf+sCtoVgQ8YVdf9fEmUPoKEOmyu9Hsr3KAZQIRAoi7/EBOhMEOKqBBaUsXeuo9ddg7b2oM8
	Tb5qzHEB4t2qKERBU6RFKP35CdXFAYTnEUAymr4H02WIkPQz2rWRFsH6+9ptq39NyCg==
X-Gm-Gg: AYBFou0zPaUDNWsbBvlMk1q5O5e/FpSiF+mmYwZwH9y7yVu00B/r12qzyCG9C2z+aek
	Tg6+1f37atKrTpX5vWMKAFneG0G4F/MNvAPV7k1NCCz1EPW1Ax/l7Jm0gD6X2f06JjCoDTjF84K
	1Vrdn88DCd5wtQpnfv5qEziaMTlmOvyTlQkEmmPQRUYa1rUfHXI6z9nn99M1d9ZET0HeIvY9gry
	bNM6fPd8xsnpKj7zGMWSv0Arp+Zz7bdNcQ7N9GrM7d62s9jcbV3VcBqkUWpqRHDihxAbmtaFnYa
	pMSOsIlD9Kz0vEFNhqmXSleTZYXuWIF0L2+r3evy7nDstMIeMm5375bsJjlFqo++5AiSGju7iHJ
	v/k/IRIuWia3d4x+FDY3hoQ==
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165036eaf.2.1790092866674;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165001eaf.2.1790092866108;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c430a09sm110972866b.5.2026.09.22.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:05 -0700 (PDT)
Message-ID: <03f5dc64-c631-41c1-9ab3-d28a867aadb2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:01:02 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: shikra: Add gpr node
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iRZAhxm7cibouYBAJsmXHT_D7YkmqStV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX+ssZ6FdT24BN
 bfXMhJnabZcfjTdOkhIZGo+2hPqBoHFG39/fr+yyE9MCz+grYY+zo7EpdlsG6zZHp45WBB7efzo
 Pt9YrsKFaTlJXL/df42EwmRJOqef/qs=
X-Proofpoint-ORIG-GUID: iRZAhxm7cibouYBAJsmXHT_D7YkmqStV
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r52As28OqXcKNvlaLHgA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX0S1t/YwQbF02
 7yhdlbDyzEdPr9EUaKwfGM/oQsrHIufGZsjEKfsUHdzpkEqKHClKin9WsCth2fw5ZU60paE5AZh
 5rdReyRXkT+Hn6B1Nlz5RDe5TE+IWL0RodorrfAN5rpnSCJojH2TRnBRPhKlVCcNncXel0vJykz
 ioTNsLHqZ5Hf9Y2ipLbdmIBE4v00yMcFOJzBFuXtxi2vlZjNxkj/y0lVMTpfr/XwfNrLFee2+++
 CNiitzZqKkzfXqWvmccWStcP5KicaYZpQ9HiAM0gUeSSERCR0Yr9KvSbiA/wkbm8UAw3MMjgdsj
 92TIkoU8sg+FX8Hc8FvK+xL4cgwbY9UyEH4TvFcr292ZNOWh7bQsoAmHRYKWWpddUIcjJVrttD3
 H1iPiLoCbJhPMy9yDgQeqeBmor0ZpPv6mj9gVWX1OHFQmSElV17mo9wV69pFvA0nOZ+8mOvOqlz
 2g2u6H6o0BtCnqk5G9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add GPR (Generic Packet Router) node along with APM (Audio Process
> Manager) and PRM (Proxy Resource Manager) audio services.
> 
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
