Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239990;
	b=xq9QDLhdfIPnFcUgMgu3eXPLm/ALfpfRREEfPAlNjR6jVtzuXOWWyzoYGmGz87nbxCok
	 wYsAfPRW11O0IOzy8rGht8rwB+PICi7GK1vRaTigLbSgg/6Q4yqmYIeh+230FCuzzj82t
	 DNbgZlErJfP22/nlli3nGvQiuvfoDU+/iiGtkcGo34DaqHpjpxyDCYJAJ7Lf8EmC3JiGU
	 4Q4QmoLG3bgYV2sZZ52rmp8oD99C9nErz1mXd1ijRPyFw/mLCHiEwVQktCBHNlvYm0J7F
	 gR7g8qkFtsL8/h8viEIx+oaAz0+8PydhJ7xtN8uYYFvouZRI8lE/bXNeV0cseVbUJNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
	b=q6mrR8zD0aYlNzK7dfmM5V3roZAdud/3AWfYv1VDvvM6Gq0I/dWQOu8TyjPD6PQUIF3I
	 M6gX5kTz8C9PITVie43xwSe5Or+5zyZ3YqzTwKHU+ga3g+dMxMiySM7b1DaKf4//kpf6o
	 //+4r2TTWxFJZZvpC9BLMu8F7YjC4U+eViyhkmZ48ULQ9Osm7NGw0sqO3vbnztIfvfucl
	 36P5Uv0m8fvql0OzbnpuX1yU1dhiQJWhBBMY3uXDnMI7epjLI3PUUVmYCkwyfGfuanzeI
	 6I6CKdRT9gs3fkxmqjsXa1EnyTyav0mTFPUNbFem/w6w0cURb8XTY4mAS2g4txS0Qjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXds+7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCb9peTj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4D606A31D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C4D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXds+7i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCb9peTj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jN7V2886481
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ZfFpRYMJHgMnVimUEMcJlJt
	QnxuiTy6BkExQhm9AuQ=; b=cDXds+7iozhUR4Ua0TOXiN3UTA8EK9QM+3Ae9/58
	ksCucRQHnTmxliv1ul+ha0ZiHzDv/dCcT8ljG8I9CFytsChebO2yUcs5k24YXr1D
	DlIpYezqnz9ePwvOLnZ41kqTEQkkPsdBuE1R3qfgZjIeMtx1DF/9F2e57wtJf+W0
	F6xKne7+L8UGIKZZypSryhGztJtKrkMXORZXpoZyCz+GGW4Uw+5pEsFpj1avu4Mn
	af3fLEaXVw3Y04G6zroVLszc3u+BCzgsAGL2s8LUgomP/7owVmI8zaFqvD7aRgXD
	AGEIngRTQe/ppdAW4B3bbnO3PNgMuVyKi+AJSOus2mX1Sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3g86r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3692c5b061bso4520450eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 19:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793239988; x=1793844788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
        b=QCb9peTjW1gpq0gYsn7nxNQI7VSomjBCQ9ImnnflYYuvAB56H81SnzRBkHQSAkwehe
         m1oW1zQxyB1UdW3p4R6KfcfI/l1WF9ME5JG9O5o4lVMKABRTZ6cGnRyXf1JmZu/8YQNi
         aY8l2HHuHLgoZ59BGK+toEPbkrYhEseHHA1Hw6dILTEzgBxivFsz+IoI29AsXg1mDm+1
         WwUa21cvYWFoP35pPFeiRy/kCW4Fa3eqdNNBwFMXqMv7LPWQi3B+WVgnWKvL42CctbKm
         Gap/+SgEULZ2OKaMyD94HQ9OFVTyTEfBmuJCGHEPiNAtewMaFc4rSnUvVIXeSoaeRLnR
         O6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793239988; x=1793844788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
        b=rLQfYHFX1SusO+lf2epLj5niUYwFsL9trRz5I6X27H5kVmZtZGpJAE8xt73fwEplPO
         y+PkEthBLZ9hRHmEzPVbCA1APKMFBTPOaig1yMT2vg9leb27N20J4LOo1t4CFheoOp1I
         +4E2PW3iS1+hP6Nj/XDXCgceGlSBPZ23XKrzsp5o7nUyOrcgWlno3yh4n1RgcT8lovgY
         TjtMstenu1RRjOw4pTE8TUKRcqLO3UNHEoUNCcBHbXZDJ38wlzw04ClKn/yufs3wIKQo
         Nq/NRRQMyXnpji2BOhfeGYE6evsouCqIE+RUiVdUiXi4EayYsq2AT13r5L91XGQjt3+4
         WcpA==
X-Forwarded-Encrypted: i=1; AKwUvBxyB38LIiLVENuBltv2CPaAFrIw8sBqUWlZOX8h/7/D6gwDEgUS66D5wKXF+R277Ju+xwbbTxEDxdCHEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPNDFhwDiB/TgsdAKJVaWbdZg7aQJ+W/BKUisi0eTRMuESREVc
	jzsrqer2T1nhTpKvAseO79mNj5bHSwf76/+/Ve8nNuZkvjn2+bpJ659LMTQUptnMAwDj3+IZZ6s
	NBQRkqVbH2LjGhZMl57cGntwpXjA3a/Nn3z5XZyjWZqUqv+dc3ffMHQP+jnVlRRONEQ==
X-Gm-Gg: AYBFou1zGuukPeJOA8cULKhkCDrfNiFNZYFFaCer4FGB78CvbOQriVLtczWIDq5OavZ
	664PwNqeu8KyyDHhLQRP1QexdFyobdc70B5lvXGNtjifGFZMhT3UXUJpI5nfmvsLWd6or2s81Ey
	Ug0YR1tYKf5qW/ANH4C++K9qtkpAikgMzZCLEekZxHKF6a/1gAXFaaWaLkcROmy4lKWUiR0tMp9
	dVxfbapZOP9mfkeqZ1lgsl4IOJiDOGcCxoTpcx5xQN/NLqjwe4cu4CATKHq48c7QY4S2AZZd0Di
	qWWwD8agl8bCfjDT7gEVofLDoItcg0mwrz8euW5XUNnW90xcH6/avz2Nb2autHUuUuNovJLzgsl
	7rTcetLHNCDCHWlhltGtTAduhwnZySa3ye/rvddusIbs4QWDDqaR/Or7KsGQXU5FVg8+BKWt+Na
	M2NnQ4qozyAyVUUzE=
X-Received: by 2002:a05:7300:8801:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36a3005b037mr1710962eec.15.1793239987339;
        Wed, 28 Oct 2026 19:13:07 -0700 (PDT)
X-Received: by 2002:a05:7300:8801:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36a3005b037mr1710930eec.15.1793239986781;
        Wed, 28 Oct 2026 19:13:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm12163260eec.11.2026.10.28.19.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:13:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <auKrrKu5O7T9fXIv@QCOM-aGQu4IUr3Y>
References: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
 <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
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
In-Reply-To: <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX8x/5+xiaI/2g
 c/F9tNVc3AcWea7MqJp6Z+KZWxbz0rF7JIECCSVNabs4E+X+fq5XSV3WIE1Lk5EVsrWBeaCYJkz
 Zjv1zUNq1Iv6zVLWIfwOd8naeciaEQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX/Inw1h4/ZHZr
 WsQxRuGfUdp9TlLw1Cvws6/07EfJuGE9XOIuvZL0SHCIvEueOTjeV6lpQkbhRU20zu0eyNBwJdo
 0VxZUmKCfTXAs5xM8VPccBsnZhDHLBixkiGC+PQWgbNJfm592374belXILoBkgoFu9OP8mFf5xk
 lg2pLbXhROjFO3GOPDTexggAu//JMHVbtpcYeSKYUnGI2qS88blI+8N2IsGgrrInzqPvD+CgrMK
 2fve0ygqu4QQWfzPEVdHU9Hrs9Rmwlmj4Awy7Kv4rdnlU03Y+hTlwAOBW1/0pC1lAZPgim4tY00
 rv8QtQlIPZxYwVJyVV3G9P0ASA8cu2kUzHJC97YkZmZr10Yi/hxHHT72/wQqco1eOwT/6L/3C+Q
 Mar5tkSkNoBUeIiQegEssDTnusOj7gfiuglbJRIcjD+M6QFFl3qc1JL2pjQVo7h5uPcVivyjpVg
 tn/AsKHYd7jRONDCZqw==
X-Proofpoint-ORIG-GUID: jM0m9d9aT-fDxN2Qk3zTZvWnqCaZjDSM
X-Proofpoint-GUID: jM0m9d9aT-fDxN2Qk3zTZvWnqCaZjDSM
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2abb4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VBx6HuuRU8mu7iSl-QoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290008

On Wed, Oct 21, 2026 at 10:55:42AM +0530, Mohammad Rafi Shaik wrote:
> 
> 
> On 10/21/2026 8:23 AM, Shawn Guo wrote:
> > Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
> > the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
> > selection as q6tdm_set_tdm_slot(). Each board then gets the channel
> > count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
> > Keep the default of two when the link has no TDM slot description.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 9aae6aadd43d..f3fb13145b3b 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> >   	channels->min = 2;
> >   	channels->max = 2;
> >   	switch (cpu_dai->id) {
> > +	case AIF_TDM_RX_8:
> > +	case AIF_TDM_TX_8: {
> 
> This should not be limited to AIF_TDM_RX_8/AIF_TDM_TX_8.
> 
> Enable it for all TDM DAI IDs.
> 
> case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> case AIF_TDM_RX_0 ... AIF_TDM_TX_12:

Ack, will cover both PRIMARY..QUINARY and AIF_TDM ranges in v2,
matching q6tdm_set_tdm_slot().

Shawn
