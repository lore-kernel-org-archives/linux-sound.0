Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21608363C50
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039107; cv=none; b=GAcrr9/q/y7iAVJzXmymHWsqcOf5oyrF5r0eIPoXKA+GhDrXg/nnIJ+PxZZytEsULtE9naaGooD1uIpXWTOTsdk2eFziohNv6XnhjCEpuV7Dt0ifnidlGhl7A/CKu99G5PEMedwmVUGuPF6ol/y/ZxlJFvqf8O9tBZkQ4ioIfPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039107; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfbxxHRrY9pbftEuXvBw5+PzHsJK1xmNZoD7cdgDT+9UmZdhglLaoHwbpmc+XLDbs/aKf2ZjRo6fSD5ji9ZOPvl4if9WkUB8BWmRuLBCI8jm9/UwuvqS1e1kOyNc5tEKkFz8cjqT4J+/E7/CA1awojmTVW3XcosiIPJ6NyOWmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/RFu8QE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9fdx82G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/RFu8QE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9fdx82G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxmNo197322
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=b/RFu8QEUhQsfImzB+Sa8XC+Dd1
	6oNJGDwefPGEG5xw5O423ro2suzPx60HSxzBhBnFYEwFBMj/lBNtlDkuDnd2Af/r
	/6kMe/vZ24jJIiQoDuDAzJhQiX4fHVhsTbw/egMmfKnxgNgeJR00I9HS3jo85qRy
	kDe268BsZwnNW0KFGuaYzGXeyRsVh2PND7c0tIEDrlw7IVj9LA6hddh5U7HkTmiy
	7moq8VLR17IDhIXLrpbPN83y2iyuSKSqVJWMPfi3leXUoidQfMLg9+JMnbRt1vQl
	dSVlbDaejYJxc6d5Xt33nM2MrmQ5Gj3Vgy0XAV6La70DSLmvpdtX4U8cDRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vc65h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506bac14430so502368291cf.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039104; x=1773643904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=E9fdx82GV9EmhN/H1xRH9TZ2JB0kc/kCualgDOmrTfRdf8mE8I3V2xp3CC1CpVW6tj
         LP15tKEFHNXd7hZzrXZbngraTdg7IHJPjsa3E5bwlEwUguPuub5NJbUmePZBiFRnFFqy
         BkV5E5pZflZJEp7HwcMG/CFNJ3sEnZYNnZVpaCXYr5F8peMvuLxMqHgao2+lRNDJvQgf
         l4ML9fPVjnTgfswmxGYYOC1JXeSHTvaBhU/X7CDrjZ+AV2fDp4AEM/jEtU41aEWG22UH
         3jfQqPMrzXPrE6fDFccDJrTRT3XuDyp+Er/9VaciVFkJNrM8V8LLNIgiFrvHi4NiM6nE
         SvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039104; x=1773643904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=wJHR9scbGMD36amLAgEeAxboPkUctlRtECFE6/qVsC0VTfeIHZEYjG0aLx8IhtUBQX
         KqKGbUWw+ZXGLeGYU4avaS4rT1SY6G2smV/n5BRovYneuF7rilaqTW9VYGVIFJqRvkSt
         ON3vaBmYKreV/QxX/0muzw5vPX3Z6ylt8abhTajUaXRXXWxm5S7Be76P93l1QZysclNA
         ikj9T3PZ2q0IrUWgFKYRVctqqBhrEd9U79VwkRSDr6aJH6sScKvFJbo/bZ4LRYgTM/CV
         Npxg/VENRz82iK90kwBML3xKLzzSgZEXQTDfGVe10QBvpi1wjM6QmLwPxhHXYANRCvjN
         D7yw==
X-Forwarded-Encrypted: i=1; AJvYcCXpmRPYyUt/iS5LtOu9SZCiS5pm/Yu8qdC1uSOqeYkijBeCWUvpdi0mEwiuxHkFP6PcZxayAVyJBdo58g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Unam2ic7H31xSS7WUkUzrl7nRsyvGUI8tGMStXq6avPArbDI
	CTNgBvqPVUQlUv4qCSbRN9TFS4StA6vGJAAx3IrnZzEdgkpzu9JWqnTczrxztpWboY4J/e6tbbV
	xacgZpLUzO292BILIuRyu0dZ5N6pLAAkRKoNkTbqBYfk1c4KvlSPzQNunM10OZE8TMw==
X-Gm-Gg: ATEYQzzHqk79ZPNVbgVMrcSzNQrXxKo6vsdzx9v7g0oJxd3N/knE0ZWOU8R9DK0iaKc
	B7GZJJaIZQIjlMqQD9ZxDbZoTkRi+z4bg3JuW8F7VI9Hm6XS6M0HFkh9EqNLYRfcBYs9fY6j04u
	uDcvkoR/9j09QHpWQGgkc8Dbn1uscffA0acMBZ++x6fKrgzGgm3fchZlDJWBSq+OhnggyxhRmNC
	Dfzv9+FQGqALCJebuTpjkuIc/aFe5Nf6F/EjPz3RVw8+iXDra2Vwhb2oGuLvN6vEmF8295/m9gi
	MXqeh0+0rGlpEZqxaL6gUekEp0uHbkv32+ksM51whZxbW60piy23ACReYe/zD6G4PrR9nsck6sR
	cC5QSDDjnecP6ZMw/LWQdOSggX8sfQ+RrJmX2zBqeqUYqgh6s0EGlz+o=
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr413622985a.26.1773039104666;
        Sun, 08 Mar 2026 23:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr413621485a.26.1773039104234;
        Sun, 08 Mar 2026 23:51:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon,  9 Mar 2026 06:51:27 +0000
Message-ID: <20260309065137.949053-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CYRnxJ-5tMo1oMblQ6pg49KkXS-8BAXV
X-Proofpoint-GUID: CYRnxJ-5tMo1oMblQ6pg49KkXS-8BAXV
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae6e01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX16wr5HlnZWBA
 ppDl3BO+RBbUs0NrNqAaxWJL3K2PHGqFvZbw/1SqVleGP90bAlaYU4npWXDOeSd/gyhXG6lDG2c
 NiBL28hAXn2BW0MPDXeaWC4mztZoWL5fORJhh/WODe2KDju2xZMGy58rFMd8cpvc+E3kISGnNV2
 bZ+EApl/m/0WyeEwLpbNifpjdyv+Dx4D89hClUhglT4QF+36GRYGuo+VAGyv2IHEhCkSLuzm0Pp
 k6yOaSFlUOJm0fuDVTwdHwKT7uGqaec69qDLBlNZEb+BpG1JLRtrIKm2DqvCwLI0zn1PEiiKp8V
 0aWx9Ph2vBVorh2zILHUof/sV39LQhOzPNMbFiu3ASsHiM29E25npKvTyvBBKmpYMyWjVpnUu2U
 L3hlnQMu4jGxpVEhvrDo17XIDu5fTBSFpMjrLcPLK8L9M2VAt5RpEjmwovwJ5czDBGBZH+XA6No
 FP4ZCHcFY13LtdFw+qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3

