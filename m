Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376493;
	b=e+gyDGNa6bojWUqS++RrB81eYwUiWy8f/RTIjNexL4sAUBmyU3novSsIlhgMK65csLus
	 Tfe7+MxGm4fj5rlm3cbeu+c9cIGZokbDnT+fWvMLaWJlUfxGtdX2RSsi0tcRUoHcnjk3E
	 i8M5mx8Xc29dmqTA35c4h7m/48jePZ62hqHQQNvBwWz8LY8XmAZdEFJAmKYmqdyqRrwBw
	 4MyjhMPkQuE092ays5L4x1rUFvow1tEowUJaG+cSYBa7S/mQ6iXmhGUSaR0ZsBwN8fFi3
	 o/Wrgn8w+pVZyQUanzKOI2LBnOrNDcPx4MmD90RpcxChyN5IpZQarQ+Tk4cFbSzBEzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
	b=z3iZM0NtoOJGyYrQ1IDNM6F5EtEP9Xm7IIJAlKRW98GNPNpF0ArY9a4KK8vIKyId192Z
	 pHizaMyQpQehr4Nu+zm09yRR91cET61vJyv87B8Q6ntjtIYAUHGAR14WHRuIj0397ZlJN
	 MrlrS6yajwlOqGyM0G7H5T+ZOMrGw7bXHSPD8LVHZqr5ushYb85o/kTlk3aJDlc/Fiqxn
	 TrSiwwPkJyzWdFiVnFTJ9nVHLAZkstvTup7MRper99u8WaTQerRQlsDnz0ec9GUxMzJhr
	 iy1SVIkMgc0YI8Z2RXP4KRub3Wj6U+R4DoiWgSrgbF/hZ9615iyyBpjUC/8neu1jcfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9A606A33E
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F9A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUrBa3514840
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=; b=UaZcjbGn3TKsKDJl
	LTnEuIUZvzso3Ez6PKujRGseSzEHxp3rQ80tLfEES+2Mx0wjvxR3epUAfM91udkv
	btk6Kgi2bGJC5UVSSsLlMEs3I6tKkHpqETJThdz+kAWtflBHY1nqmbduerjdtK93
	04tQrWwQaqPG6K1oOI8mexzLei4Zl1e17gfgqDtdceBgxVuFstXT8R26GArO2D2m
	9OaTYwuWMJQFrDpI9s83I/4D4RLG2o7DdC5zJIGZ4K3KTb2ho7JP/O/FzSS3sG+i
	7trNKwods2YCZp/ZmvQnYvfcfgO8kvz/Tlsa+x/0hbA9sYlrrT9V9dsdVWk5WEu7
	Hkbexg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v2bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so3392464eec.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376490; x=1795981290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=LlP2y1MkHTxcoBaP7zNBlC4lSa2q4XsGLohm1/xx0MOjMJgBmrPh11Tvj2S1pdONuE
         aEXd9Bddp/fbqFWLCSjYe56o+VC6EJE1X3MJ+ukmlzV0BJCt7s2avrK0O7s9w4kmoVg6
         1jt3eyaLA20Sw4BUaMj8h8bQx3L3ql/Jo0C9UqRugs/zKQq24qxov/qQ3twBcD51W9f2
         RE3bfzR38XaGL7kQpCsahoXdkzWt6jg4myUtjpGBYwWckErizaRwP4TB8GBE7CHHH/tP
         yo5rjOLKgo6YCKnm28xNQ8jjz1q33dyWhbITIxFXLbSbuAbLu1YQ6/4PohefQohXzS/O
         TEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376490; x=1795981290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=yXscob6XSMwvms3G2lDRCVKeGsMDEIoc/F5R78mbzvjDmtYj24Xt21pX6x1YnoW25+
         ur/vUNHlpPdTq2eEcwTYWM5NUXhpfOVmD5Qj/oEyWsit7XCN/gRYBnDV0Y2W6NAXjePH
         dw+407DyBTZQ3nT2SWeDCC8ev/HOsBzns9Uj1OpP6UzbfTFyJDZq1P0Ow/cDmrgtEBnJ
         OxV0zOvXZaGI9z1aH7zclxEH6pfdI/4MTJG+m1elvEapjo33EvLZaWbL1G9/uEBD6VlO
         oGD9oEE8FgqZFnsF0RFUwAY/ChlbLCI2IOZ1+X0r1bqg7aZdm5k0ErgznOt9mmJbiLL4
         pwAQ==
X-Forwarded-Encrypted: i=1; AL+hErHTKQ6ykoosOUT3Q5nlBpPm7A1UBx1whrgVZ7/GwxFZydXjNAjTdkI4vycR4RgNwAyA41it7n459jWdRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y/uJgERY0C+rdd24H7MVA5HM4S+PJlXABvN3ffzmSnPs4qKaL
	HbwPeh+JzdkA9s/Ud6IrBKkZ5qi+Bna2VCULoyNhBmVD5AF7sgs8WTethG8strH07A/qXIT0qbN
	Va9XheJpOevwZ50pUl3JS0xhRw+kLxmVxKgPe5w2TZuqabNagJm1po8EBseK5sZyDfA==
X-Gm-Gg: AZFdTZf9Soz3LrsuVkIphcmQt0hMvTsqS8i/wZdNaYJcYx7oWFZcWn/rmDeEBm2iU1S
	krD1CULQcLsIkZd1o59AwovkdiriypmonrUnBCuP5RIWzhh7tGG+lk4aJPVorlMX6cXSiQWggtJ
	SlHXt4U5NCgVaK36WN7fCHlFdmNvXRFk/AHFi6D3rpUfa/wZrEyidAzGSxHlSk+2SvexcKHmLxf
	3mQJLZro/M5/v7y4db51xTCw5yfJRDSvs+MKI1RmEja1qUkLRARPKInG2uceWtrOMdfEM6sS+b7
	JqQuWP0IfCKfGRpIs/lks7fDcZqnj1KhsuzWenWtlc+53i48VngQuKCkXvKQ6DPdrdje9Lqq9Fy
	jd/U6CT7tIGnTlcD0K7oa4BPuny6761AMQ3xXvNDzln9jfrVRBVQJ95DwYF+QcvICCD8nIzIyci
	Xga16spFZJ6A==
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124310eec.8.1795376490169;
        Sun, 22 Nov 2026 11:41:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124301eec.8.1795376489687;
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:49 +0530
Subject: [PATCH v3 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible
 support
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
Message-Id: <20261123-shikra-machine-v3-4-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1890;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ADHxLIKy80YYC4X/WhkVFhvJ5Z+R60FIHCh10Djdnek=;
 b=MYmePnWbGhM+LBfRzuDNc5iosZycgXUqbbFjEUXtFtc4uLHlU0KUIberGaJgtp2yMw6gOJcAW
 cdCELuWi5QGCMFzrCtLiUX1l8WlK2G7n2iiyQ8V/ELH3cTBudZqqV6W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03456b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wXg-2A6JSwDC41Kdh40A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX9N+OVIwBywAg
 2DG2vEniDYkeCDuU9H/Zbl3lAdk/ZyLPgd4A3O+SXu/6pbWlnD7O13OtE0MskPEVZojZiJtZ+DD
 P4wy/SwZK35BTi/NVZ9y4WQDselmgIY=
X-Proofpoint-GUID: 0xh5kP-LpeNcjiEWnJG7RN8nA0paH-Sp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX9KApzKaqKacR
 BkkUbKPIj+Tm7fMz5EDHAdgNoPge5atAq099t6DXu66BH7doiNtgWT+rKkQY0JhBMsvsChNxwtP
 E0YvJofbkUWquVJhkP6bGV/teb26WhO2kEYlD3lFmQTs4Po8bJ/KptcQbK4ei5xHXyPL0h811Nl
 H656tdgalnb2MaPk+iMVewlwAZtdYe209C1N7I3U8Iy+DD3LRfWEPel6DCQeZuKltUVtQC72qQ5
 MOCmzFywZso4O2bJ54B/ni5U5ePc5NfZ8GVwH1AAjpw1Y+FPzJbRYTjxjadkWbgRzqH+CZ/fnQ4
 gyiDHkb/VeWvvXscy6ipdH5mhbESAil0Jvn0kpAsphXFWiid0Zqnz8Znv4OdvLhGX7Z7jKGLfv3
 thNSU5u35QIfF3JIDZz8964rOgcyD7rJREl02OzxKVc+ZjoxKw18ryYpwP+BmCh+mZSmE9C5aLp
 qhneitBkArbgwaey4rg==
X-Proofpoint-ORIG-GUID: 0xh5kP-LpeNcjiEWnJG7RN8nA0paH-Sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra CQS EVK board. The
Shikra CQS platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components with modem-DSP based
audio processing.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e1d701a1b1dd..bf62e8330276 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -742,6 +742,19 @@ static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+			.id = AIF_TDM_RX_2,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -812,6 +825,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
+	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

