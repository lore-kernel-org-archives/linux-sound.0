Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798506;
	b=3UapDB3/J/u2wL3n+pcfl6Y0gGjoqvC1ftthAm5dCxXxWU1bbDlLDEnSN/lblJwLX5kc
	 soz/h++y+qVK+EutrooU72rn/ZL+H3K0DOrWoxfJEUHXuK4O5XRcDhYxowa+wcTxWPGeT
	 rJoVmn5bvtRRpizrmDjoA7Nwg4znaKnLzP6zI1FE3FJAF8RmgVzcDjlNSCW4Jyi9qO68E
	 2YJtWlODGrYbUBgjLJfLoX0o2oaz70o2l5ixx2GdNkmGzeFwLE0QLptK/vfiQcS8O+8/2
	 2mz330Rjs5kjqlatVrzWyWn8fcJDsYJ34GBRsMXxm6NPwuvjpTdf6l5W/0mC/P8Z6fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
	b=1vOD7HjuSr11TkuVLMIvB7ufjIoznMpPoPT50s5Jk9i8qbMvQ8A970+Lz0GbWTpQZEdc
	 NuJBM/RMclsraRauSayi1NBsZS+Oj9Uo36qMIiiS9oYu6SzsK7Cd0eK21pQ5+mKKZ0e46
	 Z1zZBwYfVacki/GKDkwK0Ers1W6cyjGZd8r09b02IOCybQomds8co37mk87L4hEBz0EEH
	 /4NFiWp1YJ5xSAW4v+n5slq5TfDnC+zqNRQpzpyW6lK2Lj25r58O6Uh3O+6yrDtkyxLD2
	 hjcrZHkmfamm9Am2PSHWup4YqD7pzSKdJXNItQz6UJusgNpyrYdPdE9kbci4ejOIS8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hMkwn1Cn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sjyo6MDD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AB606A32E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3AB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hMkwn1Cn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sjyo6MDD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BabCR610266
	for <linux-sound@vger.kernel.org>; Wed, 4 Nov 2026 13:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bdDbdezahsnwvvodBAeZroZh
	oHCyGDtmjwh7kWkAIGA=; b=hMkwn1CndJq7dLbOzHFcp/c7/7+LQmnU4IIeYXhl
	eD9flXMfO5OaxwvR6zf96TNocN2EPwyBHfrQvx5gGEzZmRspTRMI/3FRyLn5T0nO
	qO41sHImGEHld9GwuCDhB6F99fvCiDuFm1TlIQYNaaFdRjFO/x+usFvPgSkxXyA4
	ID2fD9HRzGcPw54pAVPqmi+DrqNoJ8e4HpPBIeci+lzWMD7y/2DAhp4K7eupSWlq
	EqE0hb/9UOAHrXtqnuGvWtK69xBgP1n+U+SX3wIbITKHiuTT3c5NfNUqCY1eXeGF
	eJuVaTRqZ+2CTMIVbZ0oA4nhv2JbtD0c0Fu/ehoTXiLj4A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80ewa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 13:21:44 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so150908241.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798504; x=1794403304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
        b=Sjyo6MDDWJLQeMVjSqSGKWmDG7H4krUMB6ZdNQ5m9dHjyBt99Q8CwA1wQmlVRMbUGH
         rqI24qbrTRoJYiBfJapCIziabzEdgSXvOo1qIr3Wzhc+dCZ2D/9ILiY7/WyKx+/Bh/hQ
         cC6ySuikCJVLMiVtU6wpQwTY9+blH9La1pQzJei/mFiaWyT49WTABmY+n/nZjX3QyYBz
         FIh8XQnMyHW6NhnIjVTUEJI+mcj/Q21U6nZf7RK0QfVvOqGGHGIVAhpwPJ4UdysQ30jF
         7sr8+/TUObuNDX2AIMW8KUcMqf56HmUxk5m8Y5ev1wWhdP4C2xYAxl1PsfFaEGO2pqhw
         KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798504; x=1794403304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
        b=xukhxZS0VvVt21GEjRUmCvYeuU1S/PPlor/PwD952yCuLGpnMd1VFAfkJgzMG1WGab
         4mf9hElzmcLvUzi3XenLYhN9AUgdi3/Hm3GXZLRtSdH/ge5D7JBT7YM8vyDH6ZQAx2In
         SGoN7/mYdmKsPz8GPbjYtx/nEgXDIknzotEazlfj/3qCd4+ptfjuvuxVcrWfKTrmpITw
         mZ3SgqzzwiJKH7RyDjpbzgoFFqzew9EaFPey0HMoIfF15DJvDkTyffh8s5dXxGOVPn2B
         YWRUGX2/smVwk6eDGqrnMO3XCr1QOhdVprT7HNtIHe5UR7lZo3ppjacc3urJWNt2NDqg
         pXnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqo+f/RzbCwDPK2VMV3Wqdbh2upBl88OSUak1mM31bkm69F8PTRWCJJnWjtfPo6XDVDCiyNhLC2LreUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BG1Q0Iw7TfXehFkmSYv/ovZRuN+C+pR6u3ARIRMhNOyzv7M/b
	bTMtBnK/gMfj10iQ0X7NhDg4q3y2PsbXXNRqGyUInTJb9KJrw0YNlW5AXNtrWFsR1mEqduEPIkR
	pZ7TKQTTJGFeTVht0yf4bAwRSx9HLqGvYoA/iug0ewuSjQaZf6lVE2yg0/tkmPKBg7Q==
X-Gm-Gg: AYBFou2/lYU5bOZXEyjcjS+sKkk9lXw8+Esj+0W7Bib79XbD0qunGSGHOlfVuQB4Vtr
	WA3jbiZdULh+/G4xnkslXyOHazF7roRWhPKStxVRD3h6aaM7V5CSXV8NDpKvSRJSjGfpYY/WQG1
	WQQVOp3p3Sfkt2joh6DiYs+yDyPGcdskn8PeEuyqLirRA5XT0rLo/Cw/qjI+mvu9DRRS4gfeSrs
	dNkE+ek47Utqy2jleasBupdXxhfzTWYdkOJCthdxavy1AZdolf6An6HJK+PIyoQlU49H2Oy6WJq
	TcXf7oS/lCghFvpSSyYMvgZn+CP40SzDE4dAjDCe6nCsmrXcVfKVUXYFz6Z63w985AEWzvU+tZi
	F1Mu0Iwas4DMQUyJ9+ZahWz/AeVc2IP95cVpBX6+UMWCeTsSTF0Ek6l6GS84AflY=
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr5830345137.21.1793798503876;
        Wed, 04 Nov 2026 05:21:43 -0800 (PST)
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr5830327137.21.1793798503118;
        Wed, 04 Nov 2026 05:21:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm51175065e9.1.2026.11.04.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:41 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: apr: Fix theoretical use-after-free of
 GPR port on concurrent RX callback
Message-ID: <xqvbybeyrp5fgortzu7pkq2ge4hshhsma2nu4ag5isjsekmitr@66erhrmbpega>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wtM-AamvpzJriVNgm1zMfU867QrULP6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX3YGkeWPEyoOe
 cY8TR9KPKiTMF2ve8pvztCoxgHbmv7ToXcJmz1sUpSWSLB+C50/fajfuko/2wv1A6YSolWSYbYC
 vnyP06m14bBIwETUQeYoTrZ7bQH4NVdgFj2YH2OdSFNuUZ6RPg6Aj9iiJgak4fmhWw9sxh2HGZR
 xWx2Db54RNTOoVktPtxfHWGKDW9xrYBTUarh30tzpVEsCDD3X9uwYbmUs3bQfM0F+Q8rItte65n
 FKq+D3H1k97Ot5Kg+bCS2m/1hb62G3YNC8tAxEVRyOtBgPgGqSSwfnhdOLiTKJn0qOMiXv2QfjJ
 LyMzcyZ6ca/+dIINSwG+OsKCjYMd0dCMcdVkeyP5jhOhHZrtqNAyQA5SH71KDYiNGbOW44XS+KB
 TJ9Hg7oJ7X+PAiwIbGxQPLU6tZSqZ1bfD3gzN3uKr6z6v5Fj3cf9k0VHcg142Tv4DDWO+jHE8p1
 f+WyFfM0Yt67ZVQTqKg==
X-Proofpoint-GUID: wtM-AamvpzJriVNgm1zMfU867QrULP6U
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb3168 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fpy8J9LNTvDAPkKIS1gA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfXw9CxgmgmNR/v
 qKV1SgyimdZU6K7Z4DFxmkoSYT4OynJrgQaw8a6/4Q1d0cNkVfQzHrvJgd8qGgs9YezWY11cijy
 6XZOqZqNiPlO9lvGEsQ751GN8BboGVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053

On 26-11-03 15:56:37, Krzysztof Kozlowski wrote:
> gpr_do_rx_callback(), executed from the RX workqueue, looks up the
> destination port in the IDR under svcs_lock, but then drops the lock to
> call port's callback.
> 
> Concurrently closing a graph calls gpr_free_port(), which frees the port
> after removing it from IDR, thus a theoretical scenario (not reproduced)
> is possible:
> 
>   CPU0 (RX worker)                  CPU1 (teardown)
>   ----------------                  ---------------
>   gpr_do_rx_callback()
>     lock(svcs_lock)
>     svc = idr_find()
>     unlock(svcs_lock)
>                                     q6apm_graph_close()
>                                       gpr_free_port()
>                                         idr_remove()
>                                         kfree(port)
>                                       kfree(graph)
>     svc->callback(..., svc->priv)   <- use-after-free
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-1ebe255f-a874-46dc-b7cc-455e7bce402f
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
