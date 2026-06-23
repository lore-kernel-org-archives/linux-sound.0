Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD513D47DA
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215654; cv=none; b=pNCFq5gxYXBNxA4cMLDbt4errsb1iqQ/wKe8hNxFg2iLyg35f4rpqQV8w7AcmZvP/z3H2y/0JM5FIw8T6WuZdBso2s4e9W5fxpGMkBkzBpi6FVS6zxcWDXn4FgEhEnhtFXhISeWQP+0lXyOtu/0amOFMajOgy345CCsxaZjDm8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215654; c=relaxed/simple;
	bh=HzmAA1VaVol1lrjRsSoR0TB9cLAtuBSKhTYVKS2X9Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7OV9bKvm7yrZdIfann9TlqVb1yNNbsJz87VfSUL5gTL9L3O1ihfrQAlLmQ4kwxSL1mlOY2GuhyU5wUcxUFHpA+g1+vHTGKNZJ3Y2l0QDYN2WdanxwrJjiSpiMPQAJ8hHKb76aMVKXW4l8ZGrtbOrXl7gNexppAlfcswBiQVbZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pwd1RnkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkK1su0S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pwd1RnkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkK1su0S"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXspR3673574
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUks2ZpMUqdR0BmwujEhPYyFchbuW825u429nVy3X5Y=; b=Pwd1RnkTr8WkoG8h
	OfiPD32mXDKIiEXT42Y0bNKf8VmZNzhj3q019bnY5hM0so+LAlKsg7YVYxmHZC0X
	g55mkvNphjKa6kLJNK4I9na9fn+C3cqJLz+2FUfTzIfXSfljEFXYrwgK4D+tNSzq
	L/HGJnmJjftIy6psPDogFElA82hruqcBYeRgp06Gf9zxv59QNWoJ5gYWS0m7Y/9G
	Us1ce3PV7qb1lk3QcOnFFYgUMZ8vx5IMb7TTUtqhrv8OsN6Sa/vC05A6gPNIraxk
	zecssBVMnMpr/YFfYDfvp7/5VIawGQKz7SJi6SqU2COJlMeLFLUbdlAodAcM+Zas
	R3++cQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729v9c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:54:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7c7fdca0cso9567495ad.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 04:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215652; x=1782820452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUks2ZpMUqdR0BmwujEhPYyFchbuW825u429nVy3X5Y=;
        b=RkK1su0SVwMOb/Iz+zpo3jlaa0ydlKEcKIYhfjUeTTdeNempoIrLZ3ulToMljXV8BW
         +T58iD6wrG/Aa8R4LMj9wHZzZYlrDM7ym7gEjRPDQ/wSb2lFjqNhAY5IyYqpDxHnS5yr
         FhVeBq/5CS/fJOvsE5fzcj0FBEdfmNC4rHoeFLKwFvRBlr/kl94FRX9woBwT2tamz6si
         DkNddVwP1hQbvOjgAHGLJtGwh5lnG034UeB4x22EZs04D+xp0/YtMFbQlqAJhcKomjTR
         6TNTl31hAKxqcrFAQ6/9PToS+ePv7/aAPeJD5mD8FTj3A3vZ0nrbLtobA/XPrKTwUSLm
         LPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215652; x=1782820452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUks2ZpMUqdR0BmwujEhPYyFchbuW825u429nVy3X5Y=;
        b=ggHiLb9YkF6JLNdNOAhqesqE3l1e6q4oFmINc/drSbLoSxDB+Mp9mVNBB2yYNGR0C6
         kiGFu/Y+kr/fmuC15x0/rZWJmmi48QqgQqrrKDjBTbscs9M3QBqlxBZFYRxvH4aeiaCP
         8ztTfJ5Fgxyh8HhsSTGrlQM43jbl4zXOm72NMqp5haqeyxypGMY4ruep+h4AySnb3tEi
         KkMT0Pj82RamjQ7ciPJQEcI6z9QVUKb0BztYhIGLI93BElJW3iGWnv8wKAfs9mEEkpUk
         YYvbo40voMujrdpjdce+RB6bLaRzwqoHDuj/AcZHjmDLSTKyagHUrYf8yepQoFoyGhia
         71lA==
X-Gm-Message-State: AOJu0YzxTy6Cbh7kDg6tylRMx9gSWG76b+22N36nI52fi4TwNB8+IMVP
	IQtj5ryMUWBx8l5H8iooO0UfafQpj+xiUHv9+2xPKKzR4FtY2Hx9LYBNxQLc6d4VQbK9Da2hfuu
	C3tKQQUEfgeRjDoEP4srZAP68QOIO0FaNE/uQfD3EzJ5leFEOTLUvXbkbIB9HTcdJbCIZpSC3Rg
	==
X-Gm-Gg: AfdE7cle7jjUdWGkb6Rqy5J2cSEF6JY6yXC8Kqku85W32gWFoE9W31r6Q/67ZnbbsTr
	3Xfl0swTYePPxQjAp9Vb8TciduRftDDbMn5Q7bUqOq307epgPFxVQKF1b7M35Qtr5x82E+vnz0y
	xCW1VHFP5Q7wHSdPDRkopIFcNKxfKIzCbz41go1bi+2zGiUOue3ArnWhjtL2YqW0bDdEji5E3E0
	8naL32HoFlp9yb4U11TIb+tcIjnmKJMoK6JuCeNbMcJERebP8Hh+GVsFq+aER4dTIaRJRhKq1cU
	2rBdf8pTjrju0cI49Gi2NrSVqD7o8fEHzqic/svFD3tmQO2QMPCf9y+IBQySU+zRDRwAwjSuuf4
	3cz5RQW7sSq4F63uHe3KvYAyV1ZIHHcBbvQl1aSY=
X-Received: by 2002:a17:902:db0a:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c7c9928d9bmr20687825ad.2.1782215651756;
        Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
X-Received: by 2002:a17:902:db0a:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c7c9928d9bmr20687565ad.2.1782215651285;
        Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436afdfesm100871525ad.7.2026.06.23.04.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
Message-ID: <7ac3fd70-e628-4fa2-a681-542aa18e692f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:24:06 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
 <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX5Vxw74QPGz2V
 UbbrLcRW9x+t1Ck2yPc8DVq6S9zTH6e3+fXoIzF1nIgh/YrpxGIVd31rQeSyzpP9g+Y8vExB294
 8HodkovgwQkxckX23j/UGmUzya83dGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXyDAJedtA0TZu
 D9pusiu/+nEKt2NKNoNbYvAhYwoD1uQ93qwvZILhp+MlFu9KQOciuvSG66TydFhGc1zd5Zl/B9s
 fwZIju6Z69NLZPgTlZ6iQxNU0Q0fTSFlzKxl22exjQq7VBYVA2VXvMCpXml9sANmWx1HnSXCrrk
 z9m2RKCcG+x8i1U5y0H3hZSHjyYcAr7ojrPEdDE84h52jXzPb20Tj0R0iTYU6hTkldcYkLO6K6B
 9nZpEaHWhAHelkLo3/WjJFAh5t+RyXzAbteG9yRdpFJfQdFDy3je7uzY8sKe2qlgJMS7h9OyBuW
 pOYuR6j3+fdemXyjOrUMXEyPxuGo1RgYvVebDD8iFb6lpiZDVbPZwz8p3CGdJjy22UxA0dxtj+7
 6eF2Y8lnB9xeZo6bBh+znknB2LSrK2Q8hNmWzzRjHUuExlUNg+/Ot7nmce+nfsIvWRYscfNoqs7
 Vdctt5gIytkqqdXOfiA==
X-Proofpoint-ORIG-GUID: vqOoPozOJ-9HVY5A7OKVZYKbs0MgaJhU
X-Proofpoint-GUID: vqOoPozOJ-9HVY5A7OKVZYKbs0MgaJhU
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a73e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=l_-fzs_PQmAqn0YR6QEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230097



On 6/23/2026 3:59 PM, Konrad Dybcio wrote:
> On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
>> Hi,
>>
>> This series converts LPASS WSA and VA macro codec drivers to the PM clock
>> framework for runtime PM clock handling, and keeps WSA MCLK-output clock
>> registration resource-managed.
>>
>> Changes since v5:
>> - Rebased to current linux-next/master and regenerated as a standalone
>>    series that applies cleanly.
> 
> Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
> all messages as a separate thread.
> 
ACK, thanks for pointing this out. I will use the b4 tool for the next 
patch series to ensure proper threading.

I attempted to resend this series but ended up breaking the 
thread—apologies for the confusion.

Ajay Kumar Nandam

> Konrad

