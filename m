Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF96459AD5
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763753; cv=none; b=VYBmF0/BjMCfoamO6vdRdm3IlUP0QiLrv9G/hikBldKCCoxgRWA4BY6dCsEyOcTeimVOLRHDZVCsW5B37fX1cJnEUHLhphaxEeBIwPootSwAzoiRCNZR/TiLdUO8c9pwO/5dX4AJqjC3a7nxNWc9k/67PFDfkQIQ2kjH2PRoBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763753; c=relaxed/simple;
	bh=kklT4BtGmbxmXXl5fIL1oE0W7MuVDXFCHQeH+8hoyJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2cYBpb1Lryrd1pwEnH3aS9fw9F0HrLBXc7x9XDujLVMHjgIwXxEE1fnZp1PkwDEfpXZMyniFql3qS2X9XPF8ErPlpQsmrVQRpMpQFC8YeFiejas8M0ZRDrmeM6GEEm27KFk2A5DHAb3lXrMGx725WgYsRaUoHMuCIxlHibDQ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5s9REBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxpUhsaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5s9REBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxpUhsaR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnmTZ3313176
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o3eANFp8vRp
	iIPxEwZyDYsYfAkwyo20ziwerf+wA+5I=; b=F5s9REBFpAnFfykmMX0iKjxiumE
	Lp7aLG6k74D+etcM9W/GRp4UhkJE5DSqXaWGUdT2l20vDm4NzQw9zSnhGaMF7HvD
	6grs8gG58yRHPvNCA2QaobMqxlhhlQgzNGd1lfi0hdYEqvoPcvsZ8//N2UG2PpH6
	LZLyuz+JR+YnFeieVbSJGu5T1goc8VoAVXZFRFAxbMMRdW0yRHjcrMgG7cUFXgpp
	tP61Wl1BNOAYLkf54vTbmNtbFHjJHPkfUlLJE17BMPzsgvGbzeazFoTAgel6lGCm
	oNIliTH8lsjH/jVj2BtwcoOCR5286lzk5SkIOLWhZ8BGTahGvBcntT9T04g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xsatg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so1190956d6.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 16:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763750; x=1785368550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3eANFp8vRpiIPxEwZyDYsYfAkwyo20ziwerf+wA+5I=;
        b=AxpUhsaRvQ8FZXTw4IA/vPs1SK7WpPUcXloyCh3lef/VCYWw/WyTRne9GjDNdwRk9X
         dwWkxyPRXJh7YS094NZLCo8Tz7jX8IGtvHAGoUBEhUcmBF0Th4wUs9Xo5UofZa/oAubj
         7ouOKr4L31Km70Qyt+oP/8F97OPHFVt7VIDzgVRSbrCiPgvBxkqs7a1eZE9ejMsgprAy
         j26Fz0EpC4dDue0GjVOtKCOR4xbBYjqekmC3wZQG08LQXMSldAUEjTvv9vzWKb7GWadf
         RgM+uGVpn/6EU6YbGvOxHuQbEhHZo7obXQdVEZZv/KrPAj1ddl9FBFv2cvOWd0DjNIFC
         BQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763750; x=1785368550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3eANFp8vRpiIPxEwZyDYsYfAkwyo20ziwerf+wA+5I=;
        b=RXF8r+6N6CWvwhkrbESlLAKXkuKjfuc9JBeqEaCNozaeu9qI13lwSlPROk2LK+dfeA
         qxsFLjM3AlmlnFst9X2MVH/xbQOW8JMESwgh+nE9GtSCexKJmDzaYRoOB0NZVWdrm26K
         ah8CT9DbFyn1Ky8ncbYwS54Ab6KsU0pQoM88HUeHwlUdb4/NH2jAArTsuevzFAA5fFFN
         vwbqMrU45GtWgmQNPT1ibkw6KCftBw1BeW5U4MBFCKZzLwQbAJB/9BWt9r9eRaAqTvld
         Pqk8QPGEeUm7YpIY4MCQPBWhp+pNCNQP+HpK50ggXqKQF/HS5rc1SQow+mcn/2fRQ/nn
         4lJw==
X-Forwarded-Encrypted: i=1; AHgh+RrAFdmvHPR494S3/2QxlEvtQ33KxCvugL2EjCB9CBR1T+LZwFJVBzz+EHi2o0FMOhx/cOQQQZGfznB8lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyru6RTzdL8AuFLD/ku9Z9X3I/5O64Z4vu+O23hhXjflWj6B6bT
	CRKU0HmmoHgsA1N8etojPIGf+0k7tlab0iULZT3HYuQX38WGUb4vuZUI0fGLZQhOzydYG8FMWvp
	hj7pw+tOv5WdUjAGjdg70ymnisd9TujLy4vycgZ4VdTEeCU4kNwuuCythLY0oDgjDDg==
X-Gm-Gg: AR+sD1353RWxmERVk3tFOiDXXNoOq8H59E5kE6aa8NllifKRm5+gd/Fyt3jpJwolndr
	ph49aGnU/XtQ54MVr7VVtpnfyUtg0l08JN8QjiPe2W3IDM3+rOdaaWikEkyv6tyIk8bEKNw2Psp
	095UdDdBhCAkeLnZYc/vb8P3JnTNxspi7P6dUMAZz92hEV9G4+36nBaKIFpSx8+iT4cDp+pAA0n
	aHO2f+2pROse5lXwGOSSAmIpvNMIDYvJR/D4rT2qZ3ZsODIetONAL+glv344zPVYiBalgJMDWr1
	P5X94TevrUElQnU82fPM22whPynG9wT7OXk9p1tVZ7VGDQys92NIbu9mTtdIF+Wn9+XZr4RvMmj
	LjG666NvMR8wgdg==
X-Received: by 2002:ac8:5807:0:b0:51c:7b12:1218 with SMTP id d75a77b69052e-5283e0419dbmr6401731cf.86.1784763749926;
        Wed, 22 Jul 2026 16:42:29 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:51c:7b12:1218 with SMTP id d75a77b69052e-5283e0419dbmr6401191cf.86.1784763749318;
        Wed, 22 Jul 2026 16:42:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input Terminals for OT DAI
Date: Thu, 23 Jul 2026 00:42:11 +0100
Message-ID: <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lPLY8TAeuUflPY29xN9mU_Ypwl9K8gNe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfXzSuoZ7133LFY
 ZgbuThwQarR+GWcNCDwsyICTTlHBgOIQkyPaNdwTpxtEOCOs98snlDWLRbYrevgSBTXmJ10Tam1
 KcrZedjQ+AVgPqkNM+46FOpBc+DMQRE=
X-Proofpoint-GUID: lPLY8TAeuUflPY29xN9mU_Ypwl9K8gNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfXy8wzNuRl/5rT
 kjAyAsjqlzs/uMYEN2C1YqoinXpRHrm8icVyTxk4w4O5KXhVnoiEIoO+169bBBQxI1AWhy8cqCB
 l9QF9NyH1sbwjnfNSDKtfqkmxjs7k43115OnrNlzUMKeutLsvuYZ7Fg/GYFXdm7jXKq0eftR6Lx
 XH0Ni3ZxMWTpuFhvR8DkpV4aghPJL07HikBTLj25HYieUkLcRiNBTx808nPp6UfOCouN5FeGKmn
 7qRN4g5VhAvbnxvGERg4/rWfK/0L/K4an7G9IOvlZlolLN4UdBtgm99T6mzc5j17cyPlHcnbmp/
 JfIKRY7sYXDajA6UNJW+c6pC+FzgR/FPurUk22nLqZ2MdOg6vsvuZBIvgT1n9QUkDVbZx/Sx7AW
 XZYdtgUtR6grx1c7UlhZ3TbcHtR6oHgxW1fFA0suvpz9SYXOZn4F5kM9PVX6naxexucHWlSfqHP
 JQfA4Xt892bLT3ZAXCg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a615567 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uD0j0RXNaZXElQmVNg8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

For a capture stream the DAI is the Output Terminal so
sdca_asoc_hw_params() only programs the OT itself: cluster, clock
and Usage.  The upstream Input Terminals that actually source the
audio never get their Usage, ClusterIndex or clock programmed, so
the power domain comes up but no samples are produced.

Walk the source graph from the OT and program every Input Terminal
reachable through it.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_asoc.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b4dedba719dc..ac688cd62970 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1726,6 +1726,51 @@ static int set_usage(struct device *dev, struct regmap *regmap,
 	return -EINVAL;
 }
 
+/*
+ * For a capture stream the ASoC DAI is the Output Terminal, so hw_params
+ * only programs the OT itself.  The upstream Input Terminal(s) that
+ * actually source the audio (e.g. a mic input behind a power-domain entity)
+ * never get their Usage / ClusterIndex / clock programmed and stay inactive,
+ * so the power domain comes up but no samples are produced.  Walk the source
+ * graph from the OT and program every Input Terminal we reach.
+ */
+static int set_input_terminal_sources(struct device *dev, struct regmap *regmap,
+				      struct sdca_function_data *function,
+				      struct sdca_entity *entity,
+				      int channels, int rate, int width)
+{
+	int i, ret;
+
+	for (i = 0; i < entity->num_sources; i++) {
+		struct sdca_entity *src = entity->sources[i];
+
+		if (src->type == SDCA_ENTITY_TYPE_IT) {
+			ret = set_cluster(dev, regmap, function, src, channels);
+			if (ret)
+				return ret;
+
+			if (src->iot.clock) {
+				ret = set_clock(dev, regmap, function,
+						src->iot.clock, rate);
+				if (ret)
+					return ret;
+			}
+
+			ret = set_usage(dev, regmap, function, src,
+					SDCA_CTL_IT_USAGE, rate, width);
+			if (ret)
+				return ret;
+		}
+
+		ret = set_input_terminal_sources(dev, regmap, function, src,
+						 channels, rate, width);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * sdca_asoc_hw_params - set SDCA channels, sample rate and bit depth
  * @dev: Pointer to the device, used for error messages.
@@ -1762,6 +1807,12 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
 		break;
 	case SDCA_ENTITY_TYPE_OT:
 		usage_sel = SDCA_CTL_OT_USAGE;
+
+		/* Program the upstream Input Terminal(s) that source this OT. */
+		ret = set_input_terminal_sources(dev, regmap, function, entity,
+						 channels, rate, width);
+		if (ret)
+			return ret;
 		break;
 	default:
 		dev_err(dev, "%s: hw_params on non-terminal entity\n", entity->label);
-- 
2.53.0

