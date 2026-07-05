Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A07243376
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783272218; cv=none; b=fGw278JEnuNbeLvP536RQKqAzNj5dLu3VM7Beyt5PvqYNosuCBNOM2WGOyqBhrdRG5qSmXB+CWrlmuvcu6D5En0xlnHCU3Q6zybmifcGCHE1f/MgvshlxxjidR3aUIJMkPi7t7K5vQ2CM8qGT5kwGjRGr3QfDlsqSsSZMy6D70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783272218; c=relaxed/simple;
	bh=c6bm1dsiT0qu8+eII7cc1Rx67c2BU6sOtQgyUeNcf3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qauz4n7z0cwl3y9jiGZEEYEkJ2GsgCwEMLNc++6TFzvjD3j8ecMs379RW6YzhV4ZthhTXbUOS3UypBLvHs6WJUMrrpmoV/ijsSiPI2SrJgTXF8DOV9aWUGiKf3Tn3uwjREQK56xBnE68qrpj4xLLycWJEJl1TWIH5nA2UAU0Ra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJHctmdS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2qNC/98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJHctmdS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2qNC/98"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6654b5On750003
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 17:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=g7B8TrormH567/TTPoHuj+TNmaAfVPNXio7
	B8SeVx6k=; b=DJHctmdSbBWYfkrBTlhAMlof1IwZs2AvFIQRU1Y7u/OMXsaokEV
	kjju861Noe5lm7PQx+ZGcpYOdJwSKzjUjVjDe9q793RrJ1VjAqdpuoVw/cVpfWM0
	DOrfaN53Oblf3pNg9OUVDEJS3XjgbcMJ/SkmKdy7OPsxZW9gnTl1E015QVhHPkT4
	1NaXiPXCY3pqcwgwCDy9J5fAMCKq/4/6y9RsvzqSsbUWnqQVHG9N39YmzhbGvyBY
	pBkIZVHRes/86UHugLR99p+HwC8mjVl85FBzyBdz0/xPRPdqugmMGwiXunFoY/QK
	7sx1toTgWw2sTHGBxJ3g0O+7fWJpSCG7nsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3b37a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 17:23:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso272691885a.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272215; x=1783877015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7B8TrormH567/TTPoHuj+TNmaAfVPNXio7B8SeVx6k=;
        b=Z2qNC/98LsDiQV5bGff7MIX98Pd1g/ZDSzrgvEXkae6xJiBFA+iedM2l03W8h5QBpV
         maqVj2XcbnfWLPWD3qQMUu6PaGAPRgAiDC37nb0bEd0BAbkoH50FTuNW32ogotQMVwOR
         EJsFDypPywbOhz0YDVakK8IKjfKQXUwIdKumc8oV5brIlNoeNgX5ozojdu9TET35UVbS
         99V8RfSrNFLwzeDzOzmG/kziYDUXdWa7IcxiW+oo+CKRm7RJunM/KRlv8YD0PXcsGjH3
         US0tVyeV5OgaQmfwUHak3COsr5F7n9U1ien7Ox90Zjbje93h6VbV3xHXTOV7j/1H2RSM
         UJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272215; x=1783877015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7B8TrormH567/TTPoHuj+TNmaAfVPNXio7B8SeVx6k=;
        b=PKlSZerAUP/RMiNxW1UH/oLHSrUJPprg2kC9ezTwcegGPZUcP9gSETafRjMghb7iPZ
         0f0LTUbxWkNJi/fE6NdxM5h2MnD1Z2K4YC/aM0ol443JxGZ0E6NjS6Vu9FWwvdXX73qu
         g3BkwUHYrs92673T874xR3wC+pOO5ClETP2blrVjuqyIJ8e38sIlB2W0RBB7hnfDCr59
         /UujYFvOgoTwmi4dTQRS/uBjTDfApr1DQQ0gzUIydiD0ldtci1atvE/yEYmzlheHq4G7
         Kj2OyOReAhwLYdPnaDVLTIRAf7i2Tn8xRun8kWIDfOQxJ/NIy3HHXcYUFDw2T7envyx6
         T/zg==
X-Forwarded-Encrypted: i=1; AHgh+RrGjAvacOhIobel7yUcafDLytVd2G69mFWZyP3vtuJLTSflTYpIwV0vxZpDDBtMpvjfOFVQUzg5qpx32Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHm6o4YomXxIzgKU9PibQKKdltqt6qE5ESKDFMgLrJ9LMyqB1d
	IXCyJYgMNqqB0ALF4Ikc03fDgk3uNmhIGXdolJd2n6cn+wNXSCV7HRQfMeuykymozyPO4p3Li8A
	8aYVRBqgjaCJadCLFiviEa/GcRmUBqaON4L2fSgLPs+inBweB/gkIMgW1Y43+UWBT7w==
X-Gm-Gg: AfdE7clc3wu0z7a5F2oM39uchB07iQI46pG306tqRVrsCLBWCjLbJQPFEiHyJTJuG5t
	8Z7xyywe6yg4Eqq/yRcMJhhzzFxQvQvOdNNCyCJI+J1556X2H3SgroTzrpi1igcsmpq9TwZStEH
	q9VyXbBnejccRBJKkzIqpzrHzXpKRwp+uLgqF7P8CU5DomqkddT8grsZ0WCBgbb5YKT+W4TZs+G
	yk+Q2uONspw1hvDqbts8VIPS+p+0cyi3vqkO9HfMSc51cDC3ZTiB9OcbwCy3oIWtdtpCS49n8vi
	6hEa+n+ySjrXWi3w3j/v0aKMIEtNsXvK6wKbCcrI1ON8ZSNQYX26Ocyw4dGX7E2Q9IeMK8whhxq
	u7FKoc/rn1Fcksdv0mWzXzhA35Do=
X-Received: by 2002:a05:620a:468f:b0:92e:754e:226c with SMTP id af79cd13be357-92e8b5d77f0mr1438784385a.44.1783272215176;
        Sun, 05 Jul 2026 10:23:35 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:92e:754e:226c with SMTP id af79cd13be357-92e8b5d77f0mr1438781785a.44.1783272214738;
        Sun, 05 Jul 2026 10:23:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm365840195e9.13.2026.07.05.10.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:23:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate
Date: Sun,  5 Jul 2026 19:23:26 +0200
Message-ID: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=c6bm1dsiT0qu8+eII7cc1Rx67c2BU6sOtQgyUeNcf3g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpMNJX9Nw6UMueesp8jAoVeKYHs7wIeEouITc
 R0JZszRoy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTDQAKCRDBN2bmhouD
 1x+cD/9Z+y6QVfiPBRM1knLHodV4nbFmdlDDSXA9INJA5AF+H30pt+h0pNEU0ktYESRpaYUa3VT
 VtQJP8oXXAWzaP9qu97ztD6baLRbjTobXGRluJzg+7Fiks1iQ17loPapzDbsFSJDF1BpD3plIwG
 xaVmXXtIQ5Us2gm+n+jgFLjGZJjxoiQ2CH7Y96VZPLxFMjQ5g9fgNHHbYeathpniu7CEIXX5QYw
 cAQVD145RUjejqaGtgs+bQjYcrn71iCc3FV6j0ajrmuDDhDiEedMHY4e/yWO3lTbkzDBlg26aIx
 usC1ouG3Uh2jDLTIhXTaLRBZuZMGoq17/m5e6f1r3WXYXyt8q4stRUAS9/CZDg13F3xCt70GI4O
 Nwzrwu38yBjCA62iXcr5XU/qsfOyHJutqTs/Z1z+oQckif1kcLy6FK8jbwY5ok3mVs8ywzsMGio
 aT1e08aAieQsI8U7V35Rp5fgXeWToFRYO42uY3QZuRs0WMxjR25SkQxu8tvT7xcw4lJ9rCrtkz0
 qrt8Eck2uct6iMeicT4vm+1K80O6L7va9Yp34erK1D/MrETP/aLd9QX7RyWGYT/8tYl+2u+Sj28
 RN2Aqmc3QrdJFci3nDPe9bfyGsssE4E+xZwg1WzGOvdFvyMV1FsFS+9n0pTJ92YkPbHZGWqlduf ES8YwET0OMTjf0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfXzGrPhLgvtnvU
 nG17uUwd/Qspsmw9fi5j9aMlv7HHkVmOa//m/TAchYEZuH8NidwgK6DwaP4m7ogx6Gp+KVbYr92
 JJinRy5Drm0YYy0GoF+ZSGcJZQuZX8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfXwxKhP+BICFH+
 1GuCZJLjQGfMTT2wIA5eb5pcTcOAHbWf0Hoy2zC9ICM/l/VRa//45yF8PNpLRm7MC9AY5QvPaC4
 Ofmr1qfmiuaOHRZWeMbNXhK+4l39lmycEXItCvMdXsAFizwmnHGrEu4MtYnu7Z4Qc+gnH0+FKyB
 tB5g3lKEgoGX2zyQ+UUuFKcOIXuDhv2GamR5F8/AkVTi8u+k+ZmAfjZggYC7QmYDpeHeWljG7ty
 GSSgopVEUdzMABQZhCcetRTnlHZaViuB8BIYr0YFOhMN26ViqxCemEMBZG3a4TaSoLun+uXyPaq
 ZCzF3s4xLFHMG1BCZCxHrrQSXnPovEv/3714TXyHRiR8Kyq+z/nWraOjFQ5C/QZq2yJ3Nn2xPN8
 Rv5KCJ87ddijjNWHjHv5nobo4olgiJXhJ4MbN7WxksdOmHBr+tiWK/jfFnd7VehD5lgnXHvHvkg
 x3p+8mfwtjcCIAZ0KrQ==
X-Proofpoint-GUID: Vutg-c0X_jZhAfkmkDzBxFUTVtrQl7u_
X-Proofpoint-ORIG-GUID: Vutg-c0X_jZhAfkmkDzBxFUTVtrQl7u_
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a9318 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2Cth1FtITvL5ni5luVUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050187

devm_clk_get() and clk_register_fixed_rate() do not return NULL (only
valid clock or ERR pointer), so simplify the code to drop redundant
IS_ERR_OR_NULL().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/renesas/rcar/adg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 53efd1be5139..2a74d89ba39d 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -565,7 +565,7 @@ static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
 	struct clk *clk;
 
 	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
-	if (IS_ERR_OR_NULL(clk)) {
+	if (IS_ERR(clk)) {
 		dev_err(dev, "create null clk error\n");
 		return ERR_CAST(clk);
 	}
@@ -618,7 +618,7 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	 * No "adg" is not error
 	 */
 	clk = devm_clk_get(dev, "adg");
-	if (IS_ERR_OR_NULL(clk))
+	if (IS_ERR(clk))
 		clk = rsnd_adg_null_clk_get(priv);
 	adg->adg = clk;
 
@@ -626,9 +626,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	for (i = 0; i < clkin_size; i++) {
 		clk = devm_clk_get(dev, clkin_name[i]);
 
-		if (IS_ERR_OR_NULL(clk))
+		if (IS_ERR(clk))
 			clk = rsnd_adg_null_clk_get(priv);
-		if (IS_ERR_OR_NULL(clk))
+		if (IS_ERR(clk))
 			goto err;
 
 		adg->clkin[i] = clk;
-- 
2.53.0

