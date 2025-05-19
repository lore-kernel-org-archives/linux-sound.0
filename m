Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D626C39C
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651985; cv=none; b=XDeETTeRWxNYb0unSNQuGpo5Gd+df6UI8k1+f66551lH9sfy52DbqrOWXh1s5iUeyisToWSUPCI8G3sNqgqbKPnt7oFH/JnGZc2BTyaxTzt5ir8Xx7C3ieQ7W2j3Id7AQNvSCAo9nBPZF7ehLukn854vzlRP3IcM5eOS6Wq7W3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651985; c=relaxed/simple;
	bh=zFVSB/jLkg54QmOKyFRdojrQh6FB/PFpAZlAM3Co3HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw4AUbwLY+EEics71Mhmg04JN5tcN5kVW9QAAfmdlZyRMk6PARhmFIUw1dKLOkuE1PKoTqKdoZ7uxdZK5yemtxJmObBx97SdClRQCEd/Q4yL/VQdkvKTo8f6Tc4GHhVtMW1pDT6ZQ0FDbypKNneE3LImXsbgKqabiTaPRNUEDKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lcg6G2b1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lcg6G2b1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9wKCc030233
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 10:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12IaN7eBq8hgvdzeUL9X3AaN
	AZFkI4T15f/kPp9SFK4=; b=Lcg6G2b1SOKlxBPjxEhfdQl2ueH0xpdGSZN7PUhv
	+C0Jz8GC30+1yWDiHcsdQE4NwlIu/JrPPQWHHcsIe4IH4qmvB5LH8Ms32BOyU5Xu
	y5xKhN68az798K5T02SAN4+M9AALMbHj+K76Nqkdpve38WmcWjHk1myCEON9O7O9
	Njym7qj3xNWZieOw0rHeWEN097x3Sb7nUnr5vzTS02AZ280bbg3ct3G7Qrs2VBvo
	1pnX9tfz4GRvE668K7rZWTV1HoQrD4MHHFgGPwqwFJwjAaw7tI/0eVWunoqiv/dc
	/bFZaLp8irDiWUS6kpD765SxLLJ+F75rKIyjoCxyp4EqaQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m1du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 10:53:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c6ce05e0so29179566d6.3
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 03:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651981; x=1748256781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12IaN7eBq8hgvdzeUL9X3AaNAZFkI4T15f/kPp9SFK4=;
        b=D2GHzTxlRUybhB6wUgnppzQmh7fZFXMVdjDJAN0zPVYc7pKmavQrr+X/ViolEMKv/n
         6KvLQSX0OBKj9P4vl85e/PpeoJkDSVrXEUSHbGoEFAZtgczTChlKnacnQJyHnJVJavat
         JSPKnhrb7Ahhbb5iYX+DaWsf6b2F63BiCOfstUWNKGswrc0hIl2ylyMJrKwQwbHLP6eB
         543xF/Jd6p65GL37cBAAx4aCcVWMe/zrCJN6RtfxWM5lGN7oR/1a/T00gp/2BBZAafYr
         q9F5PPMy1yLoGqAmBhI3HXD2Iuyn9ekMGjo3HZG2r9Zb+lPYt3XA4G35RJ5XR6CLH+JU
         fJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Qp6gTGpjJu+rfqBPQ4rczisuirM/iM9WS6G4ys/ljWnhmV2+qHuHMjf9ei525DYXCnJFt4/bt2R6Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqUcpE1Mc5U15qcRo7VChW9emsg2yG5+jczofE23PMJF6VwaT
	80Hm94FEWkLwJPsQMyvJ4Hc2183v+9jbnca/xqUpVJvveG4XqAoKLGVrVqS00oeihCPnxMVTq9j
	bBoi3TkhtTpR8ObuMcUKrHrEEkbGKDSnp+JAML1yxJBkzjpAo0msb5/J8WdZIShqxQg==
X-Gm-Gg: ASbGncvGJeT9xsUZPQ9Man5rW/J38wVFwnmQeRSlH8m09XTiPOBy+rR1XjGXM3KNTUk
	ynP6dB2HjYDNKbXAGsdO4161F/jhmpkLNk2JFyoIK8z4DGej7M6FgmjbPiQq6WzjHhkQjyvBpgm
	ldBpLrQpcmw4onv7dqeUBZweLExlnZ4BiuDrnfZa0rBx0dHwZ0IabXSqifcmSUM2UlhuwbaXENc
	I/IJbp5MDtEMezg1RohEiz2X3LD+y/BjlCuxYOgJ6E6mUbxCDl+U2U91lX64IsuqfUIfZUal56v
	QD6AVlkdpCpRQDE2XmO8rlw1tF+jafbCRr1WJiUbtRETvZO/0dK/BCms2alOOtym+jeayXrOgqA
	=
X-Received: by 2002:ad4:5cca:0:b0:6f2:bcbf:101c with SMTP id 6a1803df08f44-6f8b0902242mr200517566d6.33.1747651981308;
        Mon, 19 May 2025 03:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGosXbIBhaFmJ6p5vH35mNxV1xQHFesDqXCVMHgt8ntxYyGnp2tccv6lOtEix4vLMhGsix3iA==
X-Received: by 2002:ad4:5cca:0:b0:6f2:bcbf:101c with SMTP id 6a1803df08f44-6f8b0902242mr200517296d6.33.1747651980961;
        Mon, 19 May 2025 03:53:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701831bsm1809899e87.156.2025.05.19.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:53:00 -0700 (PDT)
Date: Mon, 19 May 2025 13:52:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for
 QCS9100 and QCS9075
Message-ID: <ni7ww76wwaxx63ikqzvrjaagyfai3dy4tm5aohxgltlrk4yuuz@h52leppsesd3>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uvSASGS3DoD5tAqx7fR_nijtocDn_3ge
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0d8e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IAa2Q9qSwG3VCOmU5ZEA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: uvSASGS3DoD5tAqx7fR_nijtocDn_3ge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfXy8VlKS6yKbXT
 Nh1uVvfOQNukov7mR6INW2MCno53wRk4c4Pe/W1eLeXpNC8zlY58K7C9mZG2sY8twqRBbNXTHN0
 iNAbpFoiF7WfjQarR6auKSdjha1kFXD0XqMw1mPZqteNG8rQ5bDIf7U0esZbg38OkUJEJ8cDSc+
 IGIx0ZF+995rCoNcgV/fk6mdQLAkjP4IzPxiZLuM9bDrdSY7ALfu6mh6n7jVh/fkgwGaGJyE/aW
 4fuFx/Uo5UJwfqhZfwvKajz2j2d/kzbUKt8RwCS++xf7CPbkemqKAQPuefTHA+gBfbp5CQwft4y
 eZ3lRusrSUXpRUAR1QjoCp0teNEqhaRTc8DCFHw/O0ioLGFPb7BnhGzz1SucjXnAQ41oIAO7bPv
 pquRVxcZuAoCuoowITVY44tjDobSaPiYPNNFeJb438U8Tbj0kvN7iP8+8KdO9+a9veorJBri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=698 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190102

On Mon, May 19, 2025 at 02:02:44PM +0530, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
