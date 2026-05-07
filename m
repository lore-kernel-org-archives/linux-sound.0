Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9D370D49
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142684; cv=none; b=Hbd4j5cIpw3zuDIEtaIgOy+Z4nu1TLxjla66qI4Aw+aypdWlZA4XvsPw5H/VjZ80Mza6l6F7faKf0xA/ntEVloGlT/ie0SSVcjPSHexS48twa0mZXxw1vWMnDreSoMAmgXi+kirD/75887dfUFsgJCXh+BQnwJ7sbrAf9qmImhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142684; c=relaxed/simple;
	bh=QS+xgoVpj05u0kN4fcEBZA7FdHDEHzpoDC0VDQZG2Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJ6uYRFxOTTfFJvRfb4tpS0wdmjg2jbeSEfdU/aKMckvolonGaGnnd98HW5x8c36CaC/1vQACbRbPFY2N0jvzQ0bcZsJslhXgZbUt30+UsZQ3z/FqeR5lNq2c3awxaYcv6NF0xQpq4vP47JJdQT6R8XwWrAsKgB4upegg6n2tQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhXHcaXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQeS+DBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhXHcaXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQeS+DBd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474444N151029
	for <linux-sound@vger.kernel.org>; Thu, 7 May 2026 08:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=; b=BhXHcaXiPBfofdoq
	lDzcH23JLjPWu2ruIVMlHF1l/fJ10xI4Bg+54JTCkn0ZX/ww/dABbaLNxWIZ0irX
	kvoLZSBKRCNi7wrzRp0PNFfaMMUgmfjEK76lXTt7oar8vCQBEakBwRl673VDAosa
	Q8/EO1/FyuEgcbMDhmjybOKy1MWbWzjq47SkaVuCeNEGEu4B0PbDsOjDwtZX5B6y
	+PzKMs1cUeZm1dbR6wlYeB5ojBSmM5yw9j5eHP7dT5OdBp43h12WTU01TBqFIYaZ
	ShmgZi9jTx5WAAOoc6qQdZ1bo+l2kmqT7wGgxwwHsburVoKs1yb5dSqdxHMAnBlL
	GAX0Fw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrwx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 08:31:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62f2e4b2b6bso1010510137.1
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778142673; x=1778747473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=;
        b=kQeS+DBdan8AA77aWYPbUHg6xR0Kd+iTY5p2avh21D+xQV5U6RwM3QN/9sR8DjvC/i
         zKiZtMBeP6CeVjUrrRM0+gIhySuFzaH/G4DtYEq4oz/TAE82BAGvSlRProA9w9Zj6/j9
         YEhhpQloZAthK+89UY0a4hhFG8IOOdc2PY+Zku9PnRcZjattvkk1NYAL3TG6iFuzgGGa
         EdFWj36X3GBZuBQuG6bfiW35fJooZkZm4fDaT2AGq3SygYlUHSqmGHqkMPAgA5TGti7i
         6ADiahUHHYMiEY1O8HCKf5rFmN6BGmZMsuE5b0FITWnA3Do452RoUfCFTQw4KxmONCkG
         yUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142673; x=1778747473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=;
        b=dP7gW8NqmpHnAnHO7mAe9sp8EM5fj3qmNCfaCwFqD/5GOlX9PC/55tG1tC1DsyjX15
         Vo/U1NOIjNgZphUCyXWm7a75VFM9n6lAnkZjK0hyzdeSEET2XzFOLOQNWvEZgNxkRT4g
         RYR8UrVUFp4+jHqkH9/VYjLiwafT1ZVbsOVkDTpygmSgzlHOTDRgrTFkHWQhjt2S4gJI
         +T4oueX19004E3+CZQ3d7eFReMRholZRVK9XHd28rKH2eBRMdyxaDFPN6QZkjtfDwwC3
         J5hvcfmhiJUBerwkIler53azTLDbQE+rkxaPKlxW+O8p08+GwCpNQLGcDlKyalgNBReG
         JmAA==
X-Forwarded-Encrypted: i=1; AFNElJ9p/Iecy7bitOA18/DFNlrCe8XY6GJV4aNDGwD8D1Jj7CUA4a7sxJKQ52V/phfJ5I3wK24aF2N9KbAfwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQ0jDF3Uv6M4xy99zdkCMLl7Upt2qzEJanRagnLRp97ARCKP6
	7Zdcdguxyzy4KhuEQcLhyk+ricOptOvMSEVztThKVMVSjxj4w4+iuvqERHzRgpy8I+Y7HK2Xwdk
	9U43PARbLU/48MMxw2QXZouykg207DEeV4IOIKNAssr/VLlk39VcCzc/jJS7g02s8CQ==
X-Gm-Gg: AeBDietvnsl3Bu+per6uhkWiE1h0jfQu2fNJQ9hXz8iHKSx0yL/2FGdiuUM4lePfo3F
	RoEjw5YKgyxl5Uj0s2gb/za02bZqm/JRgkcuI2eadYpVvhfKPK43YiJ7awygSqTixQGBZPwr0Pq
	wVZV+K3lU4GphTl0z84QyD0uTdeS/NXlltdL1xp/8cwaD05evZVU14WqP3X4kV3hQzstdOnsqXi
	UMlYy6yuKP+Xjp9UfquZwTn3I0gDwlKdxXJHF4iLU87T0xlvtC6YjxtJJcOVBU5q7HVhogfRcRN
	Q8iu5x8anSRGZEmJ/klFh66vsEB0CUXvrpJcXyfR1l2ZWhdjn41vGQuE22zJUF1tkUCFfLd2gsT
	nlIBp66umIxcJGzTKrFBJqgMbbf3tolX/yKBffia34/2qmo9Th6EvLLq6f1k=
X-Received: by 2002:a05:6102:26c3:b0:62e:1ae1:cd6f with SMTP id ada2fe7eead31-63115d83748mr644474137.3.1778142673508;
        Thu, 07 May 2026 01:31:13 -0700 (PDT)
X-Received: by 2002:a05:6102:26c3:b0:62e:1ae1:cd6f with SMTP id ada2fe7eead31-63115d83748mr644457137.3.1778142672825;
        Thu, 07 May 2026 01:31:12 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bc833742a54sm53375366b.32.2026.05.07.01.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:31:12 -0700 (PDT)
Message-ID: <af0d5cd5-4d4d-4cf1-a347-4f40c595d07d@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:31:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: qcom: qdsp6: q6routing: add Senary MI2S
 ports
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-3-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc4dd3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cc8_7rZf7ZdJLD7Cf0wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: qPnoY3Beqkvj9f9Di-pshcs08Vjz7aa1
X-Proofpoint-ORIG-GUID: qPnoY3Beqkvj9f9Di-pshcs08Vjz7aa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4MiBTYWx0ZWRfX9ci5uffDMUyZ
 CCzrs1Xj8uhkOPN0XcfcRRWrVEaIkMMv3Z6dNjLfzD4ynhi8i/qYyQyppW157tPd607rKIoReM9
 pG3cr/kko7JuzRyy648lCCPMStN+P/r7gXd52SFu26ZTIr64DCbTE+bQZQZAZ5BoNXWrOOqUzUO
 688ODyn798c67Kd1tkreDy0CyfGae4K7Q75ViNLsu2Avg3FfNMjmImIxLZOtbpXbKlWcFEe1MsV
 oBCZb1HUdgy0gmIT9E7E6eXhYuxZUxTrKume9McSCxHXLnDZd5vs0/fwDI9pSpDudu23tnBbJSd
 gLZciYlDL9AbTbq7tZnZkYYydtT0grvL9kNhn5FBeLwtJMJbNkYx1jhG/zv8sXbnrhOWoZV9LE4
 qFdfdGJXMfkxpYf+/o8Exln+Kb0MrHgw2jWCnFVK5+InNqnCB1sEbFkzAMiWcYEQLZu9yoNDYJr
 DUSL+TVWMVv8tKdRySQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070082

On 5/6/26 8:33 PM, Val Packett wrote:
> This commit adds support for senary MI2S mixers.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 7386226046fa..55119cc33d95 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -68,6 +68,7 @@
>  	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
>  	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
>  	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
> +	{ mix_name, "SEN_MI2S_TX", "SEN_MI2S_TX" },	\
>  	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
>  	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
>  	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
> @@ -145,6 +146,9 @@
>  	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("SEN_MI2S_TX", SENARY_MI2S_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
>  	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
> @@ -535,6 +539,9 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
>  static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
>  
> +static const struct snd_kcontrol_new senary_mi2s_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(SENARY_MI2S_RX) };
> +
>  static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
>  
> @@ -777,6 +784,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>  	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   quinary_mi2s_rx_mixer_controls,
>  			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("SEN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   senary_mi2s_rx_mixer_controls,
> +			   ARRAY_SIZE(senary_mi2s_rx_mixer_controls)),
>  	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   tertiary_mi2s_rx_mixer_controls,
>  			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
> @@ -969,6 +979,7 @@ static const struct snd_soc_dapm_route intercon[] = {
>  	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("SEN_MI2S_RX Audio Mixer", "SEN_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),

