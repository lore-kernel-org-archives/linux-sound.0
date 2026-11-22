Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372963;
	b=4GWmecHOQHojzHyQM8LS/q+WvEsw/PiwbsbKLxd/mocw6bATBRvmgSlXne4KXTTdkmPj
	 lA99UckhbYCAmHatVKq6hEMFPTtYRNxrN0pFA9jWtQCLZj/FFHX/fE20Dw4eV6UuocafX
	 FPuuaR1eVrM99o2W1zjO64V6k+fOvIEWmjPAB8Dypo/vg/u11Yb+3z3HW7HSpKyvbdlCR
	 CwfvUks10OQCxsuc7TyqsLpailrTaCyVnyiWZ8gUP9s5AZiFoE/aSxJqrOQl6dCbgbY54
	 NKH65vM6QLtxTLXVjK7ycpnSm4ueVYzVcDWgFrkcJV+LrVV+bL2c84yL9jr6Oinntrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
	b=u/Y5mIQSzSbZ5HrAbDHV2VSEL/RU2p6y1+BzPTjttY1Tzto7UzsyY2Ft8Wy8zJoty0OF
	 Vy3Xu9cBRAkNhlCcmZrMGmcXWCpbbxioubg82ekT8PpGldMtFHxgDEELJZ+NHcOcZ7K8I
	 aFlJLnhIUB6B4xpDL8EdXNr4rAq5ZJqil7UEj9rvoS5GZxadSpS0aHiBoMZbOX+yChpBT
	 v39D9aIPdH8wuXSSvryBBiE3r6dqFKLaVoYeX3S31sjIPrOULXC/Yw5CvNuCS90ae9t85
	 OSVkSMe3sycURpjBxtx4f23YVGPbi0l4Al62XCFxY4FcZVIrBoMMvoaW4ppKpGo3/Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVqlfr0o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3OHh6Pl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499A606A32C
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A499A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVqlfr0o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3OHh6Pl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUx3h412168
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=; b=MVqlfr0oT4+xkUQp
	YXSsMxXYoUn4w0X3fy1b84sObMFyYFhpQw2Et2LUX75nwX7InOTdR4q4mdLOm9WT
	G69yVUxn49q0mgl/FK8y3lmS6vCC+Bi9Ep1Ma5b6OmaHWlRl6e9HZxhj8bDD5c7z
	Vd5pagggO+5GHTir83up3y64txpck0lUEbp1NcbkXTNZiY+eGWiA4KCHmTs2haNu
	/vyIQbED3lZmTGaiPs3nXgI1Zdkyr+HqPS307BobJOFBVuge5eea7ZU/50FI4m2F
	7uk52f1RrfogbfU8BQYGopx2d9AVsNZFMYMMOlayQMjt4Iq6K7UUpUWabXt9ng34
	C1DhIg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m36j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so4695556eec.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372960; x=1795977760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
        b=S3OHh6PlnGJgPz2FyOdVuyyyM7EnY7yIM5QNE0aP/RrWPFWZc+LoCDxItJTeZW7JhE
         s/yMRrmInaoaNlE5bFe/+GnuiIul2WfGsDzj4xm/q6Pa20deg+wukXLtaPapO90eQ5hs
         aBLZtxwIkXGkuRkt14YunEBLTTYQd6xZOoxf15AnZphd6rCohgPzFW1sYqHBN2fDBJmI
         N1/7pqHE18812zAy9pvJhOVF5/ircOgimm8HFzABzKWvMQHLfNXcxKZXorYCxAAGyj2B
         mFVeyaEpDqil1aJZJARw2opmIhw1NHp68lmnp01/NnSPy+fkJpj/kASMhEmJhQlBeDVi
         k8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372960; x=1795977760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
        b=Uz0Zsxcg6eICm7aWffpLJBGuDWbkNIZvJgwnuMRDQfbSCc3i4wmh1QQDqYpIAnTn5Z
         /6N4IsV0jsvSW7HiliD6irodNSfhlmdheVOD36nc5aeQ8tLPatDDgZG3YTIRuk+kSEvr
         ka5qDz9IKddxBgDLpZ/vB3YPacgrbdXrikbp1kMKj1CcrT748TYSSD3IECLYAp+PO9Mv
         ngMTmPuFwzl1jsFPAKQ6qPbrPIix2WOrK0h5hNZL3aJuzAPEpC72XMpd9JUH2l+zOe5w
         Fu1IEhb5n0idm8fW+DRQCFS9MOvlhHt14NyzbSRvfNfA8BgnJ0zav53dhbA2Ks+o6dga
         WseQ==
X-Forwarded-Encrypted: i=1; AL+hErEJM2Rot64T0gsPz0JQtHx7SN3p+rkMbYezI9f36XnHbT/yXzxkhmwz676QciJTI3QVAasDCKfaJHM1LQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qFWvG8l5/cfcmniA/YVcTgjHD7XQBTLowXt306YXQxWnhaZKg
	25I5J1k+wfWW/93CEq+xAWLmrxeFmpiwW0HEGgr/y8tyMRNWLLvDs9nIHR5HLYKthEczYmCQKyI
	o9hRtQaYKZeoT1Kz0xrEtd2FELxDXadAmnODSbWogsdyWK0DiZnIL+NVKqaffbQ6rgQ==
X-Gm-Gg: AZFdTZeJwWNMCu1T8TBnND29uLQkvJ3rkk8kmg7IBjl3UH51uabUDf8VK3/pQgU1uAy
	IvSbrMqcZC7/cA1BirR1O7SswQwIjwkwZNnMwWFxomlf6RczQeSCwH2Go4GkNJSCVn59BpOiLg2
	6M7pNm7Ap6zeC2Me9oFXxEOqJeLkVu47dtXr3jYa6rXIfd20FvgOw9IQz/4IgZP3JQkFx/kcx6L
	6lw5yevLGeCFH4imm5GFhN5bkdl6cL/eaJtXpyW031d9KBcAhPHBrXA1aTyKOCFhIFiSc/gWVYg
	fcfiIZwSvIepvVk6H53GrJjnueFX8WOPvdLFjvP91jjMxaSm6G2IeuLEfq1S1/hIHGKdvppULPp
	8Q/gjF5+YyE6JzMlzBvb/fEq3HbRGrL5lWLeOc5uI93YoVwBMlDoMiH/ybUKf8UldVWOsqv8pQP
	0DdDDfVegfcA==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr10851673eec.32.1795372960455;
        Sun, 22 Nov 2026 10:42:40 -0800 (PST)
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr10851628eec.32.1795372959922;
        Sun, 22 Nov 2026 10:42:39 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:39 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:39 +0530
Subject: [PATCH v7 9/9] ASoC: qcom: lpass: Add support for Hawi
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-9-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2073;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=b/4U84734Yc7dwWjoX+6MpWrZ4xVMl2EfGHGxrL/qPk=;
 b=gYUZRHtzpFBjr3/75J1gKwWp870vSe+Terlm7RWBInWuX0hsNcQq6BELS5GUPU6M8tPjOc2aL
 dNwwwObuDp1Bd9Ofr4v/oHSCwidkAtOfmNKqyAwrIBbJUIrfE62/wMf
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: Oz0S-I7FKiTyX43j8pvFsLY7AP-7_rfB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXwMGRtFUkIUUQ
 MbJwPFAW4LBzkMo4vYYFMMHnu1KIWJg8rTuV+ST+PuXlOgvKaTy77A3OSnOd9V5U9yDBHi+ObVj
 YXcdRFEBNT80JtXMsrGX/TajWiwe9GA=
X-Proofpoint-ORIG-GUID: Oz0S-I7FKiTyX43j8pvFsLY7AP-7_rfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX17myAWSmPyJj
 q7KSj0wPV9E3uG0A5TPZC/90HYh/7bmh1qqjUnACXS0cveA2BWEc2luTV+xA1ePbI8sp9yqBgN6
 27K9WmfiaBGOTh3cqdiANwf5JwowXd+w1sQm6JC2yhnwVzLT2TvVuy3Fx8ekqfGw2yLYIXW+ovt
 x8xDUoy4P360j7A4cVM/nOZRLkEEsM7+E1Tg6wMH7W/IRsaWxjoq3/22aulXIZWhzFXPe5qVcJD
 ZY4Jif7fDluPFCyHpvPH95JoiVsoCPQFi6VitH6jvi0FcXqgmQ2x2I1aHhEM9tCDrRhXGuqvYMi
 fKrBCWs5waf4DKza7TCQlSwXGvwoiIbt+upHEl+eNUOIj9t9r0E4jxKRhCVwzQdhiH8go0Wj4xY
 1Nqb+NlKhnqxxkDfQOrTxbXOO3tK3oUb9cOHgSulHmLuUnTYMM9k+FLhjHW7QHmEa2rBnULAahg
 A8810xVXj0hoQIcZxfg==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b0337a1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bsY24OqhetQib-sbROEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi and Maili use the LPASS codec v4.0, RX macro register layout
of LPASS codec v4.0 matches the v2.5+ layout, so reuse the existing
v2.5 register access helpers, controls, widgets and register defaults
for it. Unlike Shikra, Hawi does not require FS counter bypass or
adaptive filter blocks.

Add the "qcom,hawi-lpass-rx-macro" and "qcom,hawi-lpass-va-macro"
compatibles, both pointing at the sm8550 match data, so the version is
read back from the hardware at probe.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/codecs/lpass-va-macro.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index b3adb32f7d33..09ea4240196c 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3997,6 +3997,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,hawi-lpass-rx-macro",
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8ed8420d7185..8e0c38517a5f 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -2195,6 +2195,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

