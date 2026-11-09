Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234409;
	b=bartv+0HKd0P8QDr5upVrvFc0GjR2GmqRIKtOYB1YsPv+GzVSqF8qSLQ8baTSmYifdLV
	 w6YbenX96v3erwZfjSFMSoWLveGT7jTm4pYIpqsNDlj0ilFUwedSJrr401HyWy1fy3G97
	 vp1OUrdaISJUurHGPoZf6NPBB4iz13aesk4qCyUpT68K7YkBcpq1qrNDll/CDE2ENXw85
	 qY9JC4apNmUpDgzR5I4rNZdhUFxpD6Cx8NOkgamHi0vCEh5mFk9BrEBunUE4jhft8cFwI
	 vEWjL8+Vr1KEpw6RPU0AYReEYaus43YsrfLVuQESTAMg2+FcRKOMmByZVsAOIiG15kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
	b=cp7RM/Y/MFzb3qlJvQza6p3ilklxLDxcTgdDXQPAZorXE+57QSEqQptPnm5vFNd4okSq
	 Ppax5yHrI4KOcgZB33DR6BoEhXsgCNa8evZYAPdlXunMljU401Bv2p4E10/m5Hhvj5Nm9
	 hvMChrGqA3DTAaK6+kQ4+B7dSwrJYz0vjySFwaYFD5OINp0XnhoxUXHumP9maKela3ZQc
	 qhiFRFNUwwCLyqnVQwA5V0hC+CnkSwA5O9lzRrr0Ox4Z2Xt0uk5B06UXaTld2gLQH4GLp
	 v3ifq+kuai+tSpe8vEt7110oh074muDQzmthz5pEQCwIjgVPNLpDduX0AX78jWWMytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kD5iPYuP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSX2MuBi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF5606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 14:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kD5iPYuP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSX2MuBi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFMJx359447
	for <linux-sound@vger.kernel.org>; Mon, 9 Nov 2026 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=; b=kD5iPYuPY2+z/u6Z
	vMILKDiQRWVJ6WKTsxgpUUZPgIgNSbbIXlhxpfXnQGZaxXN27K731zoYFhIAf0eX
	eYJnFS+TM7jgo/Y0brzTNIUP+omu3CLbc5dlrO6TvO5dURuToRLhXuZ8nVWR8zzX
	/gv06Dw3r8QLF4G5BwMrggJPE2n7mCzUKVlJPehSLpCs+ue+rwd96vznDXcJO7Yp
	2WbBvrZ9mkwFP5leXUy71qMGBN/7Y+qREZyibOXvQHUMcvYqlLstdtqeIkeMOzgY
	A3M3no9M+teXzTvXsFA4DOq3MIJgqpFTY8WeT9fAfUFC5yQXJxF+UXaie7dg4lQ8
	aSMeRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2j23t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 14:26:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso8328085a.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234407; x=1794839207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
        b=BSX2MuBibrH4jM+2CyradsJcro/vrW7PlaIskt1vgsU5rdhXVNZ5Xc36lcGIIbsfxG
         zu2cm/iGiF/rNZAkKsb5Mm8+sxP8Vp388bHGi0RA1WaBd0gEzHNCMdYb1SVgwZDKeevU
         QN0HNZ6L4W0i74ikg+YU228ViNymEs7WY+jjkoMJhWCQV6H+kGPHa4k3O6UtBjHywp2k
         cwueUHMzhJRMrk5SoT7GmgnDpcAlSpTMKILXXhhPUJ99ThlLHpVOYGn9ApM6i9N+3kC4
         dz7wdGOgOrHxHGtjwart1lgQXEgAi73mosoq3y4UPE0z/8LQaXN3mEh9RmPmZdx8wE4t
         G+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234407; x=1794839207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
        b=EvxC9vu2bm+7Rld4jBZOYijIF7T8TOmrRhjCK5k2Pim/JsOx21E6CXAAYGagnP5C5w
         OZRqTBgQCwT4BWNG8cji0zbkbPvHVVbOYi7QY/0GT0otbFNL0eC87kJmPpbdOWr9HFte
         sNErr1pBUEKPmPe9NPoUPicNsCsrB3ji0Tp7Xe1LNtKqHyt4QNloot1nVZX7FnjMGGPn
         zDyNS3dtSOfDAuLzQUlf7ehld0o0hrt5OurU9YjUUcxKidBu4Ll6prZqADyID4MkgrZg
         kwbwqmo8Rri0W6C6DMrfTL9Cmc/2SH/ZhshzcYaZQQLJAtWqr2GyML+SHY3RAflcJZLY
         OXYQ==
X-Forwarded-Encrypted: i=1; AL+hErGgI8oiKkqi6macP2rNr/6k9rL8AXgsLvOe7T9tTP/EUcgpfs0ZEND5M/LM13v6oPksNXFHSfpi9HI6Sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8e6Eb2JL7SJSGpDqavo2r/jYwZDp/MdUmiOuiTS5mw+ziEVGaG
	QU/CnZSjFmbh7CIVyKcqJ96HnJwankQEQqtRZaQhwC8fZWbtoVGo9sFqt0tCzY6x+iV26fl8YSU
	Q9BUvSI19bf4wSi9z4REpx8+DFrbS3H6DC0dbMWMcK7KUkKzLn+g4yj/loDwsJ+mVPA==
X-Gm-Gg: AYBFou0jCm44vtSi+ccd82mkZU/pEUfWdTy5YBE4grVUDZrVYiwKE2Bo3JafT1MwPF5
	fk6F4mAp90P4cUZn8087ReQBlroMGg9v4Cc8WqC3oW+V1qkfu0q0zuJOcnUazIFgM0OubrLjKsk
	C7GmRfO9jSHF5O9QhRXJV+JS+FBC2uOqFn19jrPf1nutLBhF3fZgMHNDsic0yyElnAmwWJFkjQJ
	5/EVBzT51vbIdmJfr94Ew4dksN+gkGEmx38Da1vjv01E2HSkAlH0rIqShHznpsyD0BVxAqPJo9S
	gYTmz8DaZc14tRFrGmu94BRAsu2MIF7AQe6oyCnIlMwfXZKr34z+Yg7tqV42cxN93S8/YJr7CUi
	V9QU3aoazEPnq00yGkJe+YpiEFnu+sM6vsxkQRS9YVJt/TasgVTZat0qXYS05CZUWWeD5mQ==
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr722570485a.2.1794234407306;
        Mon, 09 Nov 2026 06:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr722567785a.2.1794234406890;
        Mon, 09 Nov 2026 06:26:46 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4165sm1604449a12.7.2026.11.09.06.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:26:46 -0800 (PST)
Message-ID: <15ec6068-4529-4354-94cb-eea82eda5806@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:26:43 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
To: ivanverbovoy@gmail.com, Srinivas Kandagatla <srini@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1d827 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e7eVDJc1qFFcJhx190EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX0bqk/LC0E86r
 BT92AcKHI7XM1KlqkqB0dqjxmwoPeLiiLWT7Vm9T+X1mPOADw3UotVZYgoy3NqvcVGAFE37QzBr
 8JsGa0CvcHyYIdNGYP1YaEEwezZYR2WbZwRLqvF/XpL7aICjIoEj8BOD+bhQ8TboDz24FaXxVM0
 92gAwnhYVW4TBkyTt3w7zeVUyTPCnzQDKrV8cvpSmKlSxkPf591bN7pWPbYQ1a8nJDG+2imPpar
 G3grlk+nFesituCZEmYloUPPRHL7pniOe/O1l9+xrXW7lhkPaXvrWSiJaCECgi5F0qeIXxJInto
 RB/FnkMT2ywxymyOXolkbx1VUtdlF0pvXTiRhrRxlF3NZrh+hSBStHJvMrr4V+WaHsDCWAvMsML
 P4/LRgyMUoqz8ByLi5tTwxxO/wbQPy1Kqhtu+M+godWgYNkgT7cWddVhjoyv3wWPj1C+gTY6V6w
 qQ75JlbaM7oPpRhyXTg==
X-Proofpoint-GUID: Kx9TDJ0QzjKaO6UR4Lzpi8dfuFLKnet3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX85M98mp75N+X
 6+SiXk+j2t+8HV493uPL/pu152kTCoDFB+91pYcKRIybTr4ecoO2RPxYYbwzaGDlhCokfFWkM2G
 V2bUz0He+7QW4jEOgenoddgzrMt0DGs=
X-Proofpoint-ORIG-GUID: Kx9TDJ0QzjKaO6UR4Lzpi8dfuFLKnet3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

On 11/9/26 5:21 AM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
> the amplifier no longer enumerates since: "SWR bus clsh detected" at
> boot, "link failed to connect" at each resume, and every stream fails
> with -110. With the check back it enumerates and plays again. Shikra's
> controller is MMIO and keeps the enable.
> 
> Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
