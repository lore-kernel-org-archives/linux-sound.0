Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF865231C9F
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707064; cv=none; b=jd8VlmUMxrGCE49UQYeTCSNqJlHgMdrSS7SsLhGjak5Vq9Q1TlngmL09yivM0yeEuqUw3BOohM+egEVhtp2ogCWyytMExp0byIorpPL936SfklfK+zLrcjnx7LAoCO5q9J7EBjLBylYQDvxSCwDVjBRaONWcbUvwfSW1waCW3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707064; c=relaxed/simple;
	bh=bBet7OKcIFo8/SortnaFr6ndbpW4yi8PlghaYES4Z50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjDBuOJ3/QEUFXO14lNovHQoyTvfvTIMDUYqkBCImxTOujs8gSTDxBiYDv7AUjgC85/A3fVNHlyqmmnQNjBsNNq3vK1aMvu2QPudl+6Wu+1tmxSppDSbn2r1LHmPupjlAX/kT7KGfv8Yv+i+XcTWWxLx1Tv1oEjd1KEfMF/dZa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlLyrrzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlLyrrzw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H80lxT020776
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 13:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LILjlfqEYOLQkEETs/dYDTn
	PSt3uyaP94CFMKgd6Sk=; b=jlLyrrzwtrCiJc+Phc1WGAhn3uCYpQEpV6fp4kmQ
	IgSDmMmz4nwq/hXvFoNCiLhVJQQ2/gHO/M2xmyip868BiXM7Wa5rhetqO2bY2Vkj
	dX77ZmUZpKQ41bKC4YLYVbfYTpsaXiScROwBzLmsR/6VsfoME4Vi4ksSJXoKXxJy
	ywT4AnumPn12zPcWe3TOUBv52zWiNFm1wU2Ir9VyuRG0DN4JPfrX8IckxmsAO/sz
	B5HSU7OvjAiz5JQhl6hIC6B8GYIX2rE6c/o3l4xzvXioX04K4TKxKvn+lfjvxhV6
	VZp5BuiJ3Etwr0MwahRyuBBRJTQVie5h7esPIr9IaejlIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8u1a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 13:17:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-84a3a7ac082so630959985a.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 06:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707061; x=1761311861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LILjlfqEYOLQkEETs/dYDTnPSt3uyaP94CFMKgd6Sk=;
        b=TRfFK+omd5e0gP2eIQK6JqF50Y8klAN1esRpweBlEcFGNrXeTN1NHPgLe+/PZ5zXYi
         E0xe2jeAh0Cc79VPJVp8EXYMvU1uzlbxxkJK5kO9MMEOvcsH0I/+3bX4WtHmQ5dS3Tqd
         7firTn77t+xePPSE6Q0rF5EsfECv/iJFWfi58uj7oAbtHc+u8isdF8qf0hvWrNWiEt+9
         O9PI+53RuNOMKx0lN4QBwwy+xMOl1qK63+kgxsYA97dCvd06JroJs19P6t1Ycq5UN3Cv
         lfyVdaz+3D3D1wt8Ey8AuPjyWdr+sEq8KOMHfB3VCarB4HjIHzDhVQDN9BHzHDS7xU7/
         58GA==
X-Forwarded-Encrypted: i=1; AJvYcCUl8pyTJHIYo2Zt28IoJwcbuE8enkLbXMpmtCtXqo2BqQh3iylJJpc7eY2E9J0MrfBbqzSYy3ZWIPcNTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyIYSuCm1UBWkSEnJnDXm7xFTpJvEmolLv6BdtkrjG7ZD01d5z
	aG/swzTnaVJly1GIOTHyuZbq9S26E7mwibcPn0OR1hyZIm3+zirHhficffq9Xm8Exdi3rtE8OS+
	lXeLBfujWEngWdbtPEuM6Wcu1CgE4yWXOCHIoIYVT5unekdLDUOrTYbFu3ChEnW1k7Q==
X-Gm-Gg: ASbGnctN9+OvyMhe/U1ldh07VxmlGHxTr5k7UtV6XX4CRauvYNU1+PKqRfvBl28OEur
	2LahGmh/NofRHcs9Z/zX6RMf2MqBt2WTEZMXihdzqdJchEzaagEzHOvA3f6YuKUSrbcEwwtBiTk
	LlmvS7Me2qN5zDKDFfCzeaPgrd7+nZxib3FGFhkC1wxai9+i8znStJbTxQnnRkbo1pgKRgKaOly
	zu/WdSL2ugIs0tOSWbkAS5R9cdqXuHKs5iIwi4XkEE99gQp+tHn+L6KlMPnAY9QJ3ybqlMoS8wQ
	a50Y47g1+OflgRoKzz59jKeoMoE9x4ff58Xs7zdxgJ3Oqou4ttrUMHY+781NSqxVN2Tftlj7Q5f
	N77WEsNbPOi/wB97DtrO/feG6X+IwJICApvF9ERRT10o7yfavGOkOf2hmsAAuNtTgmfTVOFZBXz
	qGCtMLxVc1eTc=
X-Received: by 2002:a05:622a:1482:b0:4e6:ebcc:23fb with SMTP id d75a77b69052e-4e89d2b9904mr60570551cf.36.1760707060818;
        Fri, 17 Oct 2025 06:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7v+jw5TyUGE2GPu1mMtX3P0F0LCVH2wPKYMO3Oz7sZ6e30VO+kzOqFROiuxwu8cIa+k2C/g==
X-Received: by 2002:a05:622a:1482:b0:4e6:ebcc:23fb with SMTP id d75a77b69052e-4e89d2b9904mr60569691cf.36.1760707060268;
        Fri, 17 Oct 2025 06:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ee2asm60957181fa.50.2025.10.17.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:17:39 -0700 (PDT)
Date: Fri, 17 Oct 2025 16:17:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: prasad.kumpatla@oss.qualcomm.com, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] ASoC: dt-bindings: qcom: Add Kaanapali LPASS
 macro codecs
Message-ID: <nvomxjtxisrwb6gnqf2xvzo2sxgwsoquvvdiujrbhvjm7atwgw@g2jpwjusfcz4>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
 <20251015-knp-audio-v2-v3-5-e0e3e4167d87@oss.qualcomm.com>
 <6nyqz5fsqyqgtsqk6xxm4iorzoelhkgnghm5xczh6iamvmdfpa@2vff2lk6sq7e>
 <3d96ff4a-1d3d-4089-b571-b4d28062566a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d96ff4a-1d3d-4089-b571-b4d28062566a@kernel.org>
X-Proofpoint-GUID: ZnmZARuwkiIUTSXDj7weEi7_hjKHUbo-
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f241f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ugvR7wMMjgv2hvCkpHgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX57sklClxicD4
 /WL5HN3RlgULku4dCKiruHj2MBpyaH4Mr8JG+Voq1oBViNoBzrVCvzw1bG1G6ubtkJr1pM2Wdxc
 vnVESkvwEec+lg5mV+USuiyJVYF5OEZXXVD0sHkRPuUBvzXr/874NMhUtsNRbZhgkhGXJSWfzSP
 KvQyYbUVLa8fsWXw6amWqlXfof+Mjw3LmTPWeRJQoM4+My1hxTIwhdpqDUpRDashHNAmxhQ/RUX
 LeQXvX9KLLfoxY5LP23SHwqKWJiLTNW0fJg3sfCiFpXPp/StnAJrXHf1DNoX2ov9GTnBE4MGYaY
 wPynOW0uMg0rsJsvo9EdvMkt5JHXnItMJwGiZOCO7GTfvxe9GY+KERJ8UKFrf+AWmIvaOBBLhjM
 76+yRJ/BK0DoR+Rzq1bm7Y3UqSejvg==
X-Proofpoint-ORIG-GUID: ZnmZARuwkiIUTSXDj7weEi7_hjKHUbo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

On Thu, Oct 16, 2025 at 08:59:29AM +0200, Krzysztof Kozlowski wrote:
> On 16/10/2025 02:54, Dmitry Baryshkov wrote:
> > On Wed, Oct 15, 2025 at 01:27:19PM +0530, Prasad Kumpatla via B4 Relay wrote:
> >> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> >>
> >> Add bindings for Qualcomm Kaanapali (LPASS) RX, TX, VA and WSA
> >> macro codecs, which is likely compatible with earlier SM8550.
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > 
> > What does this serie of SoBs mean?
> 
> To me looks fine (see v1 and v2). Prasad wrote the patch, Jingyi changed
> it and sent. Then Prasad took that changed patch and changed more.
> Perfectly fine.

ok

-- 
With best wishes
Dmitry
