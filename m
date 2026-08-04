Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D443211A14
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841640; cv=none; b=G2BANAAK+jiuIMY2AL1OVLi4cRojSi6ru0RJ68FzSlXnQRga4/v9hLneoO/jeT9FNgTzynB8Tw/DrwV7erahv2AaPsHgduhlGsKTEMhAFLKwDLSbNSVd4Xm8yqXhBy8xrW3jo5QXO/Xe/Iu+eP9y1Fqe/r65Qm77WpD0zNLrtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841640; c=relaxed/simple;
	bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRAHNJBpgV0xm2ZLnRm/99ElVosMYesOp08HHdK09p2jygNGp697srMpyh2+rOhnFNIdZa8CioLIKYVkYWoHcofTY19VP0EZz+V+MuLGZLJkgAjWXTK7hbRggi3FWEfLXwTWasJpR0Hk2Zd9aua82Wfw2Uxk835SJi8lnLGvg3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqJlh31x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWm2AQfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqJlh31x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWm2AQfV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CAtQ2978729
	for <linux-sound@vger.kernel.org>; Tue, 4 Aug 2026 11:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=; b=GqJlh31xkIGa8tFO
	+g7zKln+8Bg6FCcUuNr4qftrca60TdFNdcwaJWk2ajKoV88fCmbcgssJ0FR8twRb
	wkcKg9aB2l1bTC+ZA+I+k2FySWFrVyCZly/vnmZuwdN8P3QSiQPVFEvu8reTpZPU
	WeMVCrbcM34BtYK9HinwXBCsolbt1ZHRq9/GXG2WSvc7VGKub+Tk8WrQQJmvUkn5
	cXa6l0e2ixD7qg/JcU26zhOS29f6pNebqcdcGP7CvtVukgeqozWOXZZOgjXSlNAv
	U81vBfefEjWdvAle5PYyfXo4PJcbesO5mXBAnOJYPKft+bGINJKVLANGDDUITss8
	UvOPAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2syjvsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 11:07:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so59773745ad.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 04:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841638; x=1786446438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
        b=UWm2AQfVV23kVIkFRAeYGlybX9JGRMCODRvkt/mKx7rEU8vg0Sbc3uUfOvzdreFg3b
         iyd23ZOokYA2e2ZjTfKOBA3vgPj1Y3GH2gN0F8ePU7dQ/iqahB/CwXlphJ6IfLXjTkeg
         x5dd4UY924bm+iQOP4HMaEpkGKRCc31jwuFAJmRL4FjzJuc154HhCqwNP9ZfPnAiBlOk
         LB/wIQ9CjEmSz2qj3oLA20znQHZ9bMruvDh9T6QS7l86gd/d5qwF7Y35TLcM6qpsCdiq
         jH+3sleF7m/n4BbxgBa3HeXfpSK4G8tI6uyZ/6RQus71hXCjHXeHw6heZhYhK/IqZF+J
         vYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841638; x=1786446438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
        b=aWrF/jBv2yg0R/DfASdGVzgxgTeLB1twnFtucDSWMuXCy7/opjMAgHnV13YTNY3osP
         QHTAtJ0zXpYJ2C98qwxuh/zoIpafdrjcAlGAEZt73UZCbVw77+eRVLOgpPY8cqlq7kbM
         NdcPldJMGcoSl8lMwDGg9O4ezw+V/IYOGuqNXjI+FvCZA6luCa+O0FrO1Lc5H4bItQAT
         S4d04XpL7tT/KnAj6i6oCRZRGqmZ+VCOJq5R59I+nm+BQSyEbSIgjOxO++KO+l88wd9b
         PBuM4imduw/LArHMZ4F/IqMgTHrqyjNztR0VrvBOFeoUSH6vuulseA9ob5uRotjtP/an
         X98Q==
X-Forwarded-Encrypted: i=1; AHgh+Roj8kZXtm8NlMAVL+5IckKfPsG5OxzxorKLI/mo6j7m/zusB8g0Ri0UdODwKY3IO4NTm6/4/fB5tCgDQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmbBCgx8Dbzb9QBKE+8FZ1EkpUSKvxZNslctjA52nk4gEzOsr
	WUs7z0JirH3lU6QG//FW43o1bj4d2kkREreYyuFb0ujxlnP7TIAXuQ5xKHEcZTfxnSLXyJLxRRY
	U0bbqrojgIoNaLFQr3A2sX4r+FHRA/XqK3cKJhsYQABl/Z0aQG0wIrUDhtXq4FaGBmw==
X-Gm-Gg: AR+sD12lEmTjBCOuJgVmNGOcqAf9CofqmGIXEyXMMLEzw5+4v1KjetW6DLKiOi2ZqJt
	q5dWjnzf9RGIMcqMXMjl+9CGSSjAC5/97f6whV9ejeVVk8n0nN+m8mjVXUrRJ1msWAE6lOfKn6P
	ele9TRvlLg4f7jiaDoMMqJ2oYHMKzYap9c/mL4dfdzwFSSMFMAD/aK16TXVQdUSXhCDg2OieSLb
	c2xISBkLSf25xrFWP6P3SO8dUgUEngu2T3L6gPqTtkwqvBpjMat+SSlA+sU5FCoro4vkJdVjBoi
	rUhD4gkpS/d64VxZ3bF6rJ5loyletopR8jUqVaHzeEjkrltwWPF47Q3hNOpX1bhPjwmOv1U+z5g
	9kZcWK6guNAMA1/p+cw==
X-Received: by 2002:a17:903:2c0c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d0521e28eemr129825515ad.14.1785841637867;
        Tue, 04 Aug 2026 04:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:2c0c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d0521e28eemr129825115ad.14.1785841637429;
        Tue, 04 Aug 2026 04:07:17 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586401627sm4834476eec.10.2026.08.04.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:07:16 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Tue,  4 Aug 2026 16:37:14 +0530
Message-Id: <20260804110714.2951829-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
References: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com> <20260723-master-v3-2-3d67b79b0515@oss.qualcomm.com> <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a71c7e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=igHyRETPZI50f7faVAsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4OCBTYWx0ZWRfX2r3gyulRRmYE
 g2kplvVqpqtaCbH/1+JCtDPDekES2C8Wpl3+6cZDAmDQ02keR/czk8k1Fvr1mjMVLMKR0bJV7vs
 U9ZtrrTov3Bg3ed3ra+zfz96iLPnZGs=
X-Proofpoint-ORIG-GUID: f_M_JPxYUeRxtLz6UhmWxZYFYw-0B0DR
X-Proofpoint-GUID: f_M_JPxYUeRxtLz6UhmWxZYFYw-0B0DR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4OCBTYWx0ZWRfX++fuVFg/sy7i
 +fgIhma50RGzM22qSAvFuYDWjhKzGjfphaDPbpVLylL8FZJIx51SNeKoSrboVYyVOVybr3YSZL9
 SWXarzWqFmS6x1l+rjTkgk7ug7KYb4LNkFtNFyymy7R6KE9JfmVy9yue+Ek4UXw/10V/0A7GuRi
 2/LcyfNd6pTLnJuOZQQSn6KJCQgRgG+fFzrHbTrp9x2cuZI4sioghSYXQY6wZWeK0PkpHlpj/d0
 sCcoYUXLhEUrVVZkkCIOW56c0ei7sVYPf9l6h+mzYkPUK9XyI5E6X5FRtH0hEsE+sp9LV3i5wAL
 FzmENaA0iKdx3o/ljbHbI1ozW+2tgRWBSCHUpVXIPp+t1sdeWrEqifFkHUDym7Bher8YMnZJtpJ
 rZIwWt66hVFJOHfwUAZ4A1agBzqrWXZh2xBKNZ8eyJ6VR47e5u1X7k91l5EPwGVeAnz2z5lhR/E
 iy16pTpHYW5vJSPnUqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040088

On Tue, Jul 28, 2026 at 02:12:07PM +0200, Konrad Dybcio wrote:
> This patch spans 2 subsystems and 2 separate maintainers.. we'll need
> Mark's ack for the sound/ change

Ack, will cc Mark and get his approval on next version.

> VA_CSR is the Control-and-Status-Register space of the VA Macro,
> the name of the config should definitely focus on the heartbeat
> pulse clock generator within it instead

Ack. Will rename in the next revision.

> Besides, that address space is huge, yet you're claiming it for
> a single simple clock. Exposing anything else from within there
> in the future will require bindings updates, which are usually a
> tough sell. Is there anything else in there that we need to cover
> from HLOS?

The only register block we need from HLOS is the rate generator at
offsets 0xd000-0xd010 (CTRL, COUNTER_0, DELAY). Nothing else in the
VA CSR space needs HLOS coverage for hawi. Will narrow the reg to
cover only those registers in the next revision.

Thanks,
Sarath
