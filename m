Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFC3ACA4B
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574300; cv=pass; b=tALNvm/WSSgiADKqrEzK12Uk3dSAoPLKLNmjhZAPBSDRoHuFm0rnyYsgNjIT+VTPpOpn29LsGJpB/QyDm5yaZfG7kvQV2fyr3DMaupMvJnUThj7zCPRIb/323I2eMCPloIqi9XnIbHU7xpE45C8RJOtogvvFqr00INSfpl46qho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574300; c=relaxed/simple;
	bh=I9Mp/Py13xSxFWieB7EbhwjPp/EFqEXl6CXyIvK73sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTjVgF87bZ7IVHcBO2Tt9uNUY6wrIHV6cdUiGy/Wc66xKhfqfwf6Q0KbcDVoFHXCUV6lomhkUj3vcsTPPZuCZhdF/0jzDkg0tXFAJ6MSCfUsbyKN4/NcuZ1drH4leESgMN628xOCyA4CAkYi5h+oA6y21XDS1X20uhY8jiSc3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnlEQq0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKb3OSTt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnlEQq0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKb3OSTt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLNKUV3490457
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 05:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=; b=AnlEQq0rZX1irCcW
	e1eybMhm5vHLxz5hTbuHab+sMTVHDvt6joyW67y35GODMR06qdkalK8lqGw2/+kV
	OonGx7d9eWraCLsJSZtgG8CuOTY2bq1qEQoWyBXfuvcZMwS/80AyTrNvyFPaZe4e
	BhKW8SiuT/f6X7LxLBZw8TLjXdZApQ+0qhsImm8lVdD5bGieALA31FDkFDZu+WUv
	XqDtkqVdQbG5MyQaHyDFtSor/TfA+vjLzzrjng4VNN3gK4Ck4m4dLzLcvC3s50Qr
	HHCy7VoQImDgYYgIEC0BVSRgG9MIRoTnbTftATleLWUl6y7MkBQqk6Ne2jHCZNL8
	I8ZnnQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cgmsuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 05:44:52 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cdb701595so3865150d50.1
        for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790574292; cv=none;
        d=google.com; s=arc-20260327;
        b=TG9IWn9/IsjdWgcOSygA8lM0jH2ANAtgBEfCIn45XnjsfaTEwuSTrNn6rrzvADiXPS
         IHCSOwSYZ9aop8uqxxXpr0slGRTuWacJ/3qf8VMPMIM0cRoSgTaxmehL9GEYyN6Knx1O
         cSDkjD4fGjMQXBifWhmwfMzxk4czx1yX9+RNvPi6ACAaa0xdWUWj4R8PYdhYzOmkeRIH
         M4BemIPQMG8LNrBOsz3uhGmoaQGRlaNfVZvOXALYcPQE1gzeqF+hIpTDr5D69IVYmJKa
         HZXEMtYyOr49EV4jkcD8+MBwgUVjOtfUdIEBFwFjgdNAulhEDYOcwy0PH87HZVCV9frs
         EgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        fh=kIjMczH6tmCQnwaynbfcFWmllUhcXkQbfg/a/TRT/aw=;
        b=U7+XdI7fuiCIeFkzIsE1+AbJ/8BTIpIHJIfWSxMjECNyyUYil4RIphWAmIQqlcFg5K
         vu/EUyiYJAx2b1E6c5NBEWsds9orYCxvngkYw/KaLDW0Gwr1I8SZxdq7hysSEA+De2xY
         1dy+AScUbX+bsMflDiYEbCJBy75gv1F5CoC4i9HUnWHKtDZeyCNQnOOFUwlLLhpe541s
         YrQlQCDsj+Gd/nKmj5brrLw8RIWOoWKI/fEVDe1EUdgRa912w0nwOY2vcpvM8yzHp+9u
         YKKVCYUQ7KhZEj2wklFYcv6Ick7W5MqUng/qk/QYcVOAvnXv5eXOStTgLOXz1EJVuYGY
         WNjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790574292; x=1791179092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=OKb3OSTtXcbXxLH8ak6HbUTJDuH1q+y8yM5yRA9SW8J3ykfhl5Hc6bnNPSvn9+Jp8v
         WRfIKZveWUD+rlcvc/Durj01iyy5KJQnTL/wVBZJ4xq9Y7f4hdDufiGLEAfgE+YmFBp6
         yQhLjAwUPDYRZqpMKSJ+ADN1nFTYREDQaAj7uDUszPpsrUlqTH0MP2XxA4outVFN/703
         1klRLVqapIz2UNc0vsbj6ZxUkeCkOgzlDLjOxE8YniCKzUOLsR+xGMYN8F4efgjv68/Y
         yVfNdnxFeqg32Dg7YpjBhJxLAsYfK8aQMIUzOuAeGe0MNHnrGHI7LDXrTnCph/UgLiok
         SCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574292; x=1791179092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=oVhEvCgeTpPv1BFg0LWj9AJuMXpKXQEtF1v9PJlUuWxPhsmzABdSJUC2XVwIGOy+FX
         Xg8wVtavVG5OCMfncrdRW2qLTXEpH6WG5i/P90qAVafA3yBv64Ozpl9tCa0tPDzC1u5e
         diSPcBdZLWibpPt9MiQfg6QeDwnR7lhUW/2nnbI+KjNImOg/I8woVmMaN5z0h+t8NTzr
         8swO4sI0lsrvF5pLzuJht6dZWUv0X7q5w4/FPq2gAUMB4orHv6oIh0bXQlI+Oiy42+W0
         i0EQP9LidviG83WwlLx4c1M89q/rAGWFISIftlWjEDoMex8DC18JnqSZk9+YTGWNmGbC
         XFGw==
X-Forwarded-Encrypted: i=1; AKwUvBzF6RgqskW7TP+yX/N7YYUxWhfb0XN39bBMSTrU8sDbI6EUiDEsL16VVorWKiKjPtfEU6uZ1FUlE8yweA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2OB+Xh7GcCiuTSG6VVZ6LXPf1/787b3rRbZuQ52IocaXfavAF
	fZmzDt/shvsvKJ4g/2jL+B/LGl8bqqt5eV33Fn/VtYDzakn1bFO6VsvoTTNiIaemmiBcBNw4gQo
	NrwtZ/vtpMOR2KXk0+4yzGN/7HgRY27Ri0ygU+HKxEuOpDwiyikhfB0V3LE872NHOVpSzlWF0yO
	VgpIPhNmledlVs3C6QWALu5JO/DGf/uXDe0s8yNRGb
X-Gm-Gg: AYBFou15B3TWt20EEBs8dNrpCcmu55wHImurWYYXiIRn5XuOnTqKN81qE3h5Bm5xvkI
	mW9wmfsFyZ3Qxdqd9fVtNmTl1w76JzzqgYnmi4uOKxSXkjaLQH/MPEnWyYqyzmc+l4Cv00xeYyw
	VN8mwgxEAcpRNyK7O4kat2zqnt0Th255iw1Yu7oMfHLPAlclEqVvaBrcGJ6R4=
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id 956f58d0204a3-6741cc07025mr2873094d50.10.1790574292167;
        Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id
 956f58d0204a3-6741cc07025mr2873087d50.10.1790574291796; Sun, 27 Sep 2026
 22:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com> <arObexxuRRmQ5qqw@sirena.co.uk>
In-Reply-To: <arObexxuRRmQ5qqw@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:14:41 +0530
X-Gm-Features: AclHuK8wlZTyoF8oTJGu3l_EQgkbegRC3BqnooxmGUCthXkptRkdIGPllML5mPo
Message-ID: <CAC-tS8CpbnvV28AtziXzOd9CTCwN8ToM5JqFXPRn-4h3=GAGog@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX4CjMHnuUV05t
 LzCDCwWH0vhSmPRjriKPM/4/Ip2ISHO08ZaEidnXd2qHnH511w67f3t05Md/LA6/gqXpINVS37G
 0PozvJmeV3ziSCQJPdnHLx8AdPgSQZHJx87Iv8kdW0q7BqKRBxO3KAcsic8TYWw2lqKkRPaXAEk
 2iferOlC/naRr8Zj6rCwc4/MWlBo1bQEKOEOkXYGLzv+TPGtAnKmIVbXDklx3cUA/i6QfdK8XHz
 TZYjkRVkVeTmSFp6GdvNlTYaUkaBctUJDcXkXye3ltgYVXsZ9EsRvmOqKWHlmNp1tOD6Al7/mwJ
 vYZ0OXzHgK2CeXHekN1iaweO6t049WZ2YPqTF1HrNsAeA8dPo/43h+RQc6AffFHQueXJOM2gf+m
 jadTyaRM7u9Gx5cRxoiceEhponMugg7cp5dscTsHZ5a5A9pOcAN+3GaCDlqCMYL2tb+xwyuQZIP
 PjlfSLCGbw6IlnmUIQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX+0ZhxveV40y1
 E6pPe/iq2BM/mZ/hWe1n8Le2aaBGIK7iOggBkkkoQtgXf9KZ5J78c9P5jrZkdYowbpzA4iUgTRY
 BzKUWT9VJhHeBDccFvXZskN9j2RDQgY=
X-Proofpoint-GUID: cNd5wPBhwE-aaU4dfcOFy_MllN-RcQ5E
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6ab9fed4 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6K1A5ce8U_YVOHI9IiYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: cNd5wPBhwE-aaU4dfcOFy_MllN-RcQ5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280022

On Wed, Sep 23, 2026 at 2:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:20PM +0530, Harendra Gautam wrote:
>
> > base-commit: 46e864b539a2d2f6c0e5d08623654513ee50c556
> > change-id: 20260907-b4-qaif-shikra-audio-729007ceff72
> > prerequisite-message-id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e4=
5@oss.qualcomm.com>
> > prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
> > prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
> > prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
>
> So, this does actually apply independently but does have the
> dependencies above.  I have repeatedtly asked Qualcomm in general to
> please stop sending things with in flight dependencies, it makes things
> very hard to manage.
Thanks for your input, Raised with dependency to avoid any compilation
error. I see that the dependent change is merged, and will raise the
next version without prerequisite or dependencies.
-Harendra
