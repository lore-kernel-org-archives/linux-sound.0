Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D36471CE1
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764617; cv=none; b=ng7o/JQ0W5PHjQ7yziRLIGkfadVtBDQ/nInUIY3JX5sNIysIle07pZT+LPNt5UxsYxu7UUaCkjjMC8QgdCsqoDyKSZSpVudafZvVENDkSKvF16JtjtgvhWR15c/U1hOLGB8M+5H7zgxE9OvCnGX9cemwETi3Ljge+1s3xe97pdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764617; c=relaxed/simple;
	bh=E/DePtOa4Gf/k/Lqxs95vWwK9X3iJNjnGFfGPaCyzCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkLwgO8S/4Gnhc0p+hGdbJ0lUb05TTyIrUeK2asK0lqx5N/dLp/9ttY18uGuzTsoGShUHIbX8PcCQUAXosHNmPO7ddGib2Bmo5jTdK1NflffEgHcEqVLH8726PD85I9CuTLtSyy835WmbnrFrzccWl2MJjY6217PPqzjqKOIvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBpA39t/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9D/39xt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBpA39t/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9D/39xt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKF2252116717
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 20:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPwT69uFNznJm+gRXP6xEzLLBA9/54Cc5I0vOoxny0Y=; b=EBpA39t/2oGHuf3v
	wd2whd+t4nW6W9iEmvTZ2Kqcf3zX975dr4SkeIpsxofSft6xvGr722Ybd4jBX47U
	GclEpIDkYSPImKvupVpzMWzA8VmtOwQNg+rLoOMdyt+SYF1BDrwq3V7iPZxAU1eE
	pHPbjHsD7YTL7m0QxFhWGX6WKOXVmNziye87ovLqQz7Fcfs07eqa+sGnZxOIB9km
	dc0zr7AeaRFLVm9MTM/di7b2KoAmrnjXc55GsDVeRmiAhkaGxI8a5LFSHttrVkV+
	AARX42s3hH9FBFRbp79WPjvm4HA15QE65gs0bZv11eSgVdq200Eav/cIzxZ4I5S0
	yilVeg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2utbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 20:50:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104c2ce026so28008766d6.3
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789764613; x=1790369413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPwT69uFNznJm+gRXP6xEzLLBA9/54Cc5I0vOoxny0Y=;
        b=A9D/39xt9dSCRvH49dejRHbE9zmZxk3tBDPVNRpU7BtbCy5bCsiv7E3mXhc05pync/
         XiLKwwKcQE4LpUitxvuMBs5AZ0qkyhzpaYJAl5NcksMikVLMMLdkzG/TonTlRVsfkR+1
         DYLSonMvrkrqzvoG1vV5r+TvZxNEoFIBGeeM6shLMC9nqtU7yRwLpbpPU5TmC3LIGgOm
         4OnVQtwKWFl49JeBWcdsKhwiPIeYr+8bXL47K2oQb7nJKSQXbDTfcbErX4+A0hpH+QFp
         pPxaRq8Hs6PCM5x6Cf0ijLgRJvOEPhpmEerWjJRD7vx4u+9gqKYPe9MJwgSFCVbUOHbP
         I8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764613; x=1790369413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPwT69uFNznJm+gRXP6xEzLLBA9/54Cc5I0vOoxny0Y=;
        b=QS2OMjemrtkRTGfeM2MWUV0Bbnvyyg5ZkUZuTT8OsC1cMNiw+pXtESF1q5Ubm36GNF
         IQqioFNtTGyyPxdfqjMNdvj5toup3Fn52RvIBCp0LNpaWuBu4Vw/o1qgS/ymPFZf2Bjf
         fLSATM3sbL90TmpO8+pL95wIleK+tFwXFYlougeap+7bjUTJvlp8QuQV5gLd7O3G6DK2
         b9/FSqCV0t18uL00NwOmaLUDuK96Jr8FhkNrWIK2qGTnNt6BA9MvX3sINULg6PnCeg19
         HyJPY0fBoK6La41wSTYkcj1sOx3DwjRd+b0wuNmo7AGCXLCxQ7Ba9tvFSpH+KDkJrcDR
         JZGg==
X-Forwarded-Encrypted: i=1; AKwUvBzJi4kL4jTZUCtIIXH6IXe1sulzNngg6pb4pzxfzVbrD/tVMvnJxjuffqSg+6jRJ0hFcfb1gc73w4yRLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mdKBBy282RjFz6qqN2tq0u9iZQm60V9Pm5iYLjwefqFMdREO0z
	vXRaEOfAoR7yHuzdSftu9J8ehAVJte49U3DXyeeU22Q6tC53KDBg+W9VA7jWI314BYw4OEaRs0d
	BW5x4itBJc+Za4UDd/F99F/evSrdhv8hi4gpSZBneUtqaQnKUkFx//mzdAEabOs/Ksw==
X-Gm-Gg: AYBFou17A5PDFj9TYqnfiQ70YorlbnrWPNDhSffywj0687apmg3WtpanxmnBDlqTcvE
	+kxge/WJEaw+gXSuZScA0bx2qIQwchF+6pnUb2FONECFAjHDSR65NS56gQrS8CsRJ7Moc7aShNU
	z4DFCTVAPIlGJqoy0N0F4j5z4exIiwVPcIxEJxN2LEgGmxdSTmSOe/VrQlgwvxOFDKuVbpWxd49
	v7KZ2lbN7TXgT+W66lfOYx2j7DWNEzTbktcakHsq0jUCCSF28Aahm08bFwmW9gXKORTZTOKAHI0
	OcVcfuBzw7apsS7Di1yPR4h4thGB4pVf37V49RRikgPJGwAnYX8DElC7DNHYMJwTA5iXM9jr16I
	DFcWa/OlcYxCgAbVumh5efZ9M2zE=
X-Received: by 2002:a05:620a:4592:b0:93b:d79a:c46f with SMTP id af79cd13be357-93bdca70713mr629185885a.71.1789764613319;
        Fri, 18 Sep 2026 13:50:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93b:d79a:c46f with SMTP id af79cd13be357-93bdca70713mr629182585a.71.1789764612860;
        Fri, 18 Sep 2026 13:50:12 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48724589c02sm1270037f8f.24.2026.09.18.13.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:50:12 -0700 (PDT)
Message-ID: <e6adda57-a2af-4a64-942e-456896ed1ac3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 21:50:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: qdsp6: lpass-ports: add support for
 QAIF AIF MI2S and TDM dais
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
 <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDMwMSBTYWx0ZWRfX+z0RdRVMNNkv
 sIX14rGc7b7fu1XP8SZ3yngFt+db3XOfqNDJp43F2VQCuJZgwsqwnSxPXEDgEEtfPS2BHvONddd
 8uxkvC0F7P/fHxfdsP1AAlrErTp/8Ns=
X-Proofpoint-GUID: dr284JOuV58tT9WJCbo2edO3JMYAhRel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDMwMSBTYWx0ZWRfX2qDD03QZOInl
 OLNQDKoHHNvFqCZPjH1tPYpTlUyEbWVDkz0HTpRIPJW6ceAytPTUjUyg0AlDEkLrcgJWPviMCPj
 znPaGoo+CTmSrCCyapaCRrPBgK8jnBhkqWp3MMNoMm+/w7fsyTvDMVScyCWvTaVp3rP7fr9ebMQ
 p+Yu/uAdVwRbMQImNV6kyetGyU+iHLtQ+qjxu/4C8sZCjQOwNc1zEh8skZ/qP2bWMplXJsvyQgO
 8dNTjGxjXwanYgW9Zf2cb2S5Ac45Aw0yGsjhSIWiArIeDKNq9+q/LQnQMf1FNK1jeaj6b7YGOpO
 m9ssOosAG34ZUvshyOuhqfE9TD2IGwZVAV+zWAjje40RMx6xz8T87EvGqojQKhW5yGPU/0h1RxD
 VOh96bitFBsv7zU/H8Ny8w3JkX3KehA5gIUX8uAjeJDECKGfPajW1Zgjj50IS1ED9Hh8AWvM45U
 oDJjbYkb7nJRj7W96CA==
X-Proofpoint-ORIG-GUID: dr284JOuV58tT9WJCbo2edO3JMYAhRel
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aada406 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GqQc-a0XTcvgjwLuy5oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180301



On 9/18/26 2:31 PM, Mohammad Rafi Shaik wrote:
> Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM dais in
> the dai-driver, these dais are used in Shikra, Hawi and Nord based
> Qualcomm platform devices.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c  |  2 ++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 54 ++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index e204fd59e512..83f2711bceea 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -386,6 +386,7 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
>  
>  	switch (dai->id) {
>  	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
>  		if (slot_mask & ~cap_mask) {
>  			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
> @@ -474,6 +475,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		case AIF_MI2S_RX_0 ... AIF_TDM_TX_12:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index c3d8116ad503..f422346a50c6 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -548,6 +548,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  		.id = SENARY_MI2S_TX,
>  		.name = "SEN_MI2S_TX",
>  	},
> +	Q6AFE_MI2S_RX_DAI("AIF RX0", AIF_MI2S_RX_0),
> +	Q6AFE_MI2S_RX_DAI("AIF RX1", AIF_MI2S_RX_1),
> +	Q6AFE_MI2S_RX_DAI("AIF RX2", AIF_MI2S_RX_2),
> +	Q6AFE_MI2S_RX_DAI("AIF RX3", AIF_MI2S_RX_3),
> +	Q6AFE_MI2S_RX_DAI("AIF RX4", AIF_MI2S_RX_4),
> +	Q6AFE_MI2S_RX_DAI("AIF RX5", AIF_MI2S_RX_5),
> +	Q6AFE_MI2S_RX_DAI("AIF RX6", AIF_MI2S_RX_6),
> +	Q6AFE_MI2S_RX_DAI("AIF RX7", AIF_MI2S_RX_7),
> +	Q6AFE_MI2S_RX_DAI("AIF RX8", AIF_MI2S_RX_8),
> +	Q6AFE_MI2S_RX_DAI("AIF RX9", AIF_MI2S_RX_9),
> +	Q6AFE_MI2S_RX_DAI("AIF RX10", AIF_MI2S_RX_10),
> +	Q6AFE_MI2S_RX_DAI("AIF RX11", AIF_MI2S_RX_11),
> +	Q6AFE_MI2S_RX_DAI("AIF RX12", AIF_MI2S_RX_12),
> +	Q6AFE_MI2S_TX_DAI("AIF TX0", AIF_MI2S_TX_0),
> +	Q6AFE_MI2S_TX_DAI("AIF TX1", AIF_MI2S_TX_1),
> +	Q6AFE_MI2S_TX_DAI("AIF TX2", AIF_MI2S_TX_2),
> +	Q6AFE_MI2S_TX_DAI("AIF TX3", AIF_MI2S_TX_3),
> +	Q6AFE_MI2S_TX_DAI("AIF TX4", AIF_MI2S_TX_4),
> +	Q6AFE_MI2S_TX_DAI("AIF TX5", AIF_MI2S_TX_5),
> +	Q6AFE_MI2S_TX_DAI("AIF TX6", AIF_MI2S_TX_6),
> +	Q6AFE_MI2S_TX_DAI("AIF TX7", AIF_MI2S_TX_7),
> +	Q6AFE_MI2S_TX_DAI("AIF TX8", AIF_MI2S_TX_8),
> +	Q6AFE_MI2S_TX_DAI("AIF TX9", AIF_MI2S_TX_9),
> +	Q6AFE_MI2S_TX_DAI("AIF TX10", AIF_MI2S_TX_10),
> +	Q6AFE_MI2S_TX_DAI("AIF TX11", AIF_MI2S_TX_11),
> +	Q6AFE_MI2S_TX_DAI("AIF TX12", AIF_MI2S_TX_12),
>  	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
>  	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
>  	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
> @@ -562,6 +588,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
>  	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
>  	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
> +	Q6AFE_TDM_PB_DAI("AIF RX0",  0,  AIF_TDM_RX_0),
> +	Q6AFE_TDM_PB_DAI("AIF RX1",  1,  AIF_TDM_RX_1),
> +	Q6AFE_TDM_PB_DAI("AIF RX2",  2,  AIF_TDM_RX_2),
> +	Q6AFE_TDM_PB_DAI("AIF RX3",  3,  AIF_TDM_RX_3),
> +	Q6AFE_TDM_PB_DAI("AIF RX4",  4,  AIF_TDM_RX_4),
> +	Q6AFE_TDM_PB_DAI("AIF RX5",  5,  AIF_TDM_RX_5),
> +	Q6AFE_TDM_PB_DAI("AIF RX6",  6,  AIF_TDM_RX_6),
> +	Q6AFE_TDM_PB_DAI("AIF RX7",  7,  AIF_TDM_RX_7),
> +	Q6AFE_TDM_PB_DAI("AIF RX8",  8,  AIF_TDM_RX_8),
> +	Q6AFE_TDM_PB_DAI("AIF RX9",  9,  AIF_TDM_RX_9),
> +	Q6AFE_TDM_PB_DAI("AIF RX10", 10, AIF_TDM_RX_10),
> +	Q6AFE_TDM_PB_DAI("AIF RX11", 11, AIF_TDM_RX_11),
> +	Q6AFE_TDM_PB_DAI("AIF RX12", 12, AIF_TDM_RX_12),
> +	Q6AFE_TDM_CAP_DAI("AIF TX0",  0,  AIF_TDM_TX_0),
> +	Q6AFE_TDM_CAP_DAI("AIF TX1",  1,  AIF_TDM_TX_1),
> +	Q6AFE_TDM_CAP_DAI("AIF TX2",  2,  AIF_TDM_TX_2),
> +	Q6AFE_TDM_CAP_DAI("AIF TX3",  3,  AIF_TDM_TX_3),
> +	Q6AFE_TDM_CAP_DAI("AIF TX4",  4,  AIF_TDM_TX_4),
> +	Q6AFE_TDM_CAP_DAI("AIF TX5",  5,  AIF_TDM_TX_5),
> +	Q6AFE_TDM_CAP_DAI("AIF TX6",  6,  AIF_TDM_TX_6),
> +	Q6AFE_TDM_CAP_DAI("AIF TX7",  7,  AIF_TDM_TX_7),
> +	Q6AFE_TDM_CAP_DAI("AIF TX8",  8,  AIF_TDM_TX_8),
> +	Q6AFE_TDM_CAP_DAI("AIF TX9",  9,  AIF_TDM_TX_9),
> +	Q6AFE_TDM_CAP_DAI("AIF TX10", 10, AIF_TDM_TX_10),
> +	Q6AFE_TDM_CAP_DAI("AIF TX11", 11, AIF_TDM_TX_11),
> +	Q6AFE_TDM_CAP_DAI("AIF TX12", 12, AIF_TDM_TX_12),
>  	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
>  	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
>  	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
> @@ -717,9 +769,11 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
>  		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
> +		case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
>  			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
>  			break;
>  		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  			q6dsp_audio_fe_dais[i].ops = cfg->q6tdm_ops;
>  			break;
>  		case WSA_CODEC_DMA_RX_0 ... RX_CODEC_DMA_RX_7:
> 

