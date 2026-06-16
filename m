Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413F43D4FF
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611098; cv=none; b=huuFIJ5e1+UEfQbh76w66DZYFLCBrTbKS1+iAHBMvMwwuRr+8CnelF8f+lymuTdWjHcGpkTXl85DneVecuO+HZSwo2eu7R8X+7eyKC/Gs3Hq/t8Abomp7RO4KNq/q7H1qupUXBWaqFNBZuVQFus7MJQGmZvs7x3m7jymuGySzsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611098; c=relaxed/simple;
	bh=Yr8lXVIAWkXgrBDr2OgS4iUFMLjDYwsygBnWvJVr03c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcbUb5SflPPWueCjzSShHSQ0RAYJ2X30pDinrtbh4DUP8vIRVt2SepfUvg1BuXLVZVSooSLwZ2sF3pJodGPH9sb1g+PauB6+pW+oSzmTRXXLPPgfI5NBZee2OGRHZ+2CjbCvJIIVKnqNHZgAOdxMADoRrtw9poIHL9APxK1LwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsscBhV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afAuqzi8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsscBhV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="afAuqzi8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Gfj248271
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=; b=BsscBhV7QwZc1V6C
	biXaOgq/iUL5gzyyiVMI8VWox3n+1L+X+FscBoa6QxScpl/DnDXlhNJv5BbNgam0
	wuRrPnxKm/ws8gUfGcCBU/PcuF0qJKjmnz05A3z2S4NstV71ZAehxKTpRltH814U
	CKAts9oN6CZjx1ydDyAjtGk2rAYOXsCKwvdD+MJmlciaUcoerdQsnIMu/8gApqq1
	Q7IW59U6xhGJ/+FTZ65fQsGWRNKkrDQ4qTrvvH00flnSWY5XxU+Ev6kduh9vAC8x
	eOv/MdIuaUyeAxT0fqherhdilY9eacjqT1BalLHQ4GV3RxF0WOuzflteyo+pZJxl
	H0mEyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8vcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9160006de85so118947485a.2
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611095; x=1782215895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=;
        b=afAuqzi87XlYhJdN+hTKYkoY8QeWTbHZ3sxVCKbD7+Z8aaNp3SU4rAw7V0WDlpGOIV
         r6+NrCoGK/djQe249V69aKT9F8xZC3xCHkwEP0ELk3PspRYcF1nLarQkdrVMzO7Gx4J7
         FJi7s+WfnQwQyPpB9e4IwOSsRDC+wNc9+d5tX3xT3GtWZljFfV9afEx91dWP7ZXZbbbH
         d8PnBFrR86Q+5cuZHG7UokhLlKtLVmff1Enu6A0WScdVNaiA0sOgpzl7NpWHM74jENzM
         iLmH9tHiGTMZ+DrzXqBvwk4wx9cIF6MyylA0ITfKVaJPY7YBQZxDBzoMKZEHjoh33kM7
         Mwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611095; x=1782215895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=;
        b=JyYBW2XhvuU2ZYV/sTsrx3JCYvU1U89uecpAg2LxUG3QbTpokY7d1tdOHlVhf2qql2
         76arPyMMcr+RgXjSCRwyQ/4rc/xD0g95SYLWiri6My3NXstmUrMPS2Ii4uWT5E+KXpcE
         XypvxFWRR+C/CK7pfn0ZNbeRRq2XXy4XrLnCxXMgvCNUorJJ9pMU2t7b0D1si7U+pBh3
         N9Kr2voedygPoDX+2AMtsNI9vSMnnrGgiTBGMxdigVPMiom25F5ns/PMlt8Tlo/tSKpY
         iuaYwmX9xrtxJaBzjQ151wDw+CSWlNqT5EuzyycpAMR09dc2Re4atEaXqF4kOFyq4oL5
         fvQQ==
X-Gm-Message-State: AOJu0YwttwlW0C0QfJ4GH9uNv5lmj4aftQiOf8Kjt0Wa/tR1LtprSIjl
	qHEaclDhKZGieDd27OPbquSNgXv6G7xHVAHnmw8wIsnOSDMMcATckP1Xep4MZlPSUao7YJ28gru
	VO3ZjoommeCTMeDoS8dbKlobz/GRGph2Sw/zEbXNO08ERmR6YvW6T2mojm3QfPTZ/1g==
X-Gm-Gg: Acq92OFL+XpeM3xzda8ffZyhyo3tD8XqXNvwsnmY4mwlwizWT0whYBBFTx3qQmmGfFH
	EjBgRpCrN1fo83mDi0FCwYNzlZQqa7cDHG2v7S5Obi7qUZ0hoO+Ymy4W+4IOqkFySd+a6S657oN
	CA0havZssIsMZDdkhdbEeMBu+RaW9ekT94/Y7OGC86wrKr39LXbZqVHEQ35KdtB6IWJv6aToNSQ
	hQ2Dsd1I5YKmLnriQCIL8QJr1irohDKomDQCFU/9oexcUzOy5I+4j7dlNlC2pAF4/lPheN9vluh
	JoaLZ+wLmY3V9biHb/pZ5MQMKaHyA0g3016MfPWXhuHtPM9aDN/T4MlkmpcULiL68JDsqvbOndb
	kSb/2aVx0YOXfAmmNWOiFESzvztFcghB+eEnjL8osxnLF4Q==
X-Received: by 2002:a05:620a:1a20:b0:915:f92e:9b with SMTP id af79cd13be357-9161ba94c2dmr1711724285a.1.1781611095382;
        Tue, 16 Jun 2026 04:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:915:f92e:9b with SMTP id af79cd13be357-9161ba94c2dmr1711719685a.1.1781611094894;
        Tue, 16 Jun 2026 04:58:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm615905566b.45.2026.06.16.04.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:58:13 -0700 (PDT)
Message-ID: <ea116849-718c-487d-ae9d-50e839e44c6d@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AdSp9gSvrrlBZ9Wqv4bPKUe--bM_cRnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfXy5rzJoik8Mju
 gzaxuEhIlwa0rL+PLF9fIzGQTv7+LvLQZZGyIXlc/9KGdPt+ZjN5T9mxkbn9O2u657+ymg5FY4a
 bajdnXIC53a7M7rdgYh/8CN+8K6TyNtHdvYNQLxyucUUNM4+cKmO6nka1/WQbp7EGjdedDw7FCO
 MMC0WhYMP3XI5BPeCf05rakA7GSMYjp5quiwzrfhsp2BcwYvJ3T7YuSo9CBgg2E0Sj+P8CHzDA2
 UspU2cj6xE/Vdm0RmuZx+lQ8KX6CFnh+yNabOF3yDcU6NX6t3iVhm+CMzIiLVMOYV9cejgFej0p
 gXsaiTNh36fnghXGeNk9Hw5yF8yQybQF8l47jx70I9iWlplk+NfwPmphhQe6dcr+bAKJOGWlfbB
 xAvXfAVB9BywXZ5D8nPW3YnqOhXBlsQ043PWW3cLaTOhbds9/359VZIlTKVElhLCQ8Ym9N5GPBv
 Egn/IHZI4uqwbj0/Dgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfXxkikO879JYkj
 CcRUgZpZdIcPFf44NnPiAlibfNl0oTdaGdVbjwxNajXW2rtXdM4aeBVrfghMGPwK9MyaucLZzQE
 6wWRDYxv0jaNgHNM5maV7TFX7ZDXoBo=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a313a58 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Wdb1h0LgAAAA:8 a=BqodYhQyOslAVxcsot0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: AdSp9gSvrrlBZ9Wqv4bPKUe--bM_cRnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122

On 6/6/26 8:58 PM, Hongyang Zhao wrote:
> Add audio support for the Thundercomm RubikPi3 board.
> 
> Enable AudioReach and describe the ES8316 headset codec, the LT9611
> HDMI codec endpoint and the SPDIF TX/RX endpoints exposed on the
> 40-pin header. Add the sound card DAI links, LPASS pin configuration
> and ES8316 fixed 3.3V supply.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +&q6apmbedai {
> +	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
> +		    <&mi2s0_sclk>, <&mi2s0_ws>,
> +		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>, <&lpass_qua_mi2s_data>,
> +		    <&lpass_lpi_i2s1_clk>, <&lpass_lpi_i2s1_ws>,
> +		    <&lpass_lpi_i2s1_data0>, <&lpass_lpi_i2s1_data1>;
> +	pinctrl-names = "default";
> +};

I'm slightly confused as to why you bound it to the DAI node, others
seem to couple these pins with the soundcard itself

> +
>  &qupv3_id_0 {
>  	firmware-name = "qcom/qcm6490/qupv3fw.elf";
>  
> @@ -1006,6 +1061,96 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
> +	model = "QCS6490-Thundercomm-RubikPi3";
> +
> +	audio-routing =
> +		"Headphone Jack", "HPOL",
> +		"Headphone Jack", "HPOR",
> +		"MIC2", "Mic Jack";

Let's keep the first entry right after the equals sign and align the
other ones on doublequotes

Konrad
