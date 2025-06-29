Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2CC1DE3DC
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209198; cv=none; b=mIrKMxkWFVSyDjbNnmog02k9ZGPm79w485XK2iNjTq0DSCphO6qIuvctMMShSha9G3V1q+eLRn0rkxPFeUmFEQfEAAqOhIcltS/jZMSYNBK5l7Sw8OuURPQ7qmLMI9ZQyPAc7CD2Pxe1IvOuNawTndudCpYwSjAWXTd9j7d1+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209198; c=relaxed/simple;
	bh=WktKykkWoV7ZuNQX5dd6BTNbB/RnWlKAl/D4+G37SHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3DaZsVUJoT3mBNuZeWAugMUvMsQJHlhRu70lmY1T72l3FbS8OIXon8RvkqBmI24oIcJd4DpRYfiJkT5FV3AAAnfiGi9yqCD6XtBmFGmizP6OZY1p4FBfDhQisLUj91eQ1HVDCDUV94B4N1zRPON4WpSfAEB2ZVKaujE8f4J8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g26bBxIT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g26bBxIT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBVhKZ008518
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N1juvr8EOI9+BY9a0hzHHhwy
	NzeM2f/6fhJAfb0S6+Y=; b=g26bBxIT/uydvSAmRIAOlqeS1ZdYN1d7K6Ck7dNU
	MMcpyIVprMrat5oGu7eMVCJM1zmOSU4aCtAo/qZiWbKeMGtw4FSrxf1gcZspc4ak
	V74+5GAw8mVEzQsKHysFQsW6QIL3ysN2+Roc0R1IPZayOn0zoMhj0IsbolQOZPa2
	D/BS+6rxJfDvaMDdRMXoDxF5E6Q2a0nru05j30F/ezYWfliqZsMDvYpvK4Nq3imB
	5AbOEk3OcMekzkfpz9UHidJBCv2jmkOtvoDWBdYJaEYLHt93iu8qLJpJ/loLOQ5O
	/Rh2sUC/WCj8RjyiY/fI/vGiEBWX5KM1Us2nvWkF9zkx2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpt6tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 14:59:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3d3f6471cso200456285a.3
        for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 07:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209195; x=1751813995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1juvr8EOI9+BY9a0hzHHhwyNzeM2f/6fhJAfb0S6+Y=;
        b=TES97Gec+lXg4jJ+HniyNG4mr5OvRPCVFb8Zi4l0MHadkNr8wmFQ13RlDx2ewbQ1hy
         1o/bCY+It2tykzqoAlpC1zaRYQSQxCeI5WxUKYOUXA0stT1y5RvI6fbDP/Fv3x7F4QsS
         LflnZb7QcWcpdqHVCR3scgpWCbx4VyndyfJZ6hWjjd1/7kk/DDCEKQ0D67ov+VgG+nMu
         I+uxWuxRW+swiH1DmUwSAJQeQNlbyeOLiZY6CDu6Kpe4jdnZLE9DD+NDOKY0T5aJmmpt
         6ERL8P91qNmHr1akmQIehRYJuttRh3EE5130hYMfiYq1AmLDc2AD34XgOtCp/ws5D0WT
         c95A==
X-Forwarded-Encrypted: i=1; AJvYcCUiMzNNhM1f7oo3xDisBMqxkj9MDdLOF0R1Q8TqFoLIipC2OiKZ88U6KTrT7ZGrtC3jHiUc+eMXU7PS9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTwVtJTKnr7GlE8t3eORKfjU30FoTwCrmGjP3CjUOaTY4MUll
	HEhjm2ONtBrBqfPm/F1RIPChrztPZMYm9xP5nBJy28+UK5oPAyh0WFS6SalNB6Klc5lQo3MrZs/
	3lKt5Jv4vDbs0KSlZkP8sePFesK+gi9RzKg/LeQvJa6dBh7cctsdKZyw6vnAb1BjSpQ==
X-Gm-Gg: ASbGnctRntpXdCwf+YKiOtxUHYE54QGSK9jC+bFwF4eDnS5raDzVkyAa4svjx3toXsO
	5iO7cruHmLkCJkrvEOKnycVUqoDexYH6lc298wT9OXv6DK8PfolnGJc6/ivBghjL7ocM4CxXNhQ
	i0EJ8HkwftiamQsj6ZsbfqWhnw4ojs5OKUIMlOOSxHP6Csq4fUbNKZTy2xj7psMupZv4pHHj/Gb
	PvC/pq4dwmUw7buZziIbTx4umlqukxnmE55m3BhPuY9nqNAH1D2Z5+gD4yusM1zYwXlMLbLHN01
	fmMS5Chs12xnKlS/g9eQqsPbkDmMdv28nIGooWrRIlNYEuoVMJH/qSp30jCkGD4O7xx7b+bIkfJ
	zaVPdz6C+S3K8k52jiz9PFT98RYQFyobp4Kw=
X-Received: by 2002:a05:620a:31f7:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d443994f1fmr1441531885a.36.1751209194854;
        Sun, 29 Jun 2025 07:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvXkkZ1GazwsYeATtB5CDCpnI+uME8eO1KfqiZ/FLtfPB2cvggTFZ6ZVNgWe/R/E/fTo0QDg==
X-Received: by 2002:a05:620a:31f7:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d443994f1fmr1441528885a.36.1751209194433;
        Sun, 29 Jun 2025 07:59:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0ca66sm10946561fa.31.2025.06.29.07.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:59:53 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:59:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Message-ID: <buyn3nvjprum4uxtmktci3eho3o24452zseioxq7ykzdfkuwvz@ezqwadopbqps>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
 <wcmalvywoginosy5pp7wskgdzjbwbydividmk4dtwguoltiobf@muw5lzkvgu5c>
 <DAYBDV1I7HH0.1GG9U3LI5NQ97@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAYBDV1I7HH0.1GG9U3LI5NQ97@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNiBTYWx0ZWRfX7Qk5bsN60Evn
 OZUl4rA+83Ooy5KDp1CDB+cR9K2mxiUT7r2D965nANZS4YigqjCFtXuEXylY2vprapTr4EBHR+Q
 vp+uAhyhC8co0HaFbjEyXCh40ocjd1bsRJZH2477jkebTEhqktXUkfuAw0LlZAeU6HRKlQpztmX
 OhQnhY8IxpuEJ342M4teKTyibbPtG0PyVP0BAHI6j3fF6jLJesfWc4eMKiA0Pzrtunp8CnszQrl
 Fh5C6qvgKRUWpq7ZPB5xM0vs7G/ZSFamBUFVnUdz2D36CBuBEqloU0XlRn9u1KIf5bJrT3lRUUR
 tHbJI1I+DOeMZMSEkwwC4z2hUyzmDb1/DFdS8OssUe5RqnegtANQJX1ZxzQ0RnaHozWuzuLw4dP
 gOk1UjqT5BoZu7Eu2gRQ4JntTsL8hPVdX2Q7KbtE8tewOTICwL9pGRRopUjmHFLTb0vh55FS
X-Proofpoint-ORIG-GUID: 8ews_QUzgdD8Bp-vyHRFGl-od1aKaDdz
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=686154ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=5MYOtFo4LUEscCCMUxIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8ews_QUzgdD8Bp-vyHRFGl-od1aKaDdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=917 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290126

On Sat, Jun 28, 2025 at 05:41:31PM +0100, Alexey Klimov wrote:
> On Thu Jun 26, 2025 at 7:13 AM BST, Krzysztof Kozlowski wrote:
> > On Thu, Jun 26, 2025 at 12:50:29AM +0100, Alexey Klimov wrote:
> >> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
> >> It has TX and RX soundwire slave devices hence two files
> >> are added.
> >> 
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  .../bindings/sound/qcom,pm4125-codec.yaml          | 147 +++++++++++++++++++++
> >>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
> >>  2 files changed, 233 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..1b6ce8d4397b4c1c048899bd2cc4d02318cc46c9
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> >> +
> >> +    /* ... */
> >> +
> >> +    soundwire@a610000 {
> >
> > Drop this and next one.
> 
> The audio-codec node supposed to have qcom,{rx,tx}-device properties.
> If I'll drop it then the example doesn't compile well unless I am missing
> something?

Examples are compiled as plugins, so you can reference non-existing
handles. Keep the property in the codec and drop the soundwire devices.


-- 
With best wishes
Dmitry
