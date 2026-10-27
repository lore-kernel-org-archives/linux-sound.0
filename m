Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108864;
	b=AdYirmjub1YiAVUfS5Cr/Iytj5+vh5Hv5/Czrd0z8R6hcQyNDM0T+4yJS8bFLDZkMTpa
	 oN9lo/B4CCPXmOkZiIbH09/LgUuk9vjymUz+qeajt2A21w6fX3WV50veVp7tQIRFIUR4Y
	 mAV3dL9OccZIVfDPpXo3EZPX0TWfmM4ASRTJ4g8oerrsZWWmyuI9etTMqo0duA9I2PN9/
	 CVggaafDWuxqUl3NViqgKNibIUpG/lksuLmEXTh+GCArTlJuZuHb/1ru5LNWCjwGb980L
	 7MhalOsTWQ/lDC0fka9c+8w6lyyjTmSMiPO3VOThsmPPGT2JjZGzmbjKo9+IGoBUb0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=;
	b=jW8KrHY3p/F62KfInbWWhpsoCDUfoA4prcM0u1gu0Lu5xqVpFyfpAJhCLLL0aruUP3dO
	 GSRA8rJ6H+Val3x1QjrCpZGM52HOQBWz2izGSCZDgRhBvpv6G1Qy+8b5GZ4PqZ/ih8fKp
	 6phs5T2hnxWzzLbu/Szb59EVbyR8Wj0IcJAwXebEH3F0KGXwWTCTiU/xbI8gGD7jUMKCL
	 YY1zXwDe+CdJEqTTpYnEn5Ie9SLK786zUUvuNfPV0Cz6IH2IdlbZ8bE6sCxfKMioK62LJ
	 XYQCBd9jowq4Kv7o1hKydv4L/0xjQERPxOlfp13ilDmpXoX/fI/CoOIfrxBM/2nO72Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ikdeUetf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdwwGW4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A26606A321
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A26606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ikdeUetf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdwwGW4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0971973390
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=; b=ikdeUetftx09demK
	cOUP61XV081zUWjq1bYn/wWv6mgFBtW04n3oLKUlTO9cU3W0p8EnNinxry6ZU2NB
	ez4aWGy7nzwzIeuM/dE8wsYLC6vp+ZvbDG/xfxuNezWmGsYOm9uGHQ2RYFvGVQTV
	uT2peFtXa8yXRRvnuKdPpgMhfhezNc5/1RQZs33BTHJF5igOUNPUAiVXjsxp/4JC
	QItjsr8XQt0eLl/rPoDKY/GKrKKXOi0qq+1Sy3yexpbCI34azDyf87U67VaALITZ
	y9VjNLyGYpWR8eL27uiS5J3/YaKnQK8HCJSIklZ90tZOb3xYXSBwYMMZtXI7/Z9k
	iNaBNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1guwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so669382285a.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108862; x=1793713662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=;
        b=RHdwwGW4lVQW3gD3ZEpf2ua25GmqefUkTkrXJ3KfjtnH3+j6eIq0oZnFNOFrW5vWD4
         +nB7xf0AWERIxJF847R3YHlytE2PNQ7LQbSEV4J8Cp6oROnyn8dxev5Gd9i7ZVBx0MRi
         OJfDtvFALbVvS+qdWzmcFHIkFUNsTa4Y2Y0FuVwNMl2NSAUOnROJoNusCIrxZ9vEnIXm
         QvFwPP5bRyiG9wnLls6P449Ot2ziCPiysXfflA+BPvWqqWWTvxxA++GoZuFTS2USbeOE
         Aioo2QKxPaJuWphJl4ggy24Hq4FQLJEk2TSAYb8TRuWbXhqGllSN/sfrL/L5H/H9+daS
         IQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108862; x=1793713662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=;
        b=QcwtMGT9pEEmnjhPAQvbPB4f+E26WycYWGdM4yF53fsKvPHP9rB+oeHE0kxpKOSq4J
         LeL0+/Y/gnjBIS0D8bGNqH7a7l9HhP3oNggsME/naUlkBK1/SVIZRZja0+1RCV0GcL7z
         2CKMiEF/fc7PzfOCTR/W95hwLlyhESp1TduoxJhM6ZJz9z4YAJDCwhP0B8mzpDw7ORFq
         xx4H9luYhTAQNoe2IZbwQMYSIR3NNDYwaiSDuVEE6PXzxyLPT26nWPeIO9Pe1yWef6K5
         ZwdqimW1tTnMtusX2mILqIVmTzPUgejW1+Fy6h9SZHBhuRnwGr5ICdElMUU+L6Xg24KP
         kqbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwydI+vVKbviE/PBuPPqKX7eluf92yKkoK+koGqqlHit84TcqZU8KXz1Jnb6w9E1gAOEZr4H46z8OdxGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4JhAEPO9d0z5xl69PECzAc41ZD4hdCL59vGF8nqv0HvQMe7l7
	RDbwCf5Lsb0ytE3kol25s3LCf9Yu0Iy6qAbShQPacvt1GmIx9IyouofPyFhrMabMdeziFs9ws/3
	mOlqeWwMYh5aaWGAjVF3NuQbvbED5/vE6SfXrAuwfI4w591knZE2q4w5KXWejUbSCQw==
X-Gm-Gg: AYBFou31wWppHBe4si3Ldq1+9e2x6R939vGgiExLp/50Q5CdmEJOzhou7C2V2A0q8BA
	olSkR2Zkdqo2BEat/8pYk17Uh72UAAFboSO+Nqi4u6iNnYBgW+0RsAMrDeGbPDfMwiFaw/aqzU5
	T2gyEpzJNliMdOf3MNjyZZy/iIycfEEeWusR68jZgpf+yoVT2xLexTF2k0CZR5qCiEqQU7jxpB4
	t4eMmZXH3RWJJ1Ai6AE0sPhdA68oa+1pTHXYr0m7KFkeag0hHSQ5Onlpqh114fykBumhmd3sBtT
	x/FDfix+4M5IiHF2PeLDXP+B8HD+6yV+BykBG/P3x7/J+eI+vwuR/FY9BH5K3olPQs1/FsoT7Bc
	MF78vqzciMseI3rIA61y+w+eRBA==
X-Received: by 2002:a05:620a:198e:b0:93f:6f8:9d74 with SMTP id af79cd13be357-940ef94d19emr1545838085a.77.1793108861540;
        Tue, 27 Oct 2026 06:47:41 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:93f:6f8:9d74 with SMTP id af79cd13be357-940ef94d19emr1545829185a.77.1793108860756;
        Tue, 27 Oct 2026 06:47:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm451676166b.81.2026.10.27.06.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:47:39 -0700 (PDT)
Message-ID: <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:47:38 +0000
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
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0ab7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VWED3eWwzX_2bvjvJsAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mlPYwTBwzMOG3fE1pXwRJwkFjksxdVRL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX58Qd8QCV+a2T
 LhVjKit/DFtosBHx3icPumigBc/ulEJtdPfCf/xKcG1OVYn4S8rn9XxjF8j9yKTy3y9gnChlB67
 4o3Mze36CTPeGQO9Z4OOj2el1amrZ90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX6RnDfkm4t1Ml
 cYhC3wbDmUkQQOjKXOQz2+WhuK7s9+temMVW7xnHi5OOGTrdnurFh1thFuckOHrRkIHGTqXN8Hs
 fpEis+8NyNxSsg8QJ60WWT0d/g7y0RqLxYbLUFPMLESugHqamPWboZc01b7IKnuP1521nuj3fll
 iNCX2iW/7F/PvkEUzud3ZHWDKhbqpYulHfMiqs45Ts/KMx0d5VJaW9kf6un8tbH0ft90GoGePF9
 5Nw6PCks0GgecQbNNFYcLYlHX7+OPSzUZyXdPg54sHf7Ees4rduVlLmY4qhMgnD5Bv0cfYveYet
 1Aex8BFI8wJNUfDiXnEcNCwjqR2rNLZ3H2ekmUtvjyU0PUYOi5p4J5RQ87cNSyGcTDGtihkeVTm
 bl2IOadoc1lvuSgI0msUfVJ41/+QfsYHhZ857ZrVr29wBRXmCik+EfJ76xlqR8gwonwriKMNOhv
 I4B7AVAWOfb3e4yQv4A==
X-Proofpoint-GUID: mlPYwTBwzMOG3fE1pXwRJwkFjksxdVRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054

On 10/26/26 8:25 AM, Zhangfei Gao wrote:
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
bit more context would help, why you need it now?

> 
> Reuse q6dsp_map_channels() to support multichannel PCM formats.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> ---
> 
> v2: reuse q6dsp_map_channels
> 
>  sound/soc/qcom/qdsp6/audioreach.c       | 26 -------------------------
>  sound/soc/qcom/qdsp6/audioreach.h       |  1 -
>  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  9 +++++++--
>  4 files changed, 16 insertions(+), 32 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index d2dc5d37bccf..33161523c7da 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
>  }
>  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>  
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
> -{
> -	if (num_channels == 1) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -	} else if (num_channels == 2) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -	} else if (num_channels == 4) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -		ch_map[2] =  PCM_CHANNEL_LS;
> -		ch_map[3] =  PCM_CHANNEL_RS;
> -	}
> -}
> -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> -
while you at this, please remove AR_PCM_MAX_NUM_CHANNEL too.

Other than that it looks good to me.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  static void apm_populate_container_config(struct apm_container_obj *cfg,
>  					  const struct audioreach_container *cont)
>  {
> @@ -1185,11 +1169,6 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>  	int payload_size;
>  	int i, j;
>  
> -	if (num_channels > 4) {
> -		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> -		return -EINVAL;
> -	}
> -
>  	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
>  
>  	struct gpr_pkt *pkt __free(kfree) =
> @@ -1275,11 +1254,6 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>  	int i, j;
>  	void *p;
>  
> -	if (num_channels > 4) {
> -		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> -		return -EINVAL;
> -	}
> -
>  	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
>  
>  	struct gpr_pkt *pkt __free(kfree) =
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 587f14ce71d2..495072da070b 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -1009,7 +1009,6 @@ static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
>  
>  void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
>  				   uint32_t token);
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
>  void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>  			       uint32_t token, uint32_t src_port,
>  			       uint32_t dest_port);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 58beaf906b9f..83594b693569 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -21,6 +21,7 @@
>  #include <asm/div64.h>
>  #include <asm/dma.h>
>  #include "q6apm.h"
> +#include "q6dsp-common.h"
>  
>  #define DRV_NAME "q6apm-dai"
>  #define POS_BUFFER_BYTES	4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>  	cfg.num_channels = runtime->channels;
>  	cfg.bit_width = prtd->bits_per_sample;
>  	cfg.fmt = SND_AUDIOCODEC_PCM;
> -	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
> +	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +	if (ret)
> +		return ret;
> +
>  	if (prtd->state) {
>  		/* clear the previous setup if any  */
>  		q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>  		cfg.num_channels = 2;
>  		cfg.bit_width = prtd->bits_per_sample;
>  		cfg.fmt = codec->id;
> -		audioreach_set_default_channel_mapping(cfg.channel_map,
> -						       cfg.num_channels);
> +		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
> +		if (ret)
> +			return ret;
> +
>  		memcpy(&cfg.codec, codec, sizeof(*codec));
>  
>  		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..fcc0267d3657 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
>  	cfg->bit_width = params_width(params);
>  	cfg->sample_rate = params_rate(params);
>  	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>  
>  	switch (dai->id) {
>  	case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
>  	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>  	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>  	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
> +	int ret;
>  
>  	cfg->bit_width = params_width(params);
>  	cfg->sample_rate = params_rate(params);
>  	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>  
>  	return 0;
>  }

