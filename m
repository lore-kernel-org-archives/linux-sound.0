Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794297600;
	b=thEqqNvGfo3lQdkRt7e8cLJZmb+Q1/FpoR+9UO8vvaqyE+sNB1Qc7Q+f6/+f44yHhkTA
	 OVQYQ8k53cGzJbJQZRNbcWidVW7xrEUTedlGaUP4GRT2NQR2K3Ax4Vo2l7FDtMsvDuLsz
	 SCQF38d0Yvy75PTbuoJyYRza/u4ZcfDPRDBRUmul7N3mZRLFZktVExyIOOXmjxGhnDAOD
	 t5b5Lj31gkD9qV9Og/GP+p95fg0gG6WjrJ+aGilew668XfD+CG8Y8C5dOqi4SBq7VdtrN
	 ZY51MnrQJ1V/2hkgrBeET8TFSXuidMOTnkvQ4sTVuJQ0R7FtUPOeEWyUolAwUafpXSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
	b=KOvGGl9nrTjMEyytojanZkV2YY/nfwEV+uGhnuaYIakm38Di6TU/kovsD1RZDAoK3V96
	 x7WY6MkDUirWGLXE7oDKygrGlX+ViygVJlW7T7LROaC6GRjFzgAq9KF2LL5aHt+M4H2Xy
	 9D2me3lEkV5/AvhfojsS7J52QwCpnNKW8zibR8n8cRg3cYZqQSRLDeXrCZllDaefkltrx
	 jmPeyk6Hs7F9Nr5xW8sCWJhykyA5bWFy44xO0apfvYdStGWuHtqWIhV2Jm/4xn358m9oj
	 taKrLnxd3xzawjCKGd7iIOGP1e1/7eCe4mVJucs2jaD7HesSWHPXxu4wsAfvJgYzdyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SbNq20tY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ggtl5LDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7B26077D43
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7B26077D43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SbNq20tY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ggtl5LDj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lCP43402980
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=; b=SbNq20tYV34HB8fk
	LeAvcdMKNK+XYVVRzGAAGo4h9dAxGrA9qYEheoUoOBqrjM37LAk5BvnMsZFPfqm+
	wkiwS1dTcWO/dRgDlG/B7u8iTUCWEw6ZeMnXLr9kOkZZ0yp1A9oLKRJwm7wPnZQJ
	RN/NVpvOtgrlaxOU7tOgBc18wPU72teAZqLflZ7n1a3ALmUgYtcSzn5n/hFZ1AwR
	DiCigAcr5aw5Bjy6KmkH+wAWMioRmjjPtgb/Os6r6VPOp5XRtJyTBog4EHUL3CI8
	1fCdLjL98lVR+luQFY2BO8zXMSVfN3MxGJDSiXSXjxcqtgoA0R5l70Y0vGCL2n1B
	l/rP/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx83q7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:59:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso1351011a91.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 23:59:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794297597; cv=none;
        d=google.com; s=arc-20260327;
        b=pbfR2umksig93E45OGyKMP+NbWvmQmRpMjJbpkgsQ/fgLxE0FdeCWLv/Yf06sCDQEi
         ATYe4rMjCM+hTVkoqV2v1tPdF+cgXAPDCK9Ztnwh1vlW496UPE7wng7El2Ia63HDdgBE
         QWSwCmyUkUQIs3dwComILNh5Z9+QhZCxPpuOpL442bjNlQRcNNgY652DZgfJOyD01dfk
         mbnAk60AQCLXASskWFp+GAEboyUmb1bmu9jHQUoRpfukBF4MTNaxe+eRNG5ozfbM8uEL
         MrYztjhizLbJyzInK2DekraKV3NOVD1G9RwEWkfAvLY5P8IR2FLFVLv0jSehVLD7XHHl
         zjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
        fh=eYcy/sLCdMUCAB6aZhHDf0u8w4YLOICv5Blw/7RdGaU=;
        b=h008d1ChtKK9IQeneUCbXYHCQduC9VJhtEtOxGBy2HwfLIVIPXClXjvwoqWaRP3+FN
         P7mddhGsHv8dHAUGEIQRI/u767lQAbzgWOOV0JDHEc77M2WmaqDzldApFLZqNH3Bohbx
         Bvpzj1bqzFLj02+TIqb+66jni+Cu3nSuiW66vzgSc2eSthVu0A8TPw20jomlqoaNIHUb
         HIeF37lxRz+GZ6Yh0WUjondhd8WT7zZz+c2AITODcvYvXxo88FzPjbWKVoWs82US1/v4
         zWVnRTFC/IxyF4zfZgsrNN882kTvIqcIRDSDlLhOVGFdD0U/tlW2+aBPApqKIyB8vkD+
         KVsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297597; x=1794902397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
        b=Ggtl5LDjbCamzGWPitlbpMhTKwtDu78N/9WUpW873qVAViJcPsp3a/i/dKbz0TKaYG
         lbPZoTbHObJSX1WiU04nn0Js2PuBkVuyifuZgS9ram7sgPEsNf8nh0Arji92ofrBczxF
         I0Ct7gWJWIXCnNgfBl80+CI6zFIn5+SJoYbTLGO3LHHyYVT/LS8iXA1Okq7LtcBvpmuL
         eynb065L69FkfTxx9ZPrK5VGpaVQlmX4TdRmuSasDxL2nm9FYU+hN5b7/878gyPxdGO8
         WgUcIykYhC/LwtLdl3JKVDRvWQEIgX6zt8WAZAOhESvR2yo6Hu+bPExNIT6tQc6Hxn8u
         knhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297597; x=1794902397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
        b=PzH2Ghld0Wgg2LJx6w7zO8MmMPj9HsKEKaSYIlg8feDbjVud7axCDVJfFpWq7ydG02
         GdP4FE7NtzwkS9euBNEyUkoQx5HfY5ryaCpDMMjlUFlVoAv+9rUnH8SMhVxuTfV9zt6P
         HlqiN1EVCZ4y3h9wZ3Bc7hoG5zjvJOXeqGcopBSUHWHyZOt2jTAStahy9S+5z5jam2lz
         u1TE6l+0U0//9l4cF2U4kjQBbUtgDiDVD78TDZqsDSwM78dOrvy4Sah3zjQZuEumFF0Q
         OCTbmeqN5HWJn3hiLJyMPQrikNAQ0TW3gf+b/F3SptSiohgfRP+6mkdnjTMYlUpCtI+s
         EP9Q==
X-Forwarded-Encrypted: i=1; AL+hErEOtnpGkoYwEgDC3HQL3FzaKNLTBcZUAOYiALhrfNnhUIznTCgdFPbUMiNv0sgKtb9cYF+iMvJYOS7d8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z86HZt+IPkm9cIMzre47DbqUKvtvN3Hr+CcCcZHeVextTM8W25M
	f02gLGffDuI8OWeqM/MmGjg1IGdH3Jc5hw6kdD7kHpRbhQScimpGomVw5ODLVDo+BSi9GneVZTf
	houkE8CFoCiLi3ExrJiNLAeUTLzAerA9CHMA/2UxyTzVgmocWqgG9UBnzYfR2tvtPK3shnXfk+j
	BuHdjSbXM03hetWz6nFXn+htvU0YvyDFZd4HSJgMdv
X-Gm-Gg: AYBFou0T7poSCQ5/gWDZnW56JaCxn1/90+Ya10AkzPmf8xMbSof2MhrCuGWOoxhTDPD
	VjQp5hBsgf4+AX4gRDz3VkKaUPN7+t9U4su0zXhv/YdMb4sf2uW4IhwHpYOJOP6A48X/lxYfQqR
	3kV1Il8NyBUCqLKlYm0sQErzFi/aRQ4HGjlPfgTMHJ0I1+bI32tGvC2PcZFg==
X-Received: by 2002:a17:90a:e7c9:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b166d19fdemr2096695a91.42.1794297597118;
        Mon, 09 Nov 2026 23:59:57 -0800 (PST)
X-Received: by 2002:a17:90a:e7c9:b0:3ab:e588:c295 with SMTP id
 98e67ed59e1d1-3b166d19fdemr2096684a91.42.1794297596521; Mon, 09 Nov 2026
 23:59:56 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
In-Reply-To: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:59:44 +0800
X-Gm-Features: AclHuK-Wh_FoCrAkjmR8o4Q6NvapBEp6E63cXzxrhVdtr2TiW8KWZ0PyAbif3g8
Message-ID: <CAFkd8hvXor7A5zaRtH5iQm6NsphzsxrjbADcRwedsONo=6J2gA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM formats
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2cefe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=-pBZ-5fkuRBhhW-rZE8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: U81WFVw3oeNYUNzW-ltuisQfFkEy3mhz
X-Proofpoint-ORIG-GUID: U81WFVw3oeNYUNzW-ltuisQfFkEy3mhz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX4Wwf4s3DvVXs
 A+o8+ssadLujg5euIQjPhAJUHk3MzidQ3fYxupQjfIScvniF8EAR07u4mq0QXjcGwj9BhousU4e
 Ynj/44VF3v58afw+jY8co5aUQJ71m8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX4OOaoTjUqLY/
 2smyVBxOnTpbwhlfDj7F32Xfh5ikRi2+n7lllPFzKhXSKNRd9XPs7b5ccyw888GBS18C8bbxadS
 oL47CDX9nSGJR10/HK4csoUUVfV1QN8vDOa/DzK2/pmEo/EyvXaSZEXxUVSPdPVpL4gR5wTguHF
 ZDuDKv+DIv9MseGm0ESRYXM9QUzcfgJUzAP/WXTq2wPlllFluhsl05Q0QuEokJb3I8Vi08eA6r+
 4pRkwCtLquM3KHlMshDTa+m3dyxnGxKj8OusCsiPVBKEYwAgfaK+nH2DhEeTAU4IhNvhKPeQS1e
 8p61fj9iCFNS5woZowRpISu88syGLZ56AgVk/tL85kjggcyf15R25U9wdYJk1d5f/7g97pK5db+
 m4hFEAf46zyjrB3PFkVj28gzB/7xyAdY40ZQ0JnEuF8z4rSeFtKcToFsmS5Z49d7BbLKwFQWBIX
 KCG0eNwelYRH+hOlbOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100031

On Wed, Oct 28, 2026 at 10:47=E2=80=AFAM Zhangfei Gao
<zhangfei.gao@oss.qualcomm.com> wrote:
>
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
>
> This prevents TDM links that expose more channels, such as the 6-channel
> playback path used on SA8797P Ride, from being configured.
>
> Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> the common PCM channel limit definition.
>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>
> v3: reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL (Srinivas=
)
> v2: reuse q6dsp_map_channels
>
>  sound/soc/qcom/qdsp6/audioreach.c       | 36 ++++---------------------
>  sound/soc/qcom/qdsp6/audioreach.h       |  5 ++--
>  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 ++++++---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 11 +++++---
>  4 files changed, 24 insertions(+), 40 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index d2dc5d37bccf..e6f077a5b750 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uin=
t32_t opcode, uint32_t token
>  }
>  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels=
)
> -{
> -       if (num_channels =3D=3D 1) {
> -               ch_map[0] =3D  PCM_CHANNEL_FL;
> -       } else if (num_channels =3D=3D 2) {
> -               ch_map[0] =3D  PCM_CHANNEL_FL;
> -               ch_map[1] =3D  PCM_CHANNEL_FR;
> -       } else if (num_channels =3D=3D 4) {
> -               ch_map[0] =3D  PCM_CHANNEL_FL;
> -               ch_map[1] =3D  PCM_CHANNEL_FR;
> -               ch_map[2] =3D  PCM_CHANNEL_LS;
> -               ch_map[3] =3D  PCM_CHANNEL_RS;
> -       }
> -}
> -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> -
>  static void apm_populate_container_config(struct apm_container_obj *cfg,
>                                           const struct audioreach_contain=
er *cont)
>  {
> @@ -760,7 +744,7 @@ static int audioreach_codec_dma_set_media_format(stru=
ct q6apm_graph *graph,
>         intf_cfg->cfg.intf_index =3D module->hw_interface_idx;
>         intf_cfg->cfg.active_channels_mask =3D 0;
>         /* Convert the physical channel mapping into a bit field */
> -       for (i =3D 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
> +       for (i =3D 0; i < PCM_MAX_NUM_CHANNEL; i++)
>                 if (cfg->channel_map[i])
>                         intf_cfg->cfg.active_channels_mask |=3D BIT(i);
>
> @@ -883,7 +867,7 @@ static int audioreach_mfc_set_media_format(struct q6a=
pm_graph *graph,
>         media_format->bit_width =3D cfg->bit_width;
>         media_format->num_channels =3D cfg->num_channels;
>         /* Convert the physical mapping to a logical mapping of the chann=
els */
> -       for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num=
_channels; i++) {
> +       for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < cfg->num_ch=
annels; i++) {
>                 if (!cfg->channel_map[i])
>                         continue;
>                 media_format->channel_mapping[j++] =3D cfg->channel_map[i=
];
> @@ -1185,11 +1169,6 @@ static int audioreach_pcm_set_media_format(struct =
q6apm_graph *graph,
>         int payload_size;
>         int i, j;
>
> -       if (num_channels > 4) {
> -               dev_err(graph->dev, "Error: Invalid channels (%d)!\n", nu=
m_channels);
> -               return -EINVAL;
> -       }
> -
>         payload_size =3D APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
>
>         struct gpr_pkt *pkt __free(kfree) =3D
> @@ -1218,7 +1197,7 @@ static int audioreach_pcm_set_media_format(struct q=
6apm_graph *graph,
>         media_cfg->q_factor =3D mcfg->bit_width - 1;
>         media_cfg->bits_per_sample =3D mcfg->bit_width;
>         /* Convert the physical mapping to a logical mapping of the chann=
els */
> -       for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->nu=
m_channels; i++) {
> +       for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < mcfg->num_c=
hannels; i++) {
>                 if (!mcfg->channel_map[i])
>                         continue;
>                 media_cfg->channel_mapping[j++] =3D mcfg->channel_map[i];
> @@ -1275,11 +1254,6 @@ static int audioreach_shmem_set_media_format(struc=
t q6apm_graph *graph,
>         int i, j;
>         void *p;
>
> -       if (num_channels > 4) {
> -               dev_err(graph->dev, "Error: Invalid channels (%d)!\n", nu=
m_channels);
> -               return -EINVAL;
> -       }
> -
>         payload_size =3D APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODU=
LE_PARAM_DATA_SIZE;
>
>         struct gpr_pkt *pkt __free(kfree) =3D
> @@ -1313,7 +1287,7 @@ static int audioreach_shmem_set_media_format(struct=
 q6apm_graph *graph,
>                 cfg->endianness =3D PCM_LITTLE_ENDIAN;
>                 cfg->num_channels =3D mcfg->num_channels;
>                 /* Convert the physical mapping to a logical mapping of t=
he channels */
> -               for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < =
cfg->num_channels; i++) {
> +               for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < cfg=
->num_channels; i++) {
>                         if (!mcfg->channel_map[i])
>                                 continue;
>                         cfg->channel_mapping[j++] =3D mcfg->channel_map[i=
];
> @@ -1436,7 +1410,7 @@ static int audioreach_speaker_protection_vi(struct =
q6apm_graph *graph,
>
>         cm_cfg->cfg.num_channels =3D num_channels * 2;
>         /* Convert the physical mapping to a logical mapping of the chann=
els */
> -       for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_chan=
nels; i++) {
> +       for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < num_channel=
s; i++) {
>                 if (!mcfg->channel_map[i])
>                         continue;
>                 /*
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/aud=
ioreach.h
> index 587f14ce71d2..9f4166ebdc10 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -6,6 +6,7 @@
>  #include <linux/soc/qcom/apr.h>
>  #include <uapi/sound/snd_ar_tokens.h>
>  #include <sound/soc.h>
> +#include "q6dsp-common.h"
>  struct q6apm;
>  struct q6apm_graph;
>
> @@ -805,7 +806,6 @@ struct param_id_hw_ep_power_mode_cfg {
>  #define PARAM_ID_HW_EP_DMA_DATA_ALIGN  0x08001233
>  #define AR_HW_EP_DMA_DATA_ALIGN_MSB    0
>  #define AR_HW_EP_DMA_DATA_ALIGN_LSB    1
> -#define AR_PCM_MAX_NUM_CHANNEL         8
>
>  struct param_id_hw_ep_dma_data_align {
>         uint32_t dma_data_align;
> @@ -998,7 +998,7 @@ struct audioreach_module_config {
>         u16     nslots_per_frame;
>         u16     slot_width;
>         struct snd_codec codec;
> -       u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
> +       u8 channel_map[PCM_MAX_NUM_CHANNEL];
>  };
>
>  /* Packet Allocation routines */
> @@ -1009,7 +1009,6 @@ static inline u16 audioreach_gpr_dest_domain(gpr_de=
vice_t *gdev)
>
>  void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
>                                    uint32_t token);
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels=
);
>  void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>                                uint32_t token, uint32_t src_port,
>                                uint32_t dest_port);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
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
>  #define POS_BUFFER_BYTES       4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_componen=
t *component,
>         cfg.num_channels =3D runtime->channels;
>         cfg.bit_width =3D prtd->bits_per_sample;
>         cfg.fmt =3D SND_AUDIOCODEC_PCM;
> -       audioreach_set_default_channel_mapping(cfg.channel_map, runtime->=
channels);
> +       ret =3D q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +       if (ret)
> +               return ret;
> +
>         if (prtd->state) {
>                 /* clear the previous setup if any  */
>                 q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_s=
oc_component *component,
>                 cfg.num_channels =3D 2;
>                 cfg.bit_width =3D prtd->bits_per_sample;
>                 cfg.fmt =3D codec->id;
> -               audioreach_set_default_channel_mapping(cfg.channel_map,
> -                                                      cfg.num_channels);
> +               ret =3D q6dsp_map_channels(cfg.channel_map, cfg.num_chann=
els);
> +               if (ret)
> +                       return ret;
> +
>                 memcpy(&cfg.codec, codec, sizeof(*codec));
>
>                 ret =3D q6apm_graph_media_format_shmem(prtd->graph, &cfg)=
;
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qds=
p6/q6apm-lpass-dais.c
> index 83f2711bceea..9a3994a4f475 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -94,7 +94,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *da=
i,
>                         return -EINVAL;
>                 }
>
> -               if (tx_num > AR_PCM_MAX_NUM_CHANNEL) {
> +               if (tx_num > PCM_MAX_NUM_CHANNEL) {
>                         dev_err(dai->dev, "invalid tx num %d\n",
>                                 tx_num);
>                         return -EINVAL;
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream =
*substream,
>         cfg->bit_width =3D params_width(params);
>         cfg->sample_rate =3D params_rate(params);
>         cfg->num_channels =3D channels;
> -       audioreach_set_default_channel_mapping(cfg->channel_map, channels=
);
> +       ret =3D q6dsp_map_channels(cfg->channel_map, channels);
> +       if (ret)
> +               return ret;
>
>         switch (dai->id) {
>         case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream=
 *substream,
>         struct q6apm_lpass_dai_data *dai_data =3D dev_get_drvdata(dai->de=
v);
>         struct audioreach_module_config *cfg =3D &dai_data->module_config=
[dai->id];
>         int channels =3D hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_C=
HANNELS)->max;
> +       int ret;
>
>         cfg->bit_width =3D params_width(params);
>         cfg->sample_rate =3D params_rate(params);
>         cfg->num_channels =3D channels;
> -       audioreach_set_default_channel_mapping(cfg->channel_map, channels=
);
> +       ret =3D q6dsp_map_channels(cfg->channel_map, channels);
> +       if (ret)
> +               return ret;
>
>         return 0;
>  }
> --
> 2.43.0
>

Hi, Mark

Any comments of this patch?

Thanks
