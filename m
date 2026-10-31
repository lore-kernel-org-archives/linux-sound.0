Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434621;
	b=VpZP6ZC6HThA/CAcXFtk1jXJqHw1jtfjF62WLPTwOgHCPTKtrE9qik756LSzoMkxfpdu
	 b31rOfVKag/WhH6ytKTA0KyAxw8/5tlPTa7WFt3Ne6B8CZHZyN48s6Z3S2u2GlE692+G/
	 WJ2i+qK9NmDZUIz1Dba3vONM3yr7DgX/e8HH5oS5xpPDAKLrpZqNCwKeelnSvZ2LT/fmb
	 bAEHFMVVkxh8pcGDBWMYRr36Sye7Z+MlswHyYNbv/+V+wKupd/GfEWMS4SVytZb+0JYp9
	 1VK0sh0w1oPCkHjYtwjXQ3Ore20ZPkTNmTxxs+/gKYDsycjjWTcgae816i0wV7ZAqYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
	b=tWP8nj7ZK8JLAF7S9SGFXYaq/gYl1uA1ktaX/ScHi9vNuLq9Px3QSq47S/UWos5e59pJ
	 ESp9cV31q0BG9W3+FAV8ROvYXkxuDxIECRrnM/zrpWOrm0mQxLUQpgNnmv1hflHSmuW1Z
	 Ekr2PaaPq7AEAxNnqRRaE8t4OQK94WV4Hv/n/dDq5Sle5r3jxqaOpZtWiqzGwfqM4hdGq
	 7UF5dgywtJ4wr+2NBiegkUesPjJ34yXEf8ESWkSlSwVeQHf/HwAnbaxsx7kMrMRUebRVs
	 0YsLeoZZryPNXwU4LYkSeKE9R6uY9IYv/vLHl1Hg6Rc//iOik9w4GBmmqcBxOltbcYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HjzSbq9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giUGF3Rr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0B606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 08:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HjzSbq9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giUGF3Rr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4lpwB227250
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 08:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vw6HyQtXuRoikTGlJUDmnSn
	XK5AJkthquCz9mUm8YI=; b=HjzSbq9xqHwShjbDgQTAf25CWAw7T8Cga632j0tt
	Nz5y9pJlWXGq0dByUVyxZufshCtPW3xxgj+1dDUB8tj9rl4lDI91XaVJ6Eg4XhI/
	6rdeeVF+bZ9S4IEOjU/ccrYL3Q8XK/NUpJFZfEpKyOvq+gBezmx/t/PFDuw8HPH9
	1w0sEAdGQkfAForLQGhLXid81HAIhtaXXQBBFchTyILWFJa3RuIuaEXK0tkTvP/I
	nhUwHaIpM7YvK+mHuIKhBIxCYpg8xdf1GuvLhPb63Bu7wU1f+oB6VFT/0jYmu9LS
	QG03Am20rx7tbFYJHHQNjewtG0t+pRs8NQjJVr9QP/4Qng==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98fa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 08:17:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ac19c6bc71so1329543c88.0
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793434620; x=1794039420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
        b=giUGF3Rr1YodUYQyaL3NnIf5JhkBG9KyLS4dWko6slUFG4aSLsC9XA2YEgstKh63b+
         AQGB3ViJiA0PmiSMv/vi64O5gZ/xQUX6u3RjpcV56PUmULW/rMvbWW9KysDoxDLBklwC
         XvxG890efefFzbgtL1iu8WcjikSWCymn5vys4v/YNuGytd8VeO0AhtB/7jHX1CMLLZRh
         j34mrr/prdQ8BbcGA31vfrWPsuaJu4p9BTQLdVrnptKDkubrYtKQAK58SEyOCQNQJjtn
         Pyh4xr815jC5tUoPqNi1wQGH+CTInjpHlazksSt5VjEREQQ5cF5Wt0F60Ber8CU7ad/7
         woTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434620; x=1794039420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
        b=EJg35pYV8Im5YtkBoWZwOzoZ7JhBDGvlKn8ia2QG0fBfajK6Nw315sEGj1BIcU5aQx
         ggyPqRC2NKUUUnQvplaRqIQUS3rBQci3oVD7VBncSa/GkidCubm4Qc9IjQ/sKeF10uGq
         RwrJK4dp0RHREVgaf4oeqooIEO0OFlL0aW9pVhmJdi6kbU7wDpwZg/uOjDnIcMygHPhk
         /wBt7ljIz63J5gqUlx/jGN4gdMyMUHCb66jHeM5mmLHdyF53VHazunIPUEpE2OS3Kunu
         zLT357EgXkXi5APzRMoK0w7+ZVsJ43Gm44CV/HcZmbWdoYCFoQUxE9VzXB+XVF3hWDwl
         Wagg==
X-Forwarded-Encrypted: i=1; AKwUvByHJnu3Udl92PX+/5ig33Hd+33W+eahE+ZCsspvW1aXQuntUPp15yEKVgGRX16p2kJDUQ5WQeI9SP1J7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvRGy245nOvUgz8ctCTrBSV7W2KgQ7NGnOMObXO8MfEB67lTnB
	uDmi/hGH1titqIMzALQVTAXdVnK6UcymIfLegvTqQTBgaeG4UpJnqlrsJfdsXaPNQvDQY6lJ+Y0
	c2Gb83hXOwcQtFTMcPQ2HlJayul14Y7/TeEXBM2uIBbbvr41Cj40jQghbRAyQRKHGlhidY062dv
	jX
X-Gm-Gg: AYBFou0zpR0cjv4K9Gh8HaaTSEFmGvgJ+rmwo/k6U1p4gafWLxjDn6Pde3sAVtMB45x
	Zclml1SSKJFcXeKItKnu+z/JHPoUEV41hdqcJlJIZ0oiADBwpJYPgrOi1HWECWM/os7GVCA051i
	sPVzfUcj4MPYr2irfpYQWfk6RJkTucqcSTs2h7MbhWk3yqZv37Vl1tLXjbH6nbC6Tt7G65oUz/U
	yA2N17YRGdHJPA+jJjaICXkCx/+TzRHlGlikuwClTYCeQNPVwPuxILu/XiIwgk4TMWOX8WImM6Y
	HS2uyNz2gUHyAhC4oY7EaNf9sjcAqbASJKHWlDxhfHpo0fWZeHYkb27CDVyZK6vt/m3t0EFqSd3
	v7gTWWw/PRpL4orB/4Kz/PD607OGv8ogObQUBUXNjqnUUCy6+Ed+ymoKWfENx0Vk7SmjvDxc6ln
	3ch7o0NSOC0a8WXDc=
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr6434303c88.13.1793434619481;
        Sat, 31 Oct 2026 01:16:59 -0700 (PDT)
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr6434270c88.13.1793434618901;
        Sat, 31 Oct 2026 01:16:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm13098143c88.8.2026.10.31.01.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:16:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:16:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <auWj9PgfrDMNYrI7@QCOM-aGQu4IUr3Y>
References: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
 <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NdgbCmDdNuUPdlYMnfJQYLlrUTEGHy2v
X-Proofpoint-GUID: NdgbCmDdNuUPdlYMnfJQYLlrUTEGHy2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzMiBTYWx0ZWRfX1ndsL4T1z+gg
 mzEKQIhFk6CWkkiQ0PcqiG/6e8ezCFKAFpEcOmsQoAL72hTMmjCYWLKyNtZZEOlj6lm3gVCT/j/
 aZHLfMlfzneyPmqk1sHdosZx3zMT4deX2HYibXZdypgeuAn8/NKzSn627hAiC+pDZ8GIgBjIUoT
 PnIw1T6JiiC9nMeZSvtylsz/Zki2kndBMu2TRoUGtamplGnDq7XbN9GAtj/756G2tfk6CtWCtA3
 FeMFaQNrbZ3w35Juq+jXW//IZyZ4SFCIL5j/eSpGCyNxPvPjPrrxSABkyuaHoItu8FluLu2OVg1
 rH5kq7zud0sMG/R3gdHBI3MD4TwcJcAXL5gft/dBFA/R5c6EzhhsbzdFCfxNXDH0UCohxrFelM4
 96FSLUcoi+2CSjHscTs/+oOLO2oKsRbOrYQdmxIcPCff1Ov2cLciiNzma4yFBPz6Z+AZT1N8YsP
 5yieRvPcFjynhjV8DSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzMiBTYWx0ZWRfX3utjIazC2F/w
 RCs7+nlJa08K8NFvuBhJWxlISZXdVFg5kuIkGCoWqkuesIAvUmNdwOhJUbNIpZXx0WVVJn53G6C
 baevFnQjeCF15Gsm0wM3O8H9jNJKmMg=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5a3fc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8aRUgtnILpt5z2d1PpgA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310032

On Thu, Oct 29, 2026 at 10:59:25PM +0530, Prasad Kumpatla wrote:
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 9aae6aadd43d..f5b147962afa 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> >   	channels->min = 2;
> >   	channels->max = 2;
> >   	switch (cpu_dai->id) {
> > +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> > +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
> > +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> > +		unsigned int mask;
> > +
> > +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
> 
> 
> qcom_snd_get_dai_tdm_slots() errors are silently ignored here and the channel count falls back to 2.
> Could we distinguish the no-TDM-slot case from an actual parsing/configuration error?
> This would also make invalid TDM configurations easier to debug.


Good point, Prasad! I will send v3 for that.

Shawn
