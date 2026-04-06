Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECC322533
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469519; cv=none; b=S5KV8fxs/0hCzixGh+gjawbACgRIbuS4MH51j6Aw7vA80dOljomY3zMu5+lk1CXTG8hl3shEHwCocuT5f5xpc3JLF9j6/mrgi2wIP+DCwYvUycjwW3DUHqLVosz4VhfvqPH9AVPezKI0We6Cx94lsKFFOscwqoWbvqdiVgCYh90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469519; c=relaxed/simple;
	bh=qjB9Efsy6IkWbCFnSQg0/51oe8oCnJbjksHKC2fHSts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GofEuNFqQC08Il2Qn/rhRS4P0S71tXXnLbjdMEhjA1dDb3QOy0xjvBiiVEBNnqBaB45SLvF2CFJGCQHgJ6K+LsEmn8dqI5BgExJ4DnUBYK9Zrv4ZmsZas/5IzUHHs4edFs1qKRDokzCmJKu73CoyPlTU8IB5XdvHsqC+FZUOetY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blXbdB0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+TqpdZw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blXbdB0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+TqpdZw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63655WQQ3269682
	for <linux-sound@vger.kernel.org>; Mon, 6 Apr 2026 09:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=; b=blXbdB0RP3GAG0aN
	bnA5paiQchAlxCR4B5kHKuaCb8AliqOFmUKY0HPVG8lc1nXLTTOgm0pABxBAh4at
	Nh6ardb76jZ1MlAjlSjiVnEEThj8xOWMP6ZrIN8/mIQ21D17P6+MhVL0dMUWXiZi
	xdQC+TODpGZwL5srnxxbIetssgGAldxbHT0UsWzbCh1Kh3PxGJH0/FOdadkqB1dh
	JP9a/fK2H6Qu4G9ieNmJ09C0JvJo8PdTdWGDsXWg29Sw+hJN6mdsQz7slEuEVB+7
	lWOSLLb2EI6r/j8kQ45RIil/cTErvtuvsvC1eABUpVFewA1jYZmmvH/FZmKBf1Yb
	Y/YOkQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfmrv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 09:58:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so2167086a12.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775469516; x=1776074316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=;
        b=Q+TqpdZwBALvng43x4P/PnHaVPVegkCBHrqz5eniKvA4jTR8yDp+lcsuhM0HHbOYGy
         CF7zxMvhYBQPdm8IYZJehZ5HqTu/z/aQcYWDIlSfXvPtbdEH+ZdN8r1GzU5SDCT/VrPx
         SePuXdGxwIkqgMl/PPYlO1rs07wPDeXTd3lxVIjalIDqGModhCnSj9711nIAVkePQfUu
         y/fQtVoXx4CW8HEfpK/WNTrYJC5W4DxuRd+VzOwY6WbsllZUEzQz6xYOTErhmamq/gGD
         eS89FDZ3Gm67Kp44tBKrjtQ2S7A0/kchBfJnY0FPRXXNUC/sYObKscJ69jvVvCAeslM5
         8m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469516; x=1776074316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=;
        b=Nvu9HDB6Z2fosv4/CFHlSNR/TL+MfSzvbLt+n+NDS6aqJRghycOXuF2+2EjydIJKUA
         uCMHzKoPEAvN3G5RrpqP+tw2fnBfqLE2O3QOgwPx8AsQid6jDQKHZEwrw6YWXBlVnBcE
         0Lk5rZrlfvqLjIUJM3WxO5gRSB1ThuSI8d8S2wVTzDtKlW6FWhQ1aoYoYZWZusg3ZYWU
         sMZCXLwiRDrdRFAlMy1AKrrwxruW0wQXwcdeE2duOTeHL+aBNH9Kdy75qoDZLFqFGM1w
         eNVPcX+H5orRA0QF3+AvPMFunjjGrTS7N3AhJ0bhzG4Zoga+tCckyEnUS+bzvd+IhdYf
         kYGg==
X-Forwarded-Encrypted: i=1; AJvYcCV06sk8BsnkytkH380ckv9hyHM4D2FULOUjBOx7dbcn/QTAPVxCJI1dqcwRERFOxxzipD9R2p9IkQskGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85DRw1itUDKpCPVRg++Qiu+/Myl0aVK+vxyUUihLBamz0dkSr
	Fr7XiL9y24UfeXGLZhIcHublMEkjWFl3ng20zH3G8bS2B0I6hntI5WD46ioLExzQy7b9WltXZzB
	/vFwIHCLci2dhuI8+HRCcCbhM6Kqv06ERTVfYWK7JGwTAziOHOtmV1d7PArzFyq+KAw==
X-Gm-Gg: AeBDievT2IldV2bGXH+qOgYHnOo0k5XuCCXHrmzLk29E8juMknduS7F+WtTwQRQ+yiK
	ZRqhxb+s3AMXsW6ibtd2tQoIUz23IiLmYpxIf0SnP4k8+R+Cz85SiDsTpK9qpniC2v4UErelVwp
	frFAerUy01Xhyhecujp2oyIwYE7UgbSXdW3iG1L//a7E0x5W6m64ekxOXYKSGLU5TmWBLT/gip0
	iEGVQkRFhYzliwHNc+X2gfZGR1BXxtwIH+fmhN9nhO0hsIb1cU8NVgRIi4QGZwz6Rtk7l6aUTLs
	FO4jpALsXvTkgVNQsVjS3BRpDt+sukdTcwJy/bAvS/PcCXeYgG1bAZnf4WIV1eKncp14H64A/OF
	+hmILFItC0hyT1tb32F7h86MwW87oD3SJS+X0jw/gXnugqQ==
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr12013573b3a.26.1775469516083;
        Mon, 06 Apr 2026 02:58:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr12013548b3a.26.1775469515578;
        Mon, 06 Apr 2026 02:58:35 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm17723022b3a.10.2026.04.06.02.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:58:35 -0700 (PDT)
Message-ID: <f2b9614e-140c-4407-b4fa-ef5d7c9ac0a4@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:28:30 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <177511857667.2917822.6371182180784837499.robh@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <177511857667.2917822.6371182180784837499.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NiBTYWx0ZWRfXwdzeaspZRqW7
 8zkW4flbfGasFDXVJ6iryI/kQTQaNs2imELwv+Ko+IltU9uaaBpkmYfiNFtxF1fs3Q8kzzYRVlV
 7fRQYaX0nGkKWa0YFTs5vUOI3NijrGP6IIgbma846czR7qNQsaukNQO15F7T3AQ4dHGHyoHsD7v
 bOn/ZV/9CQWfejAPdqelOg/A8Hy8QAlcqY4qN8QdCwmJKdb61Ew0+MWj8QqS+opS0HiKvlO1E4Q
 +nESV6bJR52wYB6xHE66XztKFwfOP5U3BMMGsaqB6nXUqzhSDvj/olnlHIw07ur+JPAXnhuPDAJ
 sr6d6+cBWZaY7JvFvfPqDXXsqp65L1WB9Jg7ar6rJ7X8MbBl0YJmEgVVi2ks9Bkar+PQS/8AyWT
 OHSKZ5ycraTaAPNdBI4uiocdKtJinFm6ARh7T4wdMi2iQp0+ajMvQk9gL2m4AEpBaK9oECZPVW3
 rzcnF2WS5I5l4ohvQSA==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d383cd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 2Ti7PMP-io88X5RlF9g4LzYdmNXJL1vp
X-Proofpoint-GUID: 2Ti7PMP-io88X5RlF9g4LzYdmNXJL1vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060096

Hi Rob,

Yes, I was able to run the script as you suggested and find the error 
indicated. To address the error I have removed 'type' from the 
dt-binding property "qcom,always-on-supply".

Thanks and Regards,
Karthik S

On 4/2/2026 1:59 PM, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml: properties:qcom,always-on-supply: 'type' is not one of ['description', 'deprecated']
> 	from schema $id:http://devicetree.org/meta-schemas/core.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> Seehttps://patchwork.kernel.org/project/devicetree/ 
> patch/20260402072256.2811085-1-karthik.s@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in*this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

