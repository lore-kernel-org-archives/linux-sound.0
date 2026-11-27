Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782459;
	b=mZW+lttjt+ZOasBRGJajJ0ViWoNSe9qFgsFJW/WSGOoMk3Yz3HaiXbNi8jide2sLlZ6A
	 FmTQnSqsKhWLVDDd+d5X4xjSQQmrczGscHmO7V9gHk6TsLiUml2+F/EDp6AugWTM0BlH4
	 MvLG7mVVMTuiUrhmshX86c/6s/5GDggguwoKwdIAUFCuM+L8E9yJeaokCzl8wk0fi8QXw
	 qdbfbxL2GATHHsMhXYF6+hBOSpRq1MbMF7+X2/kFbF3Q97UxE6dMenDj+O0aMJACtMngx
	 RbwKvD1IPtQHAKT/lpJbPF1AAfAuHEhB9w5hm4FuX5fwXyRt7hB0ao3UhWWW1CkQh9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
	b=qYcD/9QfgTDk7S52CgyBePdWksfhR37kmJtd5icJaZXy+/IhcpVpZsL0luFkAKquC+Gf
	 DEQcJCx+BZBKX3JnXynH0+K8AoFM2lbmcrbiJAqm9dlti4BZYaxSPM8h50u/t06CHReas
	 ArrzbkNx290E6QO8/+HljVOzii9CsC/XVItK3upJyR9wdjJPsOV6NK9QdDWKF1WWnD7+d
	 cY3hw24lk3Ol5nQJ4usBMtUD+z2BY3hTjYsBUt0l8DU5/Iqy0NwXDu/DR6Pztxat1ZGoK
	 vZDxqdyfSH1dtQa+ZnoFltSN8yzTZFqOlZ3GonND0LGtE7yN1Sb6yY/KNXPJSsqrH5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B586606A31E
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B586606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApJJQ273462
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=; b=FjKDdGF7X+XkRq9/
	MXyrQkko/PPi4y8oYop6EuxujwZUSXM6+dGJa/2bPE+BBUlPn9xFIImt4pYelgrP
	UDqemhTPiX/2tiOnRI9gMsYib3VWGheswEuCpHEN1RSJ1T4LnCOPfAG9p9cSdoGh
	TgL597+3q0WmLfIt4N8C4Rby7zInxKJqxfROs9Smsmx272Yod/JtvvVgsFrZIpSC
	SX5RwWNxLIop4hbUW2kL1T7DHts1GZvtpyByMs1Mpb+Dv/FtpbH5Xw3dDFoWy+Xc
	DJ78loK5RgPiPvobQMvh0mKhT1wwKHSmh+FfNSP/T3ZtAIexCaOg2z/lfpJRKB/J
	rtdUTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49aycu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso109346285a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782458; x=1796387258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=brLOI2dlMBcvSa0oj4XrWcI49biEwBn/hxERcZUpXyz3eGr5mkBwTXAnG1XzG/gMCh
         9oJl+AM+vkwVdtglbC7efEaZwdLdh5C2C2Sf1LcFxFtd82WCiGKvWeTxJl461bH7Ayzd
         7Y3J0kU4c7GA89yE8DLPYc3RPOTQwy3PeMtoiIphfVF56F6KVPQPCydS0wkn47030BpM
         9mP39vjxQkz2HxnBIMtgnkfg0BHEk/AKH2SX8zmUSoE9iHOAK9W1j6sJccT5h2bLofzH
         5dGrZ2OAKmoHVmUSgZjmJNa9jNdCbAulFAYmZIwmjT/Ndv3c5ixyuWCqubcrUSYYZb6f
         EHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782458; x=1796387258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=EX6S5a0YuYhGL57mTvl7xfs2N0eEcP+ZEf7AG3zdrXcqiUZOG8qAqDNuq2zLjx5csz
         NfR7RtXOGRXBm/03KsLzRJfJv+zwC595fs3Gn0IyVtQ9ABbqrDKn2ayT35jLLXwgkHGb
         AICijJIxm8CjBijGzCP/7okCFril47NJMG6F9eB1nHsB0H9s2BdU0kUKLpidekoYs16c
         MJsBeLtBPt9mpGc+WNc7ylwYhFHYTXayg3gF5s/e4QI9Q2A3FOKojalthfsmwZTa43+E
         Pp5slNG4JvJ9+s8w2GmTegqVTcBr+ZZnatZxKjgEiqEX6JrOUDl+SvJeEMYoyxFyf4KJ
         ZtGw==
X-Forwarded-Encrypted: i=1; AL+hErH41TsKMnnfOwdHNbt0kGXYGAyr9of4Ki/UctrjzVdPkSTw7miWI16c3bVDX7l3GD4DNROsVVgz80UMhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jyEuzU9674iOGPOb7jgdJhlsTEbFa7uQdXO65XOMMcOB3YiqR
	DAixAeyXZtbRxKrvvZnyer7+1bIkwZ5uNDDOpuzd3DxWubNkeyNmqT7B0FC4G04Ljb3ashfwOuP
	Cb6RxCiqxg4IpC9o0xKF2G6pQXa7WuCnnB54LE9OELpisq3f5mw3BtlLGXfSI7doWsg==
X-Gm-Gg: AZFdTZcTpeH3gbrx+5nxabTTlW6AopGrXFcA2qlMPfqNjN6SOBDceLOcxJrkovnWtEU
	9ou0qNwqBkZ9wwD0Y8xKXxMImZUwsZkSUB/HyNdiZWU/rGo+6Fl9ZfWqPPgu9H1Z3le0yZWKFpS
	az4J4cyv3dxbtyFdXZtvHf5/KFtHYRS3AiywI5p9KEO+OuLQPu8UffMkTfALIzkzO6+RFzrtAj3
	mtzHebH37lu2bhHOHZjXZSkvFt0RM8pdyGy8RrzTWDn1du1xUbvbDXyw2yUQ40fNG23+ncNg/CO
	893rYA/yg8vbBMmvrq5AY2F0pOmMysEfAT7iUlS0Uqm0hsUeRKgrv8PJYG44D7P9UgavqBZdBOa
	DFwqapcTdFQay8S7cJUASudwy2KH0w1dp1BMzBJa+z8NgSpQ7xE1CE3QsrFpAo2a9fnbjh+I=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985057985a.3.1795782457711;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985054085a.3.1795782457281;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm10501705a12.3.2026.11.27.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:27:36 -0800 (PST)
Message-ID: <765f3451-0f2e-4783-9a7e-893c06b2a735@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:27:34 +0100
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
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
 <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7tGfjY0D3KxE3V_ZJM2ow-sj1zU71CUX
X-Proofpoint-ORIG-GUID: 7tGfjY0D3KxE3V_ZJM2ow-sj1zU71CUX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX5wGIz3E+sR9S
 ngZuhSpRm7sGKRkSl9luhsMxvRmNaMz11EDd1zsP5k19gvp1Dk0DWUsGPhWeI7H2frTDfjvy574
 sUoLblxsLxStkIbMVRJilOZSiix6Crg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX6e2oiDDftnOJ
 G5X5v3zEZ7sOPYQE/bo6LMG2ZXQeZIvDed5niK83H0TYOpanUMqfj5KE7Jo5u+rHrhNcVQ0aK6s
 74FkZVMKr9hWt1hRr6PvOI37zoFL6T8YBos1zjqi2nVj6lW50/vE0lnxorrlNUtnIib4Lyw/7I3
 veytrenJQtWs8Stt+V1FNw7ijGxAKVCK2KUj9V+/btLR7LO2ZCndp9/kcNWvFHZT/t13l92vzrQ
 h2m+da8zD6VB4QUnL+ezRd8AfSKB7nB2Wltce3v9taVd/HMF5UwRkkZngdPlEE02VjHZzSn1uNz
 lkUEBW2eDAJu66uO2rKWlYek4pPYmtz/e1Y8oQjGABnA/marhzI0oiOVITWjXFS25ZnhNJMWkrk
 kW4cfostYQyRkupuuZd2YFFzSpCLsgf2B/Y0ugXpVBRZ+nYd6D26D/X64PBbxb3WVM7XSypgowq
 eEd28ywPXS4aVOs1+CQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09773a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DuBmnH7L3UKxGZjpEfMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 6:41 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

Could you try the patch in 

https://lore.kernel.org/linux-arm-msm/655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com/

?

Konrad
