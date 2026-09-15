Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82284A2A7D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478297; cv=none; b=fhvpzl+HG/6Lmp46UhAl9S0HSMZNh+o49PlQY2TPtX9lb6q6Cq9bzxHOkT7e4YUiT5TkP1CQ54pLpfhrlSdV6XC/MLgZ/4FmK4iIJap6QyvrO3w+Qq2+Vc3LedP6oat1GlkPEr04J59qpUROHSawsn4EQDhmfzxHsShB5QyPV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478297; c=relaxed/simple;
	bh=fMMT7KDyQsoYNCmheCV7pMEdLKReWz7gdFZDpKI1mGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1eZc8NQbMVSOlpeR6qgdkPVNIdaFJgv0ZIZQBg1enVe0jMJjO9k4O8DFFNZIzBKEDoui/PyreXbMbH0PBpyiWiFJCzmcF8uS/z8XPgBJz73jFncy1Y57i77vkKqw1lAhkBLcSaHPDXpNh1xoVfD8faR4LuLIxdXMFMkOp1kM4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OksDAJrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8FhoUyu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OksDAJrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8FhoUyu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD03NX156038
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=; b=OksDAJrh7ug1q5t5
	xcJdL08GNas8SYYTIuGuT7iztPVflBn8nCP6xLNqJ4yW9AjA1jJ6W4Z2ykM7mPby
	/b33Nl7dOIhIh3RztKQEPkmYEkM0qzq96ivGjVXFjP5x4dZeoPqvZQCWs6YVKdog
	JfymjtlpDoDKUaEF3vpiqWlnSlHNbI37OaT9WBsQNiAQqDRUAItMKg+eU5xLjoAC
	LPtbrt60R6uby97mA25Wqvz+pMl+nSwucY/s5Jhzf+YG7vAlnEO4gm95z31wU6IQ
	eWFRfZwjC8EoEVR+5B6sxDFERzSt+i6MurqPikoP9frM+LcaNodKNFGgfOzHPIR1
	148WOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jesqq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:18:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso237721385a.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478293; x=1790083093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=;
        b=Z8FhoUyuOLGvFXbcHnebjO8Jrefc5K1afkJbXvJsMIWxYu3B4Q1O0RKCPFkEy0KhNc
         0eMbIIMPZm72XIeA6EjQ7q1KkUExGcP/CWovjcSgMtX+C4lnAieAqtFtCAqi/ltjALGy
         aYtb6XC2BdHaP/unB5m9o1CYvGEMxIIKuLJ6Dn5J+rFr9O1S5qZo9wJyDJ3LQSgDUtZu
         nC1JD4j/ve77/WI4Ck8ZRWo4a1VcLXK7QpHat2RaKQv5wnp2WZYPnkNX2NlPfKa/iM3v
         VjxiXYRCe6rNBFH/HZahiP/5p9mSV7Z4zH2yFvfLOeFSC+N4zYP5Gc9QW8ntxCXQCkig
         XgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478293; x=1790083093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=;
        b=CuQzdJY+o1cZRrZAEodbESZCo7dQGSbxSe16HzyEbS2g3tlZMbg8M6Lfm3KMawWM53
         /sTufF/uf0cCGV6ArYmh7k6Aqt6qwF8lb1IbrPsqAUzKyxKIZSyTfrJUDhAwi9wZmQ1d
         SDFCLkyHcX7weaZ953Ts7ORXMtWgmyYMkvguoTIRSPqYTbUul2aOb14T/eoq1HqqYGRo
         fjW35oqz24lXyXylB8apGLn9cUmtgY/PcimFXR34ahTYWramwDeijmk1LGBoEl6us4PY
         VQ3uQXTw6PxrmcPyewRbr175dlzfj9uMSelBuIcB8X4Ky0wnPUlF30IpdSCNawGo6x3C
         5slw==
X-Forwarded-Encrypted: i=1; AKwUvBxFDONjQOM4NYuRrXBTVurhAZo5Pivij078hxBreM92CRPQUTur8F8Kex5VHN5yi3bMFi2zne6y7tGBhw==@vger.kernel.org
X-Gm-Message-State: AFuF++lZJXGm+PRaGE6TtXftYhlSnY82cnNp3FzMM9zVU+15AjW0gn1R
	q4TtkZFJF2sslFCixiRSx5v8N8HZEDJ168YgXJIIdIrFgTCpoR/2uSqcU0QNam8kmSaU0xeB4Ya
	o38zQ8kU8RwCl2aZY7Gagv5LKzjv8J7v64q2Cf+CJ1Yphdk7nboJKZhlGkRyfFy3jKw==
X-Gm-Gg: AYBFou2LwieldRxywULOstGIe5h+YtENKpvR/IDpiG9yNn4TMze0Xy6RFGwhN78tro0
	a8QhcuOB8QcJ2wgrVUQVDctZ29lhti/YwI0TSzk7AJ5aWGkfZd0ICnJFvhNmxd5YllERqi7QyhF
	mP03uziY6GPMcXcsVhac77rphsrFsSQtCeiFXXVkYywwuPKKzUJ2cu6xm66lwOPIHtJIDVxU+Fn
	r2h2cdKIYiR2YGbqh12n+lJnuwDZVkCUs32kb9p7ni+9CPT1wn1CVPtvpuLF923/L6aXF88vLUs
	kNfI/C+4pWX7fL8P8c2md2aoWcPPuKb4qfIDSf43oq34A0dkWuFFfnEDexnSI7yv0QXjocgC5NN
	X3UD/77zLAPhNfzfzvcA/Gs+yZRM=
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr478721985a.29.1789478293311;
        Tue, 15 Sep 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr478716285a.29.1789478292807;
        Tue, 15 Sep 2026 06:18:12 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2966067117sm597020266b.33.2026.09.15.06.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:18:11 -0700 (PDT)
Message-ID: <bef1437d-6ff3-436e-bd18-2a430fbb355e@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:18:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soundwire: qcom: add multi-master support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
        vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfXyTWT6sHNkrlC
 sZYQqx7/bTq4WkZorCEO7UpettH7vEDGePGEAXF/hUMap/dOWwndmPSXQEkViCMrIHrL2DUqwLF
 g4XZyNu0pZrPA7FdAm3OG6svew4vcCk=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa94596 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Oxe59_bkntSI8SC7MgYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2PJt9SWwD488rTLNV7KI9pqkfT-59afh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfX5JuakwHnUBaM
 9GhZZYxenGHGjklQ93Ce8p/WTV8LYQ4Il1scJ3cQbuo3sTMxQCWCmSGavaWxCtSBlZ1ZrkFBQXt
 rMma2j8DwtQwQeroas2jzoeTkr8wAg9nyO6MgtoVPrIPeQzOcNLH2cRTqg6L6a1bt2pwnw8PKKX
 Q4HkAxagSP7VAXFj6x0NHSDF0Lp/psQPbUaWU8/vxt2jN/8Pvyny+Q+p17Qt1r+4q7nfFo98EUe
 Pu+bJ22efL4REBjuWjT5diM2H1/tMffMyoFxXdMit39gt6YgN08sPgTMadHA+tFpJ0/lmVQNhJj
 3wDsnOWjQyWZDnt1z1rdMRQPFcx9nabUeBvAUrlwQb1Hs9pIr0pEZkg6vOprAqAqgK+I3IdWy/E
 +ZaVW38oGH+oq78O1MMrbEeXIIx9WWqX5Z0FvuJzx+1SoMzmUdaJC8An08WKaQjBOYSD0NjC5HP
 9R1yFVuVQNS+TqXHYLA==
X-Proofpoint-ORIG-GUID: 2PJt9SWwD488rTLNV7KI9pqkfT-59afh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150192

On 9/14/26 6:21 PM, Pierre-Louis Bossart wrote:
> On 9/11/26 10:21, Srinivas Kandagatla wrote:
>> v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
>> bus with more than two DATA lanes. One IP owns SWR_CLK and drives
>> the bus; the other contributes DATA lanes only.
>>
>> Support this pairing on the driver side. A device link between the
>> two IPs enforces correct unbind ordering and keeps the peer resumed
>> while the primary is active.
>>
>> Single-master deployments (no qcom,multi-master-mode in DT) are
>> unaffected.
> 
> It'd be good to clarify how the command protocol is handled. Each IP is
> probably capable of handling PING/READ/WRITE commands in Column0, but in
> the paired option the primary IP is the only one that deals with Column0
> and all other DATA lanes are just data?
All the control/command is only handled by Primary controller, dependent
controllers only contribute to additional data lines.

only Primary handles slave register reads/writes.

I will clarify this in next version.

thanks,
Srini
> 

