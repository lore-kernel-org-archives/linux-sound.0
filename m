Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD004B128D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487386; cv=none; b=MC8C218gyrmwlKjyvFCzLfvKlEnIF7GOyhRxfmQ9tNbGx6MUdLcEYLweMYurI4lsJwZLWh6q8ZabEizIvUheHSP8DDtRqPjKjUKtOwtVJutfD9zW/6iQPV6MUwITOxcTF+9kj1iBxZXNWtm+/ss5M6V3Vwb+IXNyCdsh+91IQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487386; c=relaxed/simple;
	bh=4ei91b2R3LhpqavB/TmX7B5aep0BPPMa3xpepuWnm3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcUGm6swWAwLLufVg66xrqihoCO9OQTe/yPZInF9MWFWy8GN7phQTKLBDtqKg5O+wA8yAQQKy85qBE+Rh5tpYUcIBisPOJRHj5L7fzkSaoGMLsLVeKnQ+pfJOoSfnBihrqbRZHjTYFzOYz2JXcN1xA1cmAKU9lYx/tyNKxKy+hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Rg5v5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un9nBENj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Rg5v5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un9nBENj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAfQV3567052
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 15:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=; b=h6Rg5v5FSw/YNtTU
	vroXO3zDJH9SA1yOYDyj3IVvfIBTQ9lrDeBr6d0zGrmPT2nAiFPEF/p2VlTOTb4M
	Cjao1j3rFUPIjobRMHQiAXDxhVtGwVXD2anwGZvxoklUYzWZPUdahvwu2mLWKRM2
	wGyXwkIUZ8ANcEaTL3+lISNjixWZxrYN+Sn3zoGc3jj0x3iEJTByKMx9PLYeraD3
	b6nnUhtAV+UgtAdptqN5XW18hhCvbDuHrJZQ0SRXvX0XCdW6FfCLQswuzfEUuS8h
	L/PCdbqGVNh7JvWG+B5nsxCKtJ1V2bMo1UMvbtkSUr0UzN/I/xgabZjSprGJJZWx
	UyBrqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxydasxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 15:49:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5923897a91.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789487384; x=1790092184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=;
        b=Un9nBENjl+gtMN8FS8w1CAMgtVO0hPSffRcdY8fonRLBHOdKUQrOXjfEllXyGHwpSf
         LEcOEv8xvbDpQyN49J3S5K0/qwR+Ovwf861gTxfLDksOFEpjGpMk0zswwDxVD8vTGK1s
         qzL1MDBoHaHqpeg3sA0XjmTHgansInLhU+oQIFHoUE+2eJtbNqnob049xZcxAwOPeMjH
         yArR3UmvYhT9voZtkkadG5Oo4PUJJ1FFtM85JCxY4x3nA6Gu2pUzS11y9OydBMPre4Xh
         JZ3pgkXDnc3tR0J6wYfnoJInHZU1ufDKz/F/P4jP5R9I2T7ig8MkvLOmD+TPRNi2hYmC
         vNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487384; x=1790092184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=;
        b=m92vsAZWdyK2l5urAI4AEI7tfWpAXZYPbBS8RI48uIcGUBGektXYITmHieDZ5W6hzl
         3jGsPkNCQ5AG0s3NucCDYxAXUj01U4AcIUjT2CTqbnewAuQv+wjUeMnU2her6pmk5XsA
         MxD4YCIXAkR94LWJ5aNF/VGDlcB07RGsRVcxk7wzNEhYyifTmXRxsZYggddPPXTaipxN
         b7rBcuMabYrMKKUIkRghZMJz0fmHQwD5zb2yFfu2v9qA+CGuda60nISQ35fT3bUeDMNr
         MXxAwm3xKGhUVvPYSJDH7hrEVznzQavui76+lYphD+eD5d49gbXtaPcun5Tm6S9F5I0o
         5V2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzoZIWWmbRRWhBAOAYKumhOGI0qh+xqLA/WIuPB3OiOkqrKFCwrGsrgMPB13G4040Tr9ssCRX9v9V0G+w==@vger.kernel.org
X-Gm-Message-State: AFuF++mVLUDaKJSk6eIjlY2c5F6iHwSyIwYPhdJ2wHXJGYEag4oxcxj5
	WOYTABa9JS++82kr7DWDGyv0r380FQKJrfiNDxXVkcTtQn0VLzGKWvL9PivLUhQ7wKbpzoG3mX5
	Uxo8JTMJeMJnJ72iNL4gJAZUiEc6z7m3iOfVowiS8E9SPtv0/XVgCpBvk9Moa71F2Aw==
X-Gm-Gg: AYBFou1clhkkjQxeAlwHPmBo6i/TxmmD7+2KmDr29/zpNa0rKBoalkE+KKDqAPHOpLz
	/reHN5dtvaPCEtnrG6ZZPGS5qY08Xq8oZW/eXzUjAZGVGbu4zoRqxMH1MJOHHiZKqsFgjfDUEKc
	yCpsGWIDtDXea6+Jn5n5dh09vQNM8HJQ8iM6yhO6hiNFj4yU586L8UttgXV4sIcHmLVxyRN2rFt
	ToJSppBDQwEHzmTFQvsuwrzdm8ov57rYIvnxJJ07OgexWYae5iIV771zXIfltw9JufjhP/6CCCQ
	SXWn2pzDqBcPCkO7FO5YVtuVFldm+m/yYLR0U01XUPlM6LzU26jc0PyGDicxfVwbAwaMwu6kBIj
	SYkQ1q1tgsX83cKAsdID2ec0XNNgvd+lT5zGSp70j
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr14331076a91.25.1789487383613;
        Tue, 15 Sep 2026 08:49:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr14330999a91.25.1789487383005;
        Tue, 15 Sep 2026 08:49:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7cc42sm6221221a91.9.2026.09.15.08.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:49:42 -0700 (PDT)
Message-ID: <bf2a490f-4bbd-4223-9cc7-685e5a90ec9d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:19:37 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260911-tireless-sincere-flounder-5fdfb0@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260911-tireless-sincere-flounder-5fdfb0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMSBTYWx0ZWRfX8jVE53RCqjZ1
 bnMHOE5WP3PE3Y3mAAHxqabT4PDEZzLTOI4cBCy2ytwMbt16n0BLPBkcMBbsIdQIvLAegWvJpsr
 4ui3b72Mck56ZPFd5apcFiRHKldZ2vQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMSBTYWx0ZWRfXzhFRuTt0AZQZ
 47d8kRNzPJVPFhBFGZui7y2FCXmGqN8byfKDkl/g/iV7/Z8P9sLqGW3Bl6oBBuXXu3kvQZmKPn3
 DKhy7Cz94ra3zNazw64gZ3R+OaeUyMM4TA3eGifr/TwaEDKtFH058Be10ar7TheA/ZrtJ+y3iZi
 SGQ9D6joANvLe4jMOeHe5hqT+AG3q4vqerhbuA6oUBG4hGnhkfwcMuK30+AEkMx4Z3FkoEIKrJk
 /S0ecA2LfGoqx66588at6h3W/FiyJH/OprvGw+kgq0VZUpUQzkVcC86I3s+kgPiEDP6vyzF7KaI
 OBxlFPRVz+6C2uUYRPBSvx8Xacy5b2YHTAOZKdQoyXG66sw4a2fkV+AaB4JvasmniIkvNSuIURr
 JbbbvemuKXsdxZCX7+o6ePiD9DhNolJG1oalrIxAbz8pK8cpnVGROTV1fCoSPH31a9ePONPkclj
 KWFHYRsHtSaRAr1YJGQ==
X-Proofpoint-ORIG-GUID: NZIn30WWNUlK4FTRNlvyZY0bdmb9MHxY
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa96918 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=5zVXc8y5ZMJFenxCD80A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: NZIn30WWNUlK4FTRNlvyZY0bdmb9MHxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150231



On 9/11/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2026 at 04:46:42AM +0530, Mohammad Rafi Shaik wrote:
>> Enable the PM4125 and WSA885X I2C codec as modules in
>> arm64 defconfig.
> 
> Why?
> 
> Same question as usually. I even documented it in maintainer soc
> profile. Dunno how to improve it more.
> 
> Can you tell me?
> 

I reviewed the guidance in Documentation/process/maintainer-soc.rst and 
realized that my original commit description did not sufficiently 
explain why these options should be enabled in arm64_defconfig.

I will improve the commit message to provide the board-specific 
justification, for example:

"Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for 
headphone playback and capture, and the WSA8855 amplifier for speaker 
playback. Enable both drivers as modules in arm64_defconfig so that 
audio functionality is available on these boards with the default arm64 
configuration."

Thanks for pointing this out.

Best Regards,
Rafi


> Best regards,
> Krzysztof
> 

