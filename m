Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575140;
	b=Yg06nKsLX54BYS4b6lnukJQBK5wuoJmGdhmZMm6FpEmLBGhop9xA2BhA8JmTiANbbMJd
	 NYSmRhX75a3kN2Ti6h7SUP2P6AtGTxotl5XoIJ6wCyVUrY3T5p2n0jHi/GfXsqAK3B9/2
	 8Bwt7Rq89DSOsPu66DTbMRkPiMnQMJvfWb7tPiknP93utcdXSrnpZSmmcdUxUNRqun6MU
	 q1o32TaUj+p/u39e11810/9I+a4QLO/JL0nMWLhqSsTyAKY5yLTFX1WVeV6kAMum6v5zF
	 pdkPKFcs/5zHkIR874ntFZQlGoLJBAn+wXyPZINsnJroK0TupTQv2lvhmWjcEhFhaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
	b=kGvmVsWECvGtyVnFn6lRLewHzD5ymd2WflhUNMCjuZV2I6TOmOcbHJ/1rGLpcazbieEl
	 R3Zu9o63//JXXdezXznX0NCin67S2ERkMN++NRnM+gHUwdct3dgUW8F546FP5MLxUYO35
	 Cl9i9/aMHPdaGl4VmpZSw/xHcsSPrRd/8BpWA1XIvgCNuCoh2HVm18EWIty7tvHbcFiu1
	 oo0QNYmGEqDWgYlHcZGZMg0IBGneinpsqrw4+Hx4Owm+PAtBbN/+reLfcgfvi7BiZiIdZ
	 IGnZ8YnT/sW1UI94OlYI3hUAaChlv6lbde2UI59KfheL+2L+ob5mQn3r4cAZlaxWvXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HpMxf+Lq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA8606A31F
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54AA8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HpMxf+Lq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VR7t2795041
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=; b=KfvHmY+VjG7+Ghrq
	KYG/RKWC3DY3lCqndyYs427hg4rcmoIbOoM2aS7mwOQL1lySBWMJF9m5EDTDvL6j
	40GH4OHn+LaUzPyegfS6u31qkJJA4prMKnxTsz9J3V/9t+WXwkaShb5XcPDTFRwI
	+VuB80ezlOT0gyFYQiUFeDKJW7C/wwoGoopBtJ0ZPlv5a5jdi7qaU59JuPin9ak9
	4S87pCYH0TAjPsEhwer2YyezJC8dJ+tVJjhrFN5IV68j5wWe0tjsjRCxFB3IXg+V
	438xYp4/RP69yrZlrppcXdZM/8muif03IgJE20RkOyUpWzTGwipuLMZDTKhMoXbC
	4hTeOQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78cw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c4d46037eso1494396d6.1
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575137; x=1793179937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=HpMxf+Lq4aX7f3KOVJRsvYnl/sRrEelfK8ohaoUZLzdN3ixN+KXIaCc0WWA7WeBmJb
         8Y0tVAgWqNSYB8G8nE7UaqJ3PgzERnti8hGO2NPjtqWrHDe4Cuvcvzaid3f809JdOK7n
         h8SVB74DcF2Lw2W5gjhJ267GFaLl/vnaRq3/VxwDpe6a6l8YpBiXt9uAFq7tYPpYSpyR
         i+BkrOb9xyZbgrP1o/LeFFQMLuE+BGUNXL/Agn7LZbMmXXGNM2dbYVXUFUht1eiTYpGG
         Yv3n+fZJ6X0MLJRaaJkKnVZ1hW3IA7nLk5uD5rmSZqluaSHYAXhsUIsiYyUng1BaUH5m
         U3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575137; x=1793179937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=o9c/asMu5PLL2KtLg8qjzhn9CvASk+sghY1IKERniAFqQLzdVlOexiW+YwlZLQH+nj
         Ba6OYhxxFzByDjj3Fd8tAb6XY5uEele3Inb9LS3NCARLPJVntf8US3UWIkjkJWALe61k
         WXoWQ/TTy8czuR3YIA0JR/21ByW/aZO3HAzS48bDnB7+lJPUFeFEvAxYi/bTl9+VGEkJ
         wtOk7+NWFktK+1VQzuoBAA1YxapzDBOrMzIyhkQlRnaYuWPsFmUSw8PKTH/XLYzhHY+v
         Cd8w/pc+QMdEp/1be+LeLD4FHS9x476Q+obNSFUZFo9tcjRxAouU2plmuxWofNIzKazr
         6ejQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3SGeKDm5wgbmMrscZpjD9SlgHEeZBzR+VBcBOeqJs42wCfMdrtKIlrVt1h1P9HNsIQsNxiCAlqFUqfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXkTJXHC5wHNKq8qjtHsxhYfHuvdWAINlPA+avqFI3MEwnFkRz
	7eTL8SLT4rzy7c7J5zJtu6VBeVBO484DDlPf9M6HkHEL8/WC+JTWoO/XbbaHt/l/4Y+qVKW1LAi
	MhKPAkCT+RL5201NxLZv7dxN8uqFJAyWrnunfKvr2kA8Cx9zmCZCn/6PqbWBhRhNGrQ==
X-Gm-Gg: AYBFou00tQV8KAzKuJ7jNJWKUVEuq5aUuDqm+xMkFm0HpPcdkDuK4SMoFv26LwtmkMp
	7o7vBrCR5+9jpA2heDrdB+zvCPFdNO0QX9ZBkBRpSCIVL/Y3PDLGhuNV9reRa4F8f5KaLTmJN0P
	QAcLBqW6aSNKh1/7qc5PcOAmhbbSBhn9EYO5MpTJMTpa7RNhcM2l+QVZNaxH3htTEXKm8HdZvhe
	S6r+W7B3O/uNzmnZEtzR90zOLSXnmmPchvYs6I+WQXlEoH8Hkkzq6v3H7DiCk5tyFkCELkD0D94
	CaqKtsNctzTLAVvehTygXUXkMr1jUYSvuaGjOChCysaPkdJufXFryBO4yACESScu1Mn/LUGuhLF
	xf7twCqpsAwYP4/ogBZkLWg==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675771cf.5.1792575137593;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675371cf.5.1792575137058;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790055a3sm58780166b.69.2026.10.21.02.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:16 -0700 (PDT)
Message-ID: <c7253a19-51d1-4525-91fd-0cc07a4640f7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:12 +0200
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
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
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
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 75RFLkuqHPsdAlZgeHCt7CzTtyZPqcpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX53yiPR4bSDHP
 PheBpfq8nhZzjemV5lSdSAp6Twz89anCpCmPzpzdyGbeDRYilKF7/DWyYQJuxHrv3TnGa38P6MB
 fZKepdRRXGZi/cYFbmOcecrSxIA2RehHFCWY1lyfO9iWWQ2bDDAgukUQmqyHecBZRXatMrKBQ5c
 5zPbXhgJrS6fKW4xyXU9RxPKdfi5u45AGgOuiDyD8pjNOU5nnp08Etq6fb6D8JxnuyyMo7LhuCn
 jKRGLeyt6Z0XRHYRghBKxLbeKv1WIuebV17MEErSKraUblQ8K1yfL9s7XXER06CNHw1FuMhysai
 rDoANtLYiiQyUPxfSUaRWCL9H/psk31fLb6JJsb9lyZcD7DkfsjF2kh5/0t6ymnHcLiEjerydhd
 j+WGPnbts/HaDTU2iqsxhQtexMB5L+nYGB7hcSybnAKA9doiu/m168WehN/2NzCMmVJzYupNoMn
 gNC8bqaao1+YT7ggTnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXygPd65nZQ7jF
 GzjuOFQ1KJ9esVRKGlnl7xYPgjy5oAaZ/Evp5adME+d998+PsazKae8mIWNqb/Vg1h3Nt1ae4SU
 76sQrW/vMF+02iq3R0GHMbx0eWNsLsE=
X-Proofpoint-ORIG-GUID: 75RFLkuqHPsdAlZgeHCt7CzTtyZPqcpE
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad886a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
