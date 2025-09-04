Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF429B233
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 07:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970622; cv=none; b=jeE+rmHDzyrFVGaxkWAgJQXJmr3uxu+dFktxvafyqNqMWlqwy/7tWIjuuOCOtWSL4INAi7Ku2HD0AFnHG0INIC2ubtPF8NXcZtCmViA/pTSI/N/PFg9tKTvrXzREV65GaGcaV9vuMY5odIXzCupYCgEXCn2cIwu/k+5Y4Aef1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970622; c=relaxed/simple;
	bh=K+k2g+907ASsyyCxtBq+xooXy3sboopG0rLk+Iq1IaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeQ/yFEL8X7Gz0HzeLgG/DWodBz5mgpnRcWIDTXn/GIgDloPpazC6vuHYO/QkD3PryvsY2y7ZWW6cpfCFeBpq7oE6YQ4FQ9mqAEZwSmCdOUXnPWUw7M0cRm8Eqhzu9sLRPSUTj74GTrYMfRsLKpc1OC2ST7/rJkwgPpHXryOKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lziSIs4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lziSIs4P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58420SfZ005765
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 07:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcLHrJrBsSDOxB6AEHbsxRowhoXfiqU9zcHadIgLOJ4=; b=lziSIs4PiBBJLjgN
	EaIw38AEPHeQmG02ymcFQqODgPlFw7ZmpbMFNbtFThH9ZvnV9rhf/VXdJ31EaDUd
	lAOZ9Q38ne9ob1GFlolyb8ViYqzESaZm0IxrJy4XSkM7zncg3eEASQsq2ywTPzMw
	BA8yeNcujTptekk2sriCAWk3kH0tF6QF78PikcIo0Y1S4LfhJX7cgZK52et9wa+Z
	ToGe+DUeGmvMfue2JTAPSGM4zt5V6oWteZKgRjGcQJd9oJ+QB3SOCmV0jjzT6W5R
	5ez9PH773nfxwgAqjXFXtAFC1CSZQx2EXgeKwlw4BuNJ+n6TIv3pw8GcdymaKcN1
	74RJ+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s6mr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 07:23:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b34c87dad0so14455311cf.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 00:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970618; x=1757575418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcLHrJrBsSDOxB6AEHbsxRowhoXfiqU9zcHadIgLOJ4=;
        b=ASZtf9WHm0J/eyGUoxfrhv6xw0Aa3yz24javVt8zf3+z4RFWqyczmpM2HZFBoOWLL/
         xbRoUJLI+5Cp4UZttw+PnOduq7EkpMrwV2svotk4U1mASPUFjI/vQz5iqJr9OZ1pfMwq
         ydrmggFlsuF8oB6yP5w5IkuEDAqZQv7E3254J3isYuP/Hm3N4i0x9jblpFndpEL4m7Dg
         EorrzGJZhIydVrfejnRXviAsJQ2n/TtB79EJGI8ghL/LpazKTxVyVuNrXtVEkhRLSnK+
         RnYGaEw+NeNvQQAMiF2anJ2wP2C2E0noA3VZGnvHFLSeD/VeS3L55pbbgSM7Ii5uzGrN
         ej4w==
X-Forwarded-Encrypted: i=1; AJvYcCX44qVGY9rYIltQjwxnjacJ9y3B80XGqM3zv0xGJPNRU+siv48YX9/z8dhRnp2WLNcyY3zP55QduzmRsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB89T2rjCWP1cd7s1gNW9JKcnZ57BKwQUcQjmAIUmBcb8nyHdh
	lhmQn/1ayHiU0L9QJ/V4E/BPseReuRFTvJHjzEIcf30fHWQg78icCcQuhwsSa2M1MWD0rrZYlLI
	hue7b5ecM3hr5M76ihvqsKEo5r2rKucHkwDNID7F3oZ4g2/cfHTywUY6GpUDceTX2ag==
X-Gm-Gg: ASbGncu5CMDqbQtCWoQAzZ1TxbMgAt5IROsd7GZfLwTBkBr+EN/Ld5tHCNs9ifKy5kD
	Dem8p5A2p1I6fTlI4u0txEv0UFOlHBR8lrGnHxua20SaKJ255jvyGlTBo05iarSOFT47SfHTNpC
	6fAXp8xbwE6Cl4JL41u8vEA1MowcsBzpu/D8sWfeTi7YtnipPfeLyju6OKb6M+ArzaQPFQ8Uy8o
	GtPc56IH8u9G3O9VJiQVJO71vUHz1F0/3hLFvOUYmNBthqSYC/8vrLr9ncUBix1oLLkPGwHNhyh
	JnbQB3xDs0dHbJoGiLdb/wV1uoIqsqreMco7TuEzxSHjG1zo7TJFU8FlRyEG5Ngwbis=
X-Received: by 2002:ac8:5a47:0:b0:4b3:1c38:b22a with SMTP id d75a77b69052e-4b31d80cc3dmr216763721cf.14.1756970618124;
        Thu, 04 Sep 2025 00:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4sjl5ao0M+XBc1s/tKuYtLWf33nRLYhQWE01z9AIvDf1k++soeDSMD6W8+8yKBeeVxEgr4A==
X-Received: by 2002:ac8:5a47:0:b0:4b3:1c38:b22a with SMTP id d75a77b69052e-4b31d80cc3dmr216763491cf.14.1756970617611;
        Thu, 04 Sep 2025 00:23:37 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm108511605e9.21.2025.09.04.00.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:23:37 -0700 (PDT)
Message-ID: <93c7a172-6c56-4feb-86b2-b645a4416a18@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 08:23:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: Fix playback quality
 distortion
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>
References: <20250901074403.137263-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250901074403.137263-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX+wzGygGYjAcc
 mHaPsLw7JEO8jYir65e7YiUxpShL2S1YccKZPuyyYr2qael93sewojd8uVNjQvRktcI766CQpss
 N4Ab6KVOTzPTigDqPT8B5Kz5x52SexIvFuHWV72NOaPuGICtI0pILmx/BD/xKM5nyoXcOzSVBOW
 7AbPWS29OsdLQWsBVHmV86fqe9JNpPtn477ZdTySl3tvb7VdQM6nWYj1yv8on164Z86LMA6pIyk
 N1YE7OXA3pe3MNPG+NloORuHAcomGrC9SdiBP/7N2PtcOIT0f2QvJL5FV0Xz865TyNXMCqEYRPP
 gX6V6K7vliBr44IFvaKRSVeRLZZ+X4nrFzDxStwfrEIYEkXBn47S/E/Jy5jcyxTGrj+8E2cyXk9
 3SbPaSfE
X-Proofpoint-GUID: pnMdvDW2E0wg09JH81x_K1pi-qYwZGd3
X-Proofpoint-ORIG-GUID: pnMdvDW2E0wg09JH81x_K1pi-qYwZGd3
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b93e7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=GEb1iMsm_hWG1FcFbWEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019



On 9/1/25 8:44 AM, Krzysztof Kozlowski wrote:
> Commit bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused
> AIF_INVALID first DAI identifier") removed first entry in enum with DAI
> identifiers, because it looked unused.  Turns out that there is a
> relation between DAI ID and "RX_MACRO RX0 MUX"-like kcontrols which use
> "rx_macro_mux_text" array.  That "rx_macro_mux_text" array used first
> three entries of DAI IDs enum, with value '0' being invalid.
> 
> The value passed tp "RX_MACRO RX0 MUX"-like kcontrols was used as DAI ID
> and set to configure active channel count and mask, which are arrays
> indexed by DAI ID.
> 
> After removal of first AIF_INVALID DAI identifier, this kcontrol was
> updating wrong entries in active channel count and mask arrays which was
> visible in reduced quality (distortions) during headset playback on the
> Qualcomm SM8750 MTP8750 board.  It seems it also fixes recording silence
> (instead of actual sound) via headset, even though that's different
> macro codec.
> 
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Fixes: bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI identifier")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
Thanks for fixing this,

tested this on T14s, WSA speakers, VA DMICs, RX and TX on headphones..
everything seems to work fine.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
> ---
> 
> Reported via IRC.
> Fix for current v6.17-RC cycle.
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 238dbdb46c18..a8fc842cc94e 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -618,6 +618,7 @@ static struct interp_sample_rate sr_val_tbl[] = {
>  	{176400, 0xB}, {352800, 0xC},
>  };
>  
> +/* Matches also rx_macro_mux_text */
>  enum {
>  	RX_MACRO_AIF1_PB,
>  	RX_MACRO_AIF2_PB,
> @@ -722,6 +723,7 @@ static const char * const rx_int2_2_interp_mux_text[] = {
>  	"ZERO", "RX INT2_2 MUX",
>  };
>  
> +/* Order must match RX_MACRO_MAX_DAIS enum (offset by 1) */
>  static const char *const rx_macro_mux_text[] = {
>  	"ZERO", "AIF1_PB", "AIF2_PB", "AIF3_PB", "AIF4_PB"
>  };
> @@ -2474,6 +2476,7 @@ static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
>  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>  	struct snd_soc_dapm_update *update = NULL;
>  	u32 rx_port_value = ucontrol->value.enumerated.item[0];
> +	unsigned int dai_id;
>  	u32 aif_rst;
>  	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
>  
> @@ -2490,19 +2493,24 @@ static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
>  
>  	switch (rx_port_value) {
>  	case 0:
> -		if (rx->active_ch_cnt[aif_rst]) {
> -			clear_bit(widget->shift,
> -				&rx->active_ch_mask[aif_rst]);
> -			rx->active_ch_cnt[aif_rst]--;
> +		/*
> +		 * active_ch_cnt and active_ch_mask use DAI IDs (RX_MACRO_MAX_DAIS).
> +		 * active_ch_cnt == 0 was tested in if() above.
> +		 */
> +		dai_id = aif_rst - 1;
> +		if (rx->active_ch_cnt[dai_id]) {
> +			clear_bit(widget->shift, &rx->active_ch_mask[dai_id]);
> +			rx->active_ch_cnt[dai_id]--;
>  		}
>  		break;
>  	case 1:
>  	case 2:
>  	case 3:
>  	case 4:
> -		set_bit(widget->shift,
> -			&rx->active_ch_mask[rx_port_value]);
> -		rx->active_ch_cnt[rx_port_value]++;
> +		/* active_ch_cnt and active_ch_mask use DAI IDs (WSA_MACRO_MAX_DAIS). */
> +		dai_id = rx_port_value - 1;
> +		set_bit(widget->shift, &rx->active_ch_mask[dai_id]);
> +		rx->active_ch_cnt[dai_id]++;
>  		break;
>  	default:
>  		dev_err(component->dev,

