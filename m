Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372923;
	b=lxyRd3qRAr9b4CdKhTuWED39+5zrpFQ2BGZxs/lSp2a56FR4XjfkvMpL/CaAnSjthw9s
	 0kfo0hxnUaFeRNQ3iq32Q3bXnx/n9malurWVDuwOmSXe6pOwbCLVH41PmTQU0GtV/Gdcy
	 hRoFFZ1gwAvcIpWmaeOdv4Dxa770MKtt3XDSBJxpM4/7Qbd4QBnuN7LlO2ePeQrwf6G0Z
	 hDl7xFm9v7rEEEa1rTERpszInQetjXsQXG3AGiXciXqarix8rnYE/FSSgThJDtGVxSEv0
	 LzpAY6bBpDlKf5ORjl4KTnjygMUlopfk5t9J52nDx1H2maGKjdNo8OTDK8G0eMsQVLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
	b=BkOLi7jccxqNDM+zpKy4K/LgeyCMYyJ0QDaIzfsPZhkR9iFN6VPrN0rs/Ui82aqFzPEj
	 riHljxf4nzqLZ/drvwO1HXlLu2O6JP4+tuFDOLPlDE4pDYYkADzEfhaTgulemo7UYhiY0
	 4+Zdsc9LIQPLRCyQkRw4ARsDIbaOZ9L/FDhZzeT0bHiGX4FvGWuaFtpeSmSxQaeRowTqt
	 1I3uZ1O6tuYPUf9/9Sz8QLs+eBvNtsO5Rc7oydy+e25LHF2sXR19TwhVqR9RkqNJcYTF4
	 9vOpKSlneQwXEt7zZivHT5Mm74IHkkS7Zs6ebTchogdnOUMkpSKQTO/y8j+ysHikQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/Qe2JGC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090B606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D090B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/Qe2JGC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVEM8687229
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=; b=N884gzRysHbYDNL7
	eYyvrHAWLxssvbmjGZJYjEW1RkNykRyP5O4/u/dgWOK2y2WI+XzA6+7LM2ASPVg6
	tg3viHG83yZooUQwT0qGtc0jS96bKbFfMsc/NDwWaAwRtsXrv0UAyvBzNqYu6rGa
	nu6SO4AG0nO5TMYWp42/VbSwPGGmQemh2Yd+pGnpdI92bmi+ePcGxzt5HtiaAc2k
	WnqTekWv8rjEgh0AJMf/hhf3Y+qseNzWigL24D93uErFeRF5D1wmwuCv+9TWxg2H
	IxBP10NF/+Q0cWAbYQDrerp1YaYkxpwtsPcDEX6/TVwK7tQuKKKFX5ONDo4tQFoX
	CFRIiQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fca56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a0f79047so1854733eec.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372922; x=1795977722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=Z/Qe2JGCG9iuF3FFGoYZ3GK8QcstTIcGS5DDVXA5pjuS0cVm6+ZVnXSqPV6t3Cw9f1
         WhD74rd2u6SkahJXqfkIdu6CscTXq86aGiE7cAw9JDliQjk/x/ZKEkLApGUcRSCf13Pf
         R/XfpmCcBqLIGdkMa0cVyqzHi6xfYUwZO8vd+jDVRXHzYzuuTY8SNTs5AZrWsa7gYhi3
         sISDDBop7xeZjd1rSneZdb8HqFMdloh/LJZ20/iu8k4UPsAPuf/jypu/OJBIf8ODL+Ti
         EIIw7rtaT8Aa82OX+mpqrRThDETTO9IiE0uNKSzbwNZ8uH3P6gnn8Djf955Xks50J/kt
         pvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372922; x=1795977722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=zB4AwzeTemqBEEKaxkw0F/GTN/khn1D4Aqld8q5ybj4hVysVPCRe1h1cFTgmi0/MUz
         KgEWT2ZVtculLbjwThDxS6YgPmJY+aRS223ao7Ig/uSEC+d8RA5iUQf54vyUdm1S7X12
         xswtsPjv8oDuEhhYoFJ6nYqhvMzY/24rNpDfHcml7a4xtNnYjwZ2cSi4Um4MFYk60+wM
         L6y2uhvWAkDUSPOV/wFy8RaI62AYHYVH7XE3Q5sTEl6wTQPAKSH3HUee6pNLBcT/OJXq
         IBkmPdTh8Gad4yRc6iRGWF+O2xDsfi+5C8yyJ2z5SbvVxYupWXGJwTziUGiljgexMx1b
         hwBg==
X-Forwarded-Encrypted: i=1; AL+hErEvFPMS8qdK/ZmMVPntbeM/yMM+nAe4g1wj21ID14Jb1CwF/F4EgCm33G25p7ODEW0nN+VVfpdGtuWdVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5z+K3nMZD9axidhjJuQo2iT+sLuVEwbuyPen5zLrid+xt8sU/
	1Pc9ksuP1ENgfez5DlCimIwT5u1shS9x/M9HBBAUuwOgtqGksDOktqXqy4rjgKiXjImYZX/sF+6
	WxQE6aFTRbdvU3ungGNeGGIFW59k9m/pcxHtg+51FrRx8sNNiSbg9j2HSMegzgOmjSQ==
X-Gm-Gg: AZFdTZe60zo23HCan7YTkjLpEQSV2KJkbnkf5ejXsljpPx9+CsRGC8AeRKoreZCKgxp
	IcXzrfaRqs8o1GgQY8T77hYQWm8jpawJOJE4xMZz4hUkEAKN6rhSrOHpY0UEdSYc2eTomHGyXTP
	BP9W3BcGgFQamlauNJgvpEpyvZY2YfeCqrxEo8212pir1X50fU6Enip09t/3ACbbZGTeTN1MgwH
	jfSKc3sr8EaZEDdHDzuK8/lcZpXYDvepPir9HR5G1mXQCu4xepFuUN7AFh17fAV4PW/qwEgNkOE
	48QBhg56s0J1gfkSCdztV17BV7wtY1yucuqT11IrWsClZS6JhyNuxufcljXefuSpoXhodZ4fSII
	5rvG1fyPWaKg2Z2CuKwe1snuvI+gFyMnhwhE8A2afPpx20Delq+9S/P1vD0khRcJ4FGA4L/cHt6
	X4rJgL4vHttQ==
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446353eec.34.1795372921395;
        Sun, 22 Nov 2026 10:42:01 -0800 (PST)
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446336eec.34.1795372920922;
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:32 +0530
Subject: [PATCH v7 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
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
Message-Id: <20261123-add_shikra_support-v7-2-7bf3aa089fc6@oss.qualcomm.com>
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
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=1112;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SZb8f4y+c8VKXAmObSVzyBxPR3uylj62lbyHSZIa09Q=;
 b=uuVTYdqXCo/Q0EWrQyqZWXll7bsLsYN5dwGnkov6NB+7G2v/fmXfsrJRS+OYu/K2nFHYDy6Nx
 E4mpaje6/ghAjSZff3MxT7d0OAWMfVUNBrigQ6vcq7E36Qtt2fp8v+i
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXwQpJncznT/gK
 6dUlN25TEICiRS1DIElCkMBMS3dtlHCHA4aPP/fpaZ+v04AmuVwOJ5Z5vPaOv49q1dJvB8DHwhR
 +9S2jRowJKyMkABi+ZeP4ENjSwGs8ePGlPxTcECx9mRGlMoe2qCjmZFIJP3AERV7BGSQfbY4YTr
 vPItCQPnKkGB9Vg/7c3a6beETPLSQeQVokQgJcZETLXEDA/HzQaIvnqY5lttjGi5MTX5JICfyw7
 UP3OG19G134X6FcLplfFSWQg+bvdZYJ6PijHeZNxn6WwUBqtx4QFY6ReHyoQevSw1zoFuy4vcGF
 iYWOPF+XZy/f9ZEfxJlQQDe14A7grJ474KLSt/BSq9raRgdYdvgpHsF4sp3b3pUUv8u66emwjQB
 q5PTVkr4TasdhxrEYIGyZfYP7cIEfbvIo1/eEJY555Ohz7+31sme7JNFSvis4l6eTl70t4sqqHc
 KFj3cUpuYLDJPIcC5HA==
X-Proofpoint-ORIG-GUID: ql6klBixRfcHeudKsm8shB1F-HymbyGW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX3/bhWwpl0NNE
 fjHz+CG2BdStWQ9S+4arF2FDvoYp8ozNJTeLdP0wKWxBVv10OQGQR06PlXk5cgzrKxttBVIay4j
 3GY7T7IvbYWVdJspEUVmZLza2v8Rpb0=
X-Proofpoint-GUID: ql6klBixRfcHeudKsm8shB1F-HymbyGW
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b03377a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Fixes: c73e2c5672da ("ASoC: codecs: lpass-macro: add Codec version 2.9")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

