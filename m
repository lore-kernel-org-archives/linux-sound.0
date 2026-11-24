Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508597;
	b=w2Iuh6K13NCIVOSSlR/Cm3IBylgXwXRDD4hcC90V84Ck0eD9GCP5czEpXAbuBfp7u2ur
	 VVNY9rK0L168nw0lZ9+4mZvGDtRrUmwCe4P+ROsn36o4i1sV0cFsb3phjfko4JeS8WoGN
	 YFeBOJzMRE6tisjhG3jMG0NsVEUO56xXInU8HnVAx3H6SOE6YNSOCpfDaoAZVdZtx3Clm
	 ZfUkfGbhBg7fOCWnZAPw9FT79LdGjKTbvxBMXWZOOiLaFBvDJULDlQ5snVrocOvM4gkzZ
	 84ZvS+PioKyDOocTknigWAqpYe8KnZaSdYNLjSDt3Hoj6d2+kbPbe09pE5Ds0wPbpJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
	b=To22fwx3hmHZOpSY1JnWMEtj5PC/lkUki5I08mw10/xxeuJWqdzwyKeF2+l+av7eM4Ws
	 w6zn9mTOKyjs6SZBGojk0NjH0h5TBjhbe4AWi3Bo3UYMmZ8ZnQfHsvC5X4uH2hsfeb1NR
	 iEaJVXIhBA2qksTYw2LFd+wwdIONHNZD5u/e0gDQqC7niAQDDlJqoeO34gRIjuUceA4M4
	 uUVl2s1KnViFg2wpgjoUjOXaZgy1ZI7v9HPeoxOyk7F7MfbR4NIubCP1hK+NJpypnEXk5
	 4b1GBXtMW4cQZ7GU2l7xW2QvvzAGywtDIo7f0csgvrrCaG0Kr80YRZAitF83GaaPF3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foqaj1qz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXYJVFJI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142F606A322
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C142F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foqaj1qz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXYJVFJI
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kQC32209288
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=; b=foqaj1qz8J/gqF0O
	BbRV3/+X65rWPWn2hI4Agb2czxq+zKzpoUsFnJqmYaCO7ClMvM4PG3OWsZ4Ni1cu
	Peq2aJXiDlxpT0rMA0AmYRQpml6SXSJqqI10EHFzpxo4oxQPWKq/DgpFrFjYPGOY
	gWwhUG8hVXBuW9l20zzdedN7L0wBrwpUkRoSrqKJtrGguafdkTueH6UfTHM42s45
	347306+T7J0QUFDpvzd5bmO6fUSVkwog0u33F7OhJx4DhVj6w2e6Ry0IiZrxNdPa
	wo1+J5uJueTu5Gx9gzf+Q5n4LRCtDm1fMOx8rFn4sJFdoETxnys2L84LHsMa+aab
	4AxSWA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11mec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso5295815c88.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508595; x=1796113395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
        b=WXYJVFJIeB3i291UdN9BU94S5scZUNvhPRiM+HyFMvqAVoD6cePYvlL27LIavs9azc
         /H9tZjk/mdev4jQUKIGJxp5bZQKVTjpk9WLIlLluUppFFpC7/XjRuo9TE8li59cPmGrY
         /cA7brncGsR8ZIdGFyX2aW54hHkstfR3LvjQnIxKdi88N+lUcYMr4W3aeb4jxip7xSMv
         wb2g8g5rZ6lNNg/sKOMc/vc95cahu7U+Q/gyNE6wjdzGRQNCHuvbn3fS1+HUqphABvyK
         U3KT8C4E4BASVYLlnb9Ivlok0Cb5hCSaOZsUZDAQxh9lwxSC7DUobj2YD/nT0qdnDJYq
         wR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508595; x=1796113395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
        b=qV2rpJR5cwpvsYYZZhfQwkwlJJbSd3eB31AjqM0dTTaoCTI5eTy3d+fsqh7JI39j63
         T+Z2iZu+J8OtjoqFVZQjCnnXWufsCq1qudn2FAdE4hYJGXtRj3cJq4Bz7tGZSPhFCgcI
         fD5P/G5O0UIEOlB0GS/vXiuDYrEM2ilSzOzVasPbbXKKwmhKMHKNQVn2gGXOfDLq0UyO
         T/RXhoIBYnQ8cEHhM8gY7xWx9D5urqjrQsExGjpKRboTj9pwaja9+X3jK80LtJWhoxkL
         RrU3RHnBR/nY/0Ukb4JNdQyBblFRigJHVkN2NLZVlMcpSAWHR22fUb9HmzIcvxkhzUzE
         +Wlw==
X-Gm-Message-State: APuU4Z8YaMnhOxQb9YJm0o7xhvNXBoN2n+g0M89T9sDRqZHjv0BtistB
	Cfz5ta5odkqFV9fqjtDeQKYSGE8TCyAfusXQbaxVgl0wfIbM9Ye9XJeMSTGd5BlftqoxpUsUU8F
	ABPRE2d5mGkcyD7JSYMapaGbloEoOrmV3WaspTyOXRTvCUna9iBcRDUa9g+I1Qta7Jw==
X-Gm-Gg: AZFdTZeV8CYPeJB293zGVUnI4U7AIjS+GHZyYFZ2KBepmDdyJvfgC2+69xf9ZUObS88
	hzPWHkj9yVxNDbbp5avVhw/HaeJi7gqqh3l8LYD62LsI2/yYnpV99ro+5hqPkZvfXOwkpAIbHjY
	7cUsJ69Ec4vrct88IaXlH3wgMVB/Wl9pXnKqsx9IScIip7TnuU19nZvds3uOMBg02GxwIsxj4n0
	+LLmYFXNVbMpvsaFO/cJDlqDeDCNjQB2IUE3YGJN44N2X801zslyPn0IDpikV1N54GOms9brN/W
	sm7uPC+igtqaWevgMTsmVuzrNKboYB7F6F6MfhrMDX5GmimHPC7e/RJ2GWFKZDF1JwChgQsaPYW
	4PhdQaB88D+8zo6LC1I62hRg96FcuXgnEmAZaKhPpkI9keNgj1YqjbCPW4k/bUS+FP//pFtyPV5
	lo8mpWGYciNi43
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr18603399c88.28.1795508594445;
        Tue, 24 Nov 2026 00:23:14 -0800 (PST)
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr18603360c88.28.1795508593798;
        Tue, 24 Nov 2026 00:23:13 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm50686826eec.10.2026.11.24.00.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:23:13 -0800 (PST)
Message-ID: <808bb7ca-ecb0-4594-900e-3114fd26eb97@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:53:08 +0530
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
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sc8280xp: Add support for
 lemans-draco-evk
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
 <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _S2oS-YVI8tk3OABzAoyz-YSDpWVZsAp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXyWL9D6ULvxd3
 mx0ejK1lUaeL1Bw8NqQ0AkfypT+LhCOzC5cl/0cG/GXkjfqdVQmdJTFTS0Yif2LyOfnGFiifoQv
 Mk1iwK1/uUMd7qtJEQrg6wOZ3cymIew=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b054973 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K-guWxSE8BY5skIoOz8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXxy2U5KsM68pm
 pQN7Lg43xEjZrsjsa4bcrQhRRx4fIk9+hCy0+HTnOEkywuLIIyGb0c9RM+PLe5NhQfpKwiQa3Rt
 xkC5iw5QksCJem0rWv1PxfAsrOlbMJd2KavTbTSaRjqV9eAik+JTTw5bi0pJzLtXFRteo5Ew4q5
 5VqREihHGFg/05wGStJCEHDr8YG8D9Z008zDkPtyDshpSWBfpgprefI+cfDXXvpWAUoexkJ1IIW
 BlPvwgocO36IbyDtN1OGSI/TVncdW3ABIjn5IYuej3XmdcWHn39DvfdsnbLFfUntlkjb1dxtmQ/
 F1Ty+J67tbqc8jTbBcXP/4lW8ZMbHoMvQvAe9mlY/FU4s9jZurUaSRQ+b37OMPdz+v/nL1UwgmE
 Nz1gs30De+I53XuAJQ2qzzCHy7I95a6r58AkybzVLj/kxOVgWLYfnfDO8NIYGUuVR9c6OXqhHSE
 X/ixqBoo/qxBwShyUTQ==
X-Proofpoint-GUID: _S2oS-YVI8tk3OABzAoyz-YSDpWVZsAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032



On 11/23/2026 12:55 PM, Karthik S wrote:
> Add routes and controls for max98091 and va_macro for playback
> and capture. Add mclk enablement and codec dai format enablement
> for playback support on lemans-draco-evk.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 38 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e136407c56bf..2a542699a51b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -44,18 +44,41 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>   
>   static const struct snd_kcontrol_new max98090_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
> -	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
>   	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>   	SOC_DAPM_PIN_SWITCH("Speaker"),
>   	SOC_DAPM_PIN_SWITCH("Receiver"),
>   	SOC_DAPM_PIN_SWITCH("Int Mic"),
>   };
>   
> +static const struct snd_soc_dapm_route draco_lemans_dapm_routes[] = {

Move the audio routes to the Device Tree.

Best Regards,
Rafi.

> +	{"IN12", NULL, "Headset Mic12"},
> +	{"Headset Mic12", NULL, "MICBIAS"},
> +	{"IN34", NULL, "Headset Mic34"},
> +	{"Headset Mic34", NULL, "MICBIAS"},
> +	{"IN56", NULL, "Headset Mic56"},
> +	{"Headset Mic56", NULL, "MICBIAS"},
> +	{"Headphone", NULL, "HPL"},
> +	{"Headphone", NULL, "HPR"},
> +	{"Receiver", NULL, "RCVL"},
> +	{"Receiver", NULL, "RCVR"},
> +	{"Speaker", NULL, "SPKL"},
> +	{"Speaker", NULL, "SPKR"},
> +	{"VA DMIC0", NULL, "vdd-micb"},
> +	{"VA DMIC1", NULL, "vdd-micb"},
> +	{"VA DMIC2", NULL, "vdd-micb"},
> +	{"VA DMIC3", NULL, "vdd-micb"},
> +	{"VA DMIC4", NULL, "vdd-micb"},
> +	{"VA DMIC5", NULL, "vdd-micb"},
> +};
> +
>   static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>   	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>   	SND_SOC_DAPM_HP("Headphone", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
>   	SND_SOC_DAPM_MIC("Int Mic", NULL),
>   	SND_SOC_DAPM_SPK("Receiver", NULL),
> @@ -617,6 +640,18 @@ static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>   };
>   
> +static const struct qcom_snd_soc_common draco_lemans_priv_data = {
> +	.driver_name = "sa8775p",
> +	.dapm_widgets = max98090_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
> +	.dapm_routes = draco_lemans_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(draco_lemans_dapm_routes),
> +	.controls = max98090_controls,
> +	.num_controls = ARRAY_SIZE(max98090_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
> +	.codec_sysclk_set = true,
> +};
> +
>   static const struct qcom_snd_soc_common qcs615_priv_data = {
>   	.driver_name = "qcs615",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -743,6 +778,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
>   	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
>   	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
> +	{ .compatible = "qcom,qcs9100-draco-sndcard", .data = &draco_lemans_priv_data },
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },

