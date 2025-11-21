Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF4346A0E
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735611; cv=none; b=NFH9pUr2i+3iBit68dPyxJYL/zY+VGeaX6qYpsIIM59SpARe7bQpGtkXu2V3IUGmAXaB7p6JazQ3bDCeK8hX2lM6nI11gAa5SyidM80W1rVk5lZ/41m5FKgUK6LQuOkJYMCkyi2zqEnSc7KY0THRcB9oKMLeqNsvU4qn6aSyNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735611; c=relaxed/simple;
	bh=U4FywKIkG2rvg7y7iad/LFg4R8Y1mdhMUb4lWGfn4cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9WlW0dmxSKrkX1fUqqB3vx4Z5JTzGkk8/RXDB0JdMe+iwlObYSKx+K4kTR9JMkldbvighxRwrS314RXrInNA6zaEXI7hQeWhcUoUsT1WQDWyhrhFn/mdxc1BLqhjU0n7rw2IE1Lk3b/GljjcTfPv0rdlwhrjR322/1dmb4b6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhJPpYRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQkfalj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhJPpYRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQkfalj3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8Yuft3139659
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 14:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=prI5P1v3X3riaBEd25Mdm8AVKgvicrHHr8j
	tFCy7A3Q=; b=QhJPpYRUan35YgOO+LxvVZL/Fl0nn/ZKYJYN+JoXnVZkHTWvoM1
	s7POpGV59WC/Wv7jUseMl74tKEpmdaryjVAa8zoRupzRyMeqg581YGqz1PYl6+jw
	HRjk6OmVVyybgS02F7digwTRbFRs2988oDu5nBrGnn1wzDGSBO0C4guF0D1dkS5P
	uW710jwCO8RaN6WKTGOimAYeZ+iBSnx2IS/2F7w5cSMCSNxHad8Sl0QdXNM90qe0
	h4p2YEqdhTRX0DV4VOwvHqcJya4csMm7379+PB4Nsyesir8wYTskLqAuoHvYpW/s
	VJBDNm8CfvU2EnBiU6rHSlxYUpFB+PZycaQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmpph79n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 14:33:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559eda577e9so1335539e0c.3
        for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 06:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763735608; x=1764340408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prI5P1v3X3riaBEd25Mdm8AVKgvicrHHr8jtFCy7A3Q=;
        b=BQkfalj3qXxHmOVTiO6uKnJPQrYG1yAtTPbvojCD04nPlNntDMWkSaut2yYDSToWYm
         ItjzZu84KwCFFKZh4GRGVsH0OMVi4Y6TASdw6/TRmUch4lnypk+Ws7vnQSlSqlShGJFm
         WUsexlYomVLi7fMR6vPM4JZzT4syf85poyWugjJsI8Wj4+UAWOgMiyvpnZ0v6jy7617l
         YHb4HbM4lazBFSQC9JWdFIoxkBGJfIo1nU3Qs5e+iXssuAh3abN8llVxI1wnsGPAXLAo
         Z9VOER1C3kPiV8rBQvF2N0meBJH2GdaXvkILIgVIpPB3iEFjnfKat06zcZ6cYJ3XQwPr
         SEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735608; x=1764340408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prI5P1v3X3riaBEd25Mdm8AVKgvicrHHr8jtFCy7A3Q=;
        b=Lpf+twBn+Ckxk9OhFj6yrYr5zlYSlEW5hIEkig2OlN/ea1XqfVeYDWq7WKFGDd2SFl
         1NxTpgURbaLaflvd0Tl8dE/FX00bMqwngrttLSpoolthNdSVGJHNt3vIgMkEGBETPG7R
         n6gdfU1VP6z2+4PTVUJ6VYimLG4MHxKpgfIy0B3cOQ5uJQVN1UbbS0v75nqYhdWZ+Lg4
         M0ilBBHyPVOaQrAl9NIS8K5DVA8GyV1tcgBR9HbnOGtGBxa18Bv6gkcsuiBYpISoZeus
         wfK9HF9ftSRWkR55M1GV27Ui+Gi2q87QhuiS9K57Tr26N/go1sGtGs4OjxIwvG51FkGS
         GzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmWHPdJSPbRRYNNaN+rjH6MFxfzjE6zPORwfLpl/VjP5vvlk+42aJKdRy1FppmJFV2lkBiJJM0FHUYiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpmqvnshwyyF/sCWjNs3cZozRt9xqZw85CRP2j5AZOe8EOl8U
	k4yPUNZJxwFH4N4fZwfX5ZVOHEOm9Ea8fHeBKhTphtaFsTpG1HwdpLnFqc6d0uUjn7L381fJ9Zo
	VnhWrbAfREO8Z5qUuw1dd2LLxCRbtQcw0K+5mBwusXx1JEnQlXj2fmdRRoSoLkK3awQ==
X-Gm-Gg: ASbGncurSrW38WJMdCvW/4ATVIsMSOoB16H91Pj1vfZJX+8Bq/nL8iP/AeiH0k1eeSs
	45T8rdBIQfK1J9jbnSk3MA/VjTxTmrfNSRUzJYXd8H8yDL7RNlVRvYjwqCvPQO/hRBZWahy5i/Q
	smODLg8YCKwNa/uz5yKaZ7b56Z4cebXhLLTWNMJ+4Di76Cmf9aNvF8egfWVFO6l4ThkIaaosTiS
	9WL+BmCscC2NEaHBd//FpK9R4ZMD3cwEV5BX5PWWv5aBAxDYXJRxqYa6lVEw7ztkWeVR+L+kxtN
	S8gDrhvl8J2aohY5qdehuVnTpFf76Mkm9M9sLlLRCRtG51fUI/sX6g/PmbesDNylUKOkeajiK9v
	NZkTiTv0JI6oeQXHZFfeNGks=
X-Received: by 2002:a05:6122:c81:b0:55b:305b:4e37 with SMTP id 71dfb90a1353d-55b8d7ca7e1mr704249e0c.18.1763735608118;
        Fri, 21 Nov 2025 06:33:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV/qX0HvnRYK2dYU4bkZLWA31JA/b6WROOy4136+E4wsjRQJk6XYLYcW8jPXzmG75a1eYTGg==
X-Received: by 2002:a05:6122:c81:b0:55b:305b:4e37 with SMTP id 71dfb90a1353d-55b8d7ca7e1mr704230e0c.18.1763735607654;
        Fri, 21 Nov 2025 06:33:27 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm10899760f8f.9.2025.11.21.06.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:33:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: shenghao-ding@ti.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: codecs: wcd934x: add explicit soundwire depenency
Date: Fri, 21 Nov 2025 14:32:58 +0000
Message-ID: <20251121143258.229138-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Vc4hQ6mcUZD_n9vq3e76rZwOKKAXkMaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNSBTYWx0ZWRfX/4Qv1hiKXEIy
 rpg8ygJlvVPJnXBTVo7gaZKW3O0eFZ9knVKr2lBXdBkRSpRC8x3cKJmkTrqhJlW8LjvGPT8NDWh
 XuL+Fx/jEy1pEtO+Ljoo1zzahGGlyl4Gxzz+TJ+nxz3whXU/N4XTXc6v54i3oW6h+gGOltvKf5Z
 7LshY0Ll+shwouCeGnL71qWmYZ0y6QS00Svkk79SxvV1ofMgdlP2jCXIVVkUD/o1l/iNDMUMIOx
 LfUIjJgNfdfZyIwXZSSEs5NF7LU7J7SdlBm2deqWOS+RdtopGfJ3EDAoN52uk3ec9SHRIbLRDz5
 BDTJQPgPbVc19SCaG8THrcincSWFCvBPJkVATLmHpIa75Wf73gbLBpb/QNGcK1nKh13afogwk0F
 vPByJz+v6uKNeDfcUXFWyLoOo7O7BA==
X-Proofpoint-GUID: Vc4hQ6mcUZD_n9vq3e76rZwOKKAXkMaL
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69207839 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=6iy2tyYm_o6rDDXbH3UA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210105

WCD934x provides register read/write interface to soundwire controller via
slimbus. Eventhough there was no direct compile time dependency for
this so far, however after adding common wcd functions this dependency
became explict.

We can either move the soundwire specific bits from wcd-common to wcd-sdw.c or
something on those lines or explicity add this dependency in Kconfig.
Moving this wcd-sdw can fix reported compile issue but it does not make
sense to select this codec without soundwire configs.
Given the fact that WCD934x is very much providing soundwire functionality
it is better to specify the soundwire dependency explicity in Kconfig
which should also fix the below compile time error with combination
of wcd934x a built-in and soundwire a module and also allow this codec
selection only when soundwire is available.

Error log:
wcd-common.c:undefiined reference to `sdw_write'
sound/soc/codecs/wcd-common.o: in function `wcd_bus_config':

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511210405.zd9wig5Z-lkp@intel.com/
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3f11b2c9cce8..65168c7aa385 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2254,6 +2254,7 @@ config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on COMMON_CLK
 	depends on SLIMBUS
+	depends on SOUNDWIRE || !SOUNDWIRE
 	select REGMAP_IRQ
 	select REGMAP_SLIMBUS
 	select SND_SOC_WCD_CLASSH
-- 
2.51.0

