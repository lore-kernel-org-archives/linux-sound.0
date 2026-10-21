Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578363;
	b=h030wyth24vdI7amSY4h/15lXM/y3sDNnr9Ch/M6qrQ9ubCvXXLgDw53u7ad1C+W+mbW
	 FNhStqc/Mtt94iyj4k/WUOH43flQY7bHtTA2KV1T+3GBKuxti/kavkYTVJaaDe/4tswwG
	 UcXVEAIQcj5YlvZs2XIk1Kpn5ko7P5vzCMQnPxTP3m+Vp3maaWqAii/oPaoliGslVd2OX
	 vJ4sv6GLIUr/P+ycjA6x6nywbAggEWd7Bs9YjMJBAdzcDDNVsvwowQuHdydE5QdyJ3bwD
	 dkignrly23HpNbDwtbRSeLMFUmLRxzci/azSmcIEZgzMNw9ZJkwS6khkSBWqCw27vPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
	b=veLk7VAWv++j8SX6tunPWMQjd7iwwZ3EYrOucRSV5nH1aB7KkCBF2XfJ3dETr/qRVFDl
	 KGpo8Z/gESo9ml+sG6Qk5mEkvhxu3lGLy64xQq8F+vZt32o1jHcUohzoO38zj6p7Fe7RI
	 43+67bG4UZto4RmsNwrhtlC2V1YgNry5rKQ7hF7mexVcmJ/u9IveORr+AUKFfdhd9ycEh
	 45hlCtw/ZqZRi/OicpbMMpsGZBYUlXkLlYDKuwi9quZd4TW+FFYz9Arw3QPCvotIDg7Yd
	 JvXu/NYo82HbBJaN9gU89wcivkTDpbU8f0rA1YfC50gopTzgmQaThHj+qjvWpEUh4Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bik8YoFl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggFU42aL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890D606A322
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8890D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bik8YoFl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggFU42aL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LANjQR885371
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/
	QzH1dAKk=; b=bik8YoFlOy/6XUIu3N7Ncy1snVNmCBlxPWuZg+YgaMIrbxnIRCJ
	Px3O4k7KKJBF0/HrSJlvvdGLtwUK4zyIvxKZqhMVotoDsAB+bVIwc+OYyS/eZik9
	y//8ljVNRmMogcsLYw6ShiKAxd4/sBdKigp57ZZWTrvLwRas+on3xcPzw7yMquxQ
	IJoIAQiy1i5jYeMFBIznEyMksNLP1Flt4kN5Cb6T8K0acEhShdJwhoZ9F26gSPlK
	UIVD2/WurYV4+6rQbEaDPKdbnDwSHVvv4Pb+MOz4hxuhwRxy00fCR1OB6NSEpoMR
	GV948w/UknOBAjAhSbmuv40B+RiAsvk+ZEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkf5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:26:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so5724275ad.2
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 03:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578360; x=1793183160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
        b=ggFU42aLM7U6CZwGVFyMGogFmGxCzqaQrTUtYUQnfCLgdFe5bTQxp5atbZj33GNkGt
         AgfLxkH5H/FhMLqjfmr8QOhVXnT3FBg9TX69WU7GEGG6++gduAwmFhj6LQZJyGkvn7y2
         HgMi9i5WWFr1Zppd48lV0k60j6QHP8kz28Ox3QLbpagQ93k436qU1awr+ikFWEg9epB0
         N4Xe7SGuRwXYPpz9mU60nwgcNkZrDlCKexZnbQDRMl3cXpoHcpb4V3SxtZCSXankwm1h
         T8x/PzOZl3tYpfkQIvzPT1Muc28XWkIEAdSflwSAQklo7cNZi9tkMkm5YahYj5iME9U0
         5Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578360; x=1793183160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
        b=YHmLvUZJF+1GwJzvwxQcWmsssOyThIViny5wW88Ufz+x8bN4I+gB9BnpSjcTpbQrAn
         DJjRLQ5gDkiH6jWuGH7Aj77aiv9/IHdjD33JswrTznUT0wmsNx7oJ3/oY3DLivN4JBiw
         hFF8q7HeLnCv+QqwukM1hPtA2OxcgFmr6EWrtAyVKyMK5IpCO5yUMYZar/izbkDyB9rP
         P2d6I0GfsVE0c7aKGtH5HcirxDCe99KbG+4IG5Jg9gtc7aD1E5zeZ7SoWM/cYvaATFpT
         /Cz/o7HfLDkxJwbQuXnm5LwdUWj7ghVUG5WsRVIH5apXFufRsF/FBfHZwZ9PvGfdSD/0
         a0HA==
X-Forwarded-Encrypted: i=1; AKwUvBxHBd4qk8pw662nhQTzNLBKkTC/BwAO8gmBbB3m4GjMgquqPCE1EapKvEyHIc7EYit24d/OqU19wu8lSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tzRj/PWJwmR9hvU7VbXgIuZu6xj8qTW3NVezFBZZc66US5X7
	waiFW3uhR98pYJjJqGvJrTu7CQkDoGOXh+eRoHxrtllIYxVycwC26jx4C71b4FAaJK5rBLmavby
	qz4Bl8l+TVqvujgXzLJANC4X12XNP4HTddiQwFVt9pzRLySpdpJu8AokSVWCh+0ph6A==
X-Gm-Gg: AYBFou2W4A7yz2nkct2KEsIB1fyde8VRnkMBRZvnedQ/Fb09kFw++8d6QRgePYWtj/a
	4WNd1ci3sEEJzP917pbhjcv2j2PPA+ckPPSwJ/cnyNxxM5JDhT6GPi++h45vYJnv+4qYb4IQctX
	2/EcaXL7SWNDmb85dj+eCXs07jDIwwDL9GXLZrykiwaAkk8wsr2RdGlPSMn5166w8HsNhhWLX5P
	6ga6lwhkqgukAP39C6MvE1ket1MTY/Ngw4oZNsikGHb9SoKRas71T1no++/zI6UpkZsJE6QkgHa
	fAuBLC15sBThQBSxVnFQiAjYxKv29aFWyAwvE/NTczQrOLcygi/iIHnSKMc2OitFhw5gC0Q7Ife
	bcRcyIDR/oM54GRq64Zl1r92HbEV6Ibk1G4TKRA==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea43e4ecd0mr10804405ad.23.1792578360162;
        Wed, 21 Oct 2026 03:26:00 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea43e4ecd0mr10804285ad.23.1792578359720;
        Wed, 21 Oct 2026 03:25:59 -0700 (PDT)
Received: from QCOM-yK68p0sug9.qualcomm.com ([114.103.220.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm9605915ad.39.2026.10.21.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:25:59 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
Date: Wed, 21 Oct 2026 18:25:49 +0800
Message-ID: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX1JOUc61rbEaV
 a5p+qXHhg+TVjIiv6F3afUUq0vT123vdjtLsSEWAZOK+Hj+oZ7x2oyNsf/QCc4bYAyHDdWk5lsM
 yW10mYjfpCeXSjvbnCnL6fBeexO2RM1I0Ks8AxLF+DPjgOd9s/hCtAfDOcORVFH/sPru05y/pU5
 lwbvoLS1dIB8AKc/psG+ArL+5fwC04gep73I+99c6dXIPTlpudycNyrzpzJnzGUObaMCoEctw7C
 xDnnCirv0mE8iVJDBFq3kkHxv7jKXWa3g+wgU2FDkkvnFa9OE5MAWinfROJXxuI+PpuQ1csQo5S
 AstbPFkiDZdhKDTuvR0A83qhrsVThlNMtVKg2aPMWTY/rApwjAsFpkfH868uu8NYWehAupnh6cR
 Za9/bRiXj51f/AWofoh03N7/bkS6390P/G0S7GQZciETt9gnFkFgZoQ/+b0ePwsja8rdPhRs/4V
 PIUNPHA+7OB8rCBRd1g==
X-Proofpoint-GUID: zm030HVtdjQAj-pf4rt_fDTGjJOCDHl0
X-Proofpoint-ORIG-GUID: zm030HVtdjQAj-pf4rt_fDTGjJOCDHl0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX6wU+ElY1hMTs
 vaeiL/vtidXFeTsP8iYLMSEo91g/HZhmb3xb7CprDPmC+u/xreyNhVhQMfhu82DC8g9yMzswhT0
 vOuyD0nBHr89MrjR8KX0DoBTUnOtHME=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad89339 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6v2YnCli3sSGVZrDHOWw5A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=R2DrIqMIi5XekuKKXfIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

AudioReach currently rejects PCM streams with more than four channels in
the PCM and shared-memory media format paths.

Extend the default channel map to support PCM streams with up to eight
channels and relax the PCM and shared-memory media format validation
accordingly.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 74 ++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..626cfbca79c8 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -308,20 +308,70 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
-	if (num_channels == 1) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-	} else if (num_channels == 2) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-	} else if (num_channels == 4) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-		ch_map[2] =  PCM_CHANNEL_LS;
-		ch_map[3] =  PCM_CHANNEL_RS;
+	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
+
+	switch (num_channels) {
+	case 1:
+		ch_map[0] = PCM_CHANNEL_FL;
+		break;
+	case 2:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		break;
+	case 3:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		break;
+	case 4:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LS;
+		ch_map[3] = PCM_CHANNEL_RS;
+		break;
+	case 5:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		ch_map[3] = PCM_CHANNEL_LS;
+		ch_map[4] = PCM_CHANNEL_RS;
+		break;
+	case 6:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		break;
+	case 7:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		ch_map[6] = PCM_CHANNEL_CS;
+		break;
+	case 8:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		ch_map[6] = PCM_CHANNEL_LB;
+		ch_map[7] = PCM_CHANNEL_RB;
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
 
+static bool audioreach_channels_supported(u32 num_channels)
+{
+	return num_channels >= 1 && num_channels <= AR_PCM_MAX_NUM_CHANNEL;
+}
+
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  const struct audioreach_container *cont)
 {
@@ -1185,7 +1235,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int payload_size;
 	int i, j;
 
-	if (num_channels > 4) {
+	if (!audioreach_channels_supported(num_channels)) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1275,7 +1325,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	int i, j;
 	void *p;
 
-	if (num_channels > 4) {
+	if (!audioreach_channels_supported(num_channels)) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
-- 
2.43.0

