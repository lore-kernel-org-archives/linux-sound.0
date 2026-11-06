Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943819;
	b=edN8QH/gwpspeBraeph5IXTpjeOrpIHSV+O229+zs8pkhOvsud/mYAe9iUe1oKc92shb
	 BX6+ChLoEzZZ7KoqsJ2gtSoTsqBYQHs/MVpzQvuZjgOo2CIPN1xcx/Eym9KKz+irbyB+r
	 70rPJ4B3t2O0q5lzN/NQOy0MKJhQ04q4kGL+DFZGQ1zxMfBNHBfDwut5sDX4LmAPyYZTb
	 tTl8WmDytJ3S2Pu7ZtSae3BeZ05wUDQ7r3KFpklglFblvJjrE5hj2mbaMuoDc5sIFEmoJ
	 lZFDn2ONu7ot1q4FECKjNqmKhXm41xrlOsWf7l03h5UrLZaK00YkwyB3EH86OOXhMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
	b=rHx3aRocPx3g1YisgVCWnAMgYvLluh27dSowxZe43IztTitwYr+XpKQxNh50oAfi4nEr
	 xa+Tu1wZPgMBYoqii5h/dJ+zHksqrcpXHdJ4XmFPSmX3rOhkTSwZgsEdtdQnyy83EIuTt
	 q49N/gUTVu+XsNoyIRARVIXV+v6f0VR5n1woLVwl25hZjphnysDq7cLKtB/W8IHkrBFII
	 SpwIyv6epjMzoM/RHmSORE2hEZO63xG7UfjIXa4qqEahUVdqkz4sK/9gfxQLhGISYjdCq
	 wnRotLNXlQ33p4NR8Ysf2qwmjq2VjjkBPZ8vhaFvMFMhNs+pMjMUBNpCS56TC4Qovzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ONuOYru/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ9+HyqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE26E606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE26E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONuOYru/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ9+HyqX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6401xW3856622
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 05:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0AYPyGhXJjP
	i7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=; b=ONuOYru/mlLgps54ZxIiXGxWDZ2
	Q7zKIOb7Tev3vHVwjaRLeSuOoyZcVUmrTtlp8/lwRHFkTQPTp22gE+iy4Q3pu8Jf
	8OBqJ3HQMvkjt2Jwh6WpEMZ0vlhNuOjIv+u9AtxwVVItPuq832JqvF49eL1jLQiv
	okduLc6DHLJKimzqxsz3xE00rhiv5tSwF5OVgJZKPBeVk2O4RvyI2rzLNlkQRXEC
	h/OiOeKMQb1neyPo/N7aLpSFtKPpaAfHlhJyeLgJOynJHvAnoJxFMvZ/ZUxfaR0m
	fawM5xqI6za2sf6IjxIQPH3TUB6evgfJVr/kcw66AYJGgBpIO5n7a/Ezd2g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9s4sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 05:43:38 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b12b209c4dso2702417b3.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943817; x=1794548617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
        b=QQ9+HyqXBkUtqeCFKopjSAIw5P12Xus/dId9lzrOZKAZRMGLVQ8vEdlUZsRhr+6C9l
         r5Tr4d8KlrUzETo3gcCAvjnaHYaiK/kb+APnKO/jyQKCaPjtWACJq13rR94ZEKJNmuHP
         TTbJBDSUMv91xLMqAJb0oNwrFFjLsX7Dt2RLC8u22vSM63PAvERey7PL5JjIDX7y0SZo
         1U9+cOJBOaDx/RbA8C+qbn+PQSMxvQrL+O0SCangDhYjPlURG7pVd4dRK54GUSOVCAMo
         fR/cFtqCTrdX58Mvcyj8a16v1zcws6bYomIVcOdCD3vKr+RuHCBB78jyXbDO31ArNmO8
         FfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943817; x=1794548617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
        b=FaxWkUDiX9+RfylqhKBEjKqIChUnxV0DDXVWOHKNH3Os201YABluEs28xf1wpkci1+
         g7pCbt131c3lSQgiQb1lqU0Hwe/LyMDZ9QWnTOcweh0J75mxpslXpcopcbcKHtU9SoOR
         wuZtnCd/l3GdaZAtsiww6eXAyas2iie7FscCj4DBJ4FG3XCwIx/BL4jAkakp5yM+gOAx
         5Oh3/OzzpAm1wZS7R4STDasaCqduRK1WqQH0cLFoNeEKWjT/jKlPqXCa3loQpCS6ysIu
         Yv01EC98jf0LuQw8h5DRDpctP8b9dz/1lFQUncQH8Fgbvos2MR103i1ZXf4ZVuCXp6di
         Du8A==
X-Forwarded-Encrypted: i=1; AL+hErHm57gMUx7fBeeCZvt+Xrg5/1t9tpdt1vknt5CKWkp5Hshr6jkG6WO7pQBlNkdBzW46VhrqXK2k5EP6gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/WVXFUhxk3Zm5Qu4E0P4pWBOZuGQaLzSmtbP9FGjiy2nv82eFc
	Ix+U/jPJbFFusYpBNHi2cBpXYOqM9Dm4I5AgxJq0pfy47QzZLz1TMAqt1K2kNyechEwaSXLQA4D
	0pwdFATaBGfpjMIpxdJCOto2/feNRcx0al3THN7bjnXPLQSIkWdZzDtf0v/BP0EpRUg==
X-Gm-Gg: AYBFou0vIQF6EPrM5Qu65gu7OMPRH2mZl1xDjeZzGfTCja77hvncTCMPjRPk1A8DIg8
	/X9OzjSauEFmCDJnWf7oJHIco3sxqZuf+m7Y2Z9aAIlTt+SYDB8q9DnRvgh63BQHQ0FBYHN7znt
	NJHyVsiHootxiyU2OOKzFqqW+c4uDlt8arztHcvtjGZgk7ShlBlALu9iweKl7okSpTVxUskL5vc
	h9s4Qj0wmxqP3fQ3qnsczmkUDEK9TZFAVTvk3B21yOuXkV6bCX3yWpbE+BDkC3KSNPP/LP0Xgoh
	oU5V2kL34OdURxs8jSZ/Ec5zxK7cKlSbF2BfUopWq1Ayku2vsbu21DGGY7/hSqBL1ONtXoj6Gy2
	6DmG04GQYFo1/pg75ETbsjwPhCEv+951UDEEMiepeKvMiU5QR1kK2nHLMqaKgYa/C01TzsACxEk
	ttkmMY1KMRT+qv5ZrGroKovBmSlEQTjRE4GQ==
X-Received: by 2002:a05:690c:6210:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b3419b7e4emr7126717b3.58.1793943817242;
        Thu, 05 Nov 2026 21:43:37 -0800 (PST)
X-Received: by 2002:a05:690c:6210:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b3419b7e4emr7126607b3.58.1793943816751;
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: soc-core: copy the DAI link names into the card
Date: Fri,  6 Nov 2026 00:43:32 -0500
Message-ID: <20261106054333.2748248-2-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX5m9CLTlA4dGa
 sJ3kjck6B97YiiPulAi57JMh/XA/X/Ne9DKUbbMUlo7Sq9TNVNPAcLx6qM38Yz+alx4mA2HE7w0
 fzvBFyor+rNm0kyUcB2oyqrTTvGDh4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX/CLbFLkjjs/M
 kFKK1n6UBK5VkEo0fSfevxSY2dMR+jwDBCMG7jR97kZ1k+EmykgHmwSAwqJzbqoIoIlpwSMEW31
 jW5Nr9f+12+DDSDyIUI9C3n5OPcC1NwZXG6sSqpogrgcV+vlTiaCiFyH0YPjLqR4xBKwHwVn8C7
 QsEKSm+vcWeELLWe3ne8S0S7OSnI8hWI02F3I17XrITIcMnLjrk+B/nK5rS/lUAb6db78zV7AFw
 w0XjQVBpfXcor1n7IbCk62bYUnCk73xjf2pQfK072Zn2+ltDJ3hgeG8OEtLeJiak2cEiyO3ceYc
 jaZiZP/kU6tmbMdtY9YdtPZMckiHWb3UYxiADZZPO8giY4vFGec7adaMWq8KEw71d2xXMb2HtRZ
 awzcHRoDfUbPBWBXcm+8VGatMbzHU1gCCzuxOXGj54+EKf1nXVWn5szcvX5P7ntDOVrz8I19Ial
 yh/7gKHuLQoJLKzhFRA==
X-Proofpoint-ORIG-GUID: oB5DcF8iWJUjqChUqXLpJS9M5iVPwjLp
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed690a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UCKFswv1oFZCIU6oLeUA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: oB5DcF8iWJUjqChUqXLpJS9M5iVPwjLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

snd_soc_of_get_dai_link_codecs() and snd_soc_of_get_dai_link_cpus()
keep a DAI name owned by the component, which is freed when the
component unbinds, so the card cannot bind again afterwards.

Copy the name onto the card device, as simple-card and audio-graph-card
do since commit aa173b70d372 ("ASoC: generic: keep fallback dai_name
stable across rebind").

Fixes: e894efef9ac7 ("ASoC: core: add support to card rebind")
Fixes: 900dedd7e47c ("ASoC: Introduce snd_soc_of_get_dai_link_cpus")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f33bece378b61..0e62965e35aaa 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3253,6 +3253,18 @@ void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link)
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_codecs);
 
+/* dai_name belongs to the component, which can unbind before the card. */
+static int snd_soc_of_dup_dai_name(struct device *dev,
+				   struct snd_soc_dai_link_component *dlc)
+{
+	if (!dlc->dai_name)
+		return 0;
+
+	dlc->dai_name = devm_kstrdup_const(dev, dlc->dai_name, GFP_KERNEL);
+
+	return dlc->dai_name ? 0 : -ENOMEM;
+}
+
 /*
  * snd_soc_of_get_dai_link_codecs - Parse a list of CODECs in the devicetree
  * @dev: Card device
@@ -3282,6 +3294,8 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 	/* Parse the list */
 	for_each_link_codecs(dai_link, index, component) {
 		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
+		if (!ret)
+			ret = snd_soc_of_dup_dai_name(dev, component);
 		if (ret)
 			goto err;
 	}
@@ -3337,6 +3351,8 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
 		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
+		if (!ret)
+			ret = snd_soc_of_dup_dai_name(dev, component);
 		if (ret)
 			goto err;
 	}
-- 
2.47.3

