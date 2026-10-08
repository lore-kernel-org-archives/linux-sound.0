Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32763F9278
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458714; cv=none; b=XbRbI5pbnP9bR6v4oaaIYlEHkBUTkw+XCFAzE7217SOjOtCUfmsesFGvEdsetPxLa2n9efj7dqkIdIaL0hSf+C6gtj7arezV5SsoC2n8+hUuCGsu0HZaA2vCmf6oyL30V6ZyKZEw1mQEfbeAZKgeFrUcOdzHAH+S7T7nLGkbN80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458714; c=relaxed/simple;
	bh=Zr5BTcRExanOPN3GVz/jGdowr9uQSut9/R3g4sDr2rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+FgZzlaJ8c5jvAsQbsuVbaqlle9xCaJQ4p6ARNPYhDMUo4WPeUZNbN0zHm9A601XLWtHCVKLQLS+ca5IjADB4w9We6zuYSiNEOIl/30ddQFA/dfm9Fij+cQ6xrvhEYUxGFtdrHSiU0jmePE/ofNqZdykrNYYkij/d/0NoQfnlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ho0W5dCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTVILPit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ho0W5dCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTVILPit"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKD4D1269585
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 11:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=ho0W5dCDqEepLeXb
	c3X6IpEzpIJuV7O9b4xR+BXQqk3t8784QEqC9pdFly9oxMZECu3kXEi5pLPm3TRH
	EvPmktk/Z6S+yoAxVcPLjsDySWgmvMB5H8ZmGNNc3h3sk1CkWxzCQ2i1pGU0CpV0
	aQ0r19woq/eVoWZW0arhYWDFK+cTaJa+l8wmP4BxqRIXLa7Qkmyw3xt2yIVHq5d+
	usqh2NhRlCCMbLucL8WaTjC33qXNtuxqzrUPtYxDkhmlwwlt71GC5EiAi0c4sqmv
	3sCAE/9yocRYyY0afMZ9e3hFLwZnACvtF1cTFAwXBQWE1uOv6MS71kMUEEXBNFNr
	yDbs0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32kfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 11:25:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e5d759038aso18081535ad.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458712; x=1792063512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=JTVILPit4jCw/mbHMNn7tCNN6PSISSXXV4mO4eSGqLcFFJmBkB5hNgaVPQcGPihbbI
         75KwzWn0no220BAT2PHeRJzu8AfpFgVirvVUCRVJ/Kzw9bVEsA28mh4w34u6GVRN4ehG
         xNsgY8VX2CXK4J6I/1QxqAlSmoWaClgTVJ9yVhQ7iekjM2Xb6rvMm4S1XabYVcOcBs5U
         LGJFFoU0En3kx/5Zc4Vc9X75IbRdyY00UP6mTsKB+IzxhrImFJlvYBuI+0H+6pX4qzdx
         Zj++XZ5Db+6KGSMBfs2vBBGEwCGOyIYfPfcxukDL29hk3ZLCGJRAD1TonWsUdb6V1M67
         G18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458712; x=1792063512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=tuHdQbHwCxQr6CBWY69hGl6K5+o5AE03YGUTq0FOik0dV4hIjoWJbUSzD1kE/LHrmZ
         fWdm4mz4Tc0LcNx0Di3nFZ8+BEwNW20phBhKOqYhRTYcXSifQ2X8f7Ma9RjtpotmUCJa
         nsfzsDQA0Lc194Y4dW8PliFJQHKPZA8qyLNcxPQOXF4mevyCu0Pt1nujGfLRs17sGqQV
         xBPkijyz60A5BlamP9kYNxKZ5o3+VlgRKWu3yxqpIpcO57Hg93Nq8b1MoftyYMkLSpb9
         79cCJGCbtJb1cO+j3jtfZewv1efrvryPWjLsW8jMpRuxE/M5PSkQNipJUAbI6nbGfwCE
         fZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVTb8nSAkHyEpO1KwljP70Qz3mlhZ4BEoHmaHPCRN0NqTbeUkpmSN3/IKszTEL5WQTv8dIXz6vp+9zNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2P7hg8MnY90jxbwaGrq3gszkDVxfqWcMSSKARp3bizJU6OrF+
	RAPzLKDfbCkRo32beLvJ5+rXzjEjki8GzUeV+Jm3i+KQMY7mtlPZE2B3aEXOXAh0K8i0bneFH+0
	t6e2kgA0MAYW8uvMiI9iA59RLEg9rlvnn2eKztijhRCMJshCwcTv9MwvARMasi8ztBQ==
X-Gm-Gg: AYBFou0dtAVZdbT34uqGPGeX1bMx/58b6raSic0AcVqLyqsWYhsWhpuGd5DUePxKkqh
	soJ+NsDfvLhOgOsyGHZZ5sh1OGRshNEtkrw9WZfipcFwBKhvkxKprIbXxGHFIFCttW8pj4f9DgO
	BIIV/bnDmfAjJ3iBt8VnBuxtwiZYTvBzNJzJ/IuNb95uJQ27kL9kzM1YkHOm3iP8MMm0Rkk97SI
	a9SfJAcR839FrOFk8pE2ULGjJ1cN5fwE716Y2uyn1Zd7kfyuH/k1KSezobpE64LW9/+VsEN2xqf
	XBanub80oQiWKeQ9eoNgR5Xfft6GQKNX9lulUO+3K0xvmJGb40iE/KQHwzbBYkqGLuEFyU30fgl
	/IT3wZn18AHdAcjnfHWYsLNmaeUI=
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40857915ad.39.1791458711598;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40857685ad.39.1791458711093;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6047201e6sm22775505ad.37.2026.10.08.04.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:25:10 -0700 (PDT)
Message-ID: <10fe8480-21ec-4e44-ab21-d88bf2ef03e0@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:55:03 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access
 clock error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfXw8LSjNRpmH0p
 oZ/O839xmixgN9Y9E9YjGKh9FAwmzKNtZ5u6DWe8PIPspWrjZHmbGeaU4ipH0/EYtrUslmRwOkY
 ub6MyRLcyhFlvUwE0cmA7X43J0gHPjvXpJxEJES2wbUNbg4yzR3Ktw7Z14Ajy53r0VyepnQ1QFT
 ZuyCncnqsS/r1b1P3bzh+xo8vbFRFFx34/NDnYtPPhZ2jfok2Tk7fyBNZym5BWONbOLP2rTjVXL
 IJROA+WjXkXAfijt9t5RvoK9fJ0TfqGGNpb2Pi9SZtTFsdJjmcRvLDv0VDbs89ZiOP0mX1lh0YU
 MpYXQftM8pskGB8s1WRTysne0F+WVKUauo9NDVha90cGMCe9uuCQahFR8eVPnSH0SgfmimNQ3ZJ
 pi+HvuzHjtqSyMIHtOYjM0BqvFr5DlB1SexOgx7lqNRdQOUhMSAZGpCIFGgCIdKCqgfcmRODxgJ
 JyvFbTehKp0QKQqBIiA==
X-Proofpoint-ORIG-GUID: GaMJfCayVi5x4RqIC0i7RQ3ZuEcf7IUQ
X-Proofpoint-GUID: GaMJfCayVi5x4RqIC0i7RQ3ZuEcf7IUQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX/tPshtmFfaES
 NbLLZYkpumDHSXAAF2QY55u/jVBs0T/gE+wy5Wo8F0RcHGzTPfIwRhUBRSADomQ5+TYgVSgtCJ3
 IgP+5PaAvMLJ4CLoE9LEzwjKoaLwKZg=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac77d98 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rZdDH30vr1OGgawLJCYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check the return value of mt8195_afe_enable_clk() when enabling the
> register access clocks.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled and propagate the error to the caller
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 12d8159338be..34c828fdea29 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
>   int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> -	int i;
> +	int i, ret;
>   	static const unsigned int clk_array[] = {
>   		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
>   		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
> @@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
>   	};
>   
> -	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
>   
>   	return 0;
> +
> +err_disable_clk:
> +	while (--i >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
> +
> +	return ret;
>   }
>   
>   int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)

