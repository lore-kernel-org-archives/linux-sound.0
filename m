Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72A1BC3F
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 05:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841429; cv=none; b=Loy+RCeqhu6L9mQ8QlYpwlITfyHWbFM6oaXnEa9kSuygEg6rCDSt7685zO0Qh6ZdcrXa/3nWurm7vxuw6HgSJj5YYzdd9bPQmBzkGCN5l1XW+bwfMCoJXhgqVNkFLENgAhnGVdGWE7wR6VV5oe2tVBREDnRvwaHfviJ+1M7TZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841429; c=relaxed/simple;
	bh=QlgZisWVY17SLtoiXdf351YXoW5eO2YEIBQ2EQVI5BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eT3C9Jetmld5kRhn3qTQk4FLWknsclqC8p0xtFKUrQbReLdh9GAsTuUWs8wskinvTiBIcjyfNQVZlNk87xEQ6PJJ05UCPlXmfmtrZSD8XtZJ7CUO0unCdqBZ0ZmJQhDD09c/et/2ReM0dlXedwukfCEwHH+ns0dY0/eXdnNywZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GP9bYpvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GP9bYpvp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551LVljp024495
	for <linux-sound@vger.kernel.org>; Mon, 2 Jun 2025 05:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BcvF3wu0+glYxRvQURwwkyPb
	Iw+40g+dQPFaEyxFw88=; b=GP9bYpvpahtE5IBqlgEbKiOhXg6THipkPi4Sa5D2
	SDZd1Ulu6vmJUpASjAQBAffcirieEVAqMA5mze5s3AHyEfOWMQ8K1OuOUMnKqacP
	F2JWvLk7F2DwE5WPOmhf1PW9G7vPGgDGjAbDPqPbaXh3Zy/as4cENeh1CW32oAkh
	RjFVpzP3HjJAdDEcoXLmmOG9Sq5ICWR3sjOXHv5EMs/Z5f0JgUA5LDniHTtk21PX
	tgbI6FTDQnejfSJPJOgp6TvFP2ZlpDZ5ysdfstweYpronhBD1wOGuIiWFuUonZO3
	iXmuM+5UbEyubg9ok1IjZwETRJCMSqMN4bbvr11Fio5UyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm3dx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 02 Jun 2025 05:17:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ea0e890ccso3744393a91.2
        for <linux-sound@vger.kernel.org>; Sun, 01 Jun 2025 22:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841426; x=1749446226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcvF3wu0+glYxRvQURwwkyPbIw+40g+dQPFaEyxFw88=;
        b=YSE9YXVYtwqNwM1fOGWfiN6T4LlwYKC92eD7G7nQaVSQg7bscRkK32a9ZWA2mC7XhD
         hOz+52Iu6rCeWyEzOM+TR3iOslsKFF1dJ22vTbDStXicP9YwiBqdon3BBSARTwiqKVqB
         xGCf6N7FYd5Lg9cWGZw27DE+4uS/5AovTSAPGrI8ymB91yai+JBUiNCxkHFOrSlDgOSx
         aj2cySogQyKa/69hOuVvPU9YLdVS1J/lazMpwDm/9SIRma/SGCdkbKuBeOJzxRi0ql2c
         gvZTuk0hqjB1Vxjvppk/s4b/xjoyD1H6tv6JZZKhn23+AhNPSFAEDJfGsr+xxDrz1twC
         BHlg==
X-Forwarded-Encrypted: i=1; AJvYcCXfuLC3Cx2/8kjDSxABjGYxQL3mrPJwc0xXfP6SKV5vPGuFa4q6OlLucM5Xy+SIVAtx7Wi3/tBMD8eCnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHN4+qeZ3Y3kcfzpKsorMBfjmVGE8FOYDeBplgQILvTXkudQAw
	af0mUj/IZBuPCrlW8ygtxXhbYhE7zUSg2d9gJxkJGlq+g2jx6gxm+qUzqglrmcV1PYoWzG4AUhv
	9io4s94twhjV9GwnqEU8MEgneX6UMdLCEd/SvrVmsCVNhp+46T7hKKS6OSfKQmCDtBVAahVUtEU
	txIWG9bGEpVhwqCo40UaNlHrsh7ctDyh3lw5VoxPms
X-Gm-Gg: ASbGnctvZhG1SK4yQG0wvMp7v/0gHGngV0xh7J646XElPG8YVL1NStFoYYSg7yiN6bR
	1Gi9cWMbjGpL/qd4635J0s3VW+zxcbsn+WFE1GWYtmNa2tyAglIcUdgUttoI966BOEroVAa/f86
	q0mG0=
X-Received: by 2002:a17:90b:5828:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31250363513mr19184382a91.12.1748841426100;
        Sun, 01 Jun 2025 22:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHChfK7PzYEZQwIvqSMCkJ/uvXJUWw56R0DX0Cq8T43ylpHzEa8bN6hcW7rjeT7ueXeX59XgKnJOr16AZ1SCX8=
X-Received: by 2002:a17:90b:5828:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-31250363513mr19184328a91.12.1748841425612; Sun, 01 Jun 2025
 22:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org> <5b28e37d-6d46-472a-9aef-d2d86ea8f04b@quicinc.com>
In-Reply-To: <5b28e37d-6d46-472a-9aef-d2d86ea8f04b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 08:16:54 +0300
X-Gm-Features: AX0GCFtphupxUXzge-OP-7CeHDdsIOZC-CkWPj3OAeMdCwPb4GB5B5RCJ_MKFaQ
Message-ID: <CAO9ioeUPQOTgAY1FDW=VCNbcTHv6jZFnjF7F0JdJb5Px3Dhotg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: eOt6NWnjpm5SF-SXbCIxkSzIkWt75RBQ
X-Proofpoint-ORIG-GUID: eOt6NWnjpm5SF-SXbCIxkSzIkWt75RBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA0MiBTYWx0ZWRfX/splpHIxYuLw
 Y/iRxD5B3YsuKCT8JnCLGj2PyA2lBS2J5fu7k+numGZdwLq+9b9UGSO9uD0YMh+KaZMd80ctEL9
 13/o+D5Yyh91Q0WJ+u+lSaNmnZ1iIV9eie3AVrjwuC6EtQkgkOIihQC5r9i/YN1Lc8FbnzQ8bw4
 Btw7X8QxO2fbL9lTPItVsPXkXoOTufbsAPVimdebhXNE8f+S2gIUvqqMB8iU9ZJCyIhov5eCSt0
 5QQ+bgo/F1gI21swk0muk00LHFSfKAJF24bF2kJiRC4B4i1P5UYzp2ztIeGp65zrNW3Ue+rPs71
 XPAaOcerTA68jAotSB0cry/ZNjTuWya7Pxjy6dMg0jxM6wvmLr1GoXUH0kz5wmdMIWKkI32HPdR
 eSKboN4ETTtq/Pg7Md1kqfm5e8/iz0Q7UGNw8DWmZvbehMyamFLgBE3ID9o/XaApBnYL1LTb
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683d33d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=XMtzzObD5LvXkpxU5CkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_01,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=935 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020042

On Sun, 1 Jun 2025 at 16:02, Prasad Kumpatla <quic_pkumpatl@quicinc.com> wrote:
>
>
>
> On 5/27/2025 7:47 PM, Alexey Klimov wrote:
> > On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> >> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> >>
> >> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> >> The updates include adding the necessary audio device tree support and the required
> >> dependencies.
> >
> > Do you have topology file and mixers commands (or UCM profile) to test this?
> >
> > I already asked but I don't see any replies. How this can be tested?
>
> please use these below UCM config files
> https://github.com/mohsRafi/alsa-ucm-conf/blob/qcs6490_qcm6490_hifi/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf
>
> https://github.com/mohsRafi/alsa-ucm-conf/blob/qcs6490_qcm6490_hifi/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf

Is there anything there that isn't a part of the 1.2.14 release of
alsa-ucm-conf?


-- 
With best wishes
Dmitry
