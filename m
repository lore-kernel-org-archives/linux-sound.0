Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93805262D0C
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244133; cv=none; b=qwp6EmljaaeJ1nMYjx5RJu58ZjBulm0eISHRDl1A68BwJ4MTHciXru+9nvyD2w0NZGaGnloc1/1cGv0cBsAENRY+XskKMdo1RKO/Z3KArR3YtYLsrQGbxCzceJjKsmcDe5PPSxv0+WQSXY9WOEE2sJbVK81X2oytSKTduCzvsso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244133; c=relaxed/simple;
	bh=ikumlZWRZ31uELt9Gx3EsqoON5ydu7Y5Jeqw2vQ5WF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0saxk+4v4pATDXWdYB1KM7yVeA/k2sA2gA+i2SyK0jQjNz/95d1Lb7oHkrUpv2AjCua+O39XT/xglRjdOFtau2wBhS4DhkrBquwdHS1wXuW5e0Vu1DqoGWiaWr0cMTH8F3tE4xcbuaOOtlEqfMJH6lglCEBr/OveN0NcE+aX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEkNXS1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEkNXS1J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587B84Us022744
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3dcTOpjTe1
	fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=; b=WEkNXS1JyGowpcnX5o1Kz24uUbx
	ocTioMUqEMtjPrHMnR3d1EB+in+GKniTcndTOw5vZhzjn4kE/6dNJn2uSoRfGnyX
	tTdVaGc/nFyxSs6eapnXypsRRuEsb+pxTrATTGE5NwhZvb4UmoB4YU7pFSoVPGA2
	OvN+VBrAfR2ojOzKyDoIQGHQoWlVQ03MkIjrQwWpO/ZoP2vZloEO8WglNijWCJnh
	6G+exLHXPDohvabF2mjnuMZgh64UP2fPoSGfT44YOIR8SF55eAWwcSkpnmgsAfbX
	agyMUcnBNZRp4gBfQvqGjkWZmrUGWqzFPwcTuqaUtSuAuEa4WGlZ2X9KvkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapa7sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-728a71d8fd9so109851236d6.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244130; x=1757848930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3dcTOpjTe1fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=;
        b=RVNfwWt8adlRe3Liv3/a9jsj7Syqot0CoQo3bFDWlUoeRxn098ePU9Ybtgj8npeIM0
         3V6kgl9gZTOR8RYTzAbytqHLobL2DKR0mTYfJHzLIzHA6TucixpQM+HGGvXuBLUjPSsr
         S3xOIw5w3dVFyBs25ZFaWN1yEuQ5LLY/TjfKEnIn5bwZuuUgxAZKGtwhoqzd4Ge8ZNDd
         inyWrOmpEqYHsLdAuHQw7MRAw88CNCPpgvhmm7ooMuJFuz6+XT0sdHzV0mvoSLMieiPm
         cynNf5S2+799JM0CC67buD4ExLu1SMimz8QIS4yP/fP+rU9af7kwfg2SIX/CeXjctMi0
         dtRA==
X-Forwarded-Encrypted: i=1; AJvYcCUV5cvqc3q0pEEd6fA9atPZbJlF5/DwY9By/KHUPn5PF94/lfwpZV/FVCsH1QXYzwdw2oBWg66VICecxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5A+4NoQMeWB7D8WTp1CVElNKBawezmeeVEPlQo5F6fgZA18yp
	Jn8amFOAk2k5Y+7DPtL5OAZLv+wE5DmONpODzscr11cBI/sX8SCcSZmBH0D44xgRTmhOQOF9diq
	J1nw1rdKQXZ95rFwAzegv8gvJ4UIew7gmxgAK6fAKAepuiY4GIgADmgi124tHohu5Zw==
X-Gm-Gg: ASbGncs3iaUWQPLH2JKx90Wm8dNJ0uSfFwwmYRUxtLXoa2azHeyFQEPHJs96TV2caHR
	ExPWiHIoQx6yXDCBWEHd+9ECrzXRjsly0bYN9IyzvexZCbWjssKxwOVDuk80z6YAIrjeFWooWyz
	nLuwNquGdBPjF0oz5akIgzRmA6TIINTScpGFQH0dPSj3N8SUosu2pV0nuTJL8ytQl5nDfhgHnrc
	xTQhGcmFI8VyYs/4usSNhgo/ZMlvw22wc38rwNYY0CVHYdDr3jAZ/lV4eS/phQDn8OUyuGptCUk
	ESShKFucb2Q2YkB0JhwNen0a16/HKgh2EjMDhxPViX6cekjwdfPZ5A==
X-Received: by 2002:ad4:5f0f:0:b0:729:aa08:11f5 with SMTP id 6a1803df08f44-7394587e3b9mr46640646d6.64.1757244129821;
        Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDHwt5qnEpcgP82XhCscnP8nH4tNjR1T6aV/vYNlsL56jTGuuf4j007iTxpaxfSjb82GbGwA==
X-Received: by 2002:ad4:5f0f:0:b0:729:aa08:11f5 with SMTP id 6a1803df08f44-7394587e3b9mr46640416d6.64.1757244129416;
        Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 04/13] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Sun,  7 Sep 2025 12:21:51 +0100
Message-ID: <20250907112201.259405-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bd6ae2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Z3m9FAhpOwSnkYl4VZSOeT8R9fBxhScd
X-Proofpoint-ORIG-GUID: Z3m9FAhpOwSnkYl4VZSOeT8R9fBxhScd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX3+DaVoR5HI51
 TDYjKkobnDVbHVx8Ly+lntslVzNlSB+JcEdTOnyzXv5eg8yumlmRBbDZAM1ej+mhOaY3dgTIzvx
 Hd2rdAc8n9L3tEPqHFnI8h5vruQEs+G6Cu8+hCUcgMBsvFfOxFlbhhGKsgn1IUvMUciP8iEQS3k
 Rw46Orka5szVnHRjFCZZ74dRt8MV25zis/FAhR5r1MY+7XID9BGKo0tamahXEhfj1CK5N1NXV3F
 dBCe10RAMSVVb5QpzvR3U7m0a2FEwfLKgB4vOIsM/amfdDGCN+RX0CR2Bkrvbx8k+DcjuHumJ/a
 IqWISlHesHov9NcrozTSdqrJ6AsxNyb0OIl22h+gSnZ9tydfE5ltb6UEL2rGgKDW0EwfpYK+FNA
 vPD66Kjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c       | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..55c1db816534 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1360,6 +1360,18 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *slave)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, SDW_SCP_CTRL);
+	if (tmp < 0)
+		return tmp;
+
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK, tmp);
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 096213956d31..e6a3476bcef1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1089,6 +1089,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1128,6 +1130,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 
+static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.50.0

