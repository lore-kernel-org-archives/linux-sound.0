Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B01C5D7E
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479113; cv=none; b=A7qnV9cGRFj44uE1rEwk02k/jRJFWeC9BUxQXR8Kyys9JpnL0AZ/qKI78ue9LBuBdH3VyVbzRT4q7Xug1xsBkxsZuUkN6etv76qpTDbUAMHz+jtGs/807LKM97cNVTSeUqtov+LbgCGKZHiE07l6rEocqB4xgYywdmw2GZrn9vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479113; c=relaxed/simple;
	bh=YgvuKEZ82WueEbmg4lKF2pJEcbOVzlhiTsYtcY4I7O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqW0q0Uuhvfka/LI5HV+hIa0dhAmBpjYz321YVrGqJ0nkBvK4veQQ7vxSV9Tg5QJflkyCf+8lHgzdOOm6N8cPKEW8KVOsLxQlgBGAqRyRiVPk51SFqgC6md4hXM4bRJRzbYuHhUoOYfqYtbdpNXsqJtwN28FLGVB0feMin9ImU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWrYHxr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWrYHxr4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z6Nq010931
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 13:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3u0JwHzpVv7+HNs86i6YT71w
	f8BI/GSn5CzgGwf5drQ=; b=TWrYHxr4JSlCLJ/oA0EuN0/yRfBCrAmbOaJqjvmq
	wBqvdDDqKgOABS/Bg1XkXLHHVh390PS8WRhnUry3Z2JavRgLzAwwmYMtjpvevhj7
	VZ8adkh//jIIsap0z7F7UHGreVmqFlOq3WYYX1/qryIvmEUINKTaiHrqUfbC89xM
	4VRVeQStwIDFBSOMk5ObfwzzhvuGsa76yb3VubmzdqRbJbWFsQdIc49PXgCnmUpE
	GLCPClD46pDdQxm51CuX4n1dK6jgIOHrM5PSscg6jsLuB6NXPQN44CLe15aYu7G7
	oo4DnvzhfJ1C3EDVNO7RBunWaYxd013lZNQdxOmSaezU+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dpjwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 13:58:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso132153585a.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 06:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479109; x=1743083909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u0JwHzpVv7+HNs86i6YT71wf8BI/GSn5CzgGwf5drQ=;
        b=l7c0hbHiiLKYC0t4UBBrGuVK+yw7+nu6zUhfxADQrVX0ZZoMmj/4XzwwvRWvBoB/a/
         wDS53p/wAEwYqHSRL11XCRA3fQWCC1kkhyPNw7u+mOZndunHFXoJfZ03cmHhq1MqaOcg
         vjX0t0/IgavS/Iwe9NOad7HJo+s8hpq60w9BpeF6WBYkrAoe+rC270vm4HCm2A67JPeF
         h0hsmA5hHFfpQgAFaMRUL2KgInKYxr8uymUycoJqexG+gOQUhTfmDlUYQHzz/f344tWS
         4Re+VA/r0i1gEyxUjHDWrCjp5qgMXY1J+xseNH54HhXIo+kn7Dn6G1yaGuntfbfNUzND
         95Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWR7L99DtDy2zamhQOQBbd2utf2nyPTj5ypQjpVPtEZrHS1kah/x3nYEEVJt7zOvIOddmQw8jlkh6KEKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHjIsDCjEjIA/oI5HLYQYIp0R0R9XpGMSiBoEKMsJ1p0GsCk/
	gTx4BlBk4MdjboF10w2c3MvhH403Pz8AZ777Msvm5ZNhzUgLmsDPaQOgTnHg94w8YyS7p8fWjQ5
	25X13v9ca4Wy9I9hrI+MVXBw9ZO8zLepHfrPPTpLtAV4tyCrknh2tvAxU1fcqbDnL/9KGAA==
X-Gm-Gg: ASbGncvLEXXsF9Q1bWIz8wJkNNnXcZ2td2ek1dOsuLdaCXHba7aRMMNC4xP/onU/iyz
	wkyN2iPE4Sg7WhgXywINtofbw0Cs3xIWYbkhs6to05yRBCAEW9kFQtCCYxN2dWoIjgVfi9kSHe+
	Er8MWEkxy7eJtl2h18cGS1kwEQH/jM90SweshGTvlooQ9o7JeihM7CQ7zulP68GQ0HclD0heUJ9
	pyKyp9xB8zD7iy+e6M13DeRe6CqXeZj0ZyKeOtB5qba1BE+RI6WjApLGSccrFZtQNVizME70GVR
	VqTxx89RPvqkGrRW2Ylk1BE3wFDPDdVgjS83peE7/A8+fYHt+NYCQR2m7igV7wUwlZDb0ORQeuj
	eadY=
X-Received: by 2002:a05:620a:4593:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c5a84ae82cmr1128473985a.47.1742479108707;
        Thu, 20 Mar 2025 06:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM55sLU2KpWX4UC4SBggnkyK9JKrQtXsw+ffsbau+k0mYKvbmbCvprVsdEvzrdFUOzIhfKlA==
X-Received: by 2002:a05:620a:4593:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c5a84ae82cmr1128470685a.47.1742479108318;
        Thu, 20 Mar 2025 06:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a830dsm2272394e87.37.2025.03.20.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:58:27 -0700 (PDT)
Date: Thu, 20 Mar 2025 15:58:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: x1e78100-t14s: Enable audio
 headset support
Message-ID: <z34vbkdvocuxjtnqwce7rbiwerrp4gmgfamxreo5swts4pvt54@h5u7tfmjdz5j>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-6-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320115633.4248-6-srinivas.kandagatla@linaro.org>
X-Proofpoint-ORIG-GUID: 4q8sPiZtUxR4C8uj6t2VfeRQa23qDhhi
X-Proofpoint-GUID: 4q8sPiZtUxR4C8uj6t2VfeRQa23qDhhi
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dc1f05 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=hJRnET2hOHO_yKWgjAYA:9 a=CjuIK1q_8ugA:10 a=kfF742M2HRgapxr-WXtP:22
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=920 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200087

On Thu, Mar 20, 2025 at 11:56:33AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
> support CTIA and OMTP headsets. This switch is used to minimise pop and
> click during headset type switching.
> 
> Enable the mux controls required to power this switch along with wiring up
> gpio that control the headset switching.
> 
> Without this, headset audio will be very noisy and might see headset
> detection errors.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index b2c2347f54fa..b40775c20493 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -19,6 +19,16 @@ / {
>  	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	/* two muxes together support CTIA and OMTP switching */
> +	us_euro_mux_ctrl: mux-controller {

This node should find its place so that the nodes are sorted
alphabetically.

> +		compatible = "gpio-mux";
> +		pinctrl-0 = <&us_euro_hs_sel>;
> +		pinctrl-names = "default";
> +		mux-supply = <&vreg_l16b_2p5>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  

[...]

> @@ -942,6 +960,13 @@ int-n-pins {
>  		};
>  	};
>  
> +	us_euro_hs_sel: us-euro-hs-sel-state {

This one also should be moved to keep them sorted.

LGTM otherwise.

> +		pins = "gpio68";
> +		function = "gpio";
> +		bias-pull-down;
> +		drive-strength = <2>;
> +	};
> +
>  	kybd_default: kybd-default-state {
>  		pins = "gpio67";
>  		function = "gpio";
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
