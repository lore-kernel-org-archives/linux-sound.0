Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894F34D383
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778380; cv=none; b=oGSZx66SWFTxLUtozMEnLJB1DipOPA42N0I1BqPDpUmtsgMzpp06j6z3E2IBKEpyk1sDv121BWJ+7/0i0nnGQKu8dvQsBLYcqD9HxylxEm9JCDQ79fuXiiwzNbCzW2/ZMSuENep/J+ip9u/lvESKmJkRemZVL17sNSoqGnqcmUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778380; c=relaxed/simple;
	bh=8vLELv6iEJw4HQAetXguIPG9JhI9/hFFJQ4g3Jr7e+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3rcoDF7Cat5b0ooanVrO7Ys5U7vV04PbfWw+6U4cu3NgKW9t19GmtoLr9iW27ZAQvwj5IP+Q0KVyMT1N8qv4wF1KtwamfGjFbePyIiKaRb3/CN7ODm06S2a3p6qYOuHil7iGBZyHTPpiitQHEJ0itx1jQNUzKWOXgdF7V9Qq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFNa4CVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XX68fA+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFNa4CVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XX68fA+b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B4pGi2627183
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 16:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35fZq0L69H3uQ9aWFEbF/Zr1Rt22YIPmZ+q/BTCJbn0=; b=bFNa4CVqVj6tKR46
	M+BoNWqrhNMouPwUVboFCVRaKQ4bLO3B8b/G0PhYU/chjX4//ey/JquE32KCiepa
	DcauSe6ehk98w7YKA85KrgcDlkaDE4gpzvTiAtDj77DfjHK5UxcWT/ZQejerSXuw
	q7uS5T8TFbnVeLljXqrHisMTXMPcj0mYuQLo+hbGcbMvHnVbXaxtYjLI/fvW3Cl8
	95X8HoyZKR2R9k9bJDxre6W18ujdkb3+aNQpsyE6srGU6MeJNZHMOpRrX8D7BWj/
	vs0ihhXPcPGbprk7Nc63WLCY1tPplmJ+R4kP2X5+W0LWjzSHp5EU2m62xyeans8D
	oN/oLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm128urq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 16:12:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22d590227so821841085a.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764778376; x=1765383176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35fZq0L69H3uQ9aWFEbF/Zr1Rt22YIPmZ+q/BTCJbn0=;
        b=XX68fA+blNPAalO+bc1JokESpel4tOmfgIsd4CRnufPo9SdMOB2up46elSrLTd+DJC
         VE7RgiucSAycRCOe5a5zEXCQTpCMbGXMjbCswRqU4EVb29Y2FExctC/x5pq8KGev6AM3
         W2P35QuOh6NlumHk82AXgAXCP4iZKwpfNtjuxkvLC8KHRCNxSD05lQkYGhbpMIBclb14
         +u3AVfDKV398ORh2OYrwbteEeSaA+O5l0B0nJRg9ARvHNGPYEx1IIRs9aYsz22hSPoKR
         3BHiil/5Rpd6AlDO9OuUaEMN4V1VYtTrx8FKqKByJdMcp/AShMhcW5Gpr0/GBI4kphxW
         3jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764778376; x=1765383176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35fZq0L69H3uQ9aWFEbF/Zr1Rt22YIPmZ+q/BTCJbn0=;
        b=CplST6wmHwdbm8KqFP5qzIvtmx9wxjJHPy6yJ2uzOn5vNVhZ5gOJHoA26smzoyPLI2
         sP+Kfc6oZvtYVQzkSrEGFGzOK6EqpdH9IRvkXbUhOsUv7ow1ioAeSsiOIeXZVjlfyuPx
         kTufHu2FWGX7KmGex22DkHBsueT4gxbFNnpxYO4r/PVDJarPy+MjGQkhTWgixA5K4lFs
         xua422GM8r+m9YoZDyODfnN5Jwl4pzsxK9sFzGN+V09/PMwOIaf0vqa2XT4EPNQpJILa
         nv46Ny5uJvhacS6f8T1H9WUAZkqLGjUNxo2tY3JNI1ZS41wu0bxT8tCNzImAADzxaYp0
         UyFA==
X-Gm-Message-State: AOJu0Yz7dv4W/0PaTLf0EV+kG4/TDfcXWKQnCC7EB08IaeBKddFKdJv6
	l0L0NMWuuAogWxqmHhMlqMx8ZoFJrmbuFQgaWDiXNfeMpnvHNx4eQOjswE7h0RDsn8fTdFTvjUG
	7hs619x42lYZXY3MHKFtEkK5GOf9+vpMg45hOV+RxZ35XaRyvALEuWTHrFrQYtgEyjA==
X-Gm-Gg: ASbGncszagYYOO+9L675XvQoPJDt/jNHTAejcD79m3iQmIRTzfk69+yEI7eLFH02tbZ
	CSPaFh/1g/smj1k5KkZJ6SfBeWZJ4dknr8doD3A39EcckZYgTzfgVg2wZsMWLA/9sROApmZHDSo
	Vjt4UCc3LKEd20EXZOQ33MyzeTjyXWuIgdXag94XCH4jjDZG0wmKdctJ9D4Yuy0PFALFdQFFKFD
	pRxgfOXJfN9sRgV6cFD6s4Yu2lR60OZYFfAJzHJodwABw8XVjErkX/bFs6gp/Llyjj1nbCsluPq
	rwqg5Gf+LRp2EOr+jK3ZV/SXQ0AA5q0AcojoKxdOwmhxStjhjOO35W997KRDBWhy/koQEBrL4s0
	G9Mb0slr457InLqEsyZmbDC6jiqjswcuJPQ==
X-Received: by 2002:a05:620a:468e:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8b5e47cd116mr353818085a.11.1764778376079;
        Wed, 03 Dec 2025 08:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG4cfQjQIEKj3oL685GCNF60vFdQ+dp9XuJDZh+9Clo7l0D/7i3PzHksj4n7pRHY6q6Y6+Dw==
X-Received: by 2002:a05:620a:468e:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8b5e47cd116mr353813185a.11.1764778375520;
        Wed, 03 Dec 2025 08:12:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b021cd2sm23688295e9.1.2025.12.03.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:12:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 17:12:39 +0100
Subject: [PATCH 2/3] ASoC: amd: acp-sdw-sof: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-asoc-wrong-cleanup-h-continued-v1-2-5142be4874fb@oss.qualcomm.com>
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
In-Reply-To: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8vLELv6iEJw4HQAetXguIPG9JhI9/hFFJQ4g3Jr7e+E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMGF8rwJf6F4HnGYCxTIAsD6B/mN7ZkafBO8Io
 3uPZi/fSGmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBhfAAKCRDBN2bmhouD
 13O8D/wLtDL1Y7runIIGFtzkOlA+CEkZuEA3RauUvgrbJF4p/8FKhG46UA5WnVSY+dofmzPguzv
 3JEMpkI9+2OIMe8BW0ylRhPhNPmU2lsnBdzFch4z68sSPrieBo9WYaxnjOE7KiH/TZkdIreTi2b
 Ez7MQrr3cn/MVlBiRT+9wAUgltXkNPuaskYDy0uAFe1DN8ae6h6+iEMuNfc15ax9AvMM/aPfcYO
 s8wgqXuyCsQJIKJs5voyDTSKYeAT5Ww0CKF79H8hNkx1tmkQ3PfiKXkaLsSE2N5MOAyfTn1U/Mv
 96SK177rnS/1MrueB6Ekxht6MahrFem/9MgFnmgGU0gd3q97+EsmebQlatPLc3v6glu0MHRX41o
 sWbEKLOSqB223g81Nx2oG52uPyaPmunvVYTJmsKUMMcTVFX46xRDhPDdb+8+bfGG2QApbFlNq6G
 Qfl7la6Io1fxmf2Ne1jY/vyxypQ1bbJNS30hQp8fbXeVdPZTwMhWWSHqu3Jwt1pyaXfJ1RdyWkW
 TWs6XLG89oTpyLkKoSiaEpo7AGNe/HEbD8LmpMyJHrV4piYy6h0d35wl89ibs0Abb7KjvKnfcKr
 /K5q9OMs/DBVuJim/9ayN3/+undx9vfMmYtX9Haf7QjwUZQEPRARuL1ODglBNWq/OVlPHupBtql
 7aMRCCcRdbr5Nyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEyOCBTYWx0ZWRfXwvi1/7Pd6AfK
 iIirI5oKPFBr0o89a4KdrxQ9vMFMZnHXeMTLrm5pjYI5lR+rbHIyp9b1Ia25FkVxQrQ9UPgoaWP
 MMBW96lWB9zuLU3fdGFeSwMdja8E01YfxoFgV/svOhwllzfXDLDf9IswLQ4gD4KX0IDMDoPsAMH
 ZvfUqqom8INFLpSyzNWUJwrKfVHlUQwqGyN+3tgbEesBnAwpuDdeQTvq2dFVTVPsSYVbeOdPYVk
 Kr/ZzhgH6bpjH9ibGMFuG+3iYyV4f/R2UpPiaSljXlSJnMpw/nDZEwQUUBmbHG/Icui7syYrbl/
 VRe3fXzeWGOfWs+tTFcTwfVxjXnerKHPS4DUwEiI0KjUkT1egkljUaSV3fFp7cwQ1DajqHRM0O4
 WCaBcZE1Ihs3RCsUww45KEwOKYcspA==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69306188 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G7cKtCAg_onYix8Q954A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: THBCjLYJ_-40rM-GTePmoqy4a66z0siv
X-Proofpoint-ORIG-GUID: THBCjLYJ_-40rM-GTePmoqy4a66z0siv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030128

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 5677ae63fca9..da815b3f6389 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -270,8 +270,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int sdw_be_num = 0, dmic_num = 0;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	struct asoc_sdw_endpoint *sof_ends __free(kfree) = NULL;
-	struct asoc_sdw_dailink *sof_dais __free(kfree) = NULL;
 	struct snd_soc_aux_dev *sof_aux;
 	struct snd_soc_codec_conf *codec_conf;
 	struct snd_soc_dai_link *dai_links;
@@ -289,12 +287,14 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	/* One per DAI link, worst case is a DAI link for every endpoint */
-	sof_dais = kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
+	struct asoc_sdw_dailink *sof_dais __free(kfree) =
+		kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
 	if (!sof_dais)
 		return -ENOMEM;
 
 	/* One per endpoint, ie. each DAI on each codec/amp */
-	sof_ends = kcalloc(num_ends, sizeof(*sof_ends), GFP_KERNEL);
+	struct asoc_sdw_endpoint *sof_ends __free(kfree) =
+		kcalloc(num_ends, sizeof(*sof_ends), GFP_KERNEL);
 	if (!sof_ends)
 		return -ENOMEM;
 

-- 
2.51.0

