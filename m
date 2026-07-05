Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0992FDC20
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783272220; cv=none; b=b/LxknticzD3C8TsF5foWA95GhjTdoSBOfGDJtyX9yLmpOrX+G8XwAelZZx2fRS+MvyztdRW8HdFthU0iuo0z+ZhC5Lr7Pq/OK0CyL+nleG1g4Up70t1v7JhuD4vbooIX6pBgtp3iUTv+iI5dW2pf1ZfTgrjKElY8RH3/V9FS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783272220; c=relaxed/simple;
	bh=EdaayfbS7qq3rEU+QMGMwkIwVzxFaUAzlHvGodRkVNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP06n2B++bcKQb5Yz+3EK/KdvDtoLW7MRN9GS6GRkaEJm6sxHRnrM+YZaTx32IDpcrDpm0X+wgq4ZW77OX1RJVQGxC/xnPc9CLfAWq2oYtRVC5esLGV2dsdtWcGVhgm5aCkNVKAm/5eIL0fXSwaRIjyi09Vy3L2WOkKiRomsAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5cIk1Nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUmq1LAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5cIk1Nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUmq1LAh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Mjtdm4092232
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 17:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4LYO0KJ0Fk
	gBtSAGBYQCbWONk0/lVRRlOaXENHlC0Q=; b=W5cIk1NcVNKYhcgvUOxgY01agRM
	rmvAlIDPq41gOAHtTzr+MsGqYlNEK1xnvwxTSoVtP5E2UclWb9JNtesZh1EbaG68
	dWOzESuqve26E3brHuyxyxzIkH9LCMtqIwzmWYgazNP8iPNhgBDJztvm2q7IEsm3
	TIFofmFYquVybM74WaLpRno5cFpPdYIj+cLutb2ghUVHwGY1NQnL9zn+LptxSpVe
	BxMiIuMCocTqDm3xVolQ5SXx9mJoKcO1tMzqkRlnJ43Pc2plfLbotmRH4AFsEtdN
	Y38aITKT8VseUodgQ9BM/HxbrhdeNgFLgEcyP/89Sm6IC8OjfImWFl7b8tQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek0m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 17:23:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso179922185a.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272218; x=1783877018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4LYO0KJ0FkgBtSAGBYQCbWONk0/lVRRlOaXENHlC0Q=;
        b=hUmq1LAhpyQmTCQPcfqbQiyzTwuT7fLVROWg7jrkNkXI3b6DYCX2F7dznmNXgayR1x
         5SPeP56rmhOF3jBTjvN7eSbEJXdr+8IbVDS5C+stTnX0Vsb5DYoy+GQACZWCRS3fcuSd
         BE+S3v72wub1tBMDinLAHDE4DQckMo0+ij8OmSnPPd3/Rp/BJOxJ/C+Wk/PMfJ+Orzih
         Qc1gtExLJjPQLK+6yxF7sFZG2Z6le7RIp1Ycmg0b0TYLkCqnwYPm/goKsv6xcEDPhtmP
         bYt1IiyH058FbN/Em9PkLtY5NpdMR+qy1QzejLRwErlHi4Vny055yyBWQG8iMG7P4fUQ
         R2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272218; x=1783877018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4LYO0KJ0FkgBtSAGBYQCbWONk0/lVRRlOaXENHlC0Q=;
        b=n4PBJq57cL4yoladHxlWRIbynuK9J4G+MPsNOwwCahr3nNZWuSlCpQZYJLvdl738m0
         VcuyGpkNB3bpqfNuu27AiWa5If38muLpFvuoNyh13h4kyt4z+XdzbI5A68k9MGCVkn7X
         tmIwUSOpHUpkCTSX3WJAbDnfqPF/JB5qNlpLyhJaKeXpNk4k4RbLgbPIMs7G0pkhKP6a
         pAjguEtz7h2nm2ocaR3TchkSSfF+sngGzTxF5EqIveIqRWjmJjDzEejakTV3+mpuL6pC
         KItx1MrnRZxC9lf6+raZ71yo3POqJpv8QkCtWHHUjCOweefrxRycaFFDE0ambkhrU7cv
         ttfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2BP8E+aUnMLDl7ec+mddRm+cUycG9Wk/IRB0FExNz/Wv8wtai1CEDFnVpueN3OblAcikexCSqy5i7pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKXW4wFaoylrvPQlbSm8E+GqppDEwuOkxSKnw/bZ+z+ZQYbkF
	ng5JepfsHlFbCoGrJGuYJoa+pQDSLvps3isa9YOTvPF+q3r8afmnWbtIcMUdyM3XKYG4RhoE2Qc
	NznPlSvK2OKbSrhTZHR+94bBQgDbHE7Sf25ZB7Vms+uWXoY7NCmUT6vhZfp2v60e/fg==
X-Gm-Gg: AfdE7ckZWJjcMxCFg7F7rS3JwW/A+PMGhCHKJfSslmmhf+nCmzQefIrTE+SxuPt7Tgw
	cN3GmsB40o1WqMVs45vtMtrkq5Ucuxzths8lB4ouVy8pnWrN8d+b8bR5PhpRZcuIljVN5UPmj3A
	r0KmtxWxvwi0EkvIeBUWnNzJqManl9FgS5EO4TQWYPtLE1HunFq2YK5AY+h5IJ0M2x5UYZzAgQn
	5FTVczUrLbSv0RiCXPMro5YNsOjJ5lX0wTwsxt3HpB1k1tf+hVC91j91YC7ACK9WZ8mmqOz6N4/
	xAqm1D/MNz+180tMuLXSan3nORV50xyzrC0p03+WQn+Sf3lMb52nyklIgRcl8TQ3DcNR3lPVkmP
	HJ/aE4AVxN6p7DEX9p5Pt21zNUtE=
X-Received: by 2002:a05:620a:4590:b0:92e:8a88:ab27 with SMTP id af79cd13be357-92e9a35c0acmr1064788985a.14.1783272218073;
        Sun, 05 Jul 2026 10:23:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:92e:8a88:ab27 with SMTP id af79cd13be357-92e9a35c0acmr1064781785a.14.1783272216956;
        Sun, 05 Jul 2026 10:23:36 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm365840195e9.13.2026.07.05.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:23:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: codecs: es9356: Constify regmap_sdw_mbq_cfg
Date: Sun,  5 Jul 2026 19:23:27 +0200
Message-ID: <20260705172325.118926-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EdaayfbS7qq3rEU+QMGMwkIwVzxFaUAzlHvGodRkVNM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpMOJnaga3x/m/ed7/YLjQ6CeQ3jQtLVC9szN
 mqVYB+ItAiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTDgAKCRDBN2bmhouD
 1z3OEACT/cBIcmKBkj2sEJcLkzgCFmq4xGOqqNnB+1g2oqri/eWn9TX5EgKifJfDq06DS6iYC/o
 TC8T/dS7DQbO2N+YOK/0jPatz+dE7zKlR0f38JOz1E4Fteb+HFLoti2HkXW54OHFQGVNdV70AFd
 zLznXwPp1QvrbqttO0ddVz1fyCKoL3WGgDAxO0doW5ShW81d7sWqMU8SSYqyGld7Lf9+r1/Jmn3
 DjHtH6i8uqOy0SYYSMxqwkMVfkmE7a8b1Jq8bR9LW2rqh3+9YwfAyc2b5zYEzB4TeM7MZTCsWtD
 lHw8GB4b10d8mcD4S454V5fGucSf/xRIpG2J92/lJ2Hmd5HqfVinZrWstcAM/rBv7e7xAYKRbBh
 Exka5PTREw2OY69yUc9OnGABdRSCjoD0SzPpNhODyHHUZEmUpJKUSUP13i43iva9bjBGgu6CRjC
 QLiMhKwVZcvGxl8dCCM+9H//gIcgV7OTP488YvpHOraSFRWg2Jr0RE841xfn3nN1DI7GafW6/WH
 m+btxu2AHMNyS4Yh6nMfc1CqiKWyHOIilV94qdGr656lOBLOR7pvmFolOd9Y5b83ZrGAjv7WRzr
 +49BDcOjFR+cj2iAKPZfAj9+UMpoUsr3FFaQhpI5BjMucjLxynQr93KhV+xEuosdsX3QqZeoZcX zn93j5rMMdMQSPg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX9P7v3V/qQzk5
 HNqwSXaJ6zRHE3U06j5g0c00BL/uGE+cwHaZoIldF2FODCX7FK5ipDWyvcVeosM4WhLH3nfcJdX
 LbK4zkzNE/sj7LwFxNsMYNEH8HkEJzM=
X-Proofpoint-GUID: ie-Rc3yHlBAFDIukw0ejiXi13un_fFzo
X-Proofpoint-ORIG-GUID: ie-Rc3yHlBAFDIukw0ejiXi13un_fFzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfXwBZ2KR+OFCcE
 XGhxLe+wyx4/J8vH1VjIfEJTDCHg2z/ih5buFTWbA71llBw4Er6BlDQimhbyV/J7MzxErbQVK0n
 IPbN+FUmTwA36mEZqJ2uIUAMwPsFTXYFJou5aSCCV1DL5qka3hKj7dqNU1eAJMpkdqfz0DF9R6m
 xOjHGJSTIK9FlvYc2BGfg8zXuwDr0Dm+WLTXjoVx4w+qb4koJ6W0TUbQA4tcU47nrL4WeRBEzyO
 46GJIpet+rEAmLY5qyNXPZWXRP/alvKeYGDd8Uac3SUYzWJJdERwmFB9iTZBZrrpTNU791OS7p1
 a+c3/tW4PVu8eI7v4elQtBTOt1fYobbdh0q2yNW4hM1Wh1SIXYbi79m2qHDTlN9woRWrUknDEAw
 VIy83gg35FjA1DfcxO4DtLZ7I/vm3cBMJynrZXNJMhaApvMl4XWlKkU6hF909r/pddxlt/J7lB6
 E/XQto5/U/SGP8xZkpw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a931a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=x8S3Fr8Iud8vDYM-HtcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050187

Static 'struct regmap_sdw_mbq_cfg' is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/codecs/es9356.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 1122455aab77..f574b3d6cb3c 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -671,7 +671,7 @@ static int es9356_sdca_mbq_size(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_sdw_mbq_cfg es9356_mbq_config = {
+static const struct regmap_sdw_mbq_cfg es9356_mbq_config = {
 	.mbq_size = es9356_sdca_mbq_size,
 };
 
-- 
2.53.0

